using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip.Manager
{
    public partial class EditSupport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SRDel.SRSql srDql = new SRDel.SRSql();
                srDql.conn.Open();
                srDql.cmd.CommandText = "update supportTB set supportContent=@supporContent where supportID=@supportID";
                srDql.cmd.Parameters.AddWithValue("@supporContent", Request.Form[TextBoxSupportContent.UniqueID]);
                srDql.cmd.Parameters.AddWithValue("@supportID", Convert.ToInt32(Request.Form[HiddenFieldSupportID.UniqueID]));
                srDql.cmd.ExecuteNonQuery();
                srDql.conn.Close();
                Response.Redirect("Supports.aspx");
            }

            string supportID = Request.QueryString["sid"];
            if (supportID == null || supportID == "")
            {
                Response.Redirect("/slip/404.aspx");
            }
            else
            {
                SRDel.SRSql srDql = new SRDel.SRSql();
                srDql.conn.Open();
                srDql.cmd.CommandText = "select * from supportTB where supportID= @supportID ";
                srDql.cmd.Parameters.AddWithValue("@supportID",Convert.ToInt32(supportID));

                srDql.da.Fill(srDql.ds,"tb_support");
                srDql.conn.Close();
                HiddenFieldSupportID.Value = supportID;
                LabelSupportTitle1.Text = srDql.ds.Tables["tb_support"].Rows[0]["supportTitle"].ToString(); 
                TextBoxSupportContent.Text = srDql.ds.Tables["tb_support"].Rows[0]["supportContent"].ToString();
            }
        }
    }
}