using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using LitJson;

namespace syglWeb.Admin.pages
{
    public partial class leader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["SyglAdmin"] == null)
            {
                Response.Redirect("/admLogin.aspx?f=unlogin");
            }
            OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
            conn.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select * from  ptm_intro_tb where ID=1  ";
            OleDbDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                this.header.Text = dr["header"].ToString();
                this.hHexiTele.Text = dr["hHexiTele"].ToString();
                this.hTedaTele.Text = dr["hTedaTele"].ToString();
                this.subHeader.Text = dr["subHeader"].ToString();
                this.shHexiTele.Text = dr["shHexiTele"].ToString();
                this.shTedaTele.Text=dr["shTedaTele"].ToString();
            }

            conn.Close();
        }
    }
}