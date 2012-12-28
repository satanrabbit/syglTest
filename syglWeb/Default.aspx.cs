using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using System.Data.SqlClient;

namespace syglWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter();

            string connStr = ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString;
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = connStr;
            conn.Open();
            //查询通知公告
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select TOP 6 articleID,articleTitle,articleIntro,articlePostTime from articles_tb where articleType in(select articleTypeID from articleTypes_tb where articleTypeParent=1) order by articlePostTime desc";

            da.SelectCommand = cmd;
            da.Fill(ds,"articles_tb_tzgg");

            Repeater_tzgg.DataSource = ds.Tables["articles_tb_tzgg"].DefaultView;
            Repeater_tzgg.DataBind();

            //工作动态
            cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select TOP 10 articleID,articleTitle,articlePostTime from articles_tb where articleType in(select articleTypeID from articleTypes_tb where articleTypeParent=2) order by articlePostTime desc";
            da.SelectCommand = cmd;
            da.Fill(ds, "articles_tb_gzdt");

            Repeater_gzdt.DataSource = ds.Tables["articles_tb_gzdt"].DefaultView;
            Repeater_gzdt.DataBind();
            //招标采购
            cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select TOP 9 articleID,articleTitle,articlePostTime from articles_tb where articleType in(select articleTypeID from articleTypes_tb where articleTypeParent=3) order by articlePostTime desc";
            da.SelectCommand = cmd;
            da.Fill(ds, "articles_tb_zbcg");

            Repeater_zbcg.DataSource = ds.Tables["articles_tb_zbcg"].DefaultView;
            Repeater_zbcg.DataBind();
            //办事流程
            cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select TOP 6 articleID,articleTitle from articles_tb where articleType in(select articleTypeID from articleTypes_tb where articleTypeParent= 4) order by articlePostTime desc";
            da.SelectCommand = cmd;
            da.Fill(ds, "articles_tb_bslc");

            Repeater_bslc.DataSource = ds.Tables["articles_tb_bslc"].DefaultView;
            Repeater_bslc.DataBind();
            //规章制度
            cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select TOP 10 articleID,articleTitle from articles_tb where articleType in(select articleTypeID from articleTypes_tb where articleTypeParent= 5) order by articlePostTime desc";
            da.SelectCommand = cmd;
            da.Fill(ds, "articles_tb_gzzd");

            Repeater_gzzd.DataSource = ds.Tables["articles_tb_gzzd"].DefaultView;
            Repeater_gzzd.DataBind();

            //文档下载
            cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select top 7 * from downs_tb order by downPostTime desc";
            da.SelectCommand = cmd;
            da.Fill(ds,"downs_tb");

            Repeater_wdxz.DataSource=ds.Tables["downs_tb"].DefaultView;
            Repeater_wdxz.DataBind();
            //轮播图片
            cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select * from imgs_tb ";
            da.SelectCommand = cmd;
            da.Fill(ds,"imgs_tb");

            this.marquee.DataSource = ds.Tables["imgs_tb"].DefaultView;
            this.marquee.DataBind();
            conn.Close();

        }
        //通知公告绑定
        protected void Repeater_tzgg_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            //标题
            HyperLink tzgg_title =(HyperLink)e.Item.FindControl("HyperLink_tzgg_title");
            tzgg_title.Text =drv["articleTitle"].ToString().Length>20?drv["articleTitle"].ToString().Substring(0,20)+"…":drv["articleTitle"].ToString();
            tzgg_title.ToolTip = drv["articleTitle"].ToString();
            tzgg_title.NavigateUrl = "art.aspx?aid="+drv["articleID"];
            //简介
            Label tzgg_intro = (Label)e.Item.FindControl("Label_tzgg_intro");
            tzgg_intro.Text = drv["articleIntro"].ToString().Length > 46 ? drv["articleIntro"].ToString().Substring(0,46) + "…" : drv["articleIntro"].ToString(); ;
            //时间
            Label tzgg_postTime = (Label)e.Item.FindControl("Label_tzgg_postTime");
            tzgg_postTime.Text = ((DateTime)drv["articlePostTime"]).ToShortDateString();
        }
        //工作动态绑定
        protected void Repeater_gzdt_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            HyperLink gzdt_title = (HyperLink)e.Item.FindControl("HyperLink_gzdt_title");
            gzdt_title.Text = drv["articleTitle"].ToString().Length > 17 ? drv["articleTitle"].ToString().Substring(0,17) + "…" : drv["articleTitle"].ToString();
            gzdt_title.NavigateUrl = "art.aspx?aid=" + drv["articleID"];
            //时间
            Label gzdt_postTime = (Label)e.Item.FindControl("Label_gzdt_postTime");
            gzdt_postTime.Text = ((DateTime)drv["articlePostTime"]).ToShortDateString();
        }
        //招标采购绑定
        protected void Repeater_zbcg_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            HyperLink gzdt_title = (HyperLink)e.Item.FindControl("HyperLink_zbcg_title");
            gzdt_title.Text = drv["articleTitle"].ToString().Length > 17 ? drv["articleTitle"].ToString().Substring(0, 17) + "…" : drv["articleTitle"].ToString();
            gzdt_title.NavigateUrl = "art.aspx?aid=" + drv["articleID"];
            //时间
            Label gzdt_postTime = (Label)e.Item.FindControl("Label_zbcg_postTime");
            gzdt_postTime.Text = ((DateTime)drv["articlePostTime"]).ToShortDateString();
        }
        //办事流程绑定
        protected void Repeater_bslc_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            HyperLink bslc_title = (HyperLink)e.Item.FindControl("HyperLink_bslc_title");
            bslc_title.Text = drv["articleTitle"].ToString().Length > 25 ? drv["articleTitle"].ToString().Substring(0, 25) + "…" : drv["articleTitle"].ToString();
            bslc_title.NavigateUrl = "art.aspx?aid=" + drv["articleID"];
        }
        //规章制度绑定

        protected void Repeater_gzzd_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            HyperLink gzzd_title = (HyperLink)e.Item.FindControl("HyperLink_gzzd_title");
            gzzd_title.Text = drv["articleTitle"].ToString().Length > 24 ? drv["articleTitle"].ToString().Substring(0, 24) + "…" : drv["articleTitle"].ToString();
            gzzd_title.NavigateUrl = "art.aspx?aid=" + drv["articleID"];
        }
        //文档下载数据绑定
        protected void Repeater_wdxz_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            HyperLink gzzd_title = (HyperLink)e.Item.FindControl("HyperLink_wdxz_title");
            gzzd_title.Text = drv["downTitle"].ToString().Length >25 ? drv["downTitle"].ToString().Substring(0, 25) + "…" : drv["downTitle"].ToString();
            gzzd_title.NavigateUrl = "down.aspx?did=" + drv["downID"];
        }

        

    }
}