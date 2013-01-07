using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;
using LitJson;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Admin
{
    /// <summary>
    /// pc_list 的摘要说明
    /// </summary>
    public class pc_list : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

            int total = 0;
            JsonData rows = new JsonData();
            if (context.Session["SyglAdmin"] == null)
            {
                context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
                context.Response.Write("未登录或登录超时！请重新登陆！<a href='LogOn.aspx'  target='_top'> 请登录</a>");
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

                string sort = "cpID";
                if (context.Request["sort"] != null && context.Request["sort"] != "")
                {
                    sort = (context.Request["sort"]);
                }
                string order = "desc";
                if (context.Request["order"] != null && context.Request["order"] != "")
                {
                    order = (context.Request["order"]);
                }

                SRSql srSql = new SRSql();

                srSql.conn.Open();

                if (page == 0)
                {
                    srSql.cmd.CommandText = "select top " + pageSize
                        + " cpID,cpName , cpYear ,cpStartTime ,cpEndTime from  cpTB  order by " + sort + " " + order + " ";
                }
                else
                {
                   srSql.cmd.CommandText = "select top " + pageSize +
                        " cpID,cpName , cpYear  ,cpStartTime ,cpEndTime from  cpTB  where  cpID not in ( select top " + page * pageSize +
                        " cpID from cpTB order by order by " + sort + " " + order + " )  order by " + sort + " " + order + " )";

                }

                srSql.dr = srSql.cmd.ExecuteReader();
                if (srSql.dr.Read())
                {
                    do
                    {
                        JsonData row = new JsonData();
                        row["cpName"] = srSql.dr["cpName"].ToString();
                        row["cpID"] = Convert.ToInt32(srSql.dr["cpID"].ToString());
                        row["cpYear"] = srSql.dr["cpYear"].ToString();
                        row["cpEndTime"] = ((DateTime)srSql.dr["cpEndTime"]).ToString("yyyy-MM-dd");
                        row["cpStartTime"] = ((DateTime)srSql.dr["cpStartTime"]).ToString("yyyy-MM-dd");
                        rows.Add(row);
                    } while (srSql.dr.Read());
                }
                else
                {
                    rows = "";
                }
                srSql.dr.Close();
                //查询数量
                srSql.cmd.CommandText = "select count(supportID) from supportTB   ";

                total = Convert.ToInt32(srSql.cmd.ExecuteScalar());

                srSql.conn.Close();

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