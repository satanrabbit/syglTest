<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/slip/Manager/Share/Manager.Master" AutoEventWireup="true" CodeBehind="ecp.aspx.cs" Inherits="syglWeb.slip.Manager.ecp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link rel="stylesheet" type="text/css" href="/Slip/Sources/kindeditor_4.1.3/themes/default/default.css" />
	<link rel="stylesheet" type="text/css" href="/Slip/Sources/kindeditor_4.1.3/plugins/code/prettify.css" />
    <script type="text/javascript" src="/Slip/Sources/kindeditor_4.1.3/kindeditor-all-min.js"></script>
	<script  type="text/javascript" charset="utf-8" src="/Slip/Sources/kindeditor_4.1.3/lang/zh_CN.js"></script>
	<script  type="text/javascript" charset="utf-8" src="/Slip/Sources/kindeditor_4.1.3/plugins/code/prettify.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="mguider">
    <span>管理首页 >> 项目进度 >> 开启新项目</span>
</div>
 
<div class="mcontent">        
<table width="100%" border="0" cellspacing="1" cellpadding="0">
   
  <tr>
    <td width="10%" align="right" scope="col">名称：<asp:HiddenField ID="HiddenFieldCpID" runat="server" />
    </td>
    <td width="90%" align="left" scope="col">
        <asp:TextBox ID="TextBoxCpName" runat="server" Height="30" Width="85%"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="TextBoxCpName" ErrorMessage="请填写进度名称！" SetFocusOnError="True">
        </asp:RequiredFieldValidator>
    </td>
  </tr> 
  <tr>
    <td align="right">项目年份：</td>
    <td>
        <asp:TextBox ID="TextBoxCpYear" runat="server"  Width="50px"></asp:TextBox>年度
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxCpYear" ErrorMessage="请填写项目所属年度！" SetFocusOnError="True">
        </asp:RequiredFieldValidator>
    </td>
  </tr>
   <tr>
    <td align="right">开始日期：</td>
    <td style=" position:relative;">
        <asp:TextBox ID="TextBoxCpStartTime" runat="server" CssClass="TextBoxCpStartTime" ></asp:TextBox>
        <span id="startTime_cn" style=" position:absolute; z-index:100;"></span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCpStartTime" runat="server" ControlToValidate="TextBoxCpStartTime" ErrorMessage="请填写开始时间！" SetFocusOnError="True">
        </asp:RequiredFieldValidator>
    </td>
  </tr>
   <tr>
    <td align="right">结束日期：</td>
    <td>
        <asp:TextBox ID="TextBoxCpEndTime" runat="server"  CssClass="TextBoxCpEndTime" ></asp:TextBox>
        <span id="endTime_cn" style=" position:absolute; z-index:100;"></span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCpEndTime" runat="server" ControlToValidate="TextBoxCpEndTime" ErrorMessage="请填写结束时间！" SetFocusOnError="True">
        </asp:RequiredFieldValidator>
    </td>
  </tr>
  <tr>
    <td align="right" valign="top" >介绍：</td>
    <td><asp:TextBox ID="TextBoxCpNotice" CssClass="TextBoxCpNotice" runat="server"   Height="30" Width="85%"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorNotice" runat="server" ControlToValidate="TextBoxCpNotice" ErrorMessage="请填写介绍！" SetFocusOnError="True"></asp:RequiredFieldValidator></td>
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
        var orsDay = new Date($(".TextBoxCpStartTime").val());
        var oreDay = new Date($(".TextBoxCpEndTime").val());
        if (orsDay == "") {
            orsDay = startDay;
        }
        if (oreDay == "") {
            oreDay = startDay;
        }
        $('#startTime_cn,#endTime_cn').hide();
        $(".TextBoxCpStartTime").focus(function () {
            $('#startTime_cn').show();
        });

        $('#startTime_cn').datepicker({
            inline: true,
            defaultDate: orsDay,
            altField: '.TextBoxCpStartTime',
            altFormat: 'yy/mm/dd',
            closeText: 'X',
            dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            showMonthAfterYear: true,
            onSelect: function (dateText, inst) { $('#startTime_cn').hide(); }
        });
        $(".TextBoxCpEndTime").focus(function () {
            $('#endTime_cn').show();
        });
        $('#endTime_cn').datepicker({
            inline: true,
            defaultDate: oreDay,
            altField: '.TextBoxCpEndTime',
            altFormat: 'yy/mm/dd',
            closeText: 'X',
            dayNamesMin: ['日', '一', '二', '三', '四', '五', '六'],
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
            showMonthAfterYear: true,
            onSelect: function (dateText, inst) { $('#endTime_cn').hide(); }
        });
    });

    KindEditor.ready(function (K) {
        var editor1 = K.create('.TextBoxCpNotice', {
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
</asp:Content>
