using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_
{
    public partial class pf : System.Web.UI.Page
    {
        protected int page = 1;
        protected int pages = 1;
        protected int type = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            oldProjectWithtotal opt = new oldProjectWithtotal();
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

            if (Request.Params["type"] == null || Request.Params["type"] == "")
            {
                type = 0;
            }
            else
            {
                type = Convert.ToInt32(Request.Params["type"]);
            }
            opt = dm.GetProjectsWithTotal(type,page, pageSize,"opType","desc");
            this.OpsRepeater.DataSource = opt.rows;
            this.OpsRepeater.DataBind();
            pages = (opt.total % pageSize) > 0 ? (opt.total / pageSize) + 1 : (opt.total / pageSize);

        }

        protected void OpsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            oldProject op = (oldProject)e.Item.DataItem;//找到分类Repeater关联的数据项
            //图片
            Image opim = e.Item.FindControl("opImage") as Image;

            if (op.opImg != null && op.opImg!= "")
            {
                opim.ImageUrl = op.opImg;
            }

            
        }
    }
}