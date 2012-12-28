using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using SRLib;

namespace syglWeb
{
    public partial class admLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SrCom srCom = new SrCom();
                string account=Request.Form[this.TextBoxAccount.UniqueID].Trim();
                string pwd = srCom.HashPassword( Request.Form[this.TextBoxPwd.UniqueID].Trim());
                string connStr=ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString;
                OleDbConnection conn = new OleDbConnection(connStr);
                conn.Open();
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select * from admins_tb where adminAccount=@account";
                cmd.Parameters.AddWithValue("@account",account);

                OleDbDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    //帐号正确
                    string dbpwd = dr["adminPwd"].ToString();
                    if (dbpwd == pwd)
                    {
                        //密码正确
                        Response.Cookies["SyglAdmin"]["account"] = dr["adminAccount"].ToString();
                        Response.Cookies["SyglAdmin"]["adminID"] = dr["adminID"].ToString();
                        Response.Cookies["SyglAdmin"].Expires = DateTime.Now.AddHours(3);
                        Response.Redirect("./Admin/");
                    }
                    else
                    {
                        //密码错误
                        this.LabelLoginTip.Text = "密码错误! ";//" + pwd;
                        this.LabelLoginTip.Visible = true;
                    }
                }
                else
                {

                    //帐号错误
                    this.LabelLoginTip.Text = "帐号不存在! ";
                    this.LabelLoginTip.Visible = true;
                }
                dr.Close();
                dr = null;
                conn.Close();

            }
            else
            {
                //初始化
                if (Request.QueryString["f"] == "unlogin")
                {
                    this.LabelLoginTip.Visible = true;
                    this.LabelLoginTip.Text = "您未登录或登录超时，请重新登陆！";
                }
            }
        }
    }
}