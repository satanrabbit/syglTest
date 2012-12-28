using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Profile.Prj
{
    public partial class EditTopicMb : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                
                string mbName = Request[TextBoxMbName.UniqueID].Trim();
                string _mbId = (Request[ HiddenFieldTopicMbID.UniqueID]).Trim();
                int mbIdentity= Convert.ToInt32( Request[RadioButtonList1.UniqueID].Trim());
                string mbPst = Request[TextBoxMbPst.UniqueID].Trim();
                string mbNum = Request[TextBoxMbNum.UniqueID].Trim();
                string mbPhone = Request[TextBoxMbPhone.UniqueID].Trim();
                string mbCollege = Request[TextBoxMbCollege.UniqueID].Trim();
                string mbMajor = Request[TextBoxMbMajor.UniqueID].Trim();
                string mbWork = Request[TextBoxMbWork.UniqueID].Trim();
                int tid = Convert.ToInt32(Request[HiddenFieldTopicID.UniqueID].Trim());

                SRSql srSql = new SRSql();
                srSql.conn.Open();
                if (_mbId == "" || _mbId == null)
                {
                    //插入

                   
                    srSql.cmd.CommandText = "insert into topicMbTb (topicMbName, topicMbCollege, topicMbMajor, topicMbIdentity,topicMbWork , mbForTopic, topicMbPst, topicMbPhone, topicMbNum) VALUES  (@topicMbName, @topicMbCollege, @topicMbMajor, @topicMbIdentity,@topicMbWork , @mbForTopic, @topicMbPst, @topicMbPhone, @topicMbNum)";

                    srSql.cmd.Parameters.AddWithValue("@topicMbName", mbName);
                    srSql.cmd.Parameters.AddWithValue("@topicMbCollege", mbCollege);
                    srSql.cmd.Parameters.AddWithValue("@topicMbMajor", mbMajor);
                    srSql.cmd.Parameters.AddWithValue("@topicMbIdentity", mbIdentity);
                    srSql.cmd.Parameters.AddWithValue("@topicMbWork", mbWork);
                    srSql.cmd.Parameters.AddWithValue("@mbForTopic", tid);
                    srSql.cmd.Parameters.AddWithValue("@topicMbPst", mbPst);
                    srSql.cmd.Parameters.AddWithValue("@topicMbPhone", mbPhone);
                    srSql.cmd.Parameters.AddWithValue("@topicMbNum", mbNum);
                    srSql.cmd.ExecuteNonQuery();
                }
                else
                {
                    //更新

                    int topicMbID = Convert.ToInt32(_mbId);

                    srSql.cmd.CommandText = "update topicMbTb set "+
                    "topicMbName=@topicMbName,"+
                    " topicMbCollege=@topicMbCollege," +
                    "  topicMbMajor=@topicMbMajor," +
                    "  topicMbIdentity=@topicMbIdentity," +
                    " topicMbWork=@topicMbWork ," +
                    " mbForTopic=@mbForTopic," +
                    " topicMbPst=@topicMbPst," +
                    "  topicMbPhone=@topicMbPhone," +
                    "  topicMbNum=@topicMbNum" +
                    "  where topicMbID = @topicMbID";


                    srSql.cmd.Parameters.AddWithValue("@topicMbName", mbName);
                    srSql.cmd.Parameters.AddWithValue("@topicMbCollege", mbCollege);
                    srSql.cmd.Parameters.AddWithValue("@topicMbMajor", mbMajor);
                    srSql.cmd.Parameters.AddWithValue("@topicMbIdentity", mbIdentity);
                    srSql.cmd.Parameters.AddWithValue("@topicMbWork", mbWork);
                    srSql.cmd.Parameters.AddWithValue("@mbForTopic", tid);
                    srSql.cmd.Parameters.AddWithValue("@topicMbPst", mbPst);
                    srSql.cmd.Parameters.AddWithValue("@topicMbPhone", mbPhone);
                    srSql.cmd.Parameters.AddWithValue("@topicMbNum", mbNum);
                    srSql.cmd.Parameters.AddWithValue("@topicMbID", topicMbID);

                    srSql.cmd.ExecuteNonQuery();

                }

                

                srSql.conn.Close();

                Response.Redirect("/Slip/Profile/Prj/TopicMember.aspx?tid="+tid);
            }


            //
            string _mbID = Request.QueryString["mbid"];
            string _topicID = Request.QueryString["tid"];
            if (_topicID == null || _topicID == "")
            {
                Response.Redirect("/slip/404.aspx");
            }

            HyperLinkTopicMb.NavigateUrl = "/Slip/Profile/Prj/TopicMember.aspx?tid=" + _topicID;

            if (_mbID == "" || _mbID == null)
            {
                LabelEdit.Text = "添加成员";
                HiddenFieldTopicID.Value = _topicID;
            }
            else
            {
                int mbID = Convert.ToInt32(_mbID);
                SRSql srSql = new SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from topicMbTb where topicMbID=@mbID";
                srSql.cmd.Parameters.AddWithValue("@mbID", mbID);
                srSql.dr = srSql.cmd.ExecuteReader();
                srSql.dr.Read();
                TextBoxMbCollege.Text = srSql.dr["topicMbCollege"].ToString();
                TextBoxMbMajor.Text = srSql.dr["topicMbMajor"].ToString();
                TextBoxMbName.Text = srSql.dr["topicMbName"].ToString();
                TextBoxMbNum.Text = srSql.dr["topicMbNum"].ToString();
                TextBoxMbPhone.Text = srSql.dr["topicMbPhone"].ToString();
                TextBoxMbPst.Text = srSql.dr["topicMbPst"].ToString();
                TextBoxMbWork.Text = srSql.dr["topicMbWork"].ToString();
                HiddenFieldTopicID.Value = _topicID;
                HiddenFieldTopicMbID.Value = mbID.ToString();
                RadioButtonList1.SelectedValue = srSql.dr["topicMbIdentity"].ToString();

                srSql.conn.Close();
                LabelEdit.Text = "修改成员";
            }
        }
    }
}