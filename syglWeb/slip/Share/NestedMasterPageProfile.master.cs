using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Share
{
    public partial class NestedMasterPageProfile : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userID"] != null)
            {
                string userID = Session["userID"].ToString();
                SRSql srSql = new SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from userTB where userID = @userID";
                srSql.cmd.Parameters.AddWithValue("@userID", userID);
                srSql.da.Fill(srSql.ds, "tb_user");
                this.ImagePortrait.ImageUrl = srSql.ds.Tables["tb_user"].Rows[0]["avatarMini"].ToString();
                
                //统计消息
                srSql.cmd.CommandText = "select msgType from msgs_tb where msgUser=@userID and msgIsRead=@isread";
                srSql.cmd.Parameters.Clear();
                srSql.cmd.Parameters.AddWithValue("@userID", userID);
                srSql.cmd.Parameters.AddWithValue("@isread", false);

                srSql.da.SelectCommand = srSql.cmd;

                srSql.da.Fill(srSql.ds, "msgs_tb");
                if (srSql.ds.Tables["msgs_tb"].Rows.Count > 0)
                {
                    this.LabelMsgCount.Text = "(" + srSql.ds.Tables["msgs_tb"].Rows.Count + ")";
                    int msgCount = srSql.ds.Tables["msgs_tb"].Select("msgType=1").Length;
                    if (msgCount > 0)
                    {
                        this.HyperLinkDiscussMsg.Text = "论坛消息("+msgCount+")";
                    }
                    int prjCount = srSql.ds.Tables["msgs_tb"].Select("msgType=2").Length;
                    if (prjCount > 0)
                    {
                        this.HyperLinkPrj.Text = "项目反馈(" + msgCount + ")";
                    }
                    int sysCount = srSql.ds.Tables["msgs_tb"].Select("msgType=0").Length;
                    if (sysCount > 0)
                    {
                        this.HyperLinkSysMsg.Text = "项目反馈(" + sysCount + ")";
                    }
                    int usermsgCount = srSql.ds.Tables["msgs_tb"].Select("msgType=3").Length;
                    if (usermsgCount > 0)
                    {
                        this.HyperLinkUserMsg.Text = "项目反馈(" + usermsgCount + ")";
                    }
                }


                srSql.conn.Close();
                srSql = null;
                
            }
            else
            {
                Response.Redirect("~/Slip/LogOn.aspx?f=noLogin");
            }
        }
    }
}