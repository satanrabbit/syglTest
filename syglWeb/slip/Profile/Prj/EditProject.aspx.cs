using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Profile.Prj
{
    public partial class EditProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SRSql srSql = new SRSql();
            srSql.conn.Open();
            #region 处理提交表单
            if (IsPostBack)
            {
                int saveType =Convert.ToInt32( Request.Form[HiddenFieldOptTip.UniqueID]);
                int saveTopic = Convert.ToInt32(Request.Form[HiddenFieldTopicID.UniqueID]);
                string saveProjectColumn=Request.Form[HiddenFieldContent.UniqueID];
                string projectContent=Request.Form[TextBoxEditProject.UniqueID];

                switch (saveProjectColumn)
                {
                    case "plan"://方案 
                        saveProjectColumn = "projectPlan";
                        break;
                    case "result"://结果 
                        saveProjectColumn = "projectResult";
                        break;

                    case "intro"://说明 
                        saveProjectColumn = "projectIntro";
                        break;
                    default:
                        Response.Redirect("/Slip/404.aspx");
                        break;
                }
                switch (saveType)
                {
                    case 0://添加

                        srSql.cmd.CommandText =
                        "insert into projectTB " +
                       "( " + saveProjectColumn + ",topic) values (@projectContent,@topicID)";
                       
                        break;
                    case 1://修改 
                        srSql.cmd.CommandText =
                        "update  projectTB set " +
                       "  " + saveProjectColumn + " =@projectContent" +
                       " where topic=@topicID";

                        break;
                    default:
                        Response.Redirect("/Slip/404.aspx");
                        break;
                }
                srSql.cmd.Parameters.AddWithValue("@projectContent", projectContent);
                srSql.cmd.Parameters.AddWithValue("@topicID", saveTopic);

                srSql.cmd.ExecuteNonQuery();
                srSql.conn.Close();
                srSql = null;
                Response.Redirect("/Slip/Profile//Prj/ProjectManage.aspx?tid=" + saveTopic);

            }
            #endregion

            #region 请求参数是否正确
            if (Request.QueryString["tid"]==null||Request.QueryString["tid"]==""||Request.QueryString["t"]==null||Request.QueryString["t"]==""||Request.QueryString["c"]==null||Request.QueryString["c"]==""){
                Response.Redirect("/Slip/404.aspx");
            }
            #endregion

            #region 设置编辑器内容
            try
            {
                #region 设置操作提示
                int topicID = Convert.ToInt32(Request.QueryString["tid"]);
                int type = Convert.ToInt32(Request.QueryString["t"]);
                string content = Request.QueryString["c"];
                string optTip = "";

                switch (type)
                {
                    case 0:
                        optTip = "填写";
                        switch (content)
                        {
                            case "plan":
                                optTip = optTip + "项目方案";
                                break;
                            case "result":
                                optTip = optTip + "项目成果";
                                break;
                            case "intro":
                                optTip = optTip + "项目说明";
                                break;
                            default:
                                Response.Redirect("/Slip/404.aspx");
                                break;
                        }

                        break;
                    case 1:
                        optTip = "修改";
                        switch (content)
                        {
                            case "plan":
                                optTip = optTip + "项目方案";
                                srSql.cmd.CommandText = "select projectPlan from projectTB where topic= @topicID";
                                srSql.cmd.Parameters.AddWithValue("@topicID", topicID);
                                srSql.da.Fill(srSql.ds, "tb_project");

                                TextBoxEditProject.Text = srSql.ds.Tables["tb_project"].Rows[0]["projectPlan"].ToString();
                                HiddenFieldTopicID.Value = topicID.ToString();
                                break;
                            case "result":
                                optTip = optTip + "项目成果";
                                srSql.cmd.CommandText = "select projectResult from projectTB where topic= @topicID";
                                srSql.cmd.Parameters.AddWithValue("@topicID", topicID);
                                srSql.da.Fill(srSql.ds, "tb_project");

                                TextBoxEditProject.Text = srSql.ds.Tables["tb_project"].Rows[0]["projectResult"].ToString();
                                HiddenFieldTopicID.Value = topicID.ToString();
                                break;
                            case "intro":
                                optTip = optTip + "项目说明";
                                srSql.cmd.CommandText = "select projectIntro from projectTB where topic= @topicID";
                                srSql.cmd.Parameters.AddWithValue("@topicID", topicID);
                                srSql.da.Fill(srSql.ds, "tb_project");
                                TextBoxEditProject.Text = srSql.ds.Tables["tb_project"].Rows[0]["projectIntro"].ToString();
                                HiddenFieldTopicID.Value = topicID.ToString();
                                break;
                            default:
                                Response.Redirect("/Slip/404.aspx");
                                break;
                        }
                        break;
                    default:
                        Response.Redirect("/Slip/404.aspx");
                        break;
                }

                LabelOptTip.Text = optTip;
                HiddenFieldOptTip.Value = type.ToString();
                HiddenFieldContent.Value = content;
                #endregion

                #region 查询题目
                srSql.cmd.CommandText = "select topicTitle from topicTB where topicID= @topicID";
                srSql.cmd.Parameters.AddWithValue("@topicID", topicID);
                srSql.da.Fill(srSql.ds, "tb_topic");
                LabelTopicTitle.Text = srSql.ds.Tables["tb_topic"].Rows[0]["topicTitle"].ToString();
                HiddenFieldTopicID.Value = topicID.ToString();

                #endregion

            }
            catch (Exception ex)
            {
                srSql.conn.Close();
                Response.Redirect("/Slip/404.aspx");
            }
            finally
            {
                srSql.conn.Close();
                srSql = null;
            }
            #endregion
        }
    }
}