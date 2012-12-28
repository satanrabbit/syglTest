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
    public partial class Department : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString;
            conn.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select * from ptm_intro_tb where ID=1";
            OleDbDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                this.LabelHeader.Text = dr["header"].ToString();
                this.LabelHHexiTele.Text = dr["hHexiTele"].ToString();
                this.LabelHTedaTele.Text = dr["hTedaTele"].ToString();
                this.LabelSubHeader.Text = dr["subHeader"].ToString();
                this.LabelShHexiTell.Text = dr["shHexiTele"].ToString();
                this.LabelShTedaTell.Text = dr["shTedaTele"].ToString();
                this.LabelIntro.Text = dr["intro"].ToString();
            }

            cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select * from ptms_tb";
            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds,"ptms_tb");

            DataRow[] drw = ds.Tables["ptms_tb"].Select("ptmID=1");
            this.Label_ptm1.Text = drw[0]["ptmIntro"].ToString();

            drw = ds.Tables["ptms_tb"].Select("ptmID=2");
            this.Label_ptm2.Text = drw[0]["ptmIntro"].ToString();

            drw = ds.Tables["ptms_tb"].Select("ptmID=3");
            this.Label_ptm3.Text = drw[0]["ptmIntro"].ToString();

            drw = ds.Tables["ptms_tb"].Select("ptmID=4");
            this.Label_ptm4.Text = drw[0]["ptmIntro"].ToString();

            drw = ds.Tables["ptms_tb"].Select("ptmID=5");
            this.Label_ptm5.Text = drw[0]["ptmIntro"].ToString();

            drw = ds.Tables["ptms_tb"].Select("ptmID=6");
            this.Label_ptm6.Text = drw[0]["ptmIntro"].ToString();

            drw = ds.Tables["ptms_tb"].Select("ptmID=7");
            this.Label_ptm7.Text = drw[0]["ptmIntro"].ToString();

            conn.Close();

        }
    }
}