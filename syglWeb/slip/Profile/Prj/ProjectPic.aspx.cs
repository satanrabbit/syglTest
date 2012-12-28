using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Profile.Prj
{
    public partial class ProjectPic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string topicID = Request.QueryString["tid"];
            if (topicID == "" || topicID == null)
            {
                Response.Redirect("/Slip/404.aspx");
            }

            HiddenFieldTopicID.Value = topicID;

            SRSql srSql = new SRSql();
            srSql.conn.Open();
            srSql.cmd.CommandText = "select * from topicImgTB where forTopic = @topicID";
            srSql.cmd.Parameters.AddWithValue("@topicID",topicID);

            srSql.da.Fill(srSql.ds,"tb_topicImg");

            srSql.cmd.CommandText = "select topicLogo, topicLogoOriginal,topicLogoMini from topicTB where topicID = @tid";
            srSql.cmd.Parameters.AddWithValue("@tid", topicID);
            srSql.da.Fill(srSql.ds, "tb_topic_logo");
            if (srSql.ds.Tables["tb_topic_logo"].Rows[0]["topicLogoMini"].ToString() != "")
            {
                ImageLogo.ImageUrl = srSql.ds.Tables["tb_topic_logo"].Rows[0]["topicLogoMini"].ToString();
            }

            RepeaterProjImg.DataSource = srSql.ds.Tables["tb_topicImg"].DefaultView;
            RepeaterProjImg.DataBind();

            srSql.conn.Close();
            
        }
    }
}