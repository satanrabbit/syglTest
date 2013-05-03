using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataModal dm = new DataModal();
            this.newsRepeate.DataSource = dm.GetNewsList(1,6).newsList;
            this.newsRepeate.DataBind();
        }
    }
}