using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using LitJson;
using SRLib;

namespace syglWeb.Admin.pages
{
    /// <summary>
    /// delete_img 的摘要说明
    /// </summary>
    public class delete_img : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            int status = 0;
            string msg = "未知错误！";
            if (context.Request.Cookies["SyglAdmin"] == null)
            {
                msg = "您未登录或登录超时！";
            }
            else
            {
                if (context.Request["imgids"] == "" || context.Request["imgids"] == null)
                {
                    msg = "您没有提交数据！";
                }
                else
                {
                    string imgids = context.Request["imgids"];
                    OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["SyglConnStr"].ConnectionString);
                    try
                    {
                        conn.Open();
                        OleDbCommand cmd = new OleDbCommand();
                        cmd.Connection = conn;
                        
                        //删除数据记录
                        cmd.CommandText = "delete from imgs_tb where imgID in ( " + imgids + ") ";
                        int effects = cmd.ExecuteNonQuery();
                        //删除图片文件
                        string imgFile = context.Request["imgFile"];
                        SrCom srCom = new SrCom();
                        srCom.DeleteFile(imgFile);

                        status = 1;
                        msg = "成功删除" + effects + "条记录";
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        msg = ex.Message;
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
            JsonData jd = new JsonData();
            jd["status"] = status;
            jd["msg"] = msg;
            string echoData = jd.ToJson();
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(echoData);
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