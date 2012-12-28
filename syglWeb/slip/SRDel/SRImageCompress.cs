using System;
using System.Drawing.Imaging;
using System.Drawing;
using System.IO;

namespace syglWeb.slip.SRDel
{
    public class SRImageCompress
    {
        #region 图片压缩(降低质量)Compress
        private ImageCodecInfo GetEncoderInfo(String mimeType)
        {
            int j;
            ImageCodecInfo[] encoders;
            encoders = ImageCodecInfo.GetImageEncoders();
            for (j = 0; j < encoders.Length; ++j)
            {
                if (encoders[j].MimeType == mimeType)
                    return encoders[j];
            }
            return null;
        }
        /// <summary>
        /// 图片压缩(降低质量以减小文件的大小)
        /// </summary>
        /// <param name="srcBitmap">传入的Bitmap对象</param>
        /// <param name="destStream">压缩后的Stream对象</param>
        /// <param name="level">压缩等级，0到100，0 最差质量，100 最佳</param>
        public void Compress(Bitmap srcBitmap, Stream destStream, long level)
        {
            ImageCodecInfo myImageCodecInfo;
            Encoder myEncoder;
            EncoderParameter myEncoderParameter;
            EncoderParameters myEncoderParameters;


            myImageCodecInfo = GetEncoderInfo("image/jpeg");
            myEncoder = Encoder.Quality;
            myEncoderParameters = new EncoderParameters(1);


            myEncoderParameter = new EncoderParameter(myEncoder, level);
            myEncoderParameters.Param[0] = myEncoderParameter;
            srcBitmap.Save(destStream, myImageCodecInfo, myEncoderParameters);
        }
        /// <summary>
        /// 图片压缩(降低质量以减小文件的大小)
        /// </summary>
        /// <param name="srcBitMap">传入的Bitmap对象</param>
        /// <param name="destFile">压缩后的图片保存路径</param>
        /// <param name="level">压缩等级，0到100，0 最差质量，100 最佳</param>
        public void Compress(Bitmap srcBitMap, string destFile, long level)
        {
            Stream s = new FileStream(destFile, FileMode.Create);
            Compress(srcBitMap, s, level);
            s.Close();
        }
        /// <summary>
        /// 图片压缩(降低质量以减小文件的大小)
        /// </summary>
        /// <param name="srcFile">传入的Stream对象</param>
        /// <param name="destFile">压缩后的图片保存路径</param>
        /// <param name="level">压缩等级，0到100，0 最差质量，100 最佳</param>
        public void Compress(Stream srcStream, string destFile, long level)
        {
            Bitmap bm = new Bitmap(srcStream);
            Compress(bm, destFile, level);
            bm.Dispose();
        }
        /// <summary>
        /// 图片压缩(降低质量以减小文件的大小)
        /// </summary>
        /// <param name="srcFile">传入的Image对象</param>
        /// <param name="destFile">压缩后的图片保存路径</param>
        /// <param name="level">压缩等级，0到100，0 最差质量，100 最佳</param>
        public void Compress(Image srcImg, string destFile, long level)
        {
            Bitmap bm = new Bitmap(srcImg);
            Compress(bm, destFile, level);
            bm.Dispose();
        }
        /// <summary>
        /// 图片压缩(降低质量以减小文件的大小)
        /// </summary>
        /// <param name="srcFile">待压缩的BMP文件名</param>
        /// <param name="destFile">压缩后的图片保存路径</param>
        /// <param name="level">压缩等级，0到100，0 最差质量，100 最佳</param>
        public void Compress(string srcFile, string destFile, long level)
        {
            // Create a Bitmap object based on a BMP file.
            Bitmap bm = new Bitmap(srcFile);
            Compress(bm, destFile, level);
            bm.Dispose();
        }

        #endregion 图片压缩(降低质量)

    }
}