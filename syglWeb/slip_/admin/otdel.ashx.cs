using System;
using System.Collections.Generic;
using System.Web;
using LitJson;
namespace syglWeb.slip_.admin
{
    /// <summary>
    /// otdel 删除旧项目分类
    /// </summary>
    public class otdel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int status = 0;
            string msg = "未知错误";
            DataModal dm = new DataModal();
            try
            {
                int ef = dm.DeleteOldType(context.Request.Params["ids"]);
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