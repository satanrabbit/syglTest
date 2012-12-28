<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/slip/Manager/Share/Manager.Master" AutoEventWireup="true" CodeBehind="EditTp.aspx.cs" Inherits="syglWeb.slip.Manager.EditTp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link rel="stylesheet" type="text/css" href="/Slip/Sources/kindeditor_4.1.3/themes/default/default.css" />
	<link rel="stylesheet" type="text/css" href="/Slip/Sources/kindeditor_4.1.3/plugins/code/prettify.css" />
    <script type="text/javascript" src="/Slip/Sources/kindeditor_4.1.3/kindeditor-all-min.js"></script>
	<script  type="text/javascript" charset="utf-8" src="/Slip/Sources/kindeditor_4.1.3/lang/zh_CN.js"></script>
	<script  type="text/javascript" charset="utf-8" src="/Slip/Sources/kindeditor_4.1.3/plugins/code/prettify.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="mguider">
    <span>管理首页 >> 项目进度 >> <asp:Label ID="LabelTitleTp" runat="server" Text=""></asp:Label></span>
</div>
 
<div class="mcontent">        
<table width="100%" border="0" cellspacing="1" cellpadding="0">
   
  <tr>
    <td width="10%" align="right" scope="col">进度公告名称：<asp:HiddenField ID="HiddenFieldCpID" runat="server" />
        <asp:HiddenField ID="HiddenFieldTpin" runat="server" />
        <asp:HiddenField ID="HiddenFieldTPID" runat="server" />
    </td>
    <td width="90%" align="left" scope="col">
        <asp:TextBox ID="TextBoxTpName" runat="server" Height="30" Width="85%"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="TextBoxTpName" ErrorMessage="请填写进度公告标题！" SetFocusOnError="True">
        </asp:RequiredFieldValidator>
    </td>
  </tr>  
   <tr>
    <td align="right">开始日期：</td>
    <td style=" position:relative;">
        <asp:TextBox ID="TextBoxTpStartTime" runat="server" CssClass="TextBoxTpStartTime" ></asp:TextBox>
        <span id="startTime_cn" style=" position:absolute; z-index:100;"></span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTpStartTime" runat="server" ControlToValidate="TextBoxTpStartTime" ErrorMessage="请填写进度开始时间！" SetFocusOnError="True">
        </asp:RequiredFieldValidator>
    </td>
  </tr>
   <tr>
    <td align="right">结束日期：</td>
    <td>
        <asp:TextBox ID="TextBoxTpEndTime" runat="server"  CssClass="TextBoxTpEndTime" >></asp:TextBox>
        <span id="endTime_cn" style=" position:absolute; z-index:100;"></span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTpEndTime" runat="server" ControlToValidate="TextBoxTpEndTime" ErrorMessage="请填写进度结束时间！" SetFocusOnError="True">
        </asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right" valign="top" >公告内容：</td>
    <td><asp:TextBox ID="TextBoxTpNotice" CssClass="TextBoxTpNotice" runat="server"   Height="30" Width="85%"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNotice" runat="server" ControlToValidate="TextBoxTpNotice" ErrorMessage="请填写进度公告内容！" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
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
<script type="text/javascript">
    $(function () {
        var startDay = new Date();
        var orsDay = new Date($(".TextBoxTpStartTime").val());
        var oreDay = new Date($(".TextBoxTpEndTime").val()); 
        if (orsDay == "") {
            orsDay = startDay;
        }
        if (oreDay == "") {
            oreDay = startDay;
        }
        $('#startTime_cn,#endTime_cn').hide();
        $(".TextBoxTpStartTime").focus(function () {
            $('#startTime_cn').show();
        }); 
        $('#startTime_cn').datepicker({
            inline: true,
            defaultDate: orsDay,
            altField: '.TextBoxTpStartTime',
            altFormat: 'yy/mm/dd',
            closeText: 'X',
            dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            showMonthAfterYear: true,
            onSelect: function (dateText, inst) { $('#startTime_cn').hide(); }
        });
        $(".TextBoxTpEndTime").focus(function () {
            $('#endTime_cn').show();
        });
        $('#endTime_cn').datepicker({
            inline: true,
            defaultDate: oreDay,
            altField: '.TextBoxTpEndTime',
            altFormat: 'yy/mm/dd',
            closeText: 'X',
            dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            showMonthAfterYear: true,
            onSelect: function (dateText, inst) { $('#endTime_cn').hide(); }
        });
    });

    KindEditor.ready(function (K) {
        var editor1 = K.create('.TextBoxTpNotice', {
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
                    K('form')[0].submit();
                });
                K.ctrl(self.edit.doc, 13, function () {
                    self.sync();
                    K('form')[0].submit();
                });
            }
        });
        prettyPrint();
    });
	 
</script>
</asp:Content>
