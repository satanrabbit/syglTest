using System;
using System.Collections.Generic;
using System.Web;
using syglWeb.slip.SRDel;

namespace syglWeb.slip.Handlers
{
    /// <summary>
    /// SaveLogo 保存项目的logo
    /// </summary>
    public class SaveLogo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string err = "";
            int status = 0;

           // context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            SRCom srCom = new SRCom();
            int avatar_x = (int)Convert.ToDouble(context.Request["px"]);
            int avatar_y = (int)Convert.ToDouble(context.Request["py"]);
            int avatar_w = (int)Convert.ToDouble(context.Request["pw"]);
            int avatar_h = (int)Convert.ToDouble(context.Request["ph"]);
            int topicID = (int)Convert.ToDouble(context.Request["tid"]);
            string img = context.Request["img"].ToString();
            string oldImg = context.Request["oldImg"].ToString();

            string logoMini = "";
            string logo = "";
            string logoOriginal = "";
            if (avatar_w > 0)
            {
                SRCutImage sweet_cutimg = new SRCutImage(avatar_x, avatar_y, avatar_w, avatar_h, 100, 125);
                sweet_cutimg.imgSaveFolder = @"/slip/Sources/ProjectImg/Logo/Mini/";
                logoMini = sweet_cutimg.Sweet_Cut(img);
                logo = srCom.MoveFile(img, @"/slip/Sources/ProjectImg/Logo/");
                logoOriginal = srCom.MoveFile(oldImg,@"/slip/Sources/ProjectImg/Logo/Original/");
            }

            SRSql srSql = new SRSql();
            SRSql srSql_ = new SRSql();
            srSql.conn.Open();
            srSql_.conn.Open();
            //删除原图片
            srSql_.cmd.CommandText = "select topicLogo, topicLogoOriginal,topicLogoMini from topicTB where topicID = @tid";
            srSql_.cmd.Parameters.AddWithValue("@tid", topicID);
            srSql_.da.Fill(srSql_.ds,"tb_topic_img");
            srCom.DeleteFile(srSql_.ds.Tables["tb_topic_img"].Rows[0]["topicLogo"].ToString());
            srCom.DeleteFile(srSql_.ds.Tables["tb_topic_img"].Rows[0]["topicLogoOriginal"].ToString());
            srCom.DeleteFile(srSql_.ds.Tables["tb_topic_img"].Rows[0]["topicLogoMini"].ToString());
           
            srSql.cmd.CommandText = "update topicTB set topicLogo= @logo, topicLogoOriginal = @logoOriginal ,topicLogoMini= @logoMini where topicID = @tid";
            srSql.cmd.Parameters.AddWithValue("@logo", logo);
            srSql.cmd.Parameters.AddWithValue("@logoOriginal", logoOriginal);
            srSql.cmd.Parameters.AddWithValue("@logoMini", logoMini);
            srSql.cmd.Parameters.AddWithValue("@tid", topicID);

            srSql.cmd.ExecuteNonQuery();

            srSql.conn.Close();
            srSql_.conn.Close();

            context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
            context.Response.Write("{\"status\":\"" + status.ToString() + "\",\"error\":\"" + err + "\",\"logo\":\"" + srCom.jsonString(logo) + "\",\"logoMini\":\"" + srCom.jsonString(logoMini) + "\"}");
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