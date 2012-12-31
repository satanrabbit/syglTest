using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using LitJson;

namespace syglWeb.slip.Admin
{
    /// <summary>
    /// op_delete 的摘要说明
    /// </summary>
    public class op_delete : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int status = 0;
            string msg = "未知错误！";
            if (context.Request.Cookies["SyglAdmin"] == null)
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
                    OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
                    try
                    {
                        conn.Open();
                        OleDbCommand cmd = new OleDbCommand();
                        cmd.Connection = conn;
                        cmd.CommandText = "delete from oldProjects_tb where opID in ( " + dids + ") ";
                        int effects = cmd.ExecuteNonQuery();
                        status = 1;
                        msg = "成功删除" + effects + "条记录";
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        msg = ex.Message;
                    }
                    finally
                    {
                        conn.Close();
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