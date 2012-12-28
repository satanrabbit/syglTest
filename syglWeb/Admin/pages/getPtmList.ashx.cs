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
    /// getPtmList 的摘要说明
    /// </summary>
    public class getPtmList : IHttpHandler
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
                string connStr = ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString;

                OleDbConnection conn = new OleDbConnection();
                conn.ConnectionString = connStr;
                conn.Open();
                OleDbCommand cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select ptmID,ptmName from ptms_tb order by ptmID";

                OleDbDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    do
                    {
                        JsonData row = new JsonData();
                        row["ptmName"] = dr["ptmName"].ToString();
                        row["ptmID"] = Convert.ToInt32(dr["ptmID"].ToString());
                        rows.Add(row);
                    } while (dr.Read());
                }

                //查询数量
                cmd = new OleDbCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select count(ptmID) from ptms_tb ";

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