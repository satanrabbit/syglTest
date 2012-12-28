<%@ Page Title="" Language="C#" ValidateRequest="false"  MasterPageFile="~/slip/Manager/Share/Manager.Master" AutoEventWireup="true" 
CodeBehind="EditNews.aspx.cs" Inherits="syglWeb.slip.Manager.EditNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link rel="stylesheet" type="text/css" href="/Slip/Sources/kindeditor_4.1.3/themes/default/default.css" />
	<link rel="stylesheet" type="text/css" href="/Slip/Sources/kindeditor_4.1.3/plugins/code/prettify.css" />
    <script type="text/javascript" src="/Slip/Sources/kindeditor_4.1.3/kindeditor-all-min.js"></script>
	<script  type="text/javascript" charset="utf-8" src="/Slip/Sources/kindeditor_4.1.3/lang/zh_CN.js"></script>
	<script  type="text/javascript" charset="utf-8" src="/Slip/Sources/kindeditor_4.1.3/plugins/code/prettify.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="mguider">
    <span>管理首页 >> 新闻资讯 >> 修改 添加 新闻资讯</span>
</div>
<div class="mcontent">

<script type="text/javascript">

    KindEditor.ready(function (K) {
        var editor1 = K.create('.TextBoxNewsContent', {
            width: '95%',
            height: '400px',
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
   
  <tr>
    <td width="10%" align="right" scope="col">标题：<asp:HiddenField ID="HiddenFieldNewsID" runat="server" />
    </td>
    <td width="90%" align="left" scope="col"><asp:TextBox ID="TextBoxNewsTitle" runat="server" Height="30" Width="95%"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="TextBoxNewsTitle" ErrorMessage="请填写新闻标题！" SetFocusOnError="True"></asp:RequiredFieldValidator></td>      
  </tr>
  <tr>
    <td align="right">发布时间：</td>
    <td><asp:TextBox ID="TextBoxNewsPostTime" runat="server" ></asp:TextBox></td>
  </tr>
  <tr>
    <td align="right" valign="top">内容：</td>
    <td><asp:TextBox ID="TextBoxNewsContent" CssClass="TextBoxNewsContent" runat="server" TextMode="MultiLine"   Width="600"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorContent" runat="server" ControlToValidate="TextBoxNewsContent" ErrorMessage="请填写新闻内容！" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
  </tr>
  <tr>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="提交" /></td>
      
  </tr>
</table>
</div>
</asp:Content>
