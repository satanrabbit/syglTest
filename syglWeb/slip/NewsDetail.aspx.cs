using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip
{
    public partial class NewsDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string newsID = Request.QueryString["nid"];
            if (newsID == null || newsID == "")
            {
                Response.Redirect("/slip/404.aspx");
            }
            else
            {
                SRSql srSql = new SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from newsTB where newsID=@newsID";
                srSql.cmd.Parameters.AddWithValue("@newsID",Convert.ToInt32(newsID));

                srSql.da.Fill(srSql.ds,"tb_news");
                LabelNewsTitle.Text = srSql.ds.Tables["tb_news"].Rows[0]["newsTitle"].ToString();
                LabelNewsPostTime.Text = srSql.ds.Tables["tb_news"].Rows[0]["newsPostTime"].ToString();
                LabelNewsContent.Text = srSql.ds.Tables["tb_news"].Rows[0]["newsContent"].ToString();
                srSql.conn.Close();
            }
        }
    }
}