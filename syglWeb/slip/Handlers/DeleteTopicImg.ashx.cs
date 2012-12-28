using System;
using System.Collections.Generic;
using System.Web;
using syglWeb.slip.SRDel;
using System.Data;

namespace syglWeb.slip.Handlers
{
    /// <summary>
    /// DeleteTopicImg 删除项目图片
    /// </summary>
    public class DeleteTopicImg : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int status = 0;
            string error = "";
            SRSql srSql = new SRSql();
            SRSql srSql_ = new SRSql();
            try
            {
                int topicImgID = Convert.ToInt32(context.Request["imgID"]);
               // SRSql srSql = new SRSql();
                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from topicImgTB where topicImgID = @imgID";
                srSql.cmd.Parameters.AddWithValue("@imgID", topicImgID);
                srSql.dr = srSql.cmd.ExecuteReader();
                srSql.dr.Read();
                string topicImgFile = srSql.dr["topicImgFile"].ToString();
                string topicImgMini = srSql.dr["topicImgMini"].ToString();
                string topicImgOriginal = srSql.dr["topicImgOr"].ToString();
                
                srSql.conn.Close();

                SRCom srCom = new SRCom();
                srCom.DeleteFile(topicImgFile);
                srCom.DeleteFile(topicImgMini);
                srCom.DeleteFile(topicImgOriginal);

                srSql_.conn.Open();
                srSql_.cmd.CommandText = "delete from topicImgTB where topicImgID = @imgID";
                srSql_.cmd.Parameters.AddWithValue("@imgID", topicImgID);
                srSql_.cmd.ExecuteNonQuery();
                srSql_.conn.Close();
                srSql.conn.Close();
                
            }
            catch(Exception ex){
                error = ex.ToString();
                srSql_.conn.Close();
                srSql.conn.Close();
                status = 1;
            }
            finally{
                srSql.conn.Close();
                srSql_.conn.Close();
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