using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using LitJson;

namespace syglWeb.slip.Admin
{
    public partial class new_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["SlipAdmin"] == null)
            {
                Response.Redirect("/admLogin.aspx?f=unlogin");
            }
            if (IsPostBack)
            {
                int status = 0;
                string msg = "未知错误！";

                string title = Request.Form["newsTitle"]; 
                string postTime;
                if (Request.Form["newsPostTime"] == "" || Request.Form["newsPostTime"] == null)
                {
                    postTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                }
                else
                {
                    postTime = Request.Form["newsPostTime"];
                }
                string content = Request.Form["newsContent"]; 
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
                try
                {
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    if (Request.Params["nid"] == "" || Request.Params["nid"] == null)
                    {
                        //新添加文章
                        cmd.CommandText = "insert into newsTB (newsTitle,newsPostTime,newsContent) values (@newsTitle,@newsPostTime,@newsContent)";
                        cmd.Parameters.AddWithValue("@newsTitle", title); 
                        cmd.Parameters.AddWithValue("@newsPostTime", postTime);
                        cmd.Parameters.AddWithValue("@newsContent", content); 
                    }
                    else
                    {
                        //修改文章
                        int aid = Convert.ToInt32(Request.Form["nid"]);
                        cmd.CommandText = "update  newsTB set newsTitle=@newsTitle,newsPostTime=@newsPostTime,newsContent=@newsContent  where newsID=@aid";
                        cmd.Parameters.AddWithValue("@newsTitle", title);
                        cmd.Parameters.AddWithValue("@newsPostTime", postTime);
                        cmd.Parameters.AddWithValue("@newsContent", content); 
                        cmd.Parameters.AddWithValue("@aid", aid);
                    }
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
                //初始化页
                if (Request.Params["nid"] == null || Request.Params["nid"] == "")
                {
                    //初始化添加页面
                }
                else
                {
                    // 初始化修改页面
                    int aid = Convert.ToInt32(Request.Params["nid"]);
                    this.nid.Value = aid.ToString();
                    OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "select * from newsTB where newsID=@aid";
                    cmd.Parameters.AddWithValue("@aid", aid);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        this.newsTitle.Text = dr["newsTitle"].ToString();
                        this.newsContent.Text = dr["newsContent"].ToString(); 
                        this.newsPostTime.Text = ((DateTime)dr["newsPostTime"]).ToString("yyyy-MM-dd HH:mm:ss");
                        
                    }
                    conn.Close();

                }
            }
        }
    }
}