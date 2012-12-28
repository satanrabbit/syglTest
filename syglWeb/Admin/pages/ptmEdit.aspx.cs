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
    public partial class ptmEdit : System.Web.UI.Page
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
               
                string title = Request.Form["articleTitle"];  
                string content = Request.Form["articleContent"];
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                try
                {
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                     
                        //修改文章
                        int aid = Convert.ToInt32(Request.QueryString["aid"]);
                        cmd.CommandText = "update  ptms_tb set ptmName=@articleTitle ,ptmIntro=@articleContent where ptmID=@aid";
                        cmd.Parameters.AddWithValue("@articleTitle", title); 
                        cmd.Parameters.AddWithValue("@articleContent", content); 
                        cmd.Parameters.AddWithValue("@aid", aid);
                    
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
                    cmd.CommandText = "select * from ptms_tb where ptmID=@aid";
                    cmd.Parameters.AddWithValue("@aid", aid);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        this.articleTitle.Text = dr["ptmName"].ToString();
                        this.articleContent.Text = dr["ptmIntro"].ToString(); 
                    }
                    conn.Close();
                   
                
            }
        
        }
    }
}