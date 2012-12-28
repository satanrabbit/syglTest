using System;
using System.Collections.Generic;
using System.Web;
using System.Collections;
using LitJson;

namespace syglWeb.slip.Manager.Handlers
{
    /// <summary>
    /// DeleteTp 的摘要说明
    /// </summary>
    public class DeleteTp : IHttpHandler
    {
        private HttpContext context;

        public void ProcessRequest(HttpContext context)
        {
            this.context = context;

            if (context.Request.Params["tpid"] == null || context.Request.Params["tpid"] == "")
            {
                showError("您没有提交要删除的新闻！");
            }
            else
            {
                SRDel.SRSql srSql = new SRDel.SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "delete from tpTB where tpID in (@tpIDs)";
                srSql.cmd.Parameters.AddWithValue("@newsIDs", context.Request.Params["tpid"]);
                string effects = srSql.cmd.ExecuteNonQuery().ToString();
                srSql.conn.Close();
                Hashtable hash = new Hashtable();
                hash["error"] = 0;
                hash["message"] = "成功删除" + effects + "条记录！";
                context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                context.Response.Write(JsonMapper.ToJson(hash));
                context.Response.End();
            }
           
        }
        private void showError(string message)
        {
            Hashtable hash = new Hashtable();
            hash["error"] = 1;
            hash["message"] = message;
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(JsonMapper.ToJson(hash));
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