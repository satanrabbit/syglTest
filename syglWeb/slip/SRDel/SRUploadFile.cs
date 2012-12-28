using System;
using System.IO;
using System.Web;

namespace syglWeb.slip.SRDel
{
    /// <summary>
    /// 文件上传类
    /// </summary>
    public class SRUploadFile
    {
            public SRUploadFile(string _filePath, string _allowFileExt, int? _fileMaxLength)
            {
                filesPath = _filePath;
                FileMaxLength = _fileMaxLength.HasValue ? (int)_fileMaxLength : 4194304;
                AllowFileExt = _allowFileExt;    // 上传扩展名
                fileExt = "";
                fileName = "";
            }
            public SRUploadFile()
            {
                filesPath = @"/slip/Sources/TempFiles/";
                FileMaxLength = 4194304;
                AllowFileExt = "txt,rar,zip,jpg,jpeg,gif,png,swf,wmv,avi,wma,mp3,mid,doc,ppt,xls,docx,pptx,xlsx,pdf";    // 上传扩展名
                fileExt = "";
                fileName = "";
            }
        /// <summary>
        /// 文件保存路径
        /// </summary>
            public string filesPath { get; set; }
        /// <summary>
        /// 最大上传文件大小
        /// </summary>
            public int FileMaxLength { get; set; }
        /// <summary>
        /// 允许上传的文件类型
        /// </summary>
            public string AllowFileExt { get; set; }
        /// <summary>
        /// 文件类型
        /// </summary>
            public string fileExt { get; set; }
        /// <summary>
        /// 文件名
        /// </summary>
            public string fileName { get; set; }
            /// <summary>
            /// 上传文件
            /// </summary>
            /// <param name="file"></param>
            /// <returns>0为文件不存在，1文件大小为0，2文件大小超过4M，3不存在文件类型，4不允许的上传类型，5上传成功</returns>
            public int UploadFile(HttpPostedFile file)
            {
                SRCom srCom = new SRCom();
                string FilesPath = AppDomain.CurrentDomain.BaseDirectory + filesPath;
                if (null == file) return 5;//文件不存在
                if (!(file.ContentLength > 0)) return 1;//文件大小为0
                if (file.ContentLength > 4194304) return 2;//文件大小超过4M

                fileName = file.FileName;//获取文件名

                fileExt = Path.GetExtension(file.FileName);//获取文件类型
                if (null == fileExt) return 3;//不存在文件类型

                // 截取上载文件后缀名，不含“.”
                string extension = srCom.GetFileExt(fileName);

                if (("," + AllowFileExt + ",").IndexOf("," + extension + ",") < 0) return 4;//err = "上传文件扩展名必需为：" + upext;
                //检查目录是否存在，不存在则创建
                if (!Directory.Exists(FilesPath))
                {
                    Directory.CreateDirectory(FilesPath);
                }
                string vsnewname = System.DateTime.Now.ToString("yyyyMMddHHmmssffff");//重命名文件名，防止重复

                fileName = vsnewname + fileExt;
                string path = FilesPath + fileName;
                file.SaveAs(path);
                return 0;
            }
        }
}