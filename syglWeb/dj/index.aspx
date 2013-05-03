<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="syglWeb.dj.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>实验室报修系统</title>
    <link href="../Sourse/jquery_easyui/themes/metro/easyui.css" rel="stylesheet" />
    <link href="../Sourse/jquery_easyui/themes/icon.css" rel="stylesheet" />   
</head>
<body class="easyui-layout"> 
    <div data-options="region:'north'"style="height:65px;background-color:#fff; position:relative;">
        <div style="background:url('images/logo.png') no-repeat ;width:455px; height:60px;"></div>
        <div style="position:absolute;right:30px;bottom:5px;">
            <a class="easyui-linkbutton" id="login-button" data-options="iconCls:'icon-user_gray'">管理员登录</a>
        </div>
    </div>
    <!--底部-->
	<div region="south"  style="height:50px;"></div>
	<div data-options="region:'east',iconCls:'icon-information',title:'关于',split:'true',collapsed:true" style="width:180px;"></div>
	<div data-options="region:'west',title:'电教信息',iconCls:'icon-page_white_gear'"  style="width:200px;">
        <div class="easyui-panel" data-options="" style="padding:10px;background:#fff;text-align:center;">
            <a class="easyui-linkbutton menu-button" data-options="iconCls:'icon-page_edit'" style="margin:5px 0;">故障登记</a>
            <a class="easyui-linkbutton menu-button" data-options="iconCls:'icon-page_paste'" style="margin:5px 0;">处理情况</a>
            <a class="easyui-linkbutton menu-button" data-options="iconCls:'icon-computer'" style="margin:5px 0;">设备信息</a>
            <a class="easyui-linkbutton menu-button" data-options="iconCls:'icon-application_home'" style="margin:5px 0;">教室配置</a>
        </div>
        <div class="easyui-panel"data-options="title:'统计信息',collapsible:true,iconCls:'icon-chart_bar'" style="height:180px;padding:10px;background:#fafafa;">
	    </div>
	</div>
	<div region="center"  style="padding:0px;background:#f9f8f8;">
        <div class="easyui-tabs" id="centerTabs" data-options="border: false">
            <div data-options="title:'首页'">
                <div class="easyui-panel" data-options="title:'使用说明'">
                    <p>使用说明待完善</p>
                </div>
                <div class="easyui-panel" data-options="title:'关于'"></div>
            </div>
        </div>
	</div>
    <div id="login-dialog" style="width:280px;">
        <form id="login-form" name="login-form" action="login.ashx" method="post" >
            <table>
                <tr><td>账号</td><td><input type="text" name="account" id="account" class="easyui-validatebox" data-options="required:true" /></td></tr>
                <tr><td>密码</td><td><input type="password" name="pwd" id="pwd" class="easyui-validatebox" data-options="required:true" /></td></tr>
            </table>
        </form>
    </div>
    <script src="../Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="../Sourse/jquery_easyui/jquery.easyui.min.js"></script>
    <script src="../Sourse/jquery_easyui/easyui_ex.js"></script>
    <script src="../Sourse/jquery_easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
</body>
</html>
