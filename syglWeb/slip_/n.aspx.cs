using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_
{
    public partial class n : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["n"] == null || Request.Params["n"] == "")
            {
                
            }
            else
            {
                DataModal dm = new DataModal();
                News n = dm.GetNewes(Convert.ToInt32(Request.Params["n"]));
                this.newsTitle.Text = n.newsTitle;
                this.newsContent.Text = n.newsContent;
            }
        }
    }
}