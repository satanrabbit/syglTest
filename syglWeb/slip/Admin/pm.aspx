<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pm.aspx.cs" Inherits="syglWeb.slip.Admin.pm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title></title>
    <!--引入样式表，含js框架样式和自定义样式-->
    <!--easyui样式-->
    <link href="../../Sourse/jquery_easyui/themes/metro/easyui.css" type="text/css" rel="stylesheet" />
    <link href="../../Sourse/jquery_easyui/themes/icon.css" rel="stylesheet" type="text/css"  />
   
    <!--页面样式--> 
    <link href="style/base.css" rel="stylesheet" />
    <!--引入js库-->
    <script src="../../Scripts/jquery-1.8.2.min.js"></script> 
    <script src="../../Sourse/jquery_easyui/jquery.easyui.min.js"></script>
    <script src="../../Sourse/jquery_easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="../../Scripts/less-1.3.0.min.js"></script>
    <script src="../../Sourse/jquery_easyui/easyui_ex.js"></script>
    <script src="../../Scripts/jquery_easyUI_dialog_form.js"></script>
</head> 
<body class="easyui-layout">
	<div data-options="region:'west',title:'查询',iconCls:'icon-search' " style="width:180px;background:#fff;padding:5px">         
    </div>
   	<div data-options=" title:'项目', region:'center',border:false">
    	<table id="dt" ></table>
    </div>
    </body>
</html>
