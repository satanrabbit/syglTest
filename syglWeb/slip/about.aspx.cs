using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace syglWeb.slip
{
    public partial class about : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            StreamReader streamReader = File.OpenText(AppDomain.CurrentDomain.BaseDirectory + "/slip/about.txt");
            this.LabelContent.Text = streamReader.ReadToEnd();
            streamReader.Dispose();
        }
    }
}