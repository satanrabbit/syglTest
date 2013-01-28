<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="syglWeb.dj.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <link href="../Sourse/jquery_easyui/themes/metro/easyui.css" rel="stylesheet" />
    <link href="../Sourse/jquery_easyui/themes/icon.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="../Sourse/jquery_easyui/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout"> 
    <div data-options="region:'north',split:true"style="height:60px;background-color:#f9f8f8;"></div>
	<div region="south" split="true" style="height:50px;"></div>
	<div data-options="region:'east',iconCls:'icon-information',title:'关于',split:'true',collapsed:true" style="width:180px;"></div>
	<div region="west" split="true" style="width:200px;"></div>
	<div region="center" style="padding:5px;background:#f9f8f8;"></div>
</body>
</html>
