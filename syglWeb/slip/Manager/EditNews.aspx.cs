using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Manager
{
    public partial class EditNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            SRSql srSql = new SRSql();

            if (IsPostBack)
            {
                string newsID = Request.Form[HiddenFieldNewsID.UniqueID];
                string newsTitle = Request.Form[TextBoxNewsTitle.UniqueID];
                string newsPostTime = Request.Form[TextBoxNewsPostTime.UniqueID];
                if (newsPostTime == null || newsPostTime == "")
                {
                    newsPostTime = DateTime.Now.ToString();
                }
                string newsContent = Request.Form[TextBoxNewsContent.UniqueID];
                if (newsID == null || newsID == "")
                {
                    //新添加news
                    srSql.conn.Open();
                    srSql.cmd.CommandText = "insert into newsTB (newsTitle,newsPostTime,newsContent)values(@newsTitle,@newsPostTime,@newsContent)";
                    srSql.cmd.Parameters.AddWithValue("@newsTitle", newsTitle);
                    srSql.cmd.Parameters.AddWithValue("@newsPostTime", newsPostTime);
                    srSql.cmd.Parameters.AddWithValue("@newsContent", newsContent);
                    srSql.cmd.ExecuteNonQuery();
                    srSql.conn.Close();
                    Response.Redirect("MNews.aspx");

                }
                else
                {
                    int _newsID = Convert.ToInt32(newsID);
                    srSql.conn.Open();
                    srSql.cmd.CommandText = "update newsTB set newsTitle=@newsTitle,newsPostTime=@newsPostTime,newsContent=@newsContent where newsID=@newsID";
                    srSql.cmd.Parameters.AddWithValue("@newsTitle", newsTitle);
                    srSql.cmd.Parameters.AddWithValue("@newsPostTime", newsPostTime);
                    srSql.cmd.Parameters.AddWithValue("@newsContent", newsContent);
                    srSql.cmd.Parameters.AddWithValue("@newsID", newsID);
                    srSql.cmd.ExecuteNonQuery();
                    srSql.conn.Close();
                    Response.Redirect("MNews.aspx");
                }
            }
            else
            {
                string _newsID = Request.QueryString["nid"];
                if (_newsID == null || _newsID == "")
                {
                    TextBoxNewsPostTime.Text = DateTime.Now.ToString();
                }
                else
                {
                    srSql.conn.Open();
                    srSql.cmd.CommandText = "select * from newsTB where newsID=@newsID";
                    srSql.cmd.Parameters.AddWithValue("@newsID", Convert.ToInt32(_newsID));
                    srSql.da.Fill(srSql.ds, "tb_news");
                    TextBoxNewsTitle.Text = srSql.ds.Tables["tb_news"].Rows[0]["newsTitle"].ToString();
                    TextBoxNewsPostTime.Text = srSql.ds.Tables["tb_news"].Rows[0]["newsPostTime"].ToString();
                    TextBoxNewsContent.Text = srSql.ds.Tables["tb_news"].Rows[0]["newsContent"].ToString();
                    HiddenFieldNewsID.Value = _newsID;
                    srSql.conn.Close();
                }
            }


        }
    }
}