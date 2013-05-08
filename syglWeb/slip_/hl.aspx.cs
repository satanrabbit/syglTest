using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_
{
    public partial class hl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        //    int page=1;
        //    if (Request.Params["page"] == null || Request.Params["page"] == "")
        //    {
        //        page = 1;
        //    }
        //    else
        //    {
        //        int.TryParse(Request.Params["page"], out page);
        //    }
        //    int pageSize = 50;
            DataModal dm = new DataModal();
            HelpRepeater.DataSource = dm.GetHelpsWithTotal(1, 100, "helpID", "asc").rows;
            HelpRepeater.DataBind();
        }
    }
}