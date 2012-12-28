using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using LitJson;

namespace syglWeb.Admin.pages
{
    /// <summary>
    /// getArticleList 的摘要说明
    /// </summary>
    public class getArticleList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int total = 0;
            JsonData rows = new JsonData();
            if (context.Request.Cookies["SyglAdmin"] == null)
            {
                context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                context.Response.Write("未登录或登录超时！请重新登陆！");
                context.Response.End();
            }
            else
            {

                int clm = Convert.ToInt32(context.Request["clm"]);
                int page = 0;
                if (context.Request["page"] != null && context.Request["page"] != "")
                {
                    page = Convert.ToInt32(context.Request["page"]) - 1;
                }
                int pageSize = 10;
                if (context.Request["rows"] != null && context.Request["rows"] != "")
                {
                    pageSize = Convert.ToInt32(context.Request["rows"]);
                }

                string sort = "articlePostTime";
                if (context.Request["sort"] != null && context.Request["sort"] != "")
                {
                    sort = (context.Request["sort"]);
                }
                string order = "desc";
                if (context.Request["order"] != null && context.Request["order"] != "")
                {
                    order = (context.Request["order"]);
                }
                string connStr = ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString;

                OleDbConnection conn = new OleDbConnection();
                conn.ConnectionString = connStr;
                conn.Open();
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = conn;
                if (page == 0)
                {
                    cmd.CommandText = "select top " + pageSize
                        + " articleID,articleTitle,articlePostTime from  articles_tb where articleType = @type1  order by " + sort + " " + order + " ";

                    // cmd.CommandText = "select top " + pageSize +
                    //   " articleID,articleTitle,articlePostTime from articles_tb where clm =@clm order by articlePostTime  desc )";
                    cmd.Parameters.AddWithValue("@type1", clm);

                }
                else
                {
                    cmd.CommandText = "select top " + pageSize +
                        " articleID,articleTitle,articlePostTime from articles_tb where clm =@clm and articleID not in ( select top " + page * pageSize +
                        " articleID from articles_tb order by order by " + sort + " " + order + " )  order by " + sort + " " + order + " )";
                    cmd.Parameters.AddWithValue("@clm", clm);
                    cmd.Parameters.AddWithValue("@sort", sort);
                    cmd.Parameters.AddWithValue("@order", order);
                    cmd.Parameters.AddWithValue("@sort_", sort);
                    cmd.Parameters.AddWithValue("@order_", order);
                }

                OleDbDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    do
                    {
                        JsonData row = new JsonData();
                        row["articleTitle"] = dr["articleTitle"].ToString();
                        row["articlePostTime"] = ((DateTime)dr["articlePostTime"]).ToString("yyyy年MM月dd日");
                        row["articleID"] = Convert.ToInt32(dr["articleID"].ToString());
                        rows.Add(row);
                    } while (dr.Read());
                }
                else
                {
                    rows = "";
                }
                //查询数量
                cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select count(articleID) from articles_tb where articleType=@clm  ";
                cmd.Parameters.AddWithValue("@clm", clm);
                total = Convert.ToInt32(cmd.ExecuteScalar());

                conn.Close();

                JsonData jsonData = new JsonData();
                jsonData["total"] = total;
                jsonData["rows"] = rows;
                string echoString = jsonData.ToJson();

                context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                context.Response.Write(echoString);
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