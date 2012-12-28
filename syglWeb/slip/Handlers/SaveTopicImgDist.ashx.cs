using System;
using System.Collections.Generic;
using System.Web;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Handlers
{
    /// <summary>
    /// SaveTopicImgDist 的摘要说明
    /// </summary>
    public class SaveTopicImgDist : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            int status = 0;
            string error = "";
            SRSql srSql = new SRSql();
            try
            {
                string dist = context.Request["dist"];
                int imgID = Convert.ToInt32(context.Request["imgID"]);

                srSql.conn.Open();

                srSql.cmd.CommandText = "update topicImgTB set topicImgInfo = @dist where topicImgID= @imgID";
                srSql.cmd.Parameters.AddWithValue("@dist", dist);
                srSql.cmd.Parameters.AddWithValue("@imgID", imgID);

                srSql.cmd.ExecuteNonQuery();
                srSql.conn.Close();
            }
            catch (Exception ex)
            {
                srSql.conn.Close();
                error = ex.ToString();
                status = 1;

            }
            finally
            {
                srSql.conn.Close();
                context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                context.Response.Write("{\"status\":\"" + status.ToString() + "\",\"error\":\"" + error + "\"}");
                context.Response.End();
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