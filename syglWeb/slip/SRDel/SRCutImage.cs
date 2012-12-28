using System;
using System.Collections.Generic;
using System.Web;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

namespace syglWeb.slip.SRDel
{
    public class SRCutImage
    {
        /// <summary>
        /// 图像剪切部位左上角x坐标
        /// </summary>
   
        public int image_x { get; set; }
        /// <summary>
        /// 图像剪切部位左上角y坐标
        /// </summary>
        public int image_y { get; set; }
        /// <summary>
        /// 图像剪切部位的宽
        /// </summary>
        public int image_w { get; set; }
        /// <summary>
        /// 图像剪切部位的高
        /// </summary>
        public int image_h { get; set; }//
        /// <summary>
        /// 输出图像的宽
        /// </summary>
        public int _width { get; set; }//
        /// <summary>
        /// 输出图像的高
        /// </summary>
        public int _height { get; set; }//
        /// <summary>
        /// 要保存的文件夹
        /// </summary>
        public string imgSaveFolder { get; set; }
        /// <summary>
        /// 图像压缩比例
        /// </summary>
        public int ImgCompressLever { get; set; } 
        /// <summary>
        /// 新图片名称
        /// </summary>
        public string NewImgName { get; set; }
        /// <summary>
        /// 剪切图片构造
        /// </summary>
        /// <param name="x">左上角x坐标</param>
        /// <param name="y">左上角y坐标</param>
        /// <param name="w">截取宽度</param>
        /// <param name="h">截取高度</param>
        /// <param name="width">保存宽度</param>
        /// <param name="height">保存高度</param>
        public SRCutImage(int x, int y, int w, int h, int width, int height)
        {
            NewImgName = null;
            image_x = x;
            image_y = y;
            image_w = w;
            image_h = h;
            _width = width;
            _height = height;
            imgSaveFolder = @"/slip/Sources/TempFiles/";
            ImgCompressLever = 80;
        }
        public SRCutImage()
        {
            NewImgName = null;
            image_x = 0;
            image_y = 0;
            image_w = 120;
            image_h = 120;
            _width = 120;
            _height = 120;
            imgSaveFolder = @"/slip/Sources/TempFiles/";
            ImgCompressLever = 80;
        }
        /// <summary>
        /// 剪切图片
        /// </summary>
        /// <param name="imgPath">图片相对服务器根目录路径</param>
        /// <returns>截取图像保存的图片相对服务器根目录路径</returns>
        public string Sweet_Cut(string imgPath)
        {
            SRCom srCom = new SRCom();
            string imgExt = srCom.GetFileExt(imgPath);//获取文件后缀类型
            string fileNewName = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");//重命名文件名，防止重复
            NewImgName = fileNewName +"."+ imgExt;
            
            string dest = AppDomain.CurrentDomain.BaseDirectory + imgSaveFolder;//图像存储文件夹
            string imgAbsPath = AppDomain.CurrentDomain.BaseDirectory + imgPath;//原图像绝对地址
            Image image = Image.FromFile(imgAbsPath); //利用Image对象装载源图像
            if (image == null)
            {
                return null;
            }

            int srcWidth = image.Width;
            int srcHeight = image.Height;

            if (image_x >= srcWidth || image_y >= srcHeight)
            {
                return null;
            }

            if (image_x + image_w > srcWidth)
            {
                image_w = srcWidth - image_x;
            }

            if (image_y + image_h > srcHeight)
            {
                image_h = srcHeight - image_y;
            }

            try
            {
                Bitmap bmp = new Bitmap(_width, _height, PixelFormat.Format24bppRgb);
                Graphics gr = Graphics.FromImage(bmp);
                gr.SmoothingMode = SmoothingMode.HighSpeed;
                gr.CompositingQuality = CompositingQuality.HighSpeed;
                gr.InterpolationMode = InterpolationMode.Default;
                Rectangle rectDestination = new Rectangle(0, 0, _width, _height);
                gr.DrawImage(image, rectDestination, image_x, image_y, image_w,image_h, GraphicsUnit.Pixel);//从image图像中选取
                gr.Dispose();
                image.Dispose();
                //检查目录是否存在，不存在则创建
                if (!Directory.Exists(dest))
                {
                    Directory.CreateDirectory(dest);
                }
                string savePath = dest + NewImgName;

                //压缩并保存
                SRImageCompress imgCompress = new SRImageCompress();
                imgCompress.Compress(bmp, savePath, ImgCompressLever);
                bmp.Dispose();

                return imgSaveFolder + NewImgName;//返回图片保存的相对路径
            }
            catch
            {
                return null;
            }
        }

    }
}