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
    public partial class ptmIntroEdit : System.Web.UI.Page
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
                string msg = "未知错误！";
                string content = Request.Form["articleContent"];
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                try
                {
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "update  ptm_intro_tb set intro=@articleContent where ID=1";

                    cmd.Parameters.AddWithValue("@articleContent", content);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    status = 1;
                    msg = "保存成功！";
                }
                catch (Exception ex)
                {
                    conn.Close();
                    msg = ex.Message;
                }
                finally
                {
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

                // 初始化修改页面
                int aid = Convert.ToInt32(Request.QueryString["aid"]);
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                conn.Open();
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select intro from ptm_intro_tb where  ID=1";
                OleDbDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    this.articleContent.Text = dr["intro"].ToString();
                }
                conn.Close();

            }
        }
    }

}