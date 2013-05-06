using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LitJson;

namespace syglWeb.slip_.admin
{
    public partial class en : System.Web.UI.Page
    {
        public void returnMsg(int status,string msg) {
            JsonData jd = new JsonData();
            jd["stauts"] = status;
            jd["msg"] = msg;
            Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            Response.Write(jd.ToJson());
            Response.End();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DataModal dm = new DataModal();
            if (IsPostBack)
            { 
                //保存
                News nw = new News();
                //验证填写是否完整
                if (Request.Form["newsID"] == "" || Request.Form["newsID"] == null)
                {
                    //添加
                }
                else
                {
                    nw.newsID = Convert.ToInt32(Request.Form["newsID"]);
                }

                if (!(Request.Form["newsTitle"] == "" || Request.Form["newsTitle"] == null))
                {
                    nw.newsTitle = Request.Form["newsTitle"];
                }
                else
                {
                    returnMsg(2,"请填写文章标题");
                }

                if (Request.Form["newsPostTime"].Trim() == "" || Request.Form["newsPostTime"].Trim() == null)
                {
                    nw.newsPostTime = DateTime.Now;
                }
                else
                {
                    string dd = Request.Form["newsPostTime"] + " " + DateTime.Now.ToShortTimeString();
                    nw.newsPostTime =Convert.ToDateTime(dd);
                }

                if (Request.Form["newsContent"] == "" || Request.Form["newsContent"] == null)
                {
                    returnMsg(2, "文章内容不能为空！");
                }
                else
                {
                    nw.newsContent = Request.Form["newsContent"];
                }
                
                    dm.SaveNews(nw);
                    returnMsg(1,"保存成功！");
            }
            else
            {
                if (Request.Params["n"] == "" || Request.Params["n"] == null)
                {
                    //新建，啥也不做
                    this.newsPostTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
                }
                else
                {
                    //修改，查询要修改的文章
                    News nw = dm.GetNewes(Convert.ToInt32(Request.Params["n"]));
                    this.newsTitle.Text = nw.newsTitle;
                    this.newsPostTime.Text = nw.newsPostTime.ToString("yyyy-MM-dd");
                    this.newsContent.Text = nw.newsContent;
                    this.newsID.Value = nw.newsID.ToString();
                }
            }

        }
    }
}