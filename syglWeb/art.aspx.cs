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
    public partial class Article : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["aid"] == "" || Request.QueryString["aid"] == null)
            {
                Response.Write("<script type='text/javascript'>alert('您的访问有误！');top.location='/';</script>");
            }
            else
            {
                int articleID = Convert.ToInt32(Request.QueryString["aid"]);
                string connStr = ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString;
                
                DataSet ds = new DataSet();
                OleDbDataAdapter da = new OleDbDataAdapter();
                OleDbConnection conn = new OleDbConnection();
                conn.ConnectionString = connStr;
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select * from articles_tb where articleID=@articleID";
                cmd.Parameters.AddWithValue("@articleID",articleID);

                da.SelectCommand = cmd;
                da.Fill(ds,"articles_tb");
                this.LabelArticleTitle.Text = ds.Tables["articles_tb"].Rows[0]["articleTitle"].ToString();
                if (ds.Tables["articles_tb"].Rows[0]["articleAuthor"].ToString() != "")
                {
                    this.LabelArticleAuthor.Text = "作者：" + ds.Tables["articles_tb"].Rows[0]["articleAuthor"].ToString();
                }
                else
                {
                    this.LabelArticleAuthor.Visible=false;
                }

                this.LabelArticlePostTime.Text = ((DateTime)ds.Tables["articles_tb"].Rows[0]["articlePostTime"]).ToShortDateString();
                this.LabelArticleContent.Text = ds.Tables["articles_tb"].Rows[0]["articleContent"].ToString();
                if (ds.Tables["articles_tb"].Rows[0]["articleIntro"].ToString().Trim() == "")
                {
                    this.Panel1.Visible = false;
                }
                else
                {
                    this.LabelArticleIntro.Text = ds.Tables["articles_tb"].Rows[0]["articleIntro"].ToString();
                }
                //栏目标题
                conn.Open();
                cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select * from articleTypes_tb where articleTypeID = " + ds.Tables["articles_tb"].Rows[0]["articleType"].ToString();
                OleDbDataReader dr = cmd.ExecuteReader();
                if(dr.Read()){
                    this.HyperLinkClmTitle.Text = dr["articleTypeName"].ToString();
                    this.HyperLinkClmTitle.NavigateUrl = "clm.aspx?clm=" + dr["articleTypeID"].ToString();

                }

                //最新发布
                cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select Top 6 articleID , articleTitle, articlePostTime from articles_tb where articleType = " + ds.Tables["articles_tb"].Rows[0]["articleType"].ToString();
                da.SelectCommand = cmd;
                da.Fill(ds,"articles_tb_latest");
                this.RepeaterLatest.DataSource = ds.Tables["articles_tb_latest"].DefaultView;
                this.RepeaterLatest.DataBind();

                conn.Close();


            }
        }
        //最新发布绑定
        protected void RepeaterLatest_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            HyperLink latest_title = (HyperLink)e.Item.FindControl("HyperLinkLatestTitle");
            latest_title.Text = drv["articleTitle"].ToString().Length > 24 ? drv["articleTitle"].ToString().Substring(0, 24) + "…" : drv["articleTitle"].ToString();
            latest_title.NavigateUrl = "art.aspx?aid=" + drv["articleID"];

            Label latestTime=(Label)(e.Item.FindControl("LabelLatestPostTime"));
            latestTime.Text = ((DateTime)drv["articlePostTime"]).ToShortDateString();
        }
    }
}