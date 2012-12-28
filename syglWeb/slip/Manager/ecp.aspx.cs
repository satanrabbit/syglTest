using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip.Manager
{
    public partial class ecp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region 提交表单
            if (IsPostBack)
            {

                string _cpID = Request.Form[HiddenFieldCpID.UniqueID].ToString();
                string cpYear = Request.Form[TextBoxCpYear.UniqueID].ToString();
                string cpName = Request.Form[TextBoxCpName.UniqueID].ToString();
                string cpStartTime = Request.Form[TextBoxCpStartTime.UniqueID].ToString();
                string cpEndTime = Request.Form[TextBoxCpEndTime.UniqueID].ToString();
                string cpNotice = Request.Form[TextBoxCpNotice.UniqueID].ToString();

                string cpPostTime = DateTime.Now.ToString();

                SRDel.SRSql srSql = new SRDel.SRSql();
                srSql.conn.Open();
                if (_cpID == null || _cpID == "")
                {
                    //新插入
                    srSql.cmd.CommandText = "insert into cpTB (cpName,cpYear,cpStartTime,cpEndTime,cpNotice,cpPostTime)values(@cpName,@cpYear,@cpStartTime,@cpEndTime,@cpNotice,@cpPostTime)";
                    srSql.cmd.Parameters.AddWithValue("@cpName", cpName);
                    srSql.cmd.Parameters.AddWithValue("@cpYear", cpYear);
                    srSql.cmd.Parameters.AddWithValue("@cpStartTime", cpStartTime);
                    srSql.cmd.Parameters.AddWithValue("@cpEndTime", cpEndTime);
                    srSql.cmd.Parameters.AddWithValue("@cpNotice", cpNotice);
                    srSql.cmd.Parameters.AddWithValue("@cpPostTime", cpPostTime);

                    srSql.cmd.ExecuteNonQuery();

                }
                else
                {
                    //更新

                    srSql.cmd.CommandText = "update cpTB set cpName=@cpName,cpYear=@cpYear,cpStartTime=@cpStartTime,cpEndTime=@cpEndTime,cpNotice=@cpNotice,cpPostTime=@cpPostTime where cpID=@cpID";
                    int cpID = Convert.ToInt32(_cpID);
                    srSql.cmd.Parameters.AddWithValue("@cpName", cpName);
                    srSql.cmd.Parameters.AddWithValue("@cpYear", cpYear);
                    srSql.cmd.Parameters.AddWithValue("@cpStartTime", cpStartTime);
                    srSql.cmd.Parameters.AddWithValue("@cpEndTime", cpEndTime);
                    srSql.cmd.Parameters.AddWithValue("@cpNotice", cpNotice);
                    srSql.cmd.Parameters.AddWithValue("@cpPostTime", cpPostTime);
                    srSql.cmd.Parameters.AddWithValue("@cpID", cpID);
                    srSql.cmd.ExecuteNonQuery();
                }
                srSql.conn.Close();
                Response.Redirect("cp.aspx");
            }
            #endregion

            #region 进入
            string _cpid = Request.QueryString["cpid"];

            if (_cpid == null || _cpid == "")
            {
                //添加
                //设置默认年度
                TextBoxCpYear.Text = DateTime.Now.Year.ToString();
            }
            else
            {
                //保存
                int cpid=Convert.ToInt32(_cpid);
                SRDel.SRSql srSql = new SRDel.SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from cpTB where cpID=@cpid";
                srSql.cmd.Parameters.AddWithValue("@cpid",cpid);
                srSql.dr = srSql.cmd.ExecuteReader();
                if (srSql.dr.Read())
                {
                    HiddenFieldCpID.Value = _cpid;
                    TextBoxCpName.Text=srSql.dr["cpName"].ToString();
                    TextBoxCpEndTime.Text = ((DateTime)srSql.dr["cpEndTime"]).ToShortDateString();
                    TextBoxCpNotice.Text = srSql.dr["cpNotice"].ToString();
                    TextBoxCpStartTime.Text = ((DateTime)srSql.dr["cpStartTime"]).ToShortDateString();
                    TextBoxCpYear.Text = srSql.dr["cpYear"].ToString();
                }

                srSql.conn.Close();
            }

            #endregion
        }
    }
}