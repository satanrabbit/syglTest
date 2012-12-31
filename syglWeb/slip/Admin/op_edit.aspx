<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="op_edit.aspx.cs" Inherits="syglWeb.slip.Admin.op_edit" %>

 
<form id="editForm" runat="server">
    <div style="margin:3px;line-height:2em;">
        <table class="edit_table">
            <thead>
                <tr><th colspan="2"></th></tr>
            </thead>
            <tbody>
                <tr><td class="title">标题</td><td><asp:textbox id="opTitle" runat="server" CssClass="input_tb h30 w70per lh30 font14"></asp:textbox></td></tr>
               
                <tr><td  class="title">年度</td><td><asp:textbox id="opYear" runat="server" CssClass="input_tb h30 w50per lh30 font14"></asp:textbox> </td></tr>
                <tr><td  class="title">内容</td><td><asp:textbox id="opContent"  runat="server" CssClass="input_tb  w70per" style="height:260px" TextMode="MultiLine"></asp:textbox> </td></tr>                 
            </tbody>
        </table>
    </div>

    <asp:hiddenfield runat="server" id="nid"></asp:hiddenfield>
 </form>
<script type="text/javascript">
    $(function () {
        var editor = KindEditor.create('textarea[name="opContent"]', {
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

        //表单验证
        $("#opTitle").validatebox({
            required: true
        });
    });


</script>
