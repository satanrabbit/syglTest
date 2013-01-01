using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;

namespace syglWeb.slip.Profile
{
    /// <summary>
    /// logOut 的摘要说明
    /// 用户退出系统
    /// </summary>
    public class logOut : IHttpHandler, IRequiresSessionState 
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Session.Abandon();
            context.Response.Redirect("/slip/");
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