using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip
{
    public partial class op : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SRDel.SRSql srSql = new SRDel.SRSql();

            srSql.conn.Open();
            srSql.cmd.CommandText = "select opID, opTitle , opYear from oldProjects_tb order by opYear desc ";
            srSql.da.Fill(srSql.ds, "oldProjects_tb");
            RepeaterNewsList.DataSource = srSql.ds.Tables["oldProjects_tb"].DefaultView;
            RepeaterNewsList.DataBind();

            srSql.conn.Close();
        }
    }
}