using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_.admin
{
    public partial class login : System.Web.UI.Page
    {
        protected string controlName = "";
        protected string msg = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.Form["adminAccount"] == null || Request.Form["adminAccount"].Trim()  == "")
                {
                    this.Panel1.Visible = true;
                    controlName = "adminAccount";
                    msg = "请填写登录帐号！";
                }
                else
                {

                    if (Request.Form["adminPWD"]== null || Request.Form["adminPWD"].Trim() == "")
                    {
                        this.Panel1.Visible = true;
                        controlName = "adminPWD";
                        msg = "请填写登录密码！";
                    }
                    else
                    {
                        string pwd = Request.Form["adminPWD"];
                        string adminAccount = Request.Form["adminAccount"];
                        DataModal dm = new DataModal();
                        Admin ad = dm.GetAdmin(adminAccount);
                        if (ad == null)
                        {
                            this.Panel1.Visible = true;
                            controlName = "adminAccount";
                            msg = "帐号不存在！";
                        }
                        else
                        {
                            if(pwd==ad.adminPWD){
                                //登录成功
                                Session["SlipAdmin"] = ad.adminID.ToString();
                                Session["SlipAdminName"] = ad.adminName.ToString();
                                Session["SlipAdminIdentity"] = ad.adminIdentity.ToString();
                                Session.Timeout = 120;  
                                Response.Redirect("./");

                            }else{
                                this.Panel1.Visible = true;
                            controlName = "adminPWD";
                            msg = "密码错误！";
                            }
                        }
                    }
                }
            }
            else
            {
                this.Panel1.Visible = false;
            }
        }
    }
}