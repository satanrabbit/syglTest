using System;
using System.Collections.Generic;
using System.Web;
using LitJson;
using System.Web.SessionState;

namespace syglWeb.slip_.admin
{
    /// <summary>
    /// saveot 保存修改或添加的旧的项目类型
    /// </summary>
    public class saveot : IHttpHandler, IRequiresSessionState
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
            string msg = "状态未知";

            oldType ot = new oldType();
            try
            {
                int tid;
                if (int.TryParse(context.Request.Params["typeID"], out tid))
                {
                    ot.typeID = tid;
                }
                int tindex;
                if (int.TryParse(context.Request.Params["typeIndex"], out tindex))
                {
                    ot.typeIndex = tindex;
                }
                else
                {
                    ot.typeIndex = 1;
                }
                ot.typeName = context.Request.Params["typeName"];
                DataModal dm = new DataModal();
                ot.typeID = dm.SaveOldType(ot);
                status = 1;
                msg = "保存成功！";
            }
            catch (Exception ex)
            {
                status = 0;
                msg = "出现错误:" + ex.Message;
            }
            JsonData jd = new JsonData();
            jd["status"] = status;
            jd["msg"] = msg;
            jd["typeID"] = ot.typeID;
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(jd));
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