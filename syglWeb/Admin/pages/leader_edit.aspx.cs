using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using LitJson;

namespace syglWeb.Admin.pages
{
    public partial class leader_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["SyglAdmin"] == null)
            {
                Response.Redirect("/admLogin.aspx?f=unlogin");
            }
            if (IsPostBack)
            {
                int status = 0;
                string msg = "未知错误";
                //保存数据
                //处理接收数据
                string header = Request.Form[this.TextBoxHeader.UniqueID];
                string hHexiTele = Request.Form[this.TextBoxHHexiTele.UniqueID];
                string hTedaTele = Request.Form[this.TextBoxHTedaTele.UniqueID];
                string subHeader = Request.Form[this.TextBoxSubHeader.UniqueID];
                string shHexiTele = Request.Form[this.TextBoxShHexiTele.UniqueID];
                string shTedaTele = Request.Form[this.TextBoxShTedaTele.UniqueID];

                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                try
                {
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "update ptm_intro_tb set header=@header,hHexiTele=@hHexiTele,hTedaTele=@hTedaTele,subHeader=@subHeader,shHexiTele=@shHexiTele,shTedaTele=@shTedaTele   where ID=1";
                    cmd.Parameters.AddWithValue("@header", header);
                    cmd.Parameters.AddWithValue("@hHexiTele", hHexiTele);
                    cmd.Parameters.AddWithValue("@hTedaTele", hTedaTele);
                    cmd.Parameters.AddWithValue("@subHeader", subHeader);
                    cmd.Parameters.AddWithValue("@shHexiTele", shHexiTele);
                    cmd.Parameters.AddWithValue("@shTedaTele", shTedaTele);
                    cmd.ExecuteNonQuery();

                    conn.Close();
                    status = 1;
                    msg = "修改成功！";
                }
                catch (Exception ex)
                {
                    conn.Close();
                    msg = ex.Message;
                }
                finally {
                    conn.Close();
                    JsonData jd = new JsonData();
                    jd["status"] = status;
                    jd["msg"] = msg;
                    string echoData = jd.ToJson();
                    Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                    Response.Write(echoData);
                    Response.End();
                }
            }
            else
            {
                //初始化页面
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                conn.Open();
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select * from  ptm_intro_tb where ID=1  ";
                OleDbDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    this.TextBoxHeader.Text = dr["header"].ToString();
                    this.TextBoxHHexiTele.Text = dr["hHexiTele"].ToString();
                    this.TextBoxHTedaTele.Text = dr["hTedaTele"].ToString();
                    this.TextBoxSubHeader.Text = dr["subHeader"].ToString();
                    this.TextBoxShHexiTele.Text = dr["shHexiTele"].ToString();
                    this.TextBoxShTedaTele.Text = dr["shTedaTele"].ToString();
                }

                conn.Close();
            }
        }
    }
}