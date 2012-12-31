using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.OleDb;
using System.Configuration;

namespace syglWeb.slip.Discuss
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int page = (Request.QueryString["page"] == "" || Request.QueryString["page"] == null) ? 0 : Convert.ToInt32(Request.QueryString["page"]) - 1;
            int pageSize = 20;
            int num = (page + 1) * pageSize;


            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter();
            OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
            conn.Open();
            OleDbCommand cmd = conn.CreateCommand();
            //默认进入的页面
            if (page == 0)
            {
                cmd.CommandText = "select top " + pageSize
                    + " issueID ,issueTitle, issuePostTime , userID ,userName ,userMajor,avatarMini from( issues_tb LEFT JOIN userTB ON issues_tb.issueAuthor = userTB.userID) order by issues_tb.issuePostTime desc";
            }
            else
            {
                cmd.CommandText = "select top " + pageSize
                    + " issueID ,issueTitle, issuePostTime , userID ,userName ,userMajor,avatarMini from( issues_tb LEFT JOIN userTB ON issues_tb.issueAuthor = userTB.userID)  where issueID not in( "
                    + " select top " + (num - pageSize) + " issueID from  issues_tb order by  issues_tb.issuePostTime desc ) order by issues_tb.issuePostTime desc";
            }

            da.SelectCommand = cmd;
            da.Fill(ds,"issue_user_tb");
          
            RepeaterIssues.DataSource = ds.Tables["issue_user_tb"].DefaultView;
            RepeaterIssues.DataBind();

            #region 分页导航
            int pages;

            cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select count(issueID) from issues_tb ";
            //cmd.Parameters.AddWithValue("@type", clm);
            pages = Convert.ToInt32(cmd.ExecuteScalar()) / pageSize + 1;
            if (pages < 2)
            {
                this.HyperLinkPrePage.Visible = false;
                this.HyperLinkNextPage.Visible = false;
            }

            if (page == 0)
            {
                this.HyperLinkPrePage.Visible = false;
            }

            if (page == pages - 1)
            {
                this.HyperLinkNextPage.Visible = false;
            }
            for (int i = 1; i <= pages; i++)
            {
                if (i == page + 1)
                {
                    this.LabelPages.Text = this.LabelPages.Text + "<a href='javascript:void(0);' class='current'>" + i + "</a>";
                }
                else
                {
                    this.LabelPages.Text = this.LabelPages.Text + "<a href='Default.aspx?page=" + i + "'>" + i + "</a>";
                }
            }
            #endregion

            conn.Close();

        }

        protected void RepeaterIssues_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
          
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            int issueID = Convert.ToInt32(drv["issueID"].ToString());
            //设置标题
            HyperLink title = e.Item.FindControl("HyperLinkIssueTitle") as HyperLink;
            title.Text = drv["issueTitle"].ToString();
            title.NavigateUrl = "issue.aspx?id=" + drv["issueID"].ToString();
            //设置头像
            Image avatarImg = e.Item.FindControl("ImageUserAvatar") as Image ;
            avatarImg.ImageUrl = drv["avatarMini"].ToString();
            HyperLink avatarLink = e.Item.FindControl("HyperLinkUserAvatar") as HyperLink;
            avatarLink.NavigateUrl = "#";
            //设置标签
            OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
            OleDbCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from (tags_tb left join tagIssues_tb on tags_tb.tagID=tagIssues_tb.tag ) where tagIssues_tb.Issue=@issueID";
            cmd.Parameters.AddWithValue("@issueID", issueID);
            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds, "tags_tb");
            conn.Close();
            Panel panel = e.Item.FindControl("PanelTags") as Panel;
            if (ds.Tables["tags_tb"].Rows.Count > 0)
            {
                panel.Visible = true;
                Repeater tags = e.Item.FindControl("RepeaterTags") as Repeater;
                tags.DataSource = ds.Tables["tags_tb"].DefaultView;
                tags.DataBind();
            }
            else
            {
                panel.Visible =false;
            }
             //设置 发帖人姓名
            HyperLink userName = e.Item.FindControl("HyperLinkUserName") as HyperLink;
            userName.Text = drv["userName"].ToString();

            //最后回复时间
            //cmd = new OleDbCommand();
           // cmd.Connection = conn;
            //cmd.CommandText = "select ";
            //，最后回复(<asp:HyperLink ID="HyperLinkReplayTime" runat="server"></asp:HyperLink>)：


           // HyperLink replayTime = e.Item.FindControl("") as HyperLink;
           // replayTime.Text = "";
        }

    }
}