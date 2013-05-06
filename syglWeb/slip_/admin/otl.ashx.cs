using System;
using System.Collections.Generic;
using System.Web;
using LitJson;

namespace syglWeb.slip_.admin
{
    /// <summary>
    /// otl 旧的项目的分类列表，例如：2012年创新项目成果
    /// </summary>
    public class otl : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            DataModal dm = new DataModal();
            List<oldType> ots = dm.GetOldType();
            if (context.Request.Params["al"] == "true")
            {
                oldType ot = new oldType();
                ot.typeID = 0;
                ot.typeIndex = 99999;
                ot.typeName = "全部";
                ots.Add(ot);
            }
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(ots));
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