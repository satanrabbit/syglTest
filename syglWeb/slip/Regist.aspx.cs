using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using syglWeb.slip.SRDel;
using System.Text;

namespace syglWeb.slip
{
    public partial class Regist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SRCom srCom = new SRCom();
                int userIdentity = Convert.ToInt32(Request.Form["user_identity"]);
                string userName = user_name.Text.Trim();//Request.Form[this.user_name.ClientID];
                string userMail = user_mail.Text.Trim().ToLower();
                string userNumber = user_school_num.Text.Trim();
                string userPassword =user_password.Text.Trim();
                userPassword = srCom.HashPassword(userPassword);
                string userPasswordCompare =user_password_compare.Text.Trim();
                string userMobile = user_mobile.Text.Trim();
                string userCollege = user_college.Text.Trim();
                string userMajor =user_major.Text.Trim();

                string userPhoto = Request.Form["userPhoto"];
                string userIntro = Request.Form["userIntro"];

                int avatar_x = (int)Convert.ToDouble(Request.Form["avatar_x"]);
                int avatar_y = (int)Convert.ToDouble(Request.Form["avatar_y"]);
                int avatar_w = (int)Convert.ToDouble(Request.Form["avatar_w"]);
                int avatar_h = (int)Convert.ToDouble(Request.Form["avatar_h"]);
                string img = Request.Form["img"].ToString();
                string oldImg = Request.Form["old_img"].ToString();

                string avatarMini = "";
                string avatar = "";
                string avataOriginal = "";
                if (avatar_w > 0)
                {
                    SRCutImage sweet_cutimg = new SRCutImage(avatar_x, avatar_y, avatar_w, avatar_h, 120, 120);
                    sweet_cutimg.imgSaveFolder = @"/slip/Sources/Portraits/Mini/";
                    avatarMini = sweet_cutimg.Sweet_Cut(img);
                    avatar = srCom.MoveFile(img, @"/slip/Sources/Portraits/");
                    avataOriginal = srCom.MoveFile(oldImg, @"/slip/Sources/Portraits/Original/");
                }

                string postTime = DateTime.Now.ToString();

                SRSql srSql = new SRSql();
                srSql.conn.Open();
                    srSql.cmd.CommandText =
                     "insert into userTB " +
                    "( userName, userMail, userNumber, userIdentity, userPWD, userMobile, userCollege, userMajor, PostTime,avatarMini,avatar,avataOriginal) VALUES " +
                    "(@userName,@userMail,@userNumber,@userIdentity,@userPWD,@userMobile,@userCollege,@userMajor,@PostTime,@avatarMini,@avatar,@avataOriginal) ";
                   
                    srSql.cmd.Parameters.AddWithValue("@userName", userName == null ? "" : userName);
                    srSql.cmd.Parameters.AddWithValue("@userMail", userMail == null ? "" : userMail);
                    srSql.cmd.Parameters.AddWithValue("@userNumber", userNumber == null ? "" : userNumber);
                    srSql.cmd.Parameters.AddWithValue("@userIdentity", userIdentity);
                    srSql.cmd.Parameters.AddWithValue("@userPWD", userPassword == null ? "" : userPassword);
                    srSql.cmd.Parameters.AddWithValue("@userMobile", userMobile == null ? "" : userMobile);
                    srSql.cmd.Parameters.AddWithValue("@userCollege", userCollege == null ? "" : userCollege);
                    srSql.cmd.Parameters.AddWithValue("@userMajor", userMajor == null ? "" : userMajor);
                    srSql.cmd.Parameters.AddWithValue("@PostTime", postTime);
                    srSql.cmd.Parameters.AddWithValue("@avatarMini", avatarMini == null ? "" : avatarMini);
                    srSql.cmd.Parameters.AddWithValue("@avatar", avatar == null ? "" : avatar);
                    srSql.cmd.Parameters.AddWithValue("@avataOriginal", avataOriginal == null ? "" : avataOriginal);
                    srSql.cmd.ExecuteNonQuery();
                    srSql.conn.Close();

                    Response.Redirect("logOn.aspx?f=new_register");
            }
        }

        
    }
}