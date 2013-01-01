using System;
using System.Collections.Generic;
using System.Web;

namespace syglWeb.slip.Profile.Prj
{
    /// <summary>
    /// DeleteMb 的摘要说明
    /// 13-1-1 15:57 用户权限验证已添加
    /// </summary>
    public class DeleteMb : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            int status = 0;
            string msg = "";

            string _mbID = context.Request["mbID"];
            if (_mbID == "" || _mbID == null)
            {
                status = 1;
                msg = "未提交项";
            }
            else
            {
                
                SRDel.SRSql srSql = new SRDel.SRSql();
                try
                {
                    if (context.Session["userID"] == null)
                    {
                        status = 1;
                        msg = "您未登录或登录超时！";
                    }
                    else
                    {
                        srSql.conn.Open();
                        srSql.cmd.CommandText = "delete from topicMbTb where topicMbID= @topicMbID";
                        srSql.cmd.Parameters.AddWithValue("@topicMbID", Convert.ToInt32(_mbID));
                        srSql.cmd.ExecuteNonQuery();
                        srSql.conn.Close();
                    }
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