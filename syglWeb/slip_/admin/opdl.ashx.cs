using System;
using System.Collections.Generic;
using System.Web;

namespace syglWeb.slip_.admin
{
    /// <summary>
    /// opdl 旧的创新成果删除
    /// </summary>
    public class opdl : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Hello World");
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