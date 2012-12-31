using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using LitJson;

namespace syglWeb.slip.Admin
{
    /// <summary>
    /// news_list 的摘要说明
    /// </summary>
    public class news_list : IHttpHandler
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
                string connStr = ConfigurationManager.ConnectionStrings["SlipConnStr"].ConnectionString;

                OleDbConnection conn = new OleDbConnection();
                conn.ConnectionString = connStr;
                conn.Open();
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = conn;
                if (page == 0)
                {
                    cmd.CommandText = "select top " + pageSize
                        + " newsID,newsTitle,newsPostTime from  newsTB  order by " + sort + " " + order + " ";
                }
                else
                {
                    cmd.CommandText = "select top " + pageSize +
                        "  newsID,newsTitle,newsPostTime from  newsTB where  newsID not in ( select top " + page * pageSize +
                        " newsID from newsTB order by order by " + sort + " " + order + " )  order by " + sort + " " + order + " )";
                      
                }

                OleDbDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    do
                    {
                        JsonData row = new JsonData();
                        row["newsTitle"] = dr["newsTitle"].ToString();
                        row["newsPostTime"] = ((DateTime)dr["newsPostTime"]).ToString("yyyy年MM月dd日");
                        row["newsID"] = Convert.ToInt32(dr["newsID"].ToString());
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
                cmd.CommandText = "select count(newsID) from newsTB   ";
                 
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