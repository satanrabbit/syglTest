using System;
using System.Collections.Generic;
using System.Web;

namespace syglWeb.slip.Profile
{
    /// <summary>
    /// logOut 的摘要说明
    /// 用户退出系统
    /// </summary>
    public class logOut : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Cookies["SlipUser"].Expires = DateTime.Now;
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