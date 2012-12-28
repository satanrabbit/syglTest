<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="postIssue.aspx.cs" ValidateRequest="false" EnableViewState="false" Inherits="syglWeb.slip.Discuss.postIssue" %>

<%@ Register Src="~/slip/Controls/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/slip/Controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/slip/Controls/hotTags.ascx" TagPrefix="uc1" TagName="hotTags" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <!--引入样式表，含js框架样式和自定义样式-->
    <!--easyui样式-->
    <link href="../../Sourse/jquery_easyui/themes/metro/easyui.css" type="text/css" rel="stylesheet" />
    <link href="../../Sourse/jquery_easyui/themes/icon.css" rel="stylesheet" type="text/css"  />
    <!--基础样式-->
    <link type="text/css" rel="stylesheet" href="~/Slip/Style/Style.css" />
    <!--页面样式-->
    <link href="../Style/Discuss.css" rel="stylesheet/less" type="text/css" />
    <!--引入js库-->
    <script src="../../Scripts/jquery-1.8.2.min.js"></script>
    <script src="../../Sourse/kindeditor_4.1.3/kindeditor-all-min.js"></script>
    <script src="../../Sourse/jquery_easyui/jquery.easyui.min.js"></script>
    <script src="../../Sourse/jquery_easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="../../Scripts/less-1.3.0.min.js"></script>
</head>
<body>    
    <uc1:header runat="server" id="header" />
    
    <form id="form_postIssue" runat="server">
    <div id="page"> 
        <div id="pg_lf">
            <div id="dsc_guider">
                
            </div>
            <div id="dsc_list">  
                <div id="dsc_li_header">
                    <div id="dsc_li_title">
                        <h2>创新论坛</h2> 
                    </div>                    
                </div>
                <table style="width:100%;">
                    <tr><td style="width:15%; text-align:center;">主题</td><td  style="width:85%;">
                        <input type="text" name="issue_title" class="titile_text" /></td></tr>
                    <tr>
                        <td style="width:15%; text-align:center;">标签</td><td  style="width:85%;">
                            <input type="text" name="tag1" style="width:70px;margin:5px;line-height:24px;" />
                            <input type="text" name="tag2" style="width:70px;margin:5px;line-height:24px;" />
                            <input type="text" name="tag3" style="width:70px;margin:5px;line-height:24px;" />
                            <input type="text" name="tag4" style="width:70px;margin:5px;line-height:24px;" />
                            <input type="text" name="tag5" style="width:70px;margin:5px;line-height:24px;" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width:15%; text-align:center; vertical-align:top;padding-top:10px;">内容</td><td  style="width:85%;">
                            <textarea name="issue_conten" style="width:90%;height:300px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;padding:5px 0;">
                        <a href="javascript:;" class="easyui-linkbutton" id="submit_issue" data-options="iconCls:'icon-disk'"> 发布</a>
                            <!--input type="submit" value="发布"  class="easyui-linkbutton" id="submit_issue" data-options="iconCls:'icon-disk'"/-->
                        </td>
                    </tr>
                </table>           
                
                 
            </div>
            
        </div>
        <div id="pg_rt"> 
            <uc1:hotTags runat="server" id="hotTags" />

        </div>
  <div class="clear"></div>
  </div>
    </form>
    <uc1:footer runat="server" id="footer" />
    
<script type="text/javascript">

    KindEditor.ready(function (K) {
        var editor1 = K.create('[name="issue_conten"]', {
            width: '90%',
            items: [
                    'source' ,
                    'justifyleft', 'justifycenter', 'justifyright',
                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    'superscript', 'selectall', '|', 'fullscreen', '/',
                    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'insertfile', 'table', 'hr', 
                    'anchor', 'link', 'unlink', '|', 'about'
            ],
            uploadJson: "../../Sources/kindeditor_4.1.3/asp.net/upload_json.ashx",
            fileManagerJson: '../../Sources/kindeditor_4.1.3/asp.net/file_manager_json.ashx',
            allowFileManager: true 
        }); 
    });
    $('[name="issue_title"]').validatebox({
        required: true
    });
    $("#submit_issue").click(function () {
        if ($("#form_postIssue").form("validate")) {
            $("#form_postIssue").submit()
        };
    });
</script>

</body>
</html>
