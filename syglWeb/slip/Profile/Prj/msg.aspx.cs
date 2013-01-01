using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;
using System.Data;
namespace syglWeb.slip.Profile.Prj
{
    public partial class msg : System.Web.UI.Page
    {
        /// <summary>
        /// 查看消息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                SRSql srSql=new SRSql();
                srSql.conn.Open();
                string sqlType = "";
                if (Request.QueryString["t"] != "" &&  Request.QueryString["t"] != null)
                {
                    sqlType = "and msgType=" + Convert.ToInt32(Request.QueryString["t"]);

                    switch (Convert.ToInt32(Request.QueryString["t"]))
                    {
                        case 0:
                            this.MsgTypeName.Text = "系统消息";
                            break;
                        case 1:
                            this.MsgTypeName.Text = "论坛消息";
                            break;
                        case 2:

                            this.MsgTypeName.Text = "项目消息";
                            break;
                        case 3:

                            this.MsgTypeName.Text = "短消息";
                            break;
                        default:

                            this.MsgTypeName.Visible = false;
                            break;
                    }

                }
                else
                {
                    this.MsgTypeName.Visible = false;
                }
                srSql.cmd.CommandText = "select * from msgs_tb where 1=1 "+ sqlType+" order by msgPostTime desc";

                srSql.da.SelectCommand =srSql.cmd;

                srSql.da.Fill(srSql.ds,"msgs_tb");
                this.RepeaterMsg.DataSource = srSql.ds.Tables["msgs_tb"].DefaultView;
                this.RepeaterMsg.DataBind();

                #region 分页导航
                int pages;
                int page = (Request.QueryString["page"] == "" || Request.QueryString["page"] == null) ? 0 : Convert.ToInt32(Request.QueryString["page"]) - 1;
                int pageSize = 20;
                int num = (page + 1) * pageSize;


                srSql.cmd.CommandText = "select count(msgID) from msgs_tb ";
                //cmd.Parameters.AddWithValue("@type", clm);
                pages = Convert.ToInt32(srSql.cmd.ExecuteScalar()) / pageSize + 1;
                if (pages < 2)
                {
                    this.HyperLinkPrePage.Visible = false;
                    this.HyperLinkNextPage.Visible = false;
                }

                if (page == 0)
                {
                    this.HyperLinkPrePage.Visible = false;
                }
                else
                {

                    this.HyperLinkPrePage.NavigateUrl = "msg.aspx?t=" + Request.QueryString["t"] + "&page=" + page;
                }

                if (page == pages - 1)
                {
                    this.HyperLinkNextPage.Visible = false;
                }
                else
                {

                    this.HyperLinkNextPage.NavigateUrl = "msg.aspx?t=" + Request.QueryString["t"] + "&page=" + page+2;
                }
                for (int i = 1; i <= pages; i++)
                {
                    if (i == page + 1)
                    {
                        this.LabelPages.Text = this.LabelPages.Text + "<a href='javascript:;' class='current'>" + i + "</a>";
                    }
                    else
                    {
                        this.LabelPages.Text = this.LabelPages.Text + "<a href='msg.aspx?t=" + Request.QueryString["t"] + "&page=" + i + "'>" + i + "</a>";
                    }
                }
                #endregion

                srSql.conn.Close();
            }
            else
            {
                Response.Redirect("/Slip/LogOn.aspx?reurl=" + Request.Url.ToString());
            }
        }

        protected void RepeaterMsg_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            HyperLink msgType = (e.Item.FindControl("HyperLinkMsgType") as HyperLink);
            msgType.NavigateUrl = "msg.aspx?t="+drv["msgType"].ToString();
            switch (Convert.ToInt32( drv["msgType"].ToString()))
            {
                case 0:
                    msgType.Text = "系统消息"; 
                    break;
                case 1:                    
                    msgType.Text = "论坛消息"; 
                    break;
                case 2:
                    msgType.Text = "项目消息"; 
                    break;
                case 3:
                    msgType.Text = "短消息"; 
                    break;
                default:
                    msgType.Visible = false; 
                    break;
            }
        }
    }
}