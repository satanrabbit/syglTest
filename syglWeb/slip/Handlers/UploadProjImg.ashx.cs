using System;
using System.Collections.Generic;
using System.Web;
using syglWeb.slip.SRDel;
using LitJson;
using System.Collections;

namespace syglWeb.slip.Handlers
{
    /// <summary>
    /// UploadProjImg 上传项目的图片
    /// </summary>
    public class UploadProjImg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            SRCom srCom = new SRCom();
            //保存图片
            string err = "";
            string path = "";
            int status = 0;
            int imgID=0;
            string imgNamePath = "";
            string miniImgNamePath = "";

            string filesPath = @"/slip/Sources/ProjectImg/Original/";
            string allowFileExt = "jpg,jpeg,gif,png";
            try
            {
                SRUploadFile fileUpload = new SRUploadFile(filesPath, allowFileExt, null);
                HttpPostedFile file = HttpContext.Current.Request.Files["imgFile"];
                status = fileUpload.UploadFile(file);
                //设置默认文件上传大小
                //设置上传路径
                fileUpload.AllowFileExt = "jpg,jpeg,png,";//文件可上传类型
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
                        setThumbnail.NewImgPath = @"/slip/Sources/ProjectImg/";
                        setThumbnail.MaxImgWidth = 500;
                        setThumbnail.CreatThumbnail(path);
                        imgNamePath = setThumbnail.NewImgPath + setThumbnail.NewImgName;

                        setThumbnail.NewImgPath = @"/slip/Sources/ProjectImg/Mini/";
                        setThumbnail.MaxImgWidth = 200;
                        setThumbnail.CreatThumbnail(path);
                        miniImgNamePath = setThumbnail.NewImgPath + setThumbnail.NewImgName;

                        int topicID = Convert.ToInt32(context.Request.QueryString["tid"]);
                        SRSql srSql=new SRSql();
                        srSql.conn.Open();
                        srSql.cmd.CommandText = "insert into topicImgTB (forTopic, topicImgFile,topicImgOr,topicImgMini) values(@forTopic, @topicImgFile,@topicImgOr,@topicImgMini)";

                        srSql.cmd.Parameters.AddWithValue("@forTopic",topicID);
                        srSql.cmd.Parameters.AddWithValue("@topicImgFile", imgNamePath);
                        srSql.cmd.Parameters.AddWithValue("@topicImgOr", path);
                        srSql.cmd.Parameters.AddWithValue("@topicImgMini", miniImgNamePath);
                        srSql.cmd.ExecuteNonQuery();
                        srSql.conn.Close();
                        //获取新插入的ID
                        SRSql srSql_ = new SRSql();
                        srSql_.conn.Open();
                        srSql_.cmd.CommandText = "select Max(topicImgID) from topicImgTB where forTopic = @topicID";
                        srSql_.cmd.Parameters.AddWithValue("@topicID",topicID);

                        imgID = Convert.ToInt32(srSql_.cmd.ExecuteScalar().ToString());
                        srSql_.conn.Close();
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
            Hashtable jdata = new Hashtable(); 
            jdata["status"] = status;
            jdata["error"] = err;
            jdata["imgNamePath"] = (miniImgNamePath);
            jdata["path"] = (path);
            jdata["imgID"] = imgID;
            string jdataStr = JsonMapper.ToJson(jdata);
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(jdataStr);
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