using LitJson;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace syglWeb.slip_.admin
{
    public partial class ep : System.Web.UI.Page
    {
        public void returnMsg(int status, string msg)
        {
            JsonData jd = new JsonData();
            jd["stauts"] = status;
            jd["msg"] = msg;
            Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            Response.Write(jd.ToJson());
            Response.End();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                DataModal dm = new DataModal();
                oldProject op = new oldProject();
                op.opContent = Request.Params["opContent"];
                op.opDepartment = Request.Params["opDepartment"];
                op.opEmail = Request.Params["opEmail"];
                if (Request.Params["opID"] != "" && Request.Params["opID"] != null)
                {
                    op.opID = Convert.ToInt32(Request.Params["opID"]);
                }
                op.opImg = Request.Params["opImg"];
                op.opIntro = Request.Params["opIntro"];
                op.opLeader = Request.Params["opLeader"];
                op.opNum = Request.Params["opNum"];
                op.opTitle = Request.Params["opTitle"];
                if (Request.Params["opType"] != "" && Request.Params["opType"] != null)
                {
                    op.opType = Convert.ToInt32(Request.Params["opType"]);
                }
                op.opYear = Request.Params["opYear"];
                
                    dm.SaveOldProject(op);
                    returnMsg(1, "保存成功！");
            }
            else
            {
                if (Request.Params["opid"] == "" || Request.Params["opid"] == null)
                {
                    //新增加
                    this.opType.Text = "";
                }
                else
                {
                    //修改
                    int opid = Convert.ToInt32(Request.Params["opid"]);
                    DataModal dm = new DataModal();
                    oldProject op = new oldProject();
                    op = dm.GetOldProject(opid);
                    this.opContent.Text = op.opContent;
                    this.opDepartment.Text = op.opDepartment;
                    this.opEmail.Text = op.opEmail;
                    this.opID.Value = op.opID.ToString();
                    this.opImg.Value = op.opImg;
                    this.opIntro.Text = op.opIntro;
                    this.opLeader.Text = op.opLeader;
                    this.opNum.Text = op.opNum;
                    this.opTitle.Text = op.opTitle                        ;
                    this.opType.Text = op.opType.ToString();
                    this.opYear.Text = op.opYear;
                    if (op.opImg != null && op.opImg.Trim() != "")
                    {
                        this.opCoverImg.ImageUrl = op.opImg;
                    }
                }
            }
        }
    }
}