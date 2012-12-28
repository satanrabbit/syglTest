using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Share
{
    public partial class NestedMasterPageProfile : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Cookies["SlipUser"] != null)
            {
                string userID = Request.Cookies["SlipUser"]["userID"].ToString();
                SRSql srSql = new SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from userTB where userID = @userID";
                srSql.cmd.Parameters.AddWithValue("@userID", userID);
                srSql.da.Fill(srSql.ds, "tb_user");
                this.ImagePortrait.ImageUrl = srSql.ds.Tables["tb_user"].Rows[0]["avatarMini"].ToString();

                srSql.conn.Close();
                srSql = null;
                
            }
            else
            {
                Response.Redirect("~/Slip/LogOn.aspx?f=noLogin");
            }
        }
    }
}