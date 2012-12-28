using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip
{
    public partial class tpNotice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tpid = Request.QueryString["tpid"];
            if (tpid == null || tpid == "")
            {
                Response.Redirect("/slip/404.aspx");
            }
            else
            {
                int _tpid = Convert.ToInt32(tpid);
                SRDel.SRSql srSql = new SRDel.SRSql();

                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from tpTB where tpID=@tpid";

                srSql.cmd.Parameters.AddWithValue("@tpid",_tpid);
                srSql.dr = srSql.cmd.ExecuteReader();
                if (srSql.dr.Read())
                {
                    LabelNoticeContent.Text = srSql.dr["tpNotice"].ToString();
                    LabelNoticeTitle.Text = srSql.dr["tpName"].ToString();
                    LabelNoticePostTime.Text = "进行时间：<span style='color:#bf3f3f; font-weight:600; font-size:14px;'>" + ((DateTime)srSql.dr["tpStartTime"]).ToLongDateString() + "</span>  至  <span style='color:#bf3f3f;font-weight:600; font-size:14px;'>" + ((DateTime)srSql.dr["tpEndTime"]).ToLongDateString() + "</span>";
                    switch(Convert.ToInt32(srSql.dr["tpIndex"].ToString())){
                        case 0:
                            HyperLinkOpt.Text = "申请课题";
                            HyperLinkOpt.NavigateUrl = "/slip/Profile/Prj/TopicCollect.aspx";
                            break;
                        case 1:
                            break;
                }

                }
                srSql.conn.Close();
            }

        }
    }
}