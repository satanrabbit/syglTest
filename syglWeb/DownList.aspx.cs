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
    public partial class DownList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int page = 0;
            int pageSize = 10; 
            if (Request.QueryString["page"] != null && Request.QueryString["page"] != "")
            {
                page = Convert.ToInt32(Request.QueryString["page"])-1;
            }

            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter();
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString;
            conn.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            if (page == 0)
            {
                cmd.CommandText = "select top " + pageSize + " * from downs_tb order by downPostTime desc ";
            }
            else
            {
                int skipNum = pageSize * page;
                cmd.CommandText = "select top "+pageSize+
                    " * from downs_tb where downID not in (select top "+skipNum+
                    " downID from dows_tb order by downPostTime desc) order by downPostTime desc";
            }
            
            da.SelectCommand = cmd;
            da.Fill(ds,"downs_tb");

            this.RepeaterList.DataSource = ds.Tables["downs_tb"].DefaultView;
            this.RepeaterList.DataBind();
            #region 分页导航
            if (page == 0)
            {
                this.HyperLinkPrePage.Visible = false;
            }
            cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select count(downID) from downs_tb ";
            int pages =Convert.ToInt32( cmd.ExecuteScalar())/pageSize + 1;
            if (pages == page+1)
            {
                HyperLinkNextPage.Visible = false;
            }
            for (int i = 1; i <= pages; i++)
            {
                if (i == page+1)
                {

                    this.LabelPages.Text = this.LabelPages.Text + "<a href='javascript:void(0);' class='current'>" + i + "</a>";
                }
                else
                {
                    this.LabelPages.Text = this.LabelPages.Text + "<a href='DownList.aspx?page=" + i + "'>" + i + "</a>";
                }
            }
            #endregion
                #region 最新发布
                cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select top 8 * from downs_tb order by downPostTime desc ";

            da.SelectCommand = cmd;
            da.Fill(ds, "latest_tb");

            this.RepeaterLatest.DataSource = ds.Tables["latest_tb"].DefaultView;
            this.RepeaterLatest.DataBind();
            //Label1.Text = ds.Tables["latest_tb"].Rows.Count.ToString();
            #endregion
            conn.Close();

        }
        //数据绑定
        protected void RepeaterList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)e.Item.DataItem;
            HyperLink listTitle = (HyperLink)e.Item.FindControl("HyperLinkDownTitle");
            listTitle.Text = drv["downTitle"].ToString();
            listTitle.NavigateUrl = "down.aspx?did="+drv["downID"].ToString();
            Label postTime = (Label)e.Item.FindControl("LabelPostTime");
            postTime.Text = ((DateTime)drv["downPostTime"]).ToString("yyyy-MM-dd");
            if (e.Item.FindControl("LabelDownIntro") == null || e.Item.FindControl("LabelDownIntro").ToString() == "")
            {
                Label intro = (Label)e.Item.FindControl("LabelDownIntro");
                intro.Visible = false;
            }
            else
            {
                Label intro = (Label)e.Item.FindControl("LabelDownIntro");
                intro.Text = "<p>" + drv["downIntro"].ToString() + "</p>";
            }
        }

        protected void RepeaterLatest_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)e.Item.DataItem;
            HyperLink latest_title = (HyperLink)e.Item.FindControl("HyperLinkLatestTitle");
            latest_title.Text = drv["downTitle"].ToString().Length > 24 ? drv["downTitle"].ToString().Substring(0, 24) + "…" : drv["downTitle"].ToString();
            latest_title.NavigateUrl = "down.aspx?did=" + drv["downID"];

            Label latestTime = (Label)(e.Item.FindControl("LabelLatestPostTime"));
            latestTime.Text = ((DateTime)drv["downPostTime"]).ToShortDateString();
        }
    }
}