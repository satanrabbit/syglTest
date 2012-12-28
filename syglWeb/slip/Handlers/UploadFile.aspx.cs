using System;
using System.Collections.Generic;

using syglWeb.slip.SRDel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip.Handlers
{
    public partial class UploadFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {


                SRCom srCom = new SRCom();
                //保存图片
                string err = "";
                string path = "";
                int status = 6;

                string imgNamePath = "";
                //string miniImgNamePath = "";

                string filesPath = @"/slip/Sources/TempFiles/";
                string allowFileExt = "jpg,jpeg,gif,png";
                try
                {
                    SRUploadFile fileUpload = new SRUploadFile(filesPath, allowFileExt, null);
                    HttpPostedFile file = HttpContext.Current.Request.Files["Fileupload"];
                    //fileUpload.AllowFileExt = allowFileExt;//文件可上传类型
                    status = fileUpload.UploadFile(file);
                    //设置默认文件上传大小
                    //设置上传路径
                    
                    switch (status)
                    {
                        case 5: err = "未选择文件";
                            break;
                        case 1: err = "文件大小为0";
                            break;
                        case 2: err = "文件大小超过4M";
                            break;
                        case 3: err = "文件类型不明确";
                            break;
                        case 4: err = "该文件类型不允许上传，可上传文件类型为：" + fileUpload.AllowFileExt;
                            break;
                        case 0:
                            path = fileUpload.filesPath + fileUpload.fileName;

                            SRCreatThumbnail setThumbnail = new SRCreatThumbnail();
                            setThumbnail.NewImgPath = @"/slip/Sources/TempFiles/";
                            setThumbnail.MaxImgWidth = 480;
                            setThumbnail.CreatThumbnail(path);//存储图片至新位置并设置缩略图

                            imgNamePath = setThumbnail.NewImgPath + setThumbnail.NewImgName;
                            break;
                        default:
                            err = "未知错误：";
                            status = 6;
                            break;
                    }
                }
                catch (Exception ex)
                {
                    err = ex.ToString();
                }
                this.LabelData.Text=("{\"status\":\"" + status.ToString() + "\",\"error\":\"" + err + "\",\"imgNamePath\":\"" + srCom.jsonString(imgNamePath) + "\",\"path\":\"" + srCom.jsonString(path) + "\"}");
               
                
                //Response.End();

            }
        }
    }
}