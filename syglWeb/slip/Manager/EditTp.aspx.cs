using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip.Manager
{
    public partial class EditTp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region 保存表单
            if (IsPostBack)
            {
                string tpID = Request.Form[HiddenFieldTPID.UniqueID];
                string tpName = Request.Form[TextBoxTpName.UniqueID];
                string tpStartTime = Request.Form[TextBoxTpStartTime.UniqueID];
                string tpEndTime = Request.Form[TextBoxTpEndTime.UniqueID];
                string tpNotice = Request.Form[TextBoxTpNotice.UniqueID];
                string tpPostTime = DateTime.Now.ToString();
                int cpID = Convert.ToInt32(Request.Form[HiddenFieldCpID.UniqueID]);
                int tpInd = Convert.ToInt32(Request.Form[HiddenFieldTpin.UniqueID]);


                SRDel.SRSql srSql = new SRDel.SRSql();

                srSql.conn.Open();
                if (tpID == "" || tpID == null)
                {
                    //新插入
                    srSql.cmd.CommandText = "insert into tpTB (tpName,tpStartTime,tpEndTime,tpNotice,tpPostTime,tpIndex,forCp) values(@tpName,@tpStartTime,@tpEndTime,@tpNotice,@tpPostTime,@tpIndex,@forCp)";
                    
                    srSql.cmd.Parameters.AddWithValue("@tpName",tpName);
                    srSql.cmd.Parameters.AddWithValue("@tpStartTime", tpStartTime);
                    srSql.cmd.Parameters.AddWithValue("@tpEndTime", tpEndTime);
                    srSql.cmd.Parameters.AddWithValue("@tpNotice", tpNotice);
                    srSql.cmd.Parameters.AddWithValue("@tpPostTime", tpPostTime);
                    srSql.cmd.Parameters.AddWithValue("@tpIndex", tpInd);
                    srSql.cmd.Parameters.AddWithValue("@forCp", cpID);

                    srSql.cmd.ExecuteNonQuery();

                }
                else
                {
                    //更改
                    int _tpID = Convert.ToInt32(tpID);
                    srSql.cmd.CommandText = "update tpTB set tpName=@tpName,tpStartTime=@tpStartTime,tpEndTime=@tpEndTime,tpNotice=@tpNotice,tpIndex=@tpIndex ,forCp=@forCp where tpID=@tpID";
                    srSql.cmd.Parameters.AddWithValue("@tpName", tpName);
                    srSql.cmd.Parameters.AddWithValue("@tpStartTime", tpStartTime);
                    srSql.cmd.Parameters.AddWithValue("@tpEndTime", tpEndTime);
                    srSql.cmd.Parameters.AddWithValue("@tpNotice", tpNotice);
                    srSql.cmd.Parameters.AddWithValue("@tpIndex", tpInd);
                    srSql.cmd.Parameters.AddWithValue("@forCp", cpID);
                    srSql.cmd.Parameters.AddWithValue("@tpID", _tpID);

                    srSql.cmd.ExecuteNonQuery();
                }                

                srSql.conn.Close();
                Response.Redirect("cpm.aspx?cpid=" + cpID);
            }

            #endregion

            //进入修改 、添加
            #region 进入修改 、添加 
            string tpid = Request.QueryString["tpid"];

            string cpid = Request.QueryString["cpid"];
            string tpIndex=Request.QueryString["tpin"];
            //cpid无值
            if (cpid == "" || cpid == null)
            {
                Response.Redirect("/slip/404.aspx");
            }
            //无进程值
            if (tpIndex == "" || tpIndex == null)
            {
                Response.Redirect("/slip/404.aspx");
            }

            switch (Convert.ToInt32(tpIndex))
            {
                case 0:
                    LabelTitleTp.Text = "题目征集";
                    break;
                case 1:
                    LabelTitleTp.Text = "题目评审";
                    break;
                case 2:
                    LabelTitleTp.Text = "发布申报指南";
                    break;
                case 3:
                    LabelTitleTp.Text = "项目申报";
                    break;
                case 4:
                    LabelTitleTp.Text = "项目评审";
                    break;

                case 5:
                    LabelTitleTp.Text = "项目公示及师生互选";
                    break;
                case 6:
                    LabelTitleTp.Text = "项目实施";
                    break;
                case 7:
                    LabelTitleTp.Text = "中期检查";
                    break;
                case 8:
                    LabelTitleTp.Text = "中期检查结果公示";
                    break;
                case 9:
                    LabelTitleTp.Text = "开始结题";
                    break;

                case 10:
                    LabelTitleTp.Text = "结题验收";
                    break;
            }




            //设置对应项目
            HiddenFieldCpID.Value = cpid;
            //设置对应进程顺序
            HiddenFieldTpin.Value = tpIndex;

            if (tpid == null || tpid == "")
            {
                //开启进程
                LabelTitleTp.Text = "开启" + LabelTitleTp.Text;

                //检查前一项进程是否开启
                if (Convert.ToInt32(tpIndex) > 0)
                {
                    SRDel.SRSql srSql = new SRDel.SRSql();

                    srSql.conn.Open();
                    srSql.cmd.CommandText = "select  count(tpIndex) from tpTB where tpIndex=@tpIndex and forCp=@cpID";

                    srSql.cmd.Parameters.AddWithValue("@tpIndex", Convert.ToInt32(tpIndex) - 1);
                    srSql.cmd.Parameters.AddWithValue("@cpID", Convert.ToInt32(cpid));
                    int ct = Convert.ToInt32(srSql.cmd.ExecuteScalar().ToString());
                    srSql.conn.Close();
                    if (ct == 0)
                    {
                        //前一项未开启！

                        Response.Write("<script type='text/javascript'>alert('前一项进程未开启，不可开启该进程！');history.go(-1);</script>");
                    }
                }
            }
            else
            {
                //修改进程
                LabelTitleTp.Text = "修改" + LabelTitleTp.Text;
                HiddenFieldTPID.Value = tpid;
                SRDel.SRSql srSql = new SRDel.SRSql();

                srSql.conn.Open();
                srSql.cmd.CommandText = "select * from tpTB where tpID=@tpid";
                srSql.cmd.Parameters.AddWithValue("@tpid",tpid);
                srSql.dr = srSql.cmd.ExecuteReader();
                if (srSql.dr.Read())
                {
                     TextBoxTpName.Text= srSql.dr["tpName"].ToString();
                     TextBoxTpNotice.Text = srSql.dr["tpNotice"].ToString();
                     TextBoxTpStartTime.Text = ((DateTime)srSql.dr["tpStartTime"]).ToShortDateString();
                     TextBoxTpEndTime.Text = ((DateTime)srSql.dr["tpEndTime"]).ToShortDateString(); 
                }
                srSql.conn.Close();
            }
            #endregion
        }
    }
}