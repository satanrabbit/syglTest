using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using LitJson;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Admin
{
    public partial class pc_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (Session["SlipAdmin"] == null)
            {
                //未登录 
                this.panel_Form.Visible = false;
                this.LabeLoginTip.Text = "未登录或登录超时！请重新登陆！<a href='LogOn.aspx'  target='_top'> 请登录</a>";
            }
            else
            {
                if (IsPostBack)
                {
                    int status = 0;
                    string msg = "未知错误！";

                    //保存数据 
                    string cpNotice = Request.Form["cpNotice"];
                    string cpPostTime = Request.Form["cpPostTime"];
                    string cpStartTime = Request.Form["cpStartTime"];
                    string cpEndTime = Request.Form["cpEndTime"];
                    string cpName = Request.Form["cpName"];
                    int cpYear = Convert.ToInt32( Request.Form["cpYear"]);
                    SRSql srSql = new SRSql();
                    srSql.conn.Open();
                    try
                    {
                        if (Request.Form["cpID"] == "" || Request.Form["cpID"] == null)
                        {
                            srSql.cmd.CommandText = "insert into cpTB (cpName,cpStartTime,cpEndTime,cpNotice,cpPostTime,cpYear ) values (" +
                                "@cpName,@cpStartTime,@cpEndTime,@cpNotice,@cpPostTime,@cpYear)";
                            srSql.cmd.Parameters.AddWithValue("@cpName", cpName);
                            srSql.cmd.Parameters.AddWithValue("@cpStartTime", cpStartTime);
                            srSql.cmd.Parameters.AddWithValue("@cpEndTime", cpEndTime);
                            srSql.cmd.Parameters.AddWithValue("@cpNotice", cpNotice);
                            srSql.cmd.Parameters.AddWithValue("@cpPostTime", cpPostTime);
                            srSql.cmd.Parameters.AddWithValue("@cpYear", cpYear); 
                        }
                        else
                        {
                            int cpID = Convert.ToInt32(Request.Form["cpID"]);
                            srSql.cmd.CommandText = "update cpTB set cpName=@cpName,cpStartTime=@cpStartTime,cpEndTime=@cpEndTime,cpNotice=@cpNotice,cpPostTime=@cpPostTime,cpYear=@cpYear where cpID=@cpID";
                            srSql.cmd.Parameters.AddWithValue("@cpName", cpName);
                            srSql.cmd.Parameters.AddWithValue("@cpStartTime", cpStartTime);
                            srSql.cmd.Parameters.AddWithValue("@cpEndTime", cpEndTime);
                            srSql.cmd.Parameters.AddWithValue("@cpNotice", cpNotice);
                            srSql.cmd.Parameters.AddWithValue("@cpPostTime", cpPostTime);
                            srSql.cmd.Parameters.AddWithValue("@cpYear", cpYear);
                            srSql.cmd.Parameters.AddWithValue("@cpID", cpID);
                        }

                        srSql.cmd.ExecuteNonQuery();

                        status = 1;
                        msg = "保存成功！";
                    }
                    catch (Exception ex)
                    {
                        msg = ex.Message;
                    }
                    finally
                    {
                        srSql.conn.Close();

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
                    this.cpYear.Text = DateTime.Now.Year.ToString();
                    if (Request.Params["did"] == "" || Request.Params["did"] == null)
                    {
                    }
                    else
                    {
                        int cpID = Convert.ToInt32(Request.Params["did"]);
                        SRSql srSql = new SRSql();
                        srSql.conn.Open();
                        srSql.cmd.CommandText = "select * from cpTB where cpID=@cpID ";
                        srSql.cmd.Parameters.AddWithValue("@cpID", cpID);

                        srSql.dr = srSql.cmd.ExecuteReader();

                        if (srSql.dr.Read())
                        {
                            this.cpID.Value = srSql.dr["cpID"].ToString();
                            this.cpName.Text = srSql.dr["cpName"].ToString();
                            this.cpNotice.Text = srSql.dr["cpNotice"].ToString();
                            this.cpPostTime.Text = ((DateTime)srSql.dr["cpPostTime"]).ToString("yyyy-MM-dd");
                            this.cpStartTime.Text = ((DateTime)srSql.dr["cpStartTime"]).ToString("yyyy-MM-dd");
                            this.cpEndTime.Text = ((DateTime)srSql.dr["cpEndTime"]).ToString("yyyy-MM-dd");
                        }

                        srSql.conn.Close();
                    }
                }
            }
        }
         
    }
}