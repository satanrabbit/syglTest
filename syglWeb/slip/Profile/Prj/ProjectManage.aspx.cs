using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Profile.Prj
{
    public partial class ProjectManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["tid"] != null && Request.QueryString["tid"].ToString() != "")
            {
                int topicID = Convert.ToInt32(Request.QueryString["tid"]);
                SRSql srSql = new SRSql();
                try
                {
                    srSql.conn.Open();
                    srSql.cmd.CommandText = "SELECT topicTB.*, userTB.*, projectTB.* FROM (topicTB left  JOIN userTB ON userTB.[userID] = topicTB.topicUser) left  JOIN projectTB ON topicTB.topicID = projectTB.topic where topicTB.topicID=@topicID";
                    srSql.cmd.Parameters.AddWithValue("@topicID",topicID);

                    srSql.da.Fill(srSql.ds,"tb_topic");
                    LabelTopicTitle.Text = srSql.ds.Tables["tb_topic"].Rows[0]["topicTitle"].ToString();
                    LabelTopicIntro.Text = srSql.ds.Tables["tb_topic"].Rows[0]["topicInfo"].ToString();
                    LabelTopicDetail.Text=srSql.ds.Tables["tb_topic"].Rows[0]["topicDetail"].ToString();
                    HyperLinkEditTopicInfo.Text = "修改";
                    HyperLinkEditTopicInfo.NavigateUrl = "/Slip/Profile/Prj/TopicCollect.aspx?tid=" + srSql.ds.Tables["tb_topic"].Rows[0]["topicID"].ToString();
                    HyperLinkEditTopicDetail.Text = "修改";
                    HyperLinkEditTopicDetail.NavigateUrl = "/Slip/Profile/Prj/TopicCollect.aspx?tid=" + srSql.ds.Tables["tb_topic"].Rows[0]["topicID"].ToString();

                    HyperLinkMProjMember.NavigateUrl = "/Slip/Profile/Prj/TopicMember.aspx?tid=" + srSql.ds.Tables["tb_topic"].Rows[0]["topicID"].ToString();

                    if (srSql.ds.Tables["tb_topic"].Rows[0]["projectID"].ToString() == "")
                    {
                        HyperLinkEditProjectIntro.Text = "填写";
                        HyperLinkEditProjectIntro.NavigateUrl = "/Slip/Profile/Prj/EditProject.aspx?tid=" + srSql.ds.Tables["tb_topic"].Rows[0]["topicID"].ToString()+"&t=0&c=intro";
                        LabelProjectIntro.Text = "未填写说明！";
                        HyperLinkEditProjectPlan.Text = "填写";
                        HyperLinkEditProjectPlan.NavigateUrl = "/Slip/Profile/Prj/EditProject.aspx?tid=" + srSql.ds.Tables["tb_topic"].Rows[0]["topicID"].ToString() + "&t=0&c=plan";
                        LabelProjectPlan.Text = "未填写实施方案！";
                        HyperLinkEditProjectResult.Text = "填写";
                        HyperLinkEditProjectResult.NavigateUrl = "/Slip/Profile/Prj/EditProject.aspx?tid=" + srSql.ds.Tables["tb_topic"].Rows[0]["topicID"].ToString() + "&t=0&c=result";
                        LabelProjectResult.Text = "未填写项目成果！";
                    }
                    else
                    {
                        HyperLinkEditProjectIntro.Text = "修改";
                        HyperLinkEditProjectIntro.NavigateUrl = "/Slip/Profile/Prj/EditProject.aspx?tid=" + srSql.ds.Tables["tb_topic"].Rows[0]["topicID"].ToString() + "&t=1&c=intro";
                        LabelProjectIntro.Text = srSql.ds.Tables["tb_topic"].Rows[0]["projectIntro"].ToString();
                        HyperLinkEditProjectPlan.Text = "修改";
                        HyperLinkEditProjectPlan.NavigateUrl = "/Slip/Profile/Prj/EditProject.aspx?tid=" + srSql.ds.Tables["tb_topic"].Rows[0]["topicID"].ToString() + "&t=1&c=plan";
                        LabelProjectPlan.Text = srSql.ds.Tables["tb_topic"].Rows[0]["projectPlan"].ToString();
                        HyperLinkEditProjectResult.Text = "修改";
                        HyperLinkEditProjectResult.NavigateUrl = "/Slip/Profile/Prj/EditProject.aspx?tid=" + srSql.ds.Tables["tb_topic"].Rows[0]["topicID"].ToString() + "&t=1&c=result";
                        LabelProjectResult.Text = srSql.ds.Tables["tb_topic"].Rows[0]["projectResult"].ToString();
                    }
                    HyperLinkMProjImg.NavigateUrl = "/Slip/Profile/Prj/ProjectPic.aspx?tid=" + srSql.ds.Tables["tb_topic"].Rows[0]["topicID"].ToString();

                }
                catch (Exception ex)
                {
                    srSql.conn.Close();
                }
                finally
                {
                    srSql.conn.Close();
                }
              
            }
            else
            {
                Response.Redirect("/Slip/404.aspx");
            }
        }
    }
}