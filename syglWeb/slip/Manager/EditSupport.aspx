<%@ Page Title="" Language="C#"  ValidateRequest="false"  MasterPageFile="~/slip/Manager/Share/Manager.Master" AutoEventWireup="true"  CodeBehind="EditSupport.aspx.cs"
 Inherits="syglWeb.slip.Manager.EditSupport"  %>
<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/Slip/Sources/kindeditor_4.1.3/themes/default/default.css" />
	<link rel="stylesheet" type="text/css" href="/Slip/Sources/kindeditor_4.1.3/plugins/code/prettify.css" />
    <script type="text/javascript" src="/Slip/Sources/kindeditor_4.1.3/kindeditor-all-min.js"></script>
	<script  type="text/javascript" charset="utf-8" src="/Slip/Sources/kindeditor_4.1.3/lang/zh_CN.js"></script>
	<script  type="text/javascript" charset="utf-8" src="/Slip/Sources/kindeditor_4.1.3/plugins/code/prettify.js"></script>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="mguider">
    <span>管理首页 >> 项目支持 >>修改内容 </span>
</div> 
<script type="text/javascript">

    KindEditor.ready(function (K) {
        var editor1 = K.create('.TextBoxSupportContent', {
            width: '95%',
            height: '500px',
            items: [
                        'source', 'undo', 'redo', '|', 'preview', 'paste',
                        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                        'superscript', 'selectall', '|', 'fullscreen', '/',
                        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'insertfile', 'table', 'hr', 'pagebreak',
                        'anchor', 'link', 'unlink', '|', 'about'
                ],
            uploadJson: "/Slip/Sources/kindeditor_4.1.3/asp.net/upload_json.ashx",
            fileManagerJson: '/Slip/Sources/kindeditor_4.1.3/asp.net/file_manager_json.ashx',
            //allowFileManager: true,
            afterCreate: function () {
                var self = this;
                K.ctrl(document, 13, function () {
                    self.sync();
                    K('form[name=example]')[0].submit();
                });
                K.ctrl(self.edit.doc, 13, function () {
                    self.sync();
                    K('form[name=example]')[0].submit();
                });
            }
        });
        prettyPrint();
    });
	 
</script>
<table width="100%" border="0" cellspacing="1" cellpadding="0">
  <caption style="font-weight:600;">
    修改<asp:Label ID="LabelSupportTitle1" runat="server" Text="LabelSupportTitle1"></asp:Label>
    <asp:HiddenField
        ID="HiddenFieldSupportID" runat="server" />
    
  </caption>
   
  <tr>
    <td align="right" valign="top">内容：</td>
    <td><asp:TextBox ID="TextBoxSupportContent" CssClass="TextBoxSupportContent" runat="server" TextMode="MultiLine"   Width="600"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorContent" runat="server" ControlToValidate="TextBoxSupportContent" ErrorMessage="请填写内容！" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="提交" /></td>
      
  </tr>
</table>
</asp:Content>
