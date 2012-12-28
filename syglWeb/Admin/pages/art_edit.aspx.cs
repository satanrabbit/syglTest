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
    public partial class art_edit : System.Web.UI.Page
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
                string author = Request.Form["articleAuthor"];
                string postTime;
                if (Request.Form["articlePostTime"] == "" || Request.Form["articlePostTime"] == null)
                {
                    postTime = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");
                }
                else
                {
                    postTime = Request.Form["articlePostTime"];
                }
                string content = Request.Form["articleContent"];
                string intro = Request.Form["articleIntro"];
                int type = Convert.ToInt32(Request.Form["articleType"]);
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                try
                {
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    if (Request.QueryString["aid"] == "" || Request.QueryString["aid"] == null)
                    {
                        //新添加文章
                        cmd.CommandText = "insert into articles_tb (articleTitle,articleIntro,articleAuthor,articlePostTime,articleContent,articleType) values (@articleTitle,@articleIntro,@articleAuthor,@articlePostTime,@articleContent,@articleType)";
                        cmd.Parameters.AddWithValue("@articleTitle", title);
                        cmd.Parameters.AddWithValue("@articleIntro", intro);
                        cmd.Parameters.AddWithValue("@articleAuthor", author);
                        cmd.Parameters.AddWithValue("@articlePostTime", postTime);
                        cmd.Parameters.AddWithValue("@articleContent", content);
                        cmd.Parameters.AddWithValue("@articleType", type);
                    }
                    else
                    {
                        //修改文章
                        int aid = Convert.ToInt32(Request.QueryString["aid"]);
                        cmd.CommandText = "update  articles_tb set articleTitle=@articleTitle,articleIntro=@articleIntro,articleAuthor=@articleAuthor,articlePostTime=@articlePostTime,articleContent=@articleContent,articleType=@articleType where articleID=@aid";
                        cmd.Parameters.AddWithValue("@articleTitle", title);
                        cmd.Parameters.AddWithValue("@articleIntro", intro);
                        cmd.Parameters.AddWithValue("@articleAuthor", author);
                        cmd.Parameters.AddWithValue("@articlePostTime", postTime);
                        cmd.Parameters.AddWithValue("@articleContent", content);
                        cmd.Parameters.AddWithValue("@articleType", type);
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
                if (Request.QueryString["aid"] == null || Request.QueryString["aid"] == "")
                {
                    //初始化添加页面
                    //int clm=Convert.ToInt32(Request.QueryString["clm"]);
                    this.articleType.Value = (Request.QueryString["clm"]);
                }
                else
                {
                    // 初始化修改页面
                    int aid = Convert.ToInt32(Request.QueryString["aid"]);
                    OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "select * from articles_tb where articleID=@aid";
                    cmd.Parameters.AddWithValue("@aid", aid);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        this.articleTitle.Text = dr["articleTitle"].ToString();
                        this.articleContent.Text = dr["articleContent"].ToString();
                        this.articleAuthor.Text = dr["articleAuthor"].ToString();
                        this.articlePostTime.Text = ((DateTime)dr["articlePostTime"]).ToString("yyyy-MM-dd hh:mm:ss");
                        this.articleIntro.Text = dr["articleIntro"].ToString();
                        this.articleType.Value = dr["articleType"].ToString();
                    }
                    conn.Close();
                   
                }
            }
        }
    }
}