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
    public partial class op_edit : System.Web.UI.Page
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

                string title = Request.Form["opTitle"];
                string opYear;
                opYear = Request.Form["opYear"];
                 
                string content = Request.Form["opContent"];
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
                try
                {
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    if (Request.Params["opid"] == "" || Request.Params["opid"] == null)
                    {
                        //新添加文章
                        cmd.CommandText = "insert into oldProjects_tb (opTitle,opYear,opContent) values (@opTitle,@opYear,@opContent)";
                        cmd.Parameters.AddWithValue("@opTitle", title);
                        cmd.Parameters.AddWithValue("@opYear", opYear);
                        cmd.Parameters.AddWithValue("@opContent", content);
                    }
                    else
                    {
                        //修改文章
                        int aid = Convert.ToInt32(Request.Form["opid"]);
                        cmd.CommandText = "update  oldProjects_tb set opTitle=@opTitle,opYear=@opYear,opContent=@opContent  where opid=@aid";
                        cmd.Parameters.AddWithValue("@opTitle", title);
                        cmd.Parameters.AddWithValue("@opYear", opYear);
                        cmd.Parameters.AddWithValue("@opContent", content);
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
                if (Request.Params["opid"] == null || Request.Params["opid"] == "")
                {
                    //初始化添加页面
                }
                else
                {
                    // 初始化修改页面
                    int aid = Convert.ToInt32(Request.Params["opid"]);
                    this.nid.Value = aid.ToString();
                    OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "select * from oldProjects_tb where opID=@aid";
                    cmd.Parameters.AddWithValue("@aid", aid);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        this.opTitle.Text = dr["opTitle"].ToString();
                        this.opContent.Text = dr["opContent"].ToString();
                        this.opYear.Text = dr["opYear"].ToString(); ;

                    }
                    conn.Close();

                }
            }
        }
    }
}