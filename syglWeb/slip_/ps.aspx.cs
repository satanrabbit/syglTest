using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_
{
    public partial class ps : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = 1;
            if (!(Request.Params["id"] == "" || Request.Params["id"] == null))
            {
                id = Convert.ToInt32(Request.Params["id"]);
            }
            DataModal dm = new DataModal();
            Support sp = dm.GetSupport(id);
            this.supportContent.Text = sp.supportContent;
            this.supportTitle.Text = sp.supportTitle;
        }
    }
}