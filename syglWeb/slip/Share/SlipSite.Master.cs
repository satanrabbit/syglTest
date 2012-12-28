using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace syglWeb.slip.Share
{
    public partial class SlipSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SRDel.SRSql srSql = new SRDel.SRSql();

            srSql.conn.Open();

            srSql.cmd.CommandText = "select * from tpTB where tpEndTime > @nowDate and tpStartTime < @nowDate order by tpStartTime desc";

            string nowDate = DateTime.Now.ToString();
            srSql.cmd.Parameters.AddWithValue("@nowDate", nowDate);
            srSql.cmd.Parameters.AddWithValue("@nowDate", nowDate);
            
            srSql.da.Fill(srSql.ds, "tb_tp");
            foreach (DataRow dr in srSql.ds.Tables["tb_tp"].Rows)
            {
                HyperLink hl = new HyperLink();
                hl.Text = dr["tpName"].ToString();
                hl.NavigateUrl =  "/slip/tpNotice.aspx?tpid="+dr["tpID"];
                hl.CssClass = "logo_tips";
                Panel1.Controls.Add(hl);
            }
           // this.HyperLinkTp.Text = srSql.ds.Tables["tb_tp"].Rows[0]["tpName"].ToString();
            //this.HyperLinkTp.NavigateUrl = srSql.ds.Tables["tb_tp"].Rows[0]["tpNotice"].ToString();            

            srSql.conn.Close();
        }
    }
}