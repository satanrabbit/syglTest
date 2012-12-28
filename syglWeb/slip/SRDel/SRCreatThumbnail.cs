using System;
using System.Collections.Generic;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

namespace syglWeb.slip.SRDel
{
    /// <summary>
    /// 图象压缩类
    /// </summary>
    public class SRCreatThumbnail
    {
        public SRCreatThumbnail()
        {
            NewImgName = "";
            NewImgPath = @"/Content/ImageFiles/"; 
            MaxImgWidth = 680;
            MiniImgWidth = 280;
            ImgCompressLever = 80;
            MiniImgCompressLever = 70;
        }
        public SRCreatThumbnail(string miniImgPath, string newImgPath, int maxImgWidth, int miniImgWidth)
        {
            NewImgName = "";
            NewImgPath = newImgPath;
            //MiniImgName = "";
            //MiniImgPath = miniImgPath;
            MaxImgWidth = maxImgWidth;
            MiniImgWidth = miniImgWidth;
            ImgCompressLever = 80;
            MiniImgCompressLever = 70;

        }
        /// <summary>
        /// 新图片名称
        /// </summary>
        public string NewImgName { get; set; }
        /// <summary>
        /// 新图片存储文件夹
        /// </summary>
        public string NewImgPath { get; set; }
        /// <summary>
        /// 缩略图名称
        /// </summary>
        //public string MiniImgName { get; set; }
        /// <summary>
        /// 缩略图存储文件夹
        /// </summary>
        //public string MiniImgPath { get; set; }
        /// <summary>
        /// 保存图片最大宽度
        /// </summary>
        public int MaxImgWidth { get; set; } 
        /// <summary>
        /// 缩略图最大宽度 
        /// </summary>
        public int MiniImgWidth { get; set; }
        /// <summary>
        /// 图像压缩比例
        /// </summary>
        public int ImgCompressLever { get; set; } 
        /// <summary>
        /// 缩略图压缩比例
        /// </summary>
        public int MiniImgCompressLever { get; set; }
        /// <summary>
        /// 创建图像
        /// </summary>
        /// <param name="imgPath">图片的相对服务器跟路径</param>
        /// <returns></returns>
        public int CreatThumbnail(string imgPath)
        {
            SRCom srCom = new SRCom();
            string fileNewName = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");//重命名文件名，防止重复
           
            string imgAbsPath = AppDomain.CurrentDomain.BaseDirectory + imgPath;//原图像绝对地址

            Image image = Image.FromFile(imgAbsPath); //利用Image对象装载源图像
            string imgExt = "."+srCom.GetFileExt(imgPath);
            NewImgName = fileNewName + imgExt;
            //MiniImgName = "mini" + fileNewName + imgExt;
            SaveThumbnail(NewImgPath, NewImgName, image, MaxImgWidth, ImgCompressLever);//存储新图像
           // SaveThumbnail(MiniImgPath, MiniImgName, image, MiniImgWidth, MiniImgCompressLever);//存储缩略图

            image.Dispose();
            //srCom.DeleteFile(imgPath);//删除原图像
            return 0;
        }


        private void SaveThumbnail(string imgPath, string imgName, Image image, int thumbWidth, int compressLever)
        {
            string dest = AppDomain.CurrentDomain.BaseDirectory + imgPath;//图像存储文件夹
            int srcWidth = image.Width;
            int srcHeight = image.Height;
            int thumbHeight = (int)((((float)srcHeight) / ((float)srcWidth)) * ((float)thumbWidth));
            if (srcWidth > thumbWidth)
            {
            }
            else
            {
                thumbWidth = srcWidth;
                thumbHeight = srcHeight;
            }
            Bitmap bmp = new Bitmap(thumbWidth, thumbHeight);
            Graphics gr = Graphics.FromImage(bmp);
            gr.SmoothingMode = SmoothingMode.HighSpeed;
            gr.CompositingQuality = CompositingQuality.HighSpeed;
            gr.InterpolationMode = InterpolationMode.Default;
            Rectangle rectDestination = new Rectangle(0, 0, thumbWidth, thumbHeight);
            gr.DrawImage(image, rectDestination, 0, 0, srcWidth, srcHeight, GraphicsUnit.Pixel);

            //检查目录是否存在，不存在则创建
            if (!Directory.Exists(dest))
            {
                Directory.CreateDirectory(dest);
            }
            string savePath = dest + imgName;

            //压缩并保存
            SRImageCompress imgCompress = new SRImageCompress();
            imgCompress.Compress(bmp, savePath, compressLever);
            bmp.Dispose();

        }
    }
}