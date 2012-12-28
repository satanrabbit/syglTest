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
    public partial class down_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["SyglAdmin"] == null)
            {
                Response.Redirect("/admLogin.aspx?f=unlogin");
            }
            if (IsPostBack)
            {  
                //获取提交数据
                string downTitle = Request.Form["downTitle"];
                string downIntro = Request.Form["downIntro"];
                string downFile = Request.Form["downFile"];
                DateTime downPostTime =DateTime.Parse(Request.Form["downPostTime"]); 

                //返回数据
                int status = 0;
                string msg = "未知错误";

                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                try
                {
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;

                    //保存提交数据
                    if (Request.QueryString["did"] == "" || Request.QueryString["did"] == null)
                    {
                        //添加文档
                        cmd.CommandText = "insert into downs_tb (downTitle,downIntro,downFile,downPostTime)values(@downTitle,@downIntro,@downFile,@downPostTime)";
                        cmd.Parameters.AddWithValue("@downTitle", downTitle);
                        cmd.Parameters.AddWithValue("@downIntro", downIntro);
                        cmd.Parameters.AddWithValue("@downFile", downFile);
                        cmd.Parameters.AddWithValue("@downPostTime", downPostTime);

                    }
                    else
                    {
                        //修改文档
                        int did = Convert.ToInt32(Request.QueryString["did"]);
                        cmd.CommandText = "update downs_tb set downTitle=@downTitle,downIntro=@downIntro,downFile=@downFile,downPostTime=@downPostTime where downID = @did";
                        cmd.Parameters.AddWithValue("@downTitle", downTitle);
                        cmd.Parameters.AddWithValue("@downIntro", downIntro);
                        cmd.Parameters.AddWithValue("@downFile", downFile);
                        cmd.Parameters.AddWithValue("@downPostTime", downPostTime);
                        cmd.Parameters.AddWithValue("@did", did);
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
                //初始化页面 || Request.QueryString["did"] == null
                if (Request.QueryString["did"] == "")
                {
                    //添加文档
                }
                else
                {
                    //修改文档
                    int did = Convert.ToInt32(Request.QueryString["did"]);
                    OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "select * from downs_tb where downID = @did";
                    cmd.Parameters.AddWithValue("@did",did);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        this.downFile.Text = dr["downFile"].ToString();
                        this.downIntro.Text = dr["downIntro"].ToString();
                        this.downPostTime.Text = ((DateTime)dr["downPostTime"]).ToString("yyyy-MM-dd hh:mm:ss");
                        this.downTitle.Text = dr["downTitle"].ToString();
                    }
                    conn.Close();
                }
            }
        }
    }
}