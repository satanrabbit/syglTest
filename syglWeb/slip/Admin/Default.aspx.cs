﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SlipAdmin"] != null)
            {

            }
            else
            {
                Response.Redirect("/slip/admin/LogOn.aspx");
            }
        }
    }
}