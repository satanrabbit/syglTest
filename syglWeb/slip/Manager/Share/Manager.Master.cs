using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip.Manager.Shara
{
    public partial class Manager : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["SlipAdmin"] != null)
            {

            }
            else
            {
                Response.Redirect("/slip/Manager/login.aspx");
            }
        }
    }
}