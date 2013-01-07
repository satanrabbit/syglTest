<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="tpStep_edit.aspx.cs" Inherits="syglWeb.slip.Admin.tpStep_edit" %>
<link href="/Sourse/kindeditor_4.1.3/themes/default/default.css" rel="stylesheet" />

<script src="/Sourse/kindeditor_4.1.3/kindeditor-min.js"></script>
<script src="/Sourse/kindeditor_4.1.3/lang/zh_CN.js"></script>

<form id="newsEditForm" runat="server">
    <asp:label runat="server" ID="LabeLoginTip"></asp:label>
    <asp:panel runat="server" ID="panel_Form">
    <div style="margin:3px;line-height:2em;">
        <table class="edit_table">
            <thead>
                
                <tr><th colspan="2"></th></tr>
            </thead>
            <tbody>
                <tr><td class="title">公告标题</td><td><asp:textbox id="tpName" runat="server" CssClass="input_tb h30 w70per lh30 font14"></asp:textbox></td></tr>
                <tr><td class="title">开始时间</td><td><asp:textbox id="tpStartTime" runat="server" CssClass="input_tb h30 w70per lh30 font14"></asp:textbox></td></tr>
                <tr><td class="title">结束时间</td><td><asp:textbox id="tpEndTime" runat="server" CssClass="input_tb h30 w70per lh30 font14"></asp:textbox></td></tr>
               
                <tr><td  class="title">发布日期</td><td><asp:textbox id="tpPostTime" runat="server" CssClass="input_tb h30 w50per lh30 font14"></asp:textbox> </td></tr>
                <tr><td  class="title">内容</td><td><asp:textbox id="tpNotice"  runat="server" CssClass="input_tb  w70per" style="height:260px" TextMode="MultiLine"></asp:textbox> </td></tr>                 
            </tbody>
            <asp:hiddenfield id="tpIndex" runat="server"></asp:hiddenfield>            
            <asp:hiddenfield id="forCp" runat="server"></asp:hiddenfield>
            <asp:hiddenfield id="tpID" runat="server"></asp:hiddenfield>
        </table>
    </div>

    <asp:hiddenfield runat="server" id="nid"></asp:hiddenfield>
        </asp:panel>
 </form>
<script type="text/javascript">
    $(function () {
        var editor = KindEditor.create('textarea[name="tpNotice"]', {
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
        $("#newsTitle").validatebox({
            required: true,
            editable: false
        });
        $('#tpStartTime,#tpEndTime').datebox({
            required: true,
            editable: false
        });
        $('#tpPostTime').datebox({  
            editable: false
        });
    });


</script>