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
            oldProjectWithtotal opt = new oldProjectWithtotal();
            opt = dm.GetProjectsWithTotal(0,1,6, "opType", "desc");
            this.OpsRepeater.DataSource = opt.rows;
            this.OpsRepeater.DataBind();
        }
        protected void OpsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            oldProject op = (oldProject)e.Item.DataItem;//找到分类Repeater关联的数据项
            //图片
            Image opim = e.Item.FindControl("opImage") as Image;

            if (op.opImg != null && op.opImg != "")
            {
                opim.ImageUrl = op.opImg;
            }


        }
    }
}