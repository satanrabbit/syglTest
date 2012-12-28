<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="issue.aspx.cs" Inherits="syglWeb.slip.Discuss.issue" %>

<%@ Register Src="~/slip/Controls/hotTags.ascx" TagPrefix="uc1" TagName="hotTags" %>
<%@ Register Src="~/slip/Controls/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/slip/Controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>


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
        
    <uc1:header runat="server" ID="header" />
    <form id="form1" runat="server">
        <div id="page"> 
        <div id="pg_lf">
            <div id="dsc_guider">
                
            </div>
            <div id="dsc_list">  
                <div id="dsc_li_header">
                    <div id="dsc_li_title">
                        <h2>创新论坛：</h2> 
                    </div>                    
                </div>
                <div class="tags"></div>
                <div class="issue">
                    <div class="issue_side">
                        <div class="isssue_user_pro">
                            <img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="60" />
                        </div>
                        <div class="isssue_user_intro">
                            <div >姓名：</div>
                            <div >专业：</div>
                        </div>
                    </div>
                    <div class="issue_main">

                    </div>
                </div>
                            
                
                 
            </div>
            
        </div>
        <div id="pg_rt"> 
            <uc1:hotTags runat="server" id="hotTags1" />

        </div>
  <div class="clear"></div>
  </div>
    </form>
    <uc1:footer runat="server" ID="footer" />
    
</body>
</html>
