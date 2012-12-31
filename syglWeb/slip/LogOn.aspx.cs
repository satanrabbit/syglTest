using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;
using System.Text;
using System.Data;
using System.Data.OleDb;

namespace syglWeb.slip
{
    public partial class LogOn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["SlipUser"] != null)
            {
                Response.Redirect("Profile");
            }

            if (Request.QueryString["f"] == "new_register")
            {
                LabelNewUserTip.Text = "您已经注册成功，请登陆！";
            }
            if (Request.QueryString["f"] == "unlogin")
            {
                LabelNewUserTip.Text = "您未登录，请登陆！";
            }


            #region 处理提交数据
            if (IsPostBack)
            {
                string returnUrl = Request.QueryString["reurl"];

                SRCom srCom = new SRCom();
                string userAccount = user_account.Text.Trim();
                string userPWD = srCom.HashPassword(user_password.Text.Trim());

                SRSql srSql = new SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from userTB where (userMail=@userMail or userNumber=@userNumber or userMobile=@userMobile) order by userID";
                srSql.cmd.Parameters.AddWithValue("@userMail", userAccount);
                srSql.cmd.Parameters.AddWithValue("@userNumber", userAccount);
                srSql.cmd.Parameters.AddWithValue("@userMobile", userAccount);
                srSql.da.Fill(srSql.ds, "tb_login_user");
                srSql.conn.Close();
                int userAmount = 0;
                int userAccountAmount = srSql.ds.Tables["tb_login_user"].Rows.Count;
                foreach (DataRow dataRow in srSql.ds.Tables["tb_login_user"].Rows)
                {
                    if (dataRow["userPWD"].ToString() == userPWD)
                    {
                        userAmount++;
                        Response.Cookies["SlipUser"]["userName"] = dataRow["userName"].ToString();
                        Response.Cookies["SlipUser"]["userID"] = dataRow["userID"].ToString();
                        Response.Cookies["SlipUser"].Expires = DateTime.Now.AddHours(2);
                        Response.Cookies["SlipUser"]["userIdentity"] = dataRow["userIdentity"].ToString();
                    }
                }

                if (userAmount > 1)
                {
                    this.LabelLoginUserTip.Text = "该账号存在两个,请更换帐号登陆！";
                    Response.Cookies["SlipUser"].Expires = DateTime.Now;
                }
                else
                {
                    if (userAccountAmount == 0)
                    {
                        this.LabelLoginUserTip.Text = "该账号不存在！";
                        Response.Cookies["SlipUser"].Expires = DateTime.Now;
                    }
                    else
                    {
                        if (userAmount < 1)
                        {
                            this.LabelLoginUserTip.Text = "密码错误！";
                            Response.Cookies["SlipUser"].Expires = DateTime.Now;
                        }
                        else
                        {
                            if (returnUrl == "" || returnUrl == null)
                            {
                                Response.Redirect("Profile");
                            }
                            else
                            {
                                Response.Redirect(returnUrl);
                            }
                        }
                    }
                }
            }
            #endregion
        }
    }
}