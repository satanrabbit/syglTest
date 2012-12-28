using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using LitJson;
using SRLib;

namespace syglWeb.Admin.pages
{
    public partial class edit_img : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["SyglAdmin"] == null)
            {

                Response.Redirect("/admLogin.aspx?f=unlogin");
            }
            else
            {
                Request.Cookies["SyglAdmin"].Expires = DateTime.Now.AddHours(1);
            }

            if (IsPostBack)
            {
                int status = 0;
                string msg = "未知错误";


                OleDbConnection conn = new OleDbConnection();
                try
                {
                    //接收数据
                    string file = Request["img_file"];
                    //转移缓存数据
                    SrCom srCom = new SrCom();
                    file = srCom.MoveFile(file, "/Sourse/Files/image/marquee/");
                    string link = Request["imgLink"];
                    conn.ConnectionString = (ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;

                    //保存数据
                    if (Request["imgID"] == "" || Request["imgID"] == null)
                    {
                        //新添加数据
                        cmd.CommandText = "insert into imgs_tb (imgFile,imgLink) values (@file,@link)";
                        cmd.Parameters.AddWithValue("@file", file);
                        cmd.Parameters.AddWithValue("@link", link);
                    }
                    else
                    {
                        //修改数据
                        int imgID = Convert.ToInt32(Request["imgID"]);
                        cmd.CommandText = "update imgs_tb set imgFile=@file,imgLink=@link where imgID=@imgID";
                        cmd.Parameters.AddWithValue("@file", file);
                        cmd.Parameters.AddWithValue("@link", link);
                        cmd.Parameters.AddWithValue("@imgID", imgID);
                    }
                    cmd.ExecuteNonQuery();
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
                    string echoStr = jd.ToJson();
                    Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                    Response.Write(echoStr);
                    Response.End();
                }
            }
            else
            {
                //初始化页面
                if (Request["imgID"] == "" || Request["imgID"] == null)
                {
                    //初始化添加页面
                    this.show_img_file.Visible = false;
                    this.img_file.Visible = false;
                }
                else
                {
                    //初始化修改页面
                    OleDbConnection conn = new OleDbConnection();
                    int imgID = Convert.ToInt32(Request["imgID"]);
                    conn.ConnectionString = (ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                    conn.Open();
                    OleDbCommand cmd = new OleDbCommand();
                    cmd.Connection = conn;
                    cmd.CommandText = "select * from imgs_tb where imgID=@imgID";
                    cmd.Parameters.AddWithValue("@imgID",imgID);
                    OleDbDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        this.show_img_file.ImageUrl = dr["imgFile"].ToString();
                        this.show_img_file.Width = 280;
                        this.img_file.Value = dr["imgFile"].ToString();
                        this.imgLink.Text = dr["imgLink"].ToString();
                        this.imgID.Value = imgID.ToString();
                    }
                    conn.Close();
                }
            }
        }
    }
}