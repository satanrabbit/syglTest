using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;
using System.Data.OleDb;

namespace syglWeb.slip.Projects
{
    public partial class ProjectDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //RepeaterTopicImg
            string tid=Request.QueryString["tid"];

            if (tid == null || tid == "")
            {
                Response.Redirect("../404.aspx");
            }
            else
            {
                int _tid = Convert.ToInt32(tid);

                SRSql srSql = new SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from ((topicTB left join userTB on topicTB.topicUser = userTB.userID )left join projectTB on projectTB.topic=topicTB.topicID ) where topicTB.topicID=@tid";

                srSql.cmd.Parameters.AddWithValue("@tid",tid);
                srSql.da.Fill(srSql.ds,"tb_topic"); 
                srSql.conn.Close();

                LabelTopicInfo.Text = srSql.ds.Tables["tb_topic"].Rows[0]["projectIntro"].ToString();
                LabelProjectPlan.Text = srSql.ds.Tables["tb_topic"].Rows[0]["projectPlan"].ToString();
                LabelProjectResult.Text = srSql.ds.Tables["tb_topic"].Rows[0]["projectResult"].ToString();
                ImageAvata.ImageUrl = srSql.ds.Tables["tb_topic"].Rows[0]["avatarMini"].ToString();
                ImageAvata.ToolTip = srSql.ds.Tables["tb_topic"].Rows[0]["userName"].ToString();
                LabelUserCollege.Text = srSql.ds.Tables["tb_topic"].Rows[0]["userCollege"].ToString();
                LabelUserIntro.Text = srSql.ds.Tables["tb_topic"].Rows[0]["userIntro"].ToString();
                LabelUserMajor.Text = srSql.ds.Tables["tb_topic"].Rows[0]["userMajor"].ToString();
                LabelUserName.Text = srSql.ds.Tables["tb_topic"].Rows[0]["userName"].ToString();
                LabelUserPst.Text = srSql.ds.Tables["tb_topic"].Rows[0]["userIdentity"].ToString();
            }
            
        }
    }
}