using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;


namespace syglWeb.slip.Support
{
    public partial class SupportDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string supportID = Request.QueryString["sid"];
            if (supportID == null || supportID == "")
            {
                Response.Redirect("/slip/404.aspx");
            }
            else
            {
                SRSql srSql = new SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from supportTB where supportID=@supportID";
                srSql.cmd.Parameters.AddWithValue("@supportID", Convert.ToInt32(supportID));

                srSql.da.Fill(srSql.ds, "tb_support");
                LabelNewsTitle.Text = srSql.ds.Tables["tb_support"].Rows[0]["supportTitle"].ToString();
                LabelNewsContent.Text = srSql.ds.Tables["tb_support"].Rows[0]["supportContent"].ToString();
                srSql.conn.Close();
            }
        }
    }
}