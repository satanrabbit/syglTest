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
    /// PostComment 的摘要说明
    /// </summary>
    public class PostComment : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

            int status = 0;
            string msg = "未知错误！";
            if (context.Session["userID"] == null)
            {
                status = 2;
                msg = "你还未登录或登录超时！";
            }
            else
            {
                int userID = Convert.ToInt32(context.Session["userID"].ToString());
                string userName = (context.Session["userName"].ToString());
                string comment = context.Request.Params["commentContent"].Trim();//
                int issueID = Convert.ToInt32(context.Request.Params["issueID"].Trim());
                int issueAuthor = Convert.ToInt32(context.Request.Params["issueUserID"].Trim());
                if (comment == "")
                {
                    status = 3;
                    msg = "回复不能为空！";
                }
                else
                {
                    string postTime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
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

                        cmd.CommandText = "insert into comments_tb  (commentUser,commentContent,commentPostTime,commentIssue) values(@commentUser,@commentContent,@commentPostTime,@commentIssue)";
                        cmd.Parameters.AddWithValue("@commentUser", userID);
                        cmd.Parameters.AddWithValue("@commentContent", comment);
                        cmd.Parameters.AddWithValue("@commentPostTime", postTime);
                        cmd.Parameters.AddWithValue("@commentIssue", issueID);
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "SELECT @@Identity ";
                        int commemtID = (int)cmd.ExecuteScalar();

                        //发送消息
                        if (issueAuthor != userID)
                        {
                            cmd.CommandText = "insert into msgs_tb (msgUser,msgContent,msgType,msgFrom,msgTitle)values(@msgUser,@msgContent,@msgType,@msgFrom,@msgTitle)";
                            cmd.Parameters.Clear();
                            cmd.Parameters.AddWithValue("@msgUser", issueAuthor);
                            cmd.Parameters.AddWithValue("@msgContent", "您好，用户" + userName + "在<a href='/slip/Discuss/issue.aspx?id=" + issueID + "'>论坛</a>中回复了您：<br />" + "<a href='/slip/Discuss/issue.aspx?id=" + issueID + "'>" + comment + "</a>");
                            cmd.Parameters.AddWithValue("@msgType", 1);
                            cmd.Parameters.AddWithValue("@msgFrom", 0);
                            cmd.Parameters.AddWithValue("@msgTitle", "您好，用户" + userName + "回复了您在创新论坛的帖子");
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