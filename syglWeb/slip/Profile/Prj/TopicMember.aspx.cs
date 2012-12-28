using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;
using System.Data;

namespace syglWeb.slip.Profile.Prj
{
    public partial class TopicMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string _topicID = Request.QueryString["tid"];

            if (_topicID == "" || _topicID == null)
            {
                Response.Redirect("/slip/404.aspx");
            }
            else
            {
                int topicID = Convert.ToInt32(_topicID);
                HyperLinkAddMb.NavigateUrl = "EditTopicMb.aspx?tid="+topicID;
                HiddenFieldTopicID.Value = topicID.ToString();
                
                SRSql srSql = new SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from topicMbTB where mbForTopic=@topicID order by topicMbIdentity ";
                srSql.cmd.Parameters.AddWithValue("@topicID" ,topicID);

                srSql.da.Fill(srSql.ds,"tb_topicMb");

                RepeaterProjMem.DataSource=srSql.ds.Tables["tb_topicMb"].DefaultView;
                RepeaterProjMem.DataBind();

                srSql.conn.Close();
            }
        }

        protected void RepeaterProjMem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);

            Label labelMbIdentity = (e.Item.FindControl("LabelIdentity") as Label);

            HyperLink hdEditmb = (e.Item.FindControl("HyperLinkEditMb") as HyperLink);
            hdEditmb.NavigateUrl = "EditTopicMb.aspx?tid=" + drv["mbForTopic"] + "&mbid="+drv["topicMbID"];
            switch(Convert.ToInt32(drv["topicMbIdentity"])){
                case 0:
                    labelMbIdentity.Text = "教师";
                    break;
                case 1:
                    labelMbIdentity.Text = "学生";
                    break;
            }
        }
    }
}