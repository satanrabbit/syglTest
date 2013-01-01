using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.test
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["FirstName"] = "neww";
            if (Request.Cookies["SlipUser"] != null)
            {
                this.Label1.Text = Session["FirstName"].ToString();
            }
            else
            {
                this.Label1.Text = "no";
            }
             
        }
    }
}