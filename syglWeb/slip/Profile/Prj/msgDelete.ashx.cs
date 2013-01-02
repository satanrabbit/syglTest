using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;
using LitJson;
namespace syglWeb.slip.Profile.Prj
{
    /// <summary>
    /// msgDelete 的摘要说明
    /// 删除消息
    /// 输入的mids形式为"3,4,5";
    /// </summary>
    public class msgDelete : IHttpHandler,IRequiresSessionState
    {
         
        public void ProcessRequest(HttpContext context)
        {
            int status = 0;
            string msg = "";
            if (context.Session["userID"] != null)
            {
                //
                if (context.Request.Params["mid"] == "" || context.Request.Params["mid"] == null)
                {
                    msg = "未提交删除数据！";
                }
                else
                {
                    int effict=0;
                    SRDel.SRSql srSql = new SRDel.SRSql();
                    srSql.conn.Open();
                    srSql.cmd.CommandText = "delete from msgs_tb where msgID in (0 , " + context.Request.Params["mid"] + ")";
                    try
                    {
                        status = 1;
                        effict = srSql.cmd.ExecuteNonQuery();
                        msg = "成功删除" + effict + "条记录！";
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
            else
            {
                msg = "您还没有登录或者登录超时！请重新登陆！";
            }

            JsonData jd = new JsonData();
            jd["status"] = status;
            jd["msg"] = msg;
            string echoStr = jd.ToJson();
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(echoStr);
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