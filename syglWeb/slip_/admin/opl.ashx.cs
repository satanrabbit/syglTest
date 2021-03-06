﻿using LitJson;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;

namespace syglWeb.slip_.admin
{
    /// <summary>
    /// opl 旧的创新成果的列表
    /// </summary>
    public class opl : IHttpHandler, IRequiresSessionState
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
            oldProjectWithtotal opt = new oldProjectWithtotal();
            DataModal dm = new DataModal();

            int page = 1;
            int type = 0;
            int pageSize = 20;
            string sort = "opNum";
            string sortOrder = "asc";
            if (!(context.Request.Params["type"] == null || context.Request.Params["type"] == ""))
            {
                type = Convert.ToInt32(context.Request.Params["type"]);
            }
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
            opt = dm.GetProjectsWithTotal(type, page, pageSize, sort, sortOrder);
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(opt));
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