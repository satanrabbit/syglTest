<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="art_edit.aspx.cs" ValidateRequest="false" EnableViewState="false" Inherits="syglWeb.Admin.pages.art_edit" %>

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
                <tr><td class="title">标题</td><td><asp:textbox id="articleTitle" runat="server" CssClass="input_tb h30 w70per lh30 font14"></asp:textbox></td></tr>
                <tr><td class="title">作者</td><td><asp:textbox id="articleAuthor" runat="server" CssClass="input_tb h30 w50per lh30 font14"></asp:textbox></td></tr>
                <tr><td class="title">摘要</td><td><asp:textbox id="articleIntro" runat="server" CssClass="input_tb  w70per lh24 font14"  style="height:50px"  TextMode="MultiLine"></asp:textbox></td></tr>
                <tr><td  class="title">发布日期</td><td><asp:textbox id="articlePostTime" runat="server" CssClass="input_tb h30 w50per lh30 font14"></asp:textbox> </td></tr>
                <tr><td  class="title">内容</td><td><asp:textbox id="articleContent"  runat="server" CssClass="input_tb  w70per" style="height:260px" TextMode="MultiLine"></asp:textbox> </td></tr>                 
            </tbody>
        </table>
    </div>

    <asp:hiddenfield runat="server" id="articleType"></asp:hiddenfield>
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
        //function () { editor.fullscreen(false) }
        setTimeout(function () { editor.fullscreen(false) },100);
        
        //表单验证
        $("#articleTitle").validatebox({
            required: true
        });
        $('#articlePostTime').datetimebox({
            showSeconds: true,
            width:200,
            editable: false           
        });
    });


</script>
