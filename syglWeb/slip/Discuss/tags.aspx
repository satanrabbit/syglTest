<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tags.aspx.cs" Inherits="syglWeb.slip.Discuss.tags" %>

<%@ Register Src="~/slip/Controls/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/slip/Controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/slip/Controls/hotTags.ascx" TagPrefix="uc1" TagName="hotTags" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>全部标签</title>
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
    <uc1:header runat="server" ID="header" />
    
        <div id="page"> 
            <div id="pg_lf">
                <div id="dsc_guider">
                
                </div>
                <div id="dsc_list">  
                    <div id="dsc_li_header">
                        <div id="dsc_li_title">
                            <h2>创新论坛：全部标签</h2>
                        </div>
                        
                    </div>               
                     <div class="dsc_rt_hotTags"> 
    <p>
        <asp:Label ID="LabelTags" runat="server" Text=""></asp:Label>
    </p>

</div>
        
                </div>
            
            </div>
            <div id="pg_rt">
                <a class="dsc_rt_openTopic" href="postIssue.aspx">发起话题</a>
                <uc1:hotTags runat="server" ID="hotTags" />
            </div>
      <div class="clear"></div>
      </div>
    <uc1:footer runat="server" ID="footer" />
</body>
</html>
