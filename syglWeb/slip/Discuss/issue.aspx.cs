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
    public partial class issue : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == "" || Request.QueryString["id"] == null)
            {
                Response.Redirect("/slip/404.aspx");
            }
            else
            {
                int issueID = Convert.ToInt32(Request.QueryString["id"]);
                this.HiddenFieldIssueID.Value = issueID.ToString();
                
                //查询话题
                OleDbConnection conn = new OleDbConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString;
                conn.Open();
                OleDbCommand cmd = conn.CreateCommand();
                cmd.CommandText = "select * from issues_tb where issueID=@id";
                cmd.Parameters.AddWithValue("@id", issueID);
                OleDbDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    //页面显示内容
                    this.LabelIssueContent.Text = dr["issueContent"].ToString();
                    this.LabelIssueTitle.Text = dr["issueTitle"].ToString();
                    this.LabelIssuePostTime.Text =((DateTime)dr["issuePostTime"]).ToString();
                    this.HiddenFieldIssueUserID.Value = dr["issueAuthor"].ToString();
                    //评论
                    cmd = new OleDbCommand();
                    cmd.Connection = conn;

                    cmd.CommandText = "select comments_tb.* ,userTB.userName,userTB.avatarMini from (comments_tb left join userTB on comments_tb.commentUser=userTb.userID) where  comments_tb.commentIssue = @issueID order by comments_tb.commentPostTime desc";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@issueID", issueID);

                    DataSet ds = new DataSet();
                    OleDbDataAdapter da = new OleDbDataAdapter();
                    da.SelectCommand = cmd;

                    da.Fill(ds,"comments_tb");

                    this.RepeaterComment.DataSource = ds.Tables["comments_tb"].DefaultView;
                    this.RepeaterComment.DataBind();
                    
                   
                }
                else
                {
                    conn.Close();
                    Response.Redirect("/slip/404.aspx");
                }

                int userID = 0;

                if (Request.Cookies["SlipUser"] != null)
                {
                    userID = Convert.ToInt32(Request.Cookies["SlipUser"]["userID"]);
                    this.HiddenFieldUserID.Value = userID.ToString();
                }
                conn.Close();
                
            }
        }

        protected void RepeaterComment_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            int commentID = Convert.ToInt32( drv["commentID"].ToString());
            //查询是否有评论的回复
            OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString);
            conn.Open();
            OleDbCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select reply_tb.* ,userTB.userName,userTB.avatarMini from (reply_tb left join userTB on userTB.userID=reply_tb.replyUser) where replyComment=@comment order by replyPostTime ";
            cmd.Parameters.AddWithValue("@comment",commentID);
            DataSet ds = new DataSet();
            OleDbDataAdapter da = new OleDbDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds,"reply_tb");
            conn.Close();
            if (ds.Tables["reply_tb"].Rows.Count > 0)
            {
                Label lb = e.Item.FindControl("LableReplayHead") as Label;
                lb.Text = "---共条"+ ds.Tables["reply_tb"].Rows.Count+"回复---"  ;
                Repeater rp = e.Item.FindControl("RepeaterComment_reply") as Repeater;

                rp.DataSource = ds.Tables["reply_tb"].DefaultView;
                rp.DataBind();
            }
            else
            {
                Panel pl = e.Item.FindControl("PanelCommentReply") as Panel;
                pl.Visible = false;
            }

        }

        protected void RepeaterComment_reply_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataRowView drv = (DataRowView)(e.Item.DataItem);
            // 判断发布时间 LabelReplyPostTime
            DateTime postTime = (DateTime)drv["replyPostTime"];
            Label lb = e.Item.FindControl("LabelReplyPostTime") as Label;
            int y =DateTime.Now.Year-postTime.Year ;
            if (y > 0)
            {
                lb.Text = y + "年前";
            }
            else
            {
                int _m = DateTime.Now.Month - postTime.Month;
                if (_m > 0)
                {
                    lb.Text = _m + "月前";
                }
                else
                {
                    int d = DateTime.Now.Day - postTime.Day;
                    if (d > 0)
                    {
                        lb.Text = d + "天前";
                    }
                    else
                    {
                        int h = DateTime.Now.Hour - postTime.Hour;
                        if (h > 0)
                        {
                            lb.Text = h + "小时前";
                        }
                        else
                        {
                            int m = DateTime.Now.Minute - postTime.Minute;
                            if (m > 0)
                            {
                                lb.Text = m + "分钟前";
                            }
                            else
                            {
                                int s = DateTime.Now.Second - postTime.Second;
                                lb.Text = s + "秒前";
                            }
                        }
                    } 
                }
            }
        }
    }
}