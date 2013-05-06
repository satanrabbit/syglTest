using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_.admin
{
    public partial class news : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SlipAdmin"] == null)
            {
                 
                Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                Response.StatusCode = 401;
                Response.StatusDescription = "您没有登录或登录超时，请重新登录！";
                Response.End();
            }
        }
    }
}