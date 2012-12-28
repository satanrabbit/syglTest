using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip
{
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SRDel.SRSql srSql = new SRDel.SRSql();

            srSql.conn.Open();
            //新闻
            srSql.cmd.CommandText = "select top 5 newsID, newsTitle from newsTB order by newsPostTime ";

            srSql.da.Fill(srSql.ds, "tb_news");
            RepeaterNews.DataSource = srSql.ds.Tables["tb_news"].DefaultView;
            RepeaterNews.DataBind();

            //项目
            srSql.cmd.CommandText = "select top 6 topicTB.topicID ,topicTB.topicTitle,topicTB.topicInfo,topicTB.topicLogo,topicLogoMini ,userTB.userID,userTB.userName from (topicTB left join userTB on topicTB.TopicUser=userTB.userID) where 1=1 ";
            srSql.da.Fill(srSql.ds,"tb_topic");
            RepeaterTopic.DataSource = srSql.ds.Tables["tb_topic"].DefaultView;
            RepeaterTopic.DataBind();

            srSql.conn.Close();
        }
    }
}