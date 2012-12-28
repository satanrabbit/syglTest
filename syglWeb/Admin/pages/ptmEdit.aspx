<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptmEdit.aspx.cs" ValidateRequest="false" Inherits="syglWeb.Admin.pages.ptmEdit" %>

 
<link href="/Sourse/kindeditor_4.1.3/themes/default/default.css" rel="stylesheet" />

<script src="/Sourse/kindeditor_4.1.3/kindeditor-min.js"></script>
<script src="/Sourse/kindeditor_4.1.3/lang/zh_CN.js"></script>
<form id="articleEditForm" runat="server">
    <div style="margin:3px;line-height:2em;">
        <table class="edit_table">
            <thead>
                <tr><th colspan="2"></th></tr>
            </thead>
            <tbody>
                <tr><td class="title">名称</td><td><asp:textbox id="articleTitle" runat="server" CssClass="input_tb h30 w70per lh30 font14"></asp:textbox></td></tr>
               
                <tr><td  class="title">介绍</td><td><asp:textbox id="articleContent"  runat="server" CssClass="input_tb  w70per" style="height:360px" TextMode="MultiLine"></asp:textbox> </td></tr>                 
            </tbody>
        </table>
    </div> 
 </form>
<script type="text/javascript">
    $(function () {
        var editor = KindEditor.create('textarea[name="articleContent"]', {
            width: '90%', basePath: "/Sourse/kindeditor_4.1.3/",
            items: [
                'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
                'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
                'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                'anchor', 'link', 'unlink', '|', 'about'
            ],
            uploadJson: '../Share/upload_json.ashx', fileManagerJson: '../Share/file_manager_json.ashx', allowFileManager: true, fillDescAfterUploadImage: true
            , fullscreenMode: true
            , afterBlur: function () {
                this.sync();
            }

        }); 
        setTimeout(function () { editor.fullscreen(false) }, 100); 
    });


</script>