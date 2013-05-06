using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_
{
    public partial class ns : System.Web.UI.Page
    {
        protected int page = 1;
        protected int pages = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            listNewsWithPages ln = new listNewsWithPages();
            DataModal dm = new DataModal();
            if (!(Request.Params["page"] == null || Request.Params["page"] == ""))
            {
                try
                {
                    page = Convert.ToInt32(Request.Params["page"]);
                }
                catch (Exception ex)
                {
                    page = 1;
                }
            }

            int pageSize = 25;
            ln = dm.GetNewsList(page,pageSize);
            this.NewsRepeater.DataSource = ln.newsList;
            this.NewsRepeater.DataBind();
            pages = (ln.Total % pageSize) > 0 ? (ln.Total / pageSize)+1 : (ln.Total / pageSize);

        }
    }
}