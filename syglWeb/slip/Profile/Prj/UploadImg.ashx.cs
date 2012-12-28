
using System;
using System.Collections;
using System.Web;
using System.IO;
using System.Globalization;
using LitJson;
using SRLib.Web;

namespace syglWeb.slip.Profile.Prj
{
    /// <summary>
    /// UploadImg 的摘要说明,请求连接的参数有：
    ///     dir，文件存储类型
    ///     isTemp，是否放在暂存文件夹里，值为"true",放在暂存文件夹里
    ///     isComp，是否压缩图片，值为"true",压缩图片
    /// </summary>
    public class UploadImg : IHttpHandler
    {

        private HttpContext context;

        public void ProcessRequest(HttpContext context)
        {
            //加入权限验证！
            //
            //
            //
            
            //定义允许上传的文件扩展名
            Hashtable extTable = new Hashtable();
            extTable.Add("image", "gif,jpg,jpeg,png,bmp");
            extTable.Add("flash", "swf,flv");
            extTable.Add("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
            extTable.Add("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2,pdf");
            //最大文件大小
            int maxSize = 4194304;
            this.context = context;

            HttpPostedFile imgFile = context.Request.Files["Filedata"];

            if (imgFile == null)
            {
                showError("请选择文件。");
            
            }

            //文件保存目录路径
            String savePath = "/Sourse/Files/";

            //文件保存目录URL
            String saveUrl = "/Sourse/Files/";

            //是否是缓存文件
            String isTemp = context.Request.QueryString["isTemp"];

            if (isTemp == "true")
            {
                //指定缓存
                savePath = "/Slip/Sources/Files/Temp/";
                saveUrl =  "/Slip/Sources/Files/Temp/";

                //默认不缓存
            }

            String dirPath = context.Server.MapPath(savePath);
            if (!Directory.Exists(dirPath))
            {
                showError("上传目录不存在。");
            }

            //要保存的文件路径
            String dirName = context.Request.QueryString["dir"];

            if (String.IsNullOrEmpty(dirName))
            {
                dirName = "image";
            }

            if (!extTable.ContainsKey(dirName))
            {
                showError("目录名不正确。");
            }

            String fileName = imgFile.FileName;
            String fileExt = Path.GetExtension(fileName).ToLower();

            if (imgFile.InputStream == null || imgFile.InputStream.Length > maxSize)
            {
                showError("上传文件大小超过4M。");
            }

            if (String.IsNullOrEmpty(fileExt) || Array.IndexOf(((String)extTable[dirName]).Split(','), fileExt.Substring(1).ToLower()) == -1)
            {
                showError("上传文件扩展名是不允许的扩展名。\n只允许" + ((String)extTable[dirName]) + "格式。");
            }

            //创建文件夹
            dirPath += dirName + "/";
            saveUrl += dirName + "/";
            if (!Directory.Exists(dirPath))
            {
                Directory.CreateDirectory(dirPath);
            }
            String ymd = DateTime.Now.ToString("yyyyMMdd", DateTimeFormatInfo.InvariantInfo);
            dirPath += ymd + "/";
            saveUrl += ymd + "/";
            if (!Directory.Exists(dirPath))
            {
                Directory.CreateDirectory(dirPath);
            }

            String newFileName = DateTime.Now.ToString("yyyyMMddHHmmss_ffff", DateTimeFormatInfo.InvariantInfo) + fileExt;

            String filePath = dirPath + newFileName;

            imgFile.SaveAs(filePath);

            String fileUrl = saveUrl + newFileName;
            string compUrl = fileUrl;

            //是否压缩图片isComp
            string isComp = context.Request.QueryString["isComp"];

            if(dirName == "image"&&isComp=="true"){
                //若是图片并且压缩

                SrImgCompress srImgCompress = new SrImgCompress();
                srImgCompress.ImgCompressLever = 80;
                srImgCompress.ImgWidth = 500;
                srImgCompress.NewImgName = newFileName;
                srImgCompress.NewImgPath = saveUrl+"comp/";
                srImgCompress.CreatThumbnail(fileUrl);
                compUrl = srImgCompress.NewImgPath + srImgCompress.NewImgName;
            }

            Hashtable hash = new Hashtable();
            hash["error"] = 0;
            hash["url"] = fileUrl;
            hash["compUrl"] = compUrl;
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(hash));
            context.Response.End();
        }
        private void showError(string message)
        {
            Hashtable hash = new Hashtable();
            hash["error"] = 1;
            hash["msg"] = message;
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(hash));
            context.Response.End();
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}