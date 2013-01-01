using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Profile.Prj
{
    public partial class TopicCollect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region 未登录
            if (Session["userID"] == null)
            {
                Response.Redirect("/Slip/LogOn.aspx");

            }
            #endregion

            #region 处理提交数据
            if (IsPostBack)
            {
                SRSql srSql = new SRSql();
                srSql.conn.Open();

                string topicTitle = Request.Form[TextBoxTopicTitle.UniqueID];
                string topicInfo = Request.Form[TextBoxTopicInfo.UniqueID];
                string topicDetail = Request.Form[TextBoxTopicDetaile.UniqueID];
                int topicUser = Convert.ToInt32(Session["userID"]);
                int topicID = 0;
                if (HiddenFieldTopicID.Value != null && (HiddenFieldTopicID.Value != ""))
                {
                    topicID = Convert.ToInt32(HiddenFieldTopicID.Value);
                    srSql.cmd.CommandText =
                    "update  topicTB set " +
                   " topicTitle =@topicTitle , topicInfo =@topicInfo  ,  topicDetail =@topicDetail" +
                   " where topicID=@topicID";

                    srSql.cmd.Parameters.AddWithValue("@topicTitle", topicTitle);
                    srSql.cmd.Parameters.AddWithValue("@topicInfo", topicInfo == null ? "" : topicInfo);
                    srSql.cmd.Parameters.AddWithValue("@tipicDetail", topicDetail == null ? "" : topicDetail);
                    srSql.cmd.Parameters.AddWithValue("@topicID", topicID);

                    srSql.cmd.ExecuteNonQuery();
                    srSql.conn.Close();
                    srSql = null;
                    Response.Redirect("/Slip/Profile//Prj/ProjectManage.aspx?tid=" + topicID);
                }
                else
                {
                    string postTime = DateTime.Now.ToLocalTime().ToString();

                    srSql.cmd.CommandText =
                     "insert into topicTB " +
                    "(  topicTitle ,  topicUser ,  topicpostTime,  topicInfo ,  topicDetail ) VALUES " +
                    "( @topicTitle , @topicUser , @topicpostTime ,@topicInfo , @topicDetail) ";

                    srSql.cmd.Parameters.AddWithValue("@topicTitle", topicTitle);
                    srSql.cmd.Parameters.AddWithValue("@topicUser", topicUser);
                    srSql.cmd.Parameters.AddWithValue("@topicpostTime", postTime);
                    srSql.cmd.Parameters.AddWithValue("@topicInfo", topicInfo == null ? "" : topicInfo);
                    srSql.cmd.Parameters.AddWithValue("@tipicDetail", topicDetail == null ? "" : topicDetail);

                    srSql.cmd.ExecuteNonQuery();
                    srSql.conn.Close();
                    srSql = null;
                    Response.Redirect("/Slip/Profile/?f=newTopic");
                }
            }
            #endregion

             
            
            if (Request.QueryString["tid"] != null && Request.QueryString["tid"] != "")
            {
                #region 修改
                int topicID = Convert.ToInt32(Request.QueryString["tid"]);
                SRSql srSql = new SRSql();
                try
                {
                    srSql.conn.Open();
                    srSql.cmd.CommandText = "select * from topicTB where topicID=@topicID";
                    srSql.cmd.Parameters.AddWithValue("@topicID", topicID);

                    srSql.da.Fill(srSql.ds, "tb_topic");

                    HiddenFieldTopicID.Value = topicID.ToString();

                    TextBoxTopicTitle.Text = srSql.ds.Tables["tb_topic"].Rows[0]["topicTitle"].ToString();
                    this.TextBoxTopicInfo.Text = srSql.ds.Tables["tb_topic"].Rows[0]["topicInfo"].ToString();
                    this.TextBoxTopicDetaile.Text = srSql.ds.Tables["tb_topic"].Rows[0]["topicDetail"].ToString();

                    srSql.conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                    srSql.conn.Close();
                }
                finally
                {
                    srSql.conn.Close();
                    srSql = null;
                }

             #endregion
            }
            else
            {

                #region 新建
                //检查是否是在征集题目时期
                string nd = DateTime.Now.ToString();
                SRSql srSql = new SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select count(tpID) from tpTB where tpIndex=0 and tpStartTime < @nowDate and tpEndTime > @nowDate";
                srSql.cmd.Parameters.AddWithValue("@noDate",nd);
                srSql.cmd.Parameters.AddWithValue("@noDate", nd);
                string am = srSql.cmd.ExecuteScalar().ToString();
                int amount = Convert.ToInt32(am);
                srSql.conn.Close();
                if (amount != 1)
                {
                    Response.Write("<script type='text/javascript'>alert('当前不在题目征集时间！');history.go(-1);</script>");
                    Response.End();
                }
                else
                {
                    //检查本期项目是否已经申请
                    srSql = new SRSql();

                    srSql.conn.Open();
                    srSql.cmd.CommandText = "select count(topicID) from topicTB where forCp in (select cpID from cpTB where cpYear=@cpy)";
                    string cpy = DateTime.Now.Year.ToString();

                    srSql.cmd.Parameters.AddWithValue("@cpy",cpy);

                    int ntp =(int) srSql.cmd.ExecuteScalar();

                    
                    if (ntp > 0)
                    {
                        //是，提示已经申请，返回
                        Response.Write("<script type='text/javascript'>alert('您已经申请了本年度项目课题！');history.go(-1);</script>");
                        Response.End();
                    }                  

                        //否，进入新建页面
                    srSql.conn.Close();
                }
                #endregion
            }

            
            
        }
    }
}