<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="Regist.aspx.cs" Inherits="syglWeb.slip.Regist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link type="text/css" rel="Stylesheet" href="../Style/jquery.Jcrop.min.css" />
<script type="text/javascript" src="../Scripts/ajaxfileupload.js"></script>
<script type="text/javascript" src="../Scripts/jquery.Jcrop.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server"> 
<form id="regist_page_form" runat="server" method="post">
<div class="regist_wp">
    <div class="regist_box">
        <div><h1>注册创新平台</h1></div>
        <div class="regist_item">
            <label  class="tilte_label">身份</label>
            <span style=" line-height:35px; height:35px; vertical-align: middle;">
            <input type="radio" name="user_identity" id="user_identity_1" value="1" checked="checked"/>
            <label for="user_identity_1" class="radio_label" >教师</label>
            <input type="radio" name="user_identity" id="user_identity_0" value="0"/>
            <label for="user_identity_0" class="radio_label">学生</label>
            </span>
        </div> 
        <div class="regist_item">
            <label for="user_school_num"  class="tilte_label" >教工号</label>
            <asp:TextBox ID="user_school_num" runat="server" CssClass="regist_text" >
            </asp:TextBox> *
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserNumber" runat="server" 
            ErrorMessage="请填写您的教工号或学号!" SetFocusOnError="True" 
                ControlToValidate="user_school_num" ToolTip="请填写您的教工号或学号!" 
                Display="Dynamic" CssClass="login_error_tips">请填写您的教工号或学号!</asp:RequiredFieldValidator>
        </div>
        <div class="regist_item">
            <label for="user_name"  class="tilte_label" >姓名</label>
            <asp:TextBox ID="user_name" runat="server" CssClass="regist_text" ></asp:TextBox> *
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" 
            ErrorMessage="请填写您的姓名！" SetFocusOnError="True" ControlToValidate="user_name" 
                ToolTip="请填写您的姓名！" Display="Dynamic" CssClass="login_error_tips">请填写您的姓名！</asp:RequiredFieldValidator>
        </div>
        <div class="regist_item">
            <label for="user_mail" class="tilte_label" >邮箱</label>
            <asp:TextBox ID="user_mail" runat="server" CssClass="regist_text" ></asp:TextBox> *
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserMail" runat="server" 
            ErrorMessage="请填写您的邮箱！" SetFocusOnError="True" ControlToValidate="user_mail" 
                ToolTip="请填写您的邮箱！" Display="Dynamic" CssClass="login_error_tips">请填写您的邮箱！</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorUserMail" 
                runat="server" ErrorMessage="*必填" 
                ControlToValidate="user_mail" ToolTip="请填写正确的邮箱！例：sample@gmail.com" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                Display="Dynamic" SetFocusOnError="True" CssClass="login_error_tips">请填写正确的邮箱！例：sample@gmail.com</asp:RegularExpressionValidator>
        </div>
        <div class="regist_item">
            <label for="user_password" class="tilte_label">密码</label>
            <asp:TextBox ID="user_password" runat="server" CssClass="regist_text" TextMode="Password"  ></asp:TextBox>
            *
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserPWD" runat="server" 
            ErrorMessage="请填写密码！" SetFocusOnError="True" ControlToValidate="user_password" 
                ToolTip="请填写密码！" Display="Dynamic" CssClass="login_error_tips" >请填写密码！</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorUserPWD" 
                runat="server" ErrorMessage="请填写您的密码！" 
                ValidationExpression="^[\dA-Za-z(!@#$%&amp;)]{5,15}$" 
                ControlToValidate="user_password" Display="Dynamic" 
                ToolTip="请填写您的密码！密码为5到15个字母、数字或字符!@#$%&amp;！" CssClass="login_error_tips">请填写您的密码！密码为5到15个字母、数字或字符!@#$%&amp;！</asp:RegularExpressionValidator>
        </div> 
        <div class="regist_item">
            <label for="user_password" class="tilte_label">确认密码</label>
            <asp:TextBox ID="user_password_compare" runat="server" CssClass="regist_text" TextMode="Password"  ></asp:TextBox>
            *
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserPWDCompare" runat="server" 
            ErrorMessage="请填写确认密码！" SetFocusOnError="True" ControlToValidate="user_password_compare" 
                ToolTip="请填写确认密码！" Display="Dynamic" CssClass="login_error_tips">请填写确认密码！</asp:RequiredFieldValidator>
                <asp:CompareValidator
                ID="CompareValidatorUserPWD" runat="server" ErrorMessage="两次密码不匹配！" 
                ControlToCompare="user_password" ControlToValidate="user_password_compare" 
                Display="Dynamic" CssClass="login_error_tips">两次密码不匹配！</asp:CompareValidator>
        </div> 
        <div class="regist_item">
            <label for="user_mobile" class="tilte_label" >手机号</label>
            <asp:TextBox ID="user_mobile" runat="server" CssClass="regist_text" ></asp:TextBox> 
        </div>
        <div class="regist_item">
            <label for="user_college"  class="tilte_label" >部门</label>
            <asp:TextBox ID="user_college" runat="server" CssClass="regist_text" ></asp:TextBox>  
        </div>
        <div class="regist_item">
            <label for="user_major"  class="tilte_label" >研究方向</label>
            <asp:TextBox ID="user_major" runat="server" CssClass="regist_text" ></asp:TextBox> 
        </div>
        <div class="login_submit_wp">
            <a class="login_submit_link" href="javascript:;" >
                <asp:Button ID="login_submit" runat="server" Text="注册" 
                CssClass="login_btn" /> 
            </a>
        </div>
        <div class="login_regist_link">
           我有帐号？ <a href="LogOn.aspx" class="user_regist">登陆</a>
        </div>
        
    </div>
    <div class="login_tips">
        <div style="width:128px;height:128px;overflow:hidden; float:left;">
            <img src="Sources/Pictures/Client 2.ico" id="preview" alt="Preview" class="jcrop-preview" />
          </div>
          <div style="float:left;" id='file_frame_wp'> 
            <iframe src="Handlers/UploadFile.aspx" name="file_iframe" id="file_iframe" marginwidth="0" marginheight="0" frameborder="0" scrolling="no"  style=" border-bottom-style:none; width:300px; height:60px; display:block;"></iframe>
          </div>
        <input id="avatar_x" name="avatar_x" type="hidden" value="0" />
        <input id="avatar_y" name="avatar_y" type="hidden" value="0" />
        <input id="avatar_w" name="avatar_w" type="hidden" value="0" />
        <input id="avatar_h" name="avatar_h" type="hidden" value="0" />
        <input id="avatar_img" name="img" type="hidden" value="0" />
        <input id="old_img" name="old_img" type="hidden" value="0" />
         <div id="submit_w">
          <a id="select_img" href="javascript:;" class="green_button block">选择图片</a>
          <!--a id="avatar_submit" href="javascript:;" class="orange_button block">上传</a-->
          <div class="clear"></div>
          </div>
          <div class="clear"></div>
          <div id="target_wrapper" style=" margin:10px 3px;"><img src="" id="target" alt="头像" /></div>
          <div class="clear"></div> 
          <input id="trigger_btn" type="button" style=" display:none;" />
          <script type="text/javascript">

              $(function () {
                  if ($.browser.msie) {
                      $("#submit_w").hide();
                  } else {
                      $("#file_frame_wp").hide();
                  }
                  var jcrop_api, boundx, boundy;
                  function updatePreview(c) {
                      if (parseInt(c.w) > 0) {
                          $('#avatar_x').val(c.x);
                          $('#avatar_y').val(c.y);
                          $('#avatar_w').val(c.w);
                          $('#avatar_h').val(c.h);
                          var rx = 100 / c.w;
                          var ry = 100 / c.h;

                          $('#preview').css({
                              width: Math.round(rx * boundx) + 'px',
                              height: Math.round(ry * boundy) + 'px',
                              marginLeft: '-' + Math.round(rx * c.x) + 'px',
                              marginTop: '-' + Math.round(ry * c.y) + 'px'
                          });
                      }
                  };
                  $("#select_img").click(function () {

                      $("#target_wrapper").empty().append("<input type='file' name='logo_file' id='logo_file'/>");
                      $("#user_avatar").trigger("click");
                  });
                  $("#trigger_btn").click(function () {
                      $('#target').Jcrop({
                          onChange: updatePreview,
                          onSelect: updatePreview,
                          aspectRatio: 1
                      }, function () {
                          var bounds = this.getBounds();
                          boundx = bounds[0];
                          boundy = bounds[1];
                          jcrop_api = this;
                      });
                  });
                  $("#user_avatar").live("change", function () {                      
                      $.ajaxFileUpload({
                          url: "Handlers/UploadImage.ashx",
                          secureuri: false,
                          fileElementId: "logo_file",
                          dataType: 'json',
                          success: function (json, status) { 
                              if (json.status == 0) {
                                  $("#target_wrapper").empty().append("<img src='" + json.imgNamePath + "' id='target' alt='头像' /> ");
                                  $("#preview").attr("src", json.imgNamePath);
                                  $("#avatar_img").val(json.imgNamePath);
                                  $("#old_img").val(json.path);
                                  $('#target').Jcrop({
                                      onChange: updatePreview,
                                      onSelect: updatePreview,
                                      aspectRatio: 1
                                  }, function () {
                                      var bounds = this.getBounds();
                                      boundx = bounds[0];
                                      boundy = bounds[1];
                                      jcrop_api = this;
                                  });
                              }
                              else {
                                  alert(json.error);
                              }
                          },
                          error: function (json, status, e) {
                              alert(e);
                          }
                      });
                  });
              });
        </script>



    </div> 
</div>
</form>

</asp:Content>
