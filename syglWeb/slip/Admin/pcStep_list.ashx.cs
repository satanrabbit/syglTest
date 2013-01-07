using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;
using LitJson;
using syglWeb.slip.SRDel;
using System.Data;
namespace syglWeb.slip.Admin
{
    /// <summary>
    /// pcStep_list 的摘要说明
    /// </summary>
    public class pcStep_list : IHttpHandler, IRequiresSessionState
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
                //查询所属项目
                int fcp = Convert.ToInt32(context.Request.Params["pc"]);
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

                string sort = "tpIndex";
                if (context.Request["sort"] != null && context.Request["sort"] != "")
                {
                    sort = (context.Request["sort"]);
                }
                string order = "asc";
                if (context.Request["order"] != null && context.Request["order"] != "")
                {
                    order = (context.Request["order"]);
                }

                SRSql srSql = new SRSql();

                srSql.conn.Open();

                if (page == 0)
                {
                    srSql.cmd.CommandText = "select top " + pageSize
                        + " tpID,tpName ,tpStartTime ,tpEndTime , tpPostTime , tpIndex  from  tpTB where forCp = "+fcp+"  order by " + sort + " " + order + " ";
                }
                else
                {
                    srSql.cmd.CommandText = "select top " + pageSize +
                         " tpID,tpName ,tpStartTime ,tpEndTime , tpPostTime , tpIndex  from  tpTB   where forCp = " + fcp + " and cpID not in ( select top " + page * pageSize +
                         " tpID from tpTB forCp = " + fcp + " order by order by " + sort + " " + order + " )  order by " + sort + " " + order + " )";

                }
                srSql.da.SelectCommand = srSql.cmd;
                srSql.da.Fill(srSql.ds,"tps_tb");
                
                //循环执行，初始话项目
                int openNext = 1;
                for (int i = 0; i < 12; i++)
                {
                    string tp = "";
                    switch (i)
                    {
                        case 0:
                            tp = "题目征集";
                            break;
                        case 1:
                            tp = "题目审核";
                            break;
                        case 2:
                            tp = "发布申报指南";
                            break;
                        case 3:
                            tp = "项目申报";
                            break;
                        case 4:
                            tp = "项目评审";
                            break;
                        case 5:
                            tp = "项目公式及师生互选";
                            break;
                        case 6:
                            tp = "项目实施";
                            break;
                        case 7:
                            tp = "中期检查";
                            break;
                        case 8:
                            tp = "中期检查结果公示";
                            break;
                        case 9:
                            tp = "开始结题";
                            break;
                        case 10:
                            tp = "结题验收";
                            break;
                        case 11:
                            tp = "题目征集";
                            break;
                        default:
                            break;
                    }

                   DataRow[] drs= srSql.ds.Tables["tps_tb"].Select("tpIndex = "+i);
                   if (drs.Length == 0)
                   {
                       //未开启第i项进程
                       

                       JsonData row = new JsonData();

                       row["open"] = openNext;
                       openNext = 0;
                       row["tp"] = tp;
                       row["tpName"] = "";
                       row["tpID"] = "";
                       row["tpIndex"] = i;
                       row["tpEndTime"] = "";
                       row["tpStartTime"] = "";
                       row["forCp"] = fcp;
                       row["tpPostTime"] = "";
                       rows.Add(row);
                   }
                   else
                   {
                       DataRow dr = drs[0];
                       JsonData row = new JsonData();
                       row["open"] = openNext;
                       openNext = 1;
                       row["tp"] = tp;
                       row["tpName"] = dr["tpName"].ToString();
                       row["tpID"] = dr["tpID"].ToString();
                       row["tpIndex"] = i;
                       row["tpEndTime"] = ((DateTime)dr["tpEndTime"]).ToString("yyyy-MM-dd");
                       row["tpStartTime"] = ((DateTime)dr["tpStartTime"]).ToString("yyyy-MM-dd");
                       row["tpPostTime"] = ((DateTime)dr["tpPostTime"]).ToString("yyyy-MM-dd");
                       row["forCp"] = fcp;
                       rows.Add(row);
                        
                   }
                }


                srSql.conn.Close();

                JsonData jsonData = new JsonData();
                jsonData["total"] = 12;
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