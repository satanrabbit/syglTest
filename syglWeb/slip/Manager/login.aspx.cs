using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip.Manager
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (IsPostBack)
            {
                SRDel.SRCom srCom = new SRDel.SRCom();
                string adminAccount = Request.Form[TextBoxAdminAccount.UniqueID];
                string adminPWD=Request.Form[TextBoxAdminPWD.UniqueID];
                adminPWD = srCom.HashPassword(adminPWD);
                SRDel.SRSql srSql = new SRDel.SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from adminTB where adminAccount=@adminAccount";
                srSql.cmd.Parameters.AddWithValue("@adminAccount",adminAccount);
                srSql.dr = srSql.cmd.ExecuteReader();

                if (srSql.dr.Read())
                {
                    if (adminPWD == srSql.dr["adminPWD"].ToString())
                    {
                        Response.Cookies["SlipAdmin"]["adminName"] = srSql.dr["adminName"].ToString();
                        Response.Cookies["SlipAdmin"]["adminID"] = srSql.dr["ID"].ToString();
                        Response.Cookies["SlipAdmin"].Expires = DateTime.Now.AddHours(2);
                        Response.Cookies["SlipAdmin"]["adminIdentity"] = srSql.dr["adminIdentity"].ToString();
                        Response.Redirect("/slip/Manager/");
                    }
                    else
                    {
                        Label1.Text = "密码错误！//"+adminPWD;
                    }
                }
                else
                {
                    Label1.Text = "帐号不存在！";
                }
                srSql.conn.Close();

            }
            RequiredFieldValidator1.Display = ValidatorDisplay.Dynamic;

            RequiredFieldValidator2.Display = ValidatorDisplay.Dynamic;
        }
    }
}