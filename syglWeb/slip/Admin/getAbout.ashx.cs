using System;
using System.Collections.Generic;
using System.Web;
using System.IO;

namespace syglWeb.slip.Admin
{
    /// <summary>
    /// getAbout 的摘要说明
    /// </summary>
    public class getAbout : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            StreamReader streamReader = File.OpenText(AppDomain.CurrentDomain.BaseDirectory + "/slip/about.html");
            string text = streamReader.ReadToEnd();
            streamReader.Dispose();
            context.Response.Write(text);
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