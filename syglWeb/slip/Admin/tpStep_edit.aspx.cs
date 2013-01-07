using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using LitJson;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Admin
{
    public partial class tpStep_edit : System.Web.UI.Page
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
                    int tpIndex = Convert.ToInt32(Request.Form["tpIndex"]);
                    int forCp = Convert.ToInt32(Request.Form["forCp"]);
                    string tpNotice = Request.Form["tpNotice"];
                    string tpPostTime = Request.Form["tpPostTime"];
                    string tpStartTime = Request.Form["tpStartTime"];
                    string tpEndTime = Request.Form["tpEndTime"];
                    string tpName = Request.Form["tpName"];
                    
                    SRSql srSql = new SRSql();
                    srSql.conn.Open();
                    try
                    {
                        if (Request.Form["tpID"] == "" || Request.Form["tpID"] == null)
                        {
                            srSql.cmd.CommandText = "insert into tpTB (tpName,tpStartTime,tpEndTime,tpNotice,tpPostTime,tpIndex,forCp) values (" +
                                "@tpName,@tpStartTime,@tpEndTime,@tpNotice,@tpPostTime,@tpIndex,@forCp)";
                            srSql.cmd.Parameters.AddWithValue("@tpName", tpName);
                            srSql.cmd.Parameters.AddWithValue("@tpStartTime", tpStartTime);
                            srSql.cmd.Parameters.AddWithValue("@tpEndTime", tpEndTime);
                            srSql.cmd.Parameters.AddWithValue("@tpNotice", tpNotice);
                            srSql.cmd.Parameters.AddWithValue("@tpPostTime", tpPostTime);
                            srSql.cmd.Parameters.AddWithValue("@tpIndex", tpIndex);
                            srSql.cmd.Parameters.AddWithValue("@forCp", forCp);
                        }
                        else
                        {
                            int tpID = Convert.ToInt32(Request.Form["tpID"]);
                            srSql.cmd.CommandText = "update tpTB set tpName=@tpName,tpStartTime=@tpStartTime,tpEndTime=@tpEndTime,tpNotice=@tpNotice,tpPostTime=@tpPostTime,tpIndex=@tpIndex,forCp=@forCp where tpID=@tpID";
                            srSql.cmd.Parameters.AddWithValue("@tpName", tpName);
                            srSql.cmd.Parameters.AddWithValue("@tpStartTime", tpStartTime);
                            srSql.cmd.Parameters.AddWithValue("@tpEndTime", tpEndTime);
                            srSql.cmd.Parameters.AddWithValue("@tpNotice", tpNotice);
                            srSql.cmd.Parameters.AddWithValue("@tpPostTime", tpPostTime);
                            srSql.cmd.Parameters.AddWithValue("@tpIndex", tpIndex);
                            srSql.cmd.Parameters.AddWithValue("@forCp", forCp);
                            srSql.cmd.Parameters.AddWithValue("@tpID", tpID);
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

                    int tpIndex = Convert.ToInt32(Request.Params["tpIndex"]);
                    int forCp = Convert.ToInt32(Request.Params["forCp"]);
                    SRSql srSql = new SRSql();
                    srSql.conn.Open();
                    srSql.cmd.CommandText = "select * from tpTB where tpIndex= @tpIndex and forCp= @forCp";
                    srSql.cmd.Parameters.AddWithValue("@tpIndex",tpIndex);
                    srSql.cmd.Parameters.AddWithValue("@forCp", forCp);

                    srSql.dr = srSql.cmd.ExecuteReader();

                    this.tpIndex.Value = tpIndex.ToString();
                    this.forCp.Value = forCp.ToString();

                    if (srSql.dr.Read())
                    {
                        this.tpID.Value = srSql.dr["tpID"].ToString();
                        this.tpName.Text = srSql.dr["tpName"].ToString();
                        this.tpNotice.Text = srSql.dr["tpNotice"].ToString();
                        this.tpPostTime.Text = ((DateTime)srSql.dr["tpPostTime"]).ToString("yyyy-MM-dd");
                        this.tpStartTime.Text = ((DateTime)srSql.dr["tpStartTime"]).ToString("yyyy-MM-dd");
                        this.tpEndTime.Text = ((DateTime)srSql.dr["tpEndTime"]).ToString("yyyy-MM-dd");
                    }

                    srSql.conn.Close();
                }
            }
        }
    }
}