using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Projects
{
    public partial class Defualt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SRSql srSql = new SRSql();

            srSql.conn.Open();
            srSql.cmd.CommandText = "select * from( topicTB left join userTB on topicTB.topicUser=userTB.userID) order by topicPostTime desc";
            srSql.da.Fill(srSql.ds,"tb_topic");

            RepeaterTopic.DataSource = srSql.ds.Tables["tb_topic"].DefaultView;
            RepeaterTopic.DataBind();
            srSql.conn.Close();
        }
    }
}