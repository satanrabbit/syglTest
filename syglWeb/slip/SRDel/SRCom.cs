using System;
using System.Web;
using System.IO;
using System.Text.RegularExpressions;
using System.Text;

namespace syglWeb.slip.SRDel
{
    public class SRCom
    {
        #region 哈希算法加密密码
        /// <summary>
        /// 哈希算法加密密码
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public string HashPassword(string str)
        {
            string returnHash = "";

            System.Security.Cryptography.SHA1 hash = System.Security.Cryptography.SHA1.Create();
            System.Text.ASCIIEncoding encoder = new System.Text.ASCIIEncoding();
            byte[] combined = encoder.GetBytes(str);
            hash.ComputeHash(combined);
            returnHash = Convert.ToBase64String(hash.Hash);

            return returnHash;
        }
        #endregion

        #region 将路径字符转义为json格式
        /// <summary>
        /// 将字符转义为json格式
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
         public string jsonString(string str)
        {
            str = str.Replace("\\", "\\\\");
            str = str.Replace("/", "\\/");
            str = str.Replace("'", "\\'");
            str = str.Replace("\"", "\\\"");
            return str;
        }
        #endregion
        #region 将路径字符转义为路径格式
        /// <summary>
        /// 将路径字符转义为路径格式
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
         public string PathString(string str)
        {
            //str = str.Replace("\", "\\");
            str = str.Replace("/", "\\");
            //str = str.Replace("'", "\\'");
            return str;
        }
        #endregion
        #region 获取文件后缀名,不带"."
        /// <summary>
        /// 获取文件后缀名,不带"."
        /// </summary>
        /// <param name="FullPath"></param>
        /// <returns></returns>
         public string GetFileExt(string FullPath)
        {
            if (FullPath != "") return FullPath.Substring(FullPath.LastIndexOf('.') + 1).ToLower();
            else return "";
        }
        #endregion
        #region 删除指定文件
        /// <summary>
        /// 删除指定文件
        /// </summary>
        /// <param name="path">服务器根目录下的相对路径，例： "/Areas/LEBS/Content/ProjectFiles/"</param>
         public void DeleteFile(string path)
        {
            if (path == "") return;
            if (path.Substring(0, 1) == "/")
            {
                path = path.Substring(1);
            }
            path = PathString(path);

            string filePath = AppDomain.CurrentDomain.BaseDirectory + path;
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
        }
        #endregion
        #region 将指定文件重名后转移到新文件夹下
        /// <summary>
        /// 将指定文件重名后转移到新文件夹下
        /// </summary>
        /// <param name="path">原始文件路径</param>
        /// <param name="newFolder">要转移到的文件夹</param>
        /// <returns>新文件的相对路径</returns>
         public string MoveFile(string path, string newFolder)
        {
            string fileExt = GetFileExt(path);

            string fileNewName = System.DateTime.Now.ToString("yyyyMMddHHmmssffff") + "." + fileExt;
            string saveFolder = AppDomain.CurrentDomain.BaseDirectory + newFolder;
            if (!Directory.Exists(saveFolder))
            {
                Directory.CreateDirectory(saveFolder);
            }
            string savePath = saveFolder + fileNewName;
            path = AppDomain.CurrentDomain.BaseDirectory + path;
            if (System.IO.File.Exists(path))
            {
                System.IO.File.Move(path, savePath);
            }

            return newFolder + fileNewName;
        }
        #endregion

        #region 去除HTML标签
        /// <summary>
        /// 去除HTML标签
        /// </summary>
        /// <param name="html"></param>
        /// <returns></returns>
         public string ParseHtml(string Htmlstring)
        {
            //删除脚本
            Htmlstring = Regex.Replace(Htmlstring, @"<script[^>]*?>.*?</script>", "", RegexOptions.IgnoreCase);
            //删除HTML
            Htmlstring = Regex.Replace(Htmlstring, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"([\r\n])[\s]+", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"-->", "", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"<!--.*", "", RegexOptions.IgnoreCase);

            Htmlstring = Regex.Replace(Htmlstring, @"&(quot|#34);", "\"", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(amp|#38);", "&", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(lt|#60);", "<", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(gt|#62);", ">", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(nbsp|#160);", " ", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(iexcl|#161);", "\xa1", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(cent|#162);", "\xa2", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(pound|#163);", "\xa3", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&(copy|#169);", "\xa9", RegexOptions.IgnoreCase);
            Htmlstring = Regex.Replace(Htmlstring, @"&#(\d+);", "", RegexOptions.IgnoreCase);
            Htmlstring.Replace("<", "");
            Htmlstring.Replace(">", "");
            Htmlstring.Replace("\r\n", "");
            Htmlstring = HttpContext.Current.Server.HtmlEncode(Htmlstring).Trim();

            //Htmlstring = ParseHtml(Htmlstring);
            return Htmlstring;
        }
        #endregion

        #region 字符串截取函数
        /// <summary>
        /// 字符串截取函数
        /// </summary>
        /// <param name="inputString">待截取字符串</param>
        /// <param name="len">截取长度</param>
        /// <returns>字符串截取结果</returns>
        public  string CutString(string inputString, int len)
        {
            ASCIIEncoding ascii = new ASCIIEncoding();
            int tempLen = 0;
            string tempString = "";
            byte[] s = ascii.GetBytes(inputString);
            for (int i = 0; i < s.Length; i++)
            {
                if ((int)s[i] == 63) //63:表示问号：?
                {
                    tempLen += 2;
                }
                else
                {
                    tempLen += 1;
                }
                try
                {
                    tempString += inputString.Substring(i, 1);
                }
                catch
                {
                    break;
                }
                if (tempLen >= (len * 2))
                    break;
            }
            //如果截过则加上半个省略号 
            byte[] mybyte = System.Text.Encoding.Default.GetBytes(inputString);
            if (mybyte.Length > len)
                tempString += "…";
            return tempString;
        }
        #endregion

    }
}