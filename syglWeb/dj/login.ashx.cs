using System;
using System.Collections.Generic;
using System.Web;
using LitJson;
using SRLib;
using System.Data;
using System.Data.OleDb;
using System.Web.SessionState;


namespace syglWeb.dj
{
    /// <summary>
    /// login 的摘要说明
    /// </summary>
    public class login : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //登录状态码
            int status = 0;
            //登录状态提示信息
            string msg = "未知错误";
            //接收数据
            string account = context.Request.Form["account"];
            string pwd = context.Request.Form["pwd"];

            if (account == null || account == "")
            {
                msg = "未填写帐号！";
            }
            else 
            {
                if (pwd == null || pwd == "")
                {
                    msg = "未填写密码！";
                }
                else
                {
                    //数据验证通过，查询帐号 
                    DjOledb djOledb = new DjOledb();
                    djOledb.conn.Open();
                    djOledb.cmd.CommandText = "select * from admin_tb where adminAccount= @account";
                    djOledb.cmd.Parameters.AddWithValue("@account",account);
                    djOledb.dr = djOledb.cmd.ExecuteReader();
                    if (djOledb.dr.Read())
                    {
                        //帐号存在
                        //加密密码
                        SrCom srCom = new SrCom();
                        pwd = srCom.HashPassword(pwd);
                        
                        //匹配密码
                        if (pwd == djOledb.dr["adminPwd"].ToString())
                        {
                            //匹配
                            status = 1;
                            msg = "登录成功！";
                            //设置session
                            context.Session["djAdminAccount"] = account;
                            context.Session["djAdminName"] = djOledb.dr["adminName"].ToString();
                            context.Session["djAdminType"] = djOledb.dr["adminType"].ToString();
                        }
                        else
                        {
                            //不匹配
                            msg = "密码错误！<br />"+pwd;
                        }
                    }
                    else
                    {
                        //帐号不存在
                        msg = "帐号不存在！";
                    }
                    djOledb.conn.Close();            
                }
            }
            //返回登录结果json数据
            JsonData reData = new JsonData();
            reData["status"] = status;
            reData["msg"] = msg;
            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write(reData.ToJson());
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