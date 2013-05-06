using LitJson;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_.admin
{
    public partial class espt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ( Session["SlipAdmin"] == null)
            {
                //保存出错

                Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                Response.StatusCode = 402;
                Response.StatusDescription = "您没有登录或登录超时，请重新登录！";
                Response.End();
            }
            if (IsPostBack)
            {
                JsonData jd = new JsonData();
                 
                int status = 0;
                string msg = "未知状态";
                Support spt = new Support();
                DataModal dm = new DataModal();
                try
                {
                    spt.supportID = Convert.ToInt32(Request.Form["supportID"]);
                    spt.supportTitle = Request.Form["supportTitle"];
                    spt.supportContent = Request.Form["supportContent"];
                    dm.SaveSupport(spt);
                    status = 1;
                    msg = "保存成功！";
                }
                catch (Exception ex)
                {
                    msg = "错误：" + ex.Message;
                }
                
                jd["stauts"] = status;
                jd["msg"] = msg;
                Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                Response.Write(jd.ToJson());
                Response.End();
            }
            else
            {
                int id = 1;
                if (Request.Params["id"] == null || Request.Params["id"] == "")
                {
                    id = 1;
                }
                else
                {
                    id = Convert.ToInt32(Request.Params["id"]);                    
                }

                Support spt = new Support();
                DataModal dm = new DataModal();
                spt = dm.GetSupport(id);
                this.supportContent.Text = spt.supportContent;
               this.supportID.Value = spt.supportID.ToString();
               this.supportTitle.Text = spt.supportTitle;
               this.supportTitle.ReadOnly = true;
            }
        }
    }
}