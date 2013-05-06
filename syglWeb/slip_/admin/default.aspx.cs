﻿using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_.admin
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SlipAdmin"] == null || Session["SlipAdmin"]=="")
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}