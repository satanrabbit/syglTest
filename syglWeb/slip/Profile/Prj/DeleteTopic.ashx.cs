using System;
using System.Collections.Generic;
using System.Web;

namespace syglWeb.slip.Profile.Prj
{
    /// <summary>
    /// DeleteTopic 的摘要说明
    /// </summary>
    public class DeleteTopic : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            int status = 0;
            string msg = "";
            string _tid = context.Request["tid"];
            if (_tid == "" || _tid == null)
            {
                status = 1;
                msg = "未提交项";
            }
            else
            {
                SRDel.SRSql srSql = new SRDel.SRSql();
                try
                {

                    srSql.conn.Open();
                    srSql.cmd.CommandText = "delete from topicTB where topicID= @topicID";
                    srSql.cmd.Parameters.AddWithValue("@topicID", Convert.ToInt32(_tid));
                    srSql.cmd.ExecuteNonQuery();
                    srSql.conn.Close();
                }
                catch (Exception ex)
                {
                    srSql.conn.Close();
                    status = 1;
                    msg = ex.ToString();
                }
                finally
                {
                    srSql.conn.Close();

                    context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                    context.Response.Write("{\"status\":\"" + status.ToString() + "\",\"msg\":\"" + msg + "\"}");
                    context.Response.End();
                }
            }
             
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