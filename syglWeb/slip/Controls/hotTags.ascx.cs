using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls; 
using syglWeb.slip.SRDel;
namespace syglWeb.slip.Controls
{
    public partial class hotTags : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SRSql srSql = new SRSql();
            srSql.cmd.CommandText = "select top 30 * From tags_tb order by tagTimes desc";
            srSql.conn.Open();
            srSql.dr = srSql.cmd.ExecuteReader();
            if (srSql.dr.Read())
            {
                do
                {
                    this.LabelHotTags.Text += "<a href='Default.aspx?tag=" + srSql.dr["tagID"].ToString() + "'>" + srSql.dr["tagName"].ToString()  +"(" + srSql.dr["tagTimes"].ToString() + ")</a>";
                } while (srSql.dr.Read());
            }
        }
    }
}