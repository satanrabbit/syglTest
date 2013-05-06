using System;
using System.Collections.Generic;
using System.Web;
using LitJson;
using SRFileManagerLibrary;
using System.Collections;
using System.Web.SessionState;
namespace syglWeb.slip_.admin
{
    /// <summary>
    /// upload 的摘要说明
    /// </summary>
    public class upload : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            Hashtable ht = new Hashtable();
            if (context.Session["SlipAdmin"] == null)
            {
                //保存出错
                ht["error"] = 1;
                ht["message"] = "您没有登录，没有上传权限！";
                context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                context.Response.Write(JsonMapper.ToJson(ht));
                context.Response.End();
            }
           
            SRUploadFile srUpfile = new SRUploadFile(context, "imgFile");

            srUpfile.FileType = context.Request.QueryString["dir"];
            srUpfile.FileFolder = "/slip_/file/admin/"+srUpfile.FileType+"/";
            srUpfile.SaveFile();
            if (Convert.ToInt32(srUpfile.StepStatus["status"]) == 1)
            {
                //保存成功
                ht["error"] = 0;
                ht["url"] = srUpfile.FilePath;
            }
            else
            {
                //保存出错
                ht["error"] = 1;
                ht["message"] = srUpfile.StepStatus["msg"];
            }

            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(ht));
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