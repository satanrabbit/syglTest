using System;
using System.Collections.Generic;
using System.Web;

namespace syglWeb.Admin
{
    /// <summary>
    /// LogOut 的摘要说明
    /// </summary>
    public class LogOut : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        { 
            context.Response.Cookies["SyglAdmin"].Expires = DateTime.Now;
            context.Response.Redirect("/");
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