using LitJson;
using System;
using System.Collections.Generic;
using System.Web;

namespace syglWeb.slip_.admin
{
    /// <summary>
    /// sptl 的摘要说明
    /// </summary>
    public class sptl : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Session["SlipAdmin"] == null)
            {
                //保存出错
                
                context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                context.Response.StatusCode=402;
                context.Response.StatusDescription = "您没有登录或登录超时，请重新登录！";
                context.Response.End();
            }
            SupportListWithTotal sptlt = new SupportListWithTotal();
            DataModal dm = new DataModal();
            sptlt=dm.GetSupportList();
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(sptlt));
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