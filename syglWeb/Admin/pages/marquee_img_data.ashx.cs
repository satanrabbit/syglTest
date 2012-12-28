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
    /// marquee_img_data 的摘要说明
    /// </summary>
    public class marquee_img_data : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
            conn.Open();
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = "select * from imgs_tb order by imgID";
            OleDbDataReader dr = cmd.ExecuteReader();
            
            string echoString="";
            JsonData rows = new JsonData();
            int total = 0;
            if (dr.Read())
            {

                do
                {
                    total++;
                    JsonData jsonDataItem = new JsonData();
                    jsonDataItem["imgID"] = Convert.ToInt32( dr["imgID"].ToString());
                    jsonDataItem["imgFile"] = dr["imgFile"].ToString();
                    jsonDataItem["imgLink"] = dr["imgLink"].ToString();
                    rows.Add(jsonDataItem);
                } while (dr.Read());

            }
            else
            {
                rows = "";
            }
            JsonData jsonData = new JsonData();
            jsonData["total"] = total;
            jsonData["rows"] = rows;
            echoString = jsonData.ToJson();

            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(echoString);
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