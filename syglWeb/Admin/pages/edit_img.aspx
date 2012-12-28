<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  EnableViewState="false" ValidateRequest="false" CodeBehind="edit_img.aspx.cs" Inherits="syglWeb.Admin.pages.edit_img" %>
 
<link href="/Sourse/kindeditor_4.1.3/themes/default/default.css" rel="stylesheet" />
<script src="/Sourse/kindeditor_4.1.3/kindeditor-min.js"></script>
<script src="/Sourse/kindeditor_4.1.3/lang/zh_CN.js"></script>
<form id="form_edit_img" runat="server">
    <div style="margin:3px;line-height:2em;">
        <table class="edit_table">
            <thead>
                <tr><th colspan="2"></th></tr>
            </thead>
            <tbody>
                <tr><td class="title">图片</td>
                    <td>
                        <span id="img_wp">
                            <asp:image id="show_img_file" runat="server"></asp:image>
                            <asp:hiddenfield id="img_file" runat="server"></asp:hiddenfield>
                        </span>
                        <a href="javascript:;" id="add_img_btn" value="选择图片">选择图片</a>
                    </td>
                </tr>
                <tr><td class="title">链接地址</td><td><asp:textbox  id="imgLink" runat="server" CssClass="input_tb w70per lh30 font14" Height="60px" TextMode="MultiLine" ></asp:textbox></td></tr>
            </tbody>
        </table>
    </div>

    <asp:hiddenfield runat="server" id="imgID"></asp:hiddenfield>
 </form>
<script type="text/javascript">
    $(function () {
        var uploadbutton = KindEditor.uploadbutton({
            button: $('#add_img_btn'),
            fieldName: 'imgFile',
            url: '../Share/upload_json.ashx',
            afterUpload: function (data) {
                if (data.error === 0) {
                    var url = KindEditor.formatUrl(data.url, 'absolute');
                    $('#img_wp').empty().append('<img src="' + url + '" width="200"/><input type="hidden" name="img_file" id="img_file" value="' + url + '" />');
                } else {
                    alert(data.message);
                }
            },
            afterError: function (str) {
                alert('错误信息: ' + str);
            }
        });
        uploadbutton.fileBox.change(function (e) {
            uploadbutton.submit();
        });
        //表单验证
        $("#imgLink").validatebox({
            required: true,validType:"url",invalidMessage:"请填入有效url地址，形如：http://www.exmple.com/"
        });
        $('#articlePostTime').datetimebox({
            showSeconds: true,
            width: 200,
            editable: false
        });
    });


</script>
 