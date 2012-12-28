using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SRDel.SRSql srSql = new SRDel.SRSql();

            srSql.conn.Open();
            srSql.cmd.CommandText = "select newsID, newsTitle , newsPostTime from newsTB order by newsPostTime desc ";
            srSql.da.Fill(srSql.ds,"tb_news");
            RepeaterNewsList.DataSource = srSql.ds.Tables["tb_news"].DefaultView;
            RepeaterNewsList.DataBind();

            srSql.conn.Close();

        }
    }
}