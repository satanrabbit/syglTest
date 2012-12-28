<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="down_edit.aspx.cs" EnableViewState="false" Inherits="syglWeb.Admin.pages.down_edit" %>

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
                <tr>
                    <td class="title">标题</td>
                    <td>
                        <asp:textbox id="downTitle" runat="server" CssClass="input_tb h30 w70per lh30 font14"></asp:textbox>
                    </td>
                </tr>                
                <tr>
                    <td class="title">摘要</td>
                    <td>
                        <asp:textbox id="downIntro" runat="server" CssClass="input_tb  w70per lh24 font14"  style="height:50px"  TextMode="MultiLine"></asp:textbox>
                    </td>
                </tr>
                <tr>
                    <td  class="title">发布日期</td>
                    <td>
                        <asp:textbox id="downPostTime" runat="server" CssClass="input_tb h30 w50per lh30 font14"></asp:textbox> 
                    </td>
                </tr>
                <tr>
                    <td  class="title">文件</td>
                    <td>
                        <asp:textbox id="downFile"  runat="server" CssClass="input_tb h30 w70per lh30 font14" ReadOnly="True" ></asp:textbox> 
                        <br />                        
                        <input type="button" id="uploadButton" value="选择文件" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
 </form>
<script type="text/javascript">
    $(function () {
        var uploadbutton = KindEditor.uploadbutton({
            button: KindEditor('#uploadButton')[0],
            fieldName: 'imgFile',
            url: '../Share/upload_json.ashx?dir=file',
            afterUpload: function (data) {
                if (data.error === 0) {
                    var url = KindEditor.formatUrl(data.url, 'absolute');
                    KindEditor('#downFile').val(url);
                } else {
                    alert(data.message);
                }
            },
            afterError: function (str) {
                alert('自定义错误信息: ' + str);
            }
        });
        uploadbutton.fileBox.change(function (e) {
            uploadbutton.submit();
        });
        //表单验证
        $("#downTitle").validatebox({
            required: true
        });
        $('#downPostTime').datetimebox({
            showSeconds: true,
            width: 200,
            editable: false
        });
    });


</script>
