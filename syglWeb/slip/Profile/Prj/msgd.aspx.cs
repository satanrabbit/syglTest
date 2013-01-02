using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;
using System.Data;

namespace syglWeb.slip.Profile.Prj
{
    public partial class msgd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SRSql srSql = new SRSql();
            srSql.conn.Open();
            int msgID = 0;
            if (Request.QueryString["m"] != "" && Request.QueryString["m"] != null)
            {
                msgID = Convert.ToInt32(Request.QueryString["m"]);
                srSql.cmd.CommandText = "select * from msgs_tb where msgID=" + msgID;
                srSql.dr = srSql.cmd.ExecuteReader();
                if (srSql.dr.Read())
                {
                    this.MsgContent.Text = srSql.dr["msgContent"].ToString();
                    this.MsgTitle.Text = srSql.dr["msgTitle"].ToString();

                    switch (Convert.ToInt32(srSql.dr["msgType"].ToString()))
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
                    Response.Redirect("/slip/404.aspx");
                }
                //更新消息已经被查看
                srSql.dr.Close();
                srSql.cmd.CommandText = "UPDATE msgs_tb set msgIsRead=true where msgID = " + msgID;
                srSql.cmd.ExecuteNonQuery();
                srSql.conn.Close();

            }
            else
            {
                Response.Redirect("/slip/404.aspx");
            }
        }
    }
}