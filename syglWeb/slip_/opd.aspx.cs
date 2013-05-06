using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_
{
    public partial class opd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["pid"] == "" || Request.Params["pid"] == null)
            {
                Response.Redirect("~/slip_/");
            }
            else
            {
                DataModal dm = new DataModal();
                int opid = Convert.ToInt32(Request.Params["pid"]);
                oldProject op = dm.GetOldProject(opid);
                this.opTitle.Text = op.opTitle;
                if (op.opImg != null && op.opImg != "")
                {
                    opImage.ImageUrl = op.opImg;
                }
                opDepartment.Text = op.opDepartment;
                opNum.Text = op.opNum;
                opYear.Text = op.opYear;
                this.opContent.Text = op.opContent;
                this.opTypeLink.Text = op.opTypeName;
                this.opTypeLink.NavigateUrl = "pf.aspx?type="+op.opType.ToString();
            }

        }
    }
}