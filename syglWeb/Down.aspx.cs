using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

namespace syglWeb
{
    public partial class Down : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["did"] == "" || Request.QueryString["did"] == null)
            {
                Response.Write("<script type='text/javascript'>alert('访问出错！返回主页');window.location.href=('/');</script>");
                Response.End();
            }
            else
            {
                int downID = Convert.ToInt32(Request.QueryString["did"]);
                OleDbConnection conn = new OleDbConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString;
                conn.Open();
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select * from downs_tb where downID=@downID";
                cmd.Parameters.AddWithValue("@downID", downID);
                OleDbDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    this.LabelDownTitle.Text = dr["downTitle"].ToString();
                    if (dr["downIntro"].ToString() == "")
                    {
                        this.LabelDownIntro.Visible = false;
                    }
                    else
                    {
                        this.LabelDownIntro.Text = dr["downIntro"].ToString();
                    }
                    this.LabelDownPostTime.Text = ((DateTime)dr["downPostTime"]).ToString("yyyy年MM月dd日");
                    this.HyperLinkDownFile.Text = dr["downTitle"].ToString();
                    this.HyperLinkDownFile.NavigateUrl = dr["downFile"].ToString();
                }
                //最新发布
                DataSet ds = new DataSet();
                OleDbDataAdapter da=new OleDbDataAdapter();
                cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select top 7 * from downs_tb order by downPostTime desc ";
                
                da.SelectCommand = cmd;
                da.Fill(ds,"latest_tb");
                this.RepeaterLatest.DataSource = ds.Tables["latest_tb"].DefaultView;
                this.RepeaterLatest.DataBind();                
                conn.Close();

            }
        }
        //数据绑定
        protected void RepeaterLatest_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv =(DataRowView)e.Item.DataItem;
            HyperLink latest_title = (HyperLink)e.Item.FindControl("HyperLinkLatestTitle");
            latest_title.Text = drv["downTitle"].ToString().Length > 24 ? drv["downTitle"].ToString().Substring(0, 24) + "…" : drv["downTitle"].ToString();
            latest_title.NavigateUrl = "down.aspx?did=" + drv["downID"];

            Label latestTime = (Label)(e.Item.FindControl("LabelLatestPostTime"));
            latestTime.Text = ((DateTime)drv["downPostTime"]).ToShortDateString();
            if (drv["downIntro"].ToString() == "")
            {
                this.Panel1.Visible = false;
            }
            else
            {
                this.Panel1.Visible = true;
                this.LabelDownIntro.Text = drv["downIntro"].ToString();
            }
        }
    }
}