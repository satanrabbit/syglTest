using System;
using System.Collections.Generic;
using System.Web;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Handlers
{
    /// <summary>
    /// SaveMb 的摘要说明
    /// </summary>
    public class SaveMb : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int status = 0;
            string msg = "";
            int topicMbID=0;
            SRSql srSql = new SRSql();
            try
            {
                string mbName = context.Request["mbName"];
                int mbId = Convert.ToInt32(context.Request["mbId"]);
                string mbPst = context.Request["mbPst"];
                string mbNum = context.Request["mbNum"];
                string mbPhone = context.Request["mbPhone"];
                string mbCollege = context.Request["mbCollege"];
                string mbMajor = context.Request["mbMajor"];
                string mbWork = context.Request["mbWork"];
                int tid = Convert.ToInt32(context.Request["tid"]);
                string _topicMbID = context.Request["tpoicMbID"];

                srSql.conn.Open();
                if (_topicMbID == "" || _topicMbID == null)
                {
                    srSql.cmd.CommandText = "insert into topicMbTb (topicMbName, topicMbCollege, topicMbMajor, topicMbIdentity,topicMbWork , mbForTopic, topicMbPst, topicMbPhone, topicMbNum) VALUES  (@topicMbName, @topicMbCollege, @topicMbMajor, @topicMbIdentity,@topicMbWork , @mbForTopic, @topicMbPst, @topicMbPhone, @topicMbNum)";

                    srSql.cmd.Parameters.AddWithValue("@topicMbName", mbName);
                    srSql.cmd.Parameters.AddWithValue("@topicMbCollege", mbCollege);
                    srSql.cmd.Parameters.AddWithValue("@topicMbMajor", mbMajor);
                    srSql.cmd.Parameters.AddWithValue("@topicMbIdentity", mbId);
                    srSql.cmd.Parameters.AddWithValue("@topicMbWork", mbWork);
                    srSql.cmd.Parameters.AddWithValue("@mbForTopic", tid);
                    srSql.cmd.Parameters.AddWithValue("@topicMbPst", mbPst);
                    srSql.cmd.Parameters.AddWithValue("@topicMbPhone", mbPhone);
                    srSql.cmd.Parameters.AddWithValue("@topicMbNum", mbNum);
                }
                else
                {
                    srSql.cmd.CommandText = "update topicMbTb set topicMbName=@topicMbName, topicMbCollege=@ topicMbCollege, topicMbMajor=@topicMbMajor, topicMbIdentity=@topicMbIdentity,topicMbWork=@topicMbWork , mbForTopic=@mbForTopic, mbForTopic=@mbForTopic, topicMbPhone=@topicMbPhone, topicMbNum=@topicMbNum where topicMbID=@topicMbID";

                    topicMbID = Convert.ToInt32(_topicMbID);

                    srSql.cmd.Parameters.AddWithValue("@topicMbName", mbName);
                    srSql.cmd.Parameters.AddWithValue("@topicMbCollege", mbCollege);
                    srSql.cmd.Parameters.AddWithValue("@topicMbMajor", mbMajor);
                    srSql.cmd.Parameters.AddWithValue("@topicMbIdentity", mbId);
                    srSql.cmd.Parameters.AddWithValue("@topicMbWork", mbWork);
                    srSql.cmd.Parameters.AddWithValue("@mbForTopic", tid);
                    srSql.cmd.Parameters.AddWithValue("@topicMbPst", mbPst);
                    srSql.cmd.Parameters.AddWithValue("@topicMbPhone", mbPhone);
                    srSql.cmd.Parameters.AddWithValue("@topicMbNum", mbNum);
                    srSql.cmd.Parameters.AddWithValue("@topicMbID", Convert.ToInt32(_topicMbID));

                }

                srSql.cmd.ExecuteNonQuery();

                if (_topicMbID == "" || _topicMbID == null)
                {
                    //获取新插入的ID
                    SRSql srSql_ = new SRSql();
                    srSql_.conn.Open();
                    srSql_.cmd.CommandText = "select Max(topicMbID) from topicMbTb where mbForTopic = @topicID";
                    srSql_.cmd.Parameters.AddWithValue("@topicID", tid);

                    topicMbID = Convert.ToInt32(srSql_.cmd.ExecuteScalar().ToString());

                    srSql_.conn.Close();
                }


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
                context.Response.Write("{\"status\":\"" + status.ToString() + "\",\"mbID\":\"" + topicMbID.ToString() + "\",\"msg\":\"" + msg + "\"}");
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