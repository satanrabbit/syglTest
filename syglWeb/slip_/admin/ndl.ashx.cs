using System;
using System.Collections.Generic;
using System.Web;
using LitJson;

namespace syglWeb.slip_.admin
{
    /// <summary>
    /// ndl 的摘要说明
    /// </summary>
    public class ndl : IHttpHandler
    {
        
        public void ProcessRequest(HttpContext context)
        {
            int status = 0;
            string msg = "未知错误";
            DataModal dm = new DataModal();
            try
            {
                int ef =dm.DeleteNews(context.Request.Params["nids"]);
                status = 1;
                msg = "成功删除" + ef + "条记录";
               
            }
            catch (Exception ex)
            {
                status = 2;
                msg = ex.Message;
            }

            JsonData jd = new JsonData();
            jd["status"] = status;
            jd["msg"] = msg;
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(jd.ToJson());
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