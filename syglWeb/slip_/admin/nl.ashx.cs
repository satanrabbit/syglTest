using System;
using System.Collections.Generic;
using System.Web;
using LitJson;
using System.Web.SessionState;


namespace syglWeb.slip_.admin
{
    
    /// <summary>
    /// 获取新闻的json字符串
    /// </summary>
    public class nl : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            if (context.Session["SlipAdmin"] == null)
            {
                //保存出错

                context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                context.Response.StatusCode = 401;
                context.Response.StatusDescription = "您没有登录或登录超时，请重新登录！";
                context.Response.End();
            }
            listNewsWithPages ln = new listNewsWithPages();
            DataModal dm = new DataModal();

            int page=1;
            int pageSize=20;
            string sort="newsPostTime";
            string sortOrder="desc";
            if (!(context.Request.Params["page"] == null || context.Request.Params["page"] == ""))
            {
                page = Convert.ToInt32(context.Request.Params["page"]);
            }

            if (!(context.Request.Params["rows"] == null || context.Request.Params["rows"] == ""))
            {
                pageSize = Convert.ToInt32(context.Request.Params["rows"]);
            }

            if (!(context.Request.Params["sortName"] == null || context.Request.Params["sortName"] == ""))
            {
                sort = context.Request.Params["sortName"];
            }

            if (!(context.Request.Params["sortOrder"] == null || context.Request.Params["sortOrder"] == ""))
            {
                sortOrder = context.Request.Params["sortOrder"];
            }


            ln = dm.GetNewsList(page,pageSize,sort,sortOrder);
            
            newsForJson nf = new newsForJson();
            nf.total=ln.Total;
            nf.rows=ln.newsList;
           
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(nf));
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}