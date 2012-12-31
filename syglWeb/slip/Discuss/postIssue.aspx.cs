using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

namespace syglWeb.slip.Discuss
{
    public partial class postIssue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //判断验证
            if (Request.Cookies["SlipUser"] == null)
            {
                Response.Redirect("/slip/LogOn.aspx");
            }



            if (IsPostBack)
            {
                int userID =Convert.ToInt32( Request.Cookies["SlipUser"]["userID"]);
                //保存数据
                string title = Request.Form["issue_title"];
                string content = Request.Form["issue_conten"];
                string postTime = DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss");

                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
                conn.Open();
                
                // 显示开启事务
                OleDbTransaction trans = conn.BeginTransaction();
                OleDbCommand cmd = conn.CreateCommand();
                // 关联事务
                cmd.Transaction = trans;
                try
                {
                    
                    cmd.CommandText = "insert into issues_tb  (issueTitle,issueContent,issuePostTime,issueAuthor) values(@issueTitle,@issueContent,@issuePostTime,@issueAuthor)";
                    cmd.Parameters.AddWithValue("@issueTitle", title);
                    cmd.Parameters.AddWithValue("@issueContent", content);
                    cmd.Parameters.AddWithValue("@issuePostTime", postTime);
                    cmd.Parameters.AddWithValue("@issueAuthor", userID);
                    cmd.ExecuteNonQuery();

                    cmd.CommandText = "SELECT @@Identity ";
                    int issueID = (int)cmd.ExecuteScalar();

                    

                    //处理标签
                    for (int i = 1; i <= 5; i++)
                    {
                        if (Request.Form["tag" + i] == "" || Request.Form["tag" + i] == null)
                        {
                        }
                        else
                        {                            
                            string tag = Request.Form["tag" + i].Trim();
                            if (tag != "")
                            {
                                int tagID;
                                //查询标签是否存在,存在则引用tagTimes+1
                                cmd.CommandText = "update  tags_tb set tagTimes = tagTimes + 1 where tagName= @tag";                                
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("@tag", tag);
                                int effict = cmd.ExecuteNonQuery();
                                if (effict == 0)
                                {
                                    //标签不存在，添加新标签,并获取标签id
                                    cmd.CommandText = "insert into tags_tb (tagName,tagUser,tagPostTime)values(@tagName,@tagUser,@tagPostTime)";
                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("@tagName", tag);
                                    cmd.Parameters.AddWithValue("@tagUser", userID);
                                    cmd.Parameters.AddWithValue("@tagPostTime", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

                                    cmd.ExecuteNonQuery();

                                    cmd.CommandText = "SELECT @@Identity ";
                                    tagID = (int)cmd.ExecuteScalar();
                                }
                                else
                                {
                                    //标签存在，获取标签ID
                                    cmd.CommandText = "select tagID from tags_tb where tagName=@tag";
                                    tagID = (int)cmd.ExecuteScalar();
                                }
                                //保存标签与issue映射
                                cmd.CommandText = "insert into tagIssues_tb (tag,issue)values(@tag,@issue)";
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("@tag",tagID);
                                cmd.Parameters.AddWithValue("@issue", issueID);
                                cmd.ExecuteNonQuery();                                   
                            }
                        }
                    }

                    trans.Commit();
                    Response.Redirect("issue.aspx?id=" + issueID);
                }
                catch (Exception ex)
                {

                    // 发生错误，回滚事务
                    if (trans != null) trans.Rollback();
                    Response.Write("创建用户失败。事务已回滚。"+ex.Message);

                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                //初始化页面
            }
        }
    }
}