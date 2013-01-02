using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using LitJson;
using System.Collections;
using System.Web.SessionState;

namespace syglWeb.slip.Discuss
{
    /// <summary>
    /// PostReply 的摘要说明
    /// </summary>
    public class PostReply : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

            int status = 0;
            string msg = "未知错误！";
            string postTime = DateTime.Now.ToLocalTime().ToString("yyyy-MM-dd HH:mm:ss"); ;
            if (context.Session["userID"] == null)
            {
                status = 2;
                msg = "你还未登录或登录超时！";
            }
            else
            {
                int userID = Convert.ToInt32(context.Session["userID"]);
                string userName = (context.Session["userName"].ToString());
                string reply = context.Request.Params["reply"].Trim();
                int toUser = Convert.ToInt32(context.Request.Params["user"].Trim());
                string toUserName =  context.Request.Params["userName"].Trim();
                int comment = Convert.ToInt32(context.Request.Params["comment"].Trim());
                if (reply == "")
                {
                    status = 3;
                    msg = "回复不能为空！";
                }
                else
                {

                    //保存回复并获取回复的ID

                    OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
                    conn.Open();

                    // 显示开启事务
                    OleDbTransaction trans = conn.BeginTransaction();
                    OleDbCommand cmd = conn.CreateCommand();
                    // 关联事务
                    cmd.Transaction = trans;
                    try
                    {

                        cmd.CommandText = "insert into reply_tb  (replyToUser,replyContent,replyToUserName,replyUser,replyPostTime,replyComment) values(@replyToUser,@replyContent,@replyToUserName,@replyUser,@replyPostTime,@replyComment)";
                        cmd.Parameters.AddWithValue("@replyToUser", toUser);
                        cmd.Parameters.AddWithValue("@replyContent", reply);
                        cmd.Parameters.AddWithValue("@replyToUserName", toUserName);
                        cmd.Parameters.AddWithValue("@replyUser", userID);
                        cmd.Parameters.AddWithValue("@replyPostTime", postTime);
                        cmd.Parameters.AddWithValue("@replyComment", comment);
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "SELECT @@Identity ";
                        int replyID = (int)cmd.ExecuteScalar();

                        //发送消息
                        if (userID != toUser)
                        {
                            cmd.CommandText = "insert into msgs_tb (msgUser,msgContent,msgType,msgFrom,msgTitle)values(@msgUser,@msgContent,@msgType,@msgFrom,@msgTitle)";
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@msgUser", toUser);
                            cmd.Parameters.AddWithValue("@msgContent", "您好，用户" + userName + "在<a href='/slip/Discuss/issue.aspx?id=" + context.Request.Params["issueID"] + "'>论坛</a>中回复了您：<br />" + "<a href='/slip/Discuss/issue.aspx?id=" + context.Request.Params["issueID"] + "'>" + reply + "</a>");
                            cmd.Parameters.AddWithValue("@msgType", 1);// msgTitle
                            cmd.Parameters.AddWithValue("@msgFrom", 0);
                            cmd.Parameters.AddWithValue("@msgTitle", "您好，用户" + userName + "回复了您在创新论坛的评论");
                            cmd.ExecuteNonQuery();
                        }
                        trans.Commit();
                        status = 1;
                        msg = "评论成功！";
                    }
                    catch (Exception ex)
                    {
                        trans.Rollback();
                        msg = ex.Message;
                    }
                }
            }



            Hashtable jdata = new Hashtable();
            jdata["status"] = status;
            jdata["msg"] = msg;
            jdata["postTime"] = postTime;
            string jdataStr = JsonMapper.ToJson(jdata);
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(jdataStr);
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