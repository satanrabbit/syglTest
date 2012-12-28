using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Manager
{
    public partial class cpm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //管理项目进程
            string cpid = Request.QueryString["cpid"];
            if (cpid == "" || cpid == null)
            {
                Response.Redirect("/slip/404.aspx");
            }

            int _cpid = Convert.ToInt32(cpid);

            SRSql srSql = new SRSql();
            srSql.conn.Open();
            srSql.cmd.CommandText = "select * from tpTB where forCp=@cpid order by tpIndex";
            srSql.cmd.Parameters.AddWithValue("@cpid",cpid);
            srSql.da.Fill(srSql.ds,"tb_tp");
            int np = srSql.ds.Tables["tb_tp"].Rows.Count;

            if (np <1 )//np==0
            {
                //题目征集未开启
                Panel0_0.Visible = true;
                Panel0_1.Visible = false;
                HyperLinkEcit0_0.NavigateUrl = "EditTp.aspx?cpid="+cpid+"&tpin=0";
            }
            else
            {
                //已经开启
                Panel0_1.Visible = true;
                Panel0_0.Visible = false;
                Label0_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[0]["tpStartTime"]).ToLongDateString();
                Label0_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[0]["tpEndTime"]).ToLongDateString();
                HyperLinkEcit0_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=0&tpid="+srSql.ds.Tables["tb_tp"].Rows[0]["tpID"];
            }

            if (np <2 ) //np==1
            {
                //题目评审未开启
                Panel1_0.Visible = true;
                Panel1_1.Visible = false;
                HyperLinkEdit1_0.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=1";
            }
            else
            {
                //已经开启
                Panel1_1.Visible = true;
                Panel1_0.Visible = false;
                Label1_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[1]["tpStartTime"]).ToLongDateString();
                Label1_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[1]["tpEndTime"]).ToLongDateString();
                HyperLinkEdit1_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=1&tpid=" + srSql.ds.Tables["tb_tp"].Rows[1]["tpID"];
            }

            if (np < 3) //np==2
            {
                //发布申报指南
                Panel2_0.Visible = true;
                Panel2_1.Visible = false;
                HyperLinkEdit2_0.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=2";
            }
            else
            {
                //已经开启
                Panel2_1.Visible = true;
                Panel2_0.Visible = false;
                Label2_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[2]["tpStartTime"]).ToLongDateString();
                Label2_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[2]["tpEndTime"]).ToLongDateString();
                HyperLinkEdit2_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=2&tpid=" + srSql.ds.Tables["tb_tp"].Rows[2]["tpID"];
            }

            if (np < 4) //np==3
            {
                //发布申报指南
                Panel3_0.Visible = true;
                Panel3_1.Visible = false;
                HyperLinkEdit3_0.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=3";
            }
            else
            {
                //已经开启
                Panel3_1.Visible = true;
                Panel3_0.Visible = false;
                Label3_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[3]["tpStartTime"]).ToLongDateString();
                Label3_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[3]["tpEndTime"]).ToLongDateString();
                HyperLinkEdit3_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=3&tpid=" + srSql.ds.Tables["tb_tp"].Rows[3]["tpID"];
            }

            if (np < 5) //np==4
            {
                //发布申报指南
                Panel4_0.Visible = true;
                Panel4_1.Visible = false;
                HyperLinkEdit4_0.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=4";
            }
            else
            {
                //已经开启
                Panel4_1.Visible = true;
                Panel4_0.Visible = false;
                Label4_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[4]["tpStartTime"]).ToLongDateString();
                Label4_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[4]["tpEndTime"]).ToLongDateString();
                HyperLinkEdit4_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=4&tpid=" + srSql.ds.Tables["tb_tp"].Rows[4]["tpID"];
            }

            if (np < 6) //np==5
            {
                //发布申报指南
                Panel5_0.Visible = true;
                Panel5_1.Visible = false;
                HyperLinkEdit5_0.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=5";
            }
            else
            {
                //已经开启
                Panel5_1.Visible = true;
                Panel5_0.Visible = false;
                Label5_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[5]["tpStartTime"]).ToLongDateString();
                Label5_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[5]["tpEndTime"]).ToLongDateString();
                HyperLinkEdit5_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=5&tpid=" + srSql.ds.Tables["tb_tp"].Rows[5]["tpID"];
            }


            if (np < 7) //np==6
            {
                //发布申报指南
                Panel6_0.Visible = true;
                Panel6_1.Visible = false;
                HyperLinkEdit6_0.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=6";
            }
            else
            {
                //已经开启
                Panel6_1.Visible = true;
                Panel6_0.Visible = false;
                Label6_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[6]["tpStartTime"]).ToLongDateString();
                Label6_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[6]["tpEndTime"]).ToLongDateString();
                HyperLinkEdit6_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=6&tpid=" + srSql.ds.Tables["tb_tp"].Rows[6]["tpID"];
            }
            if (np < 8) //np==7
            {
                //发布申报指南
                Panel7_0.Visible = true;
                Panel7_1.Visible = false;
                HyperLinkEdit7_0.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=7";
            }
            else
            {
                //已经开启
                Panel7_1.Visible = true;
                Panel7_0.Visible = false;
                Label7_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[7]["tpStartTime"]).ToLongDateString();
                Label7_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[7]["tpEndTime"]).ToLongDateString();
                HyperLinkEdit7_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=7&tpid=" + srSql.ds.Tables["tb_tp"].Rows[7]["tpID"];
            }


            if (np < 9) //np==8
            {
                //发布申报指南
                Panel8_0.Visible = true;
                Panel8_1.Visible = false;
                HyperLinkEdit8_0.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=8";
            }
            else
            {
                //已经开启
                Panel8_1.Visible = true;
                Panel8_0.Visible = false;
                Label8_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[8]["tpStartTime"]).ToLongDateString();
                Label8_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[8]["tpEndTime"]).ToLongDateString();
                HyperLinkEdit8_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=8&tpid=" + srSql.ds.Tables["tb_tp"].Rows[8]["tpID"];
            }
            if (np < 10) //np==9
            {
                //发布申报指南
                Panel9_0.Visible = true;
                Panel9_1.Visible = false;
                HyperLinkEdit9_0.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=9";
            }
            else
            {
                //已经开启
                Panel9_1.Visible = true;
                Panel9_0.Visible = false;
                Label9_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[9]["tpStartTime"]).ToLongDateString();
                Label9_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[9]["tpEndTime"]).ToLongDateString();
                HyperLinkEdit9_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=9&tpid=" + srSql.ds.Tables["tb_tp"].Rows[9]["tpID"];
            }

            if (np < 11) //np==10
            {
                //发布申报指南
                Panel10_0.Visible = true;
                Panel10_1.Visible = false;
                HyperLinkEdit10_0.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=10";
            }
            else
            {
                //已经开启
                Panel10_1.Visible = true;
                Panel10_0.Visible = false;
                Label10_0.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[10]["tpStartTime"]).ToLongDateString();
                Label10_1.Text = ((DateTime)srSql.ds.Tables["tb_tp"].Rows[10]["tpEndTime"]).ToLongDateString();
                HyperLinkEdit10_1.NavigateUrl = "EditTp.aspx?cpid=" + cpid + "&tpin=10&tpid=" + srSql.ds.Tables["tb_tp"].Rows[10]["tpID"];
            }

            srSql.conn.Close();

        }
    }
}