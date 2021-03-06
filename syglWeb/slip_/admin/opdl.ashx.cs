﻿using LitJson;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;

namespace syglWeb.slip_.admin
{
    /// <summary>
    /// opdl 旧的创新成果删除
    /// </summary>
    public class opdl : IHttpHandler, IRequiresSessionState
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
            int status = 0;
            string msg = "未知错误";
            DataModal dm = new DataModal();
            try
            {
                int ef = dm.DeleteOldProject(context.Request.Params["ids"]);
                status = 1;
                msg = "成功删除" + ef + "条记录";

            }
            catch (Exception ex)
            {
                status = 2;
                msg = ex.Message;
            }

            JsonData jd = new JsonData();
            jd["status"] = status;
            jd["msg"] = msg;
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(jd.ToJson());
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