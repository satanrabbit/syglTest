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
    public partial class spt_edit : System.Web.UI.Page
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
                string content = Request.Form["sptContent"];
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
                try
                {
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    if (Request.Params["spid"] == "" || Request.Params["spid"] == null)
                    {
                        msg = "不可添加！";
                    }
                    else
                    {
                        //修改文章
                        int aid = Convert.ToInt32(Request.Form["spid"]);
                        cmd.CommandText = "update  supportTB set supportContent=@supportContent where supportID=@aid";                       
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
                if (Request.Params["spid"] == null || Request.Params["spid"] == "")
                {
                    //初始化添加页面
                }
                else
                {
                    // 初始化修改页面
                    int aid = Convert.ToInt32(Request.Params["spid"]);
                    this.spid.Value = aid.ToString();
                    OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "select * from supportTB where supportID=@aid";
                    cmd.Parameters.AddWithValue("@aid", aid);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        this.sptTitle.Text = dr["supportTitle"].ToString();
                        this.sptTitle.ReadOnly = true;
                        this.sptContent.Text = dr["supportContent"].ToString(); 

                    }
                    conn.Close();
                }
            }
        }
    }
}