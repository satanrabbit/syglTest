using System;
using System.Data;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;
namespace syglWeb.slip.Profile
{
    public partial class Default1 : System.Web.UI.Page
    {
        SRSql srSql = new SRSql();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["SlipUser"] == null)
            {
                Response.Redirect("/Slip/LogOn.aspx?f=unlogin");
            }
            else
            {
                string fromPage = Request.QueryString["f"];
                this.HiddenPageFrom.Value = fromPage;
                int userID = Convert.ToInt32( Request.Cookies["SlipUser"]["userID"]);
                srSql.conn.Open();
                srSql.cmd.CommandText = "SELECT topicTB.*, userTB.*, projectTB.* FROM (topicTB left  JOIN userTB ON userTB.[userID] = topicTB.topicUser) left  JOIN projectTB ON topicTB.topicID = projectTB.topic order by topicPostTime desc";
               
                srSql.cmd.Parameters.AddWithValue("@topicUser", userID);

                srSql.da.Fill(srSql.ds,"tb_topic");
                 
                RepeaterProjects.DataSource = srSql.ds.Tables["tb_topic"].DefaultView;
                RepeaterProjects.DataBind();
                

             }
            srSql.conn.Close();
        }        

        protected void RepeaterProjects_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);

            switch (Convert.ToInt32(drv["topicStatus"]))
            {
                case 0:
                    Label statusLabel = (e.Item.FindControl("LabelStatusTip") as Label);
                    statusLabel.Text = "课题审核中";
                    break;
            }

            if (drv["topicLogoMini"] == null || (drv["topicLogoMini"].ToString() == ""))
            {
                Image imgLogo = (e.Item.FindControl("ImageTopicLogo") as Image);
                imgLogo.ImageUrl = "";
                imgLogo.Visible = false;
            }
            else
            {
                Image imgLogo = (e.Item.FindControl("ImageTopicLogo") as Image);
                imgLogo.ImageUrl = drv["topicLogoMini"].ToString(); 
            }
        }
    }
}