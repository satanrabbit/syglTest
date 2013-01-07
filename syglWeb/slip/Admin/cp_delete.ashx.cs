using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;
 
using syglWeb.slip.SRDel;
using LitJson;

namespace syglWeb.slip.Admin
{
    /// <summary>
    /// cp_delete 的摘要说明
    /// </summary>
    public class cp_delete : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

            int status = 0;
            string msg = "未知错误！";
            if (context.Session["SlipAdmin"] == null)
            {
                msg = "您未登录或登录超时！";
            }
            else
            {
                if (context.Request["dids"] == "" || context.Request["dids"] == null)
                {
                    msg = "您没有提交数据！";
                }
                else
                {
                    string dids = context.Request["dids"];
                    SRSql srSql = new SRSql();
                    try
                    {
                        srSql.conn.Open();
                        srSql.cmd.CommandText = "delete from cpTB where cpID in ( " + dids + ") ";
                        int effects = srSql.cmd.ExecuteNonQuery();
                        status = 1;
                        msg = "成功删除" + effects + "条记录";
                        srSql.conn.Close();
                    }
                    catch (Exception ex)
                    {
                        msg = ex.Message;
                    }
                    finally
                    {
                        srSql.conn.Close();
                    }
                }
            }
            JsonData jd = new JsonData();
            jd["status"] = status;
            jd["msg"] = msg;
            string echoData = jd.ToJson();
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(echoData);
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