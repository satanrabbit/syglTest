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
    public partial class clm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["clm"] == "" || Request.QueryString["clm"] == null)
            {
                Response.Write("<script type='text/javascript'>alert('您的访问有误！返回主页');self.location='/';</script>");
                Response.End();
            }
            else
            {
                int clm = Convert.ToInt32(Request.QueryString["clm"]);
                int page = (Request.QueryString["page"] == "" || Request.QueryString["page"] == null) ? 0 : Convert.ToInt32(Request.QueryString["page"])-1;
                int pageSize =10;
                #region 文章列表
                string connStr = ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString;

                DataSet ds = new DataSet();
                OleDbDataAdapter da = new OleDbDataAdapter();

                OleDbConnection conn=new OleDbConnection();
                conn.ConnectionString = connStr;
                conn.Open();
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = conn;
                int num = (page + 1) * pageSize;
                if (page == 0)
                {
                    cmd.CommandText = "select top " + pageSize
                    + " articleID,articleTitle,articlePostTime,articleIntro from  articles_tb where articleType = @type1  order by articlePostTime desc ";

                }
                else
                {
                    cmd.CommandText = "select top " + pageSize
                        + " articleID,articleTitle,articlePostTime,articleIntro from  articles_tb where articleType = @type1 and articleID not in( "
                        + " select top " + (num - pageSize) + " articleID from  articles_tb where articleType =@type  order by articlePostTime desc )  order by articlePostTime desc ";
                }
                cmd.Parameters.AddWithValue("@type1",clm);
                cmd.Parameters.AddWithValue("@type", clm);
                da.SelectCommand = cmd;
                da.Fill(ds ,"arts_tb");
                
                this.RepeaterList.DataSource = ds.Tables["arts_tb"].DefaultView;
                this.RepeaterList.DataBind();
                #endregion

                #region 分页导航
                int pages;
               
                cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select count(articleID) from articles_tb where articleType=@type";
                cmd.Parameters.AddWithValue("@type",clm);
                pages =Convert.ToInt32( cmd.ExecuteScalar())/pageSize+1;
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
                        this.LabelPages.Text = this.LabelPages.Text + "<a href='clm.aspx?clm=" + clm + "&page=" + i + "'>" + i + "</a>";
                    }
                }
                #endregion

                #region 栏目标题
                cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select articleTypeID,articleTypeName from articleTypes_tb where articleTypeID=" + clm;
                OleDbDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    this.HyperLinkClmTitle.Text = dr["articleTypeName"].ToString();
                    this.HyperLinkClmTitle.NavigateUrl = "clm.aspx?clm=" + dr["articleTypeID"].ToString();
                }
                #endregion

                

                #region 最近发布
                cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select top 8 articleID ,articleTitle ,articlePostTime from articles_tb where articleType = "+clm+" order by articlePostTime desc";
                da.SelectCommand = cmd;
                //dr = cmd.ExecuteReader();
                da.Fill(ds,"latests_tb");
                this.RepeaterLatest.DataSource = ds.Tables["latests_tb"].DefaultView;
                this.RepeaterLatest.DataBind();

                #endregion

                conn.Close();
            }
        }
        #region 文章列表数据绑定
        protected void RepeaterList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)e.Item.DataItem;
            HyperLink artTitle = (HyperLink)e.Item.FindControl("HyperLinkArtTitle");
            artTitle.Text=drv["articleTitle"].ToString();
            artTitle.NavigateUrl = "art.aspx?aid="+drv["articleID"].ToString();
            Label artIntro = (Label)e.Item.FindControl("LabelArtIntro");
            if (drv["articleIntro"].ToString().Trim() != "")
            {
                artIntro.Text = "<P>" + drv["articleIntro"].ToString() + "</p>";
            }
            Label artPostTime = (Label)e.Item.FindControl("LabelPostTime");
            artPostTime.Text = ((DateTime)drv["articlePostTime"]).ToShortDateString();
        }
        #endregion
        #region 最近发布文章数据绑定
        protected void RepeaterLatest_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)e.Item.DataItem;
            HyperLink latestTitle =(HyperLink)e.Item.FindControl("HyperLinkLatestTitle");
            latestTitle.NavigateUrl = "art.aspx?aid=" + drv["articleID"].ToString();
            latestTitle.Text = drv["articleTitle"].ToString();
            Label latestPostTime = (Label)e.Item.FindControl("LabelLatestPostTime");
            latestPostTime.Text = ((DateTime)drv["articlePostTime"]).ToShortDateString();
        }
        #endregion
    }
}