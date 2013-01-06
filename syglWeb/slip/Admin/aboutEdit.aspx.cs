using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

namespace syglWeb.slip.Admin
{
    public partial class aboutEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string aboutPath = AppDomain.CurrentDomain.BaseDirectory + "/slip/about.html";
            if (IsPostBack)
            {
                string aboutStr = Request.Form["Content"];
                using (StreamWriter writer = new StreamWriter(aboutPath, false, Encoding.UTF8))
                {
                    writer.Write(aboutStr);
                }
            }
            else
            {
                StreamReader streamReader = File.OpenText(AppDomain.CurrentDomain.BaseDirectory + "/slip/about.html");
                string text = streamReader.ReadToEnd();
                streamReader.Dispose();
                this.Content.Text = text;
            }
        }
    }
}