<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="syglWeb.slip.Admin.about" %>

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
<body>
    <form id="form1" runat="server">
    <div id="about_panel" data-optiongs="">
        
    </div>
    </form>
    <script type="text/javascript">
        $(function () {
            var wh = window.screen.availHeight;
            if(wh >500){
                wh = 500;
            }
            $('#about_panel').panel({
                width:500,
                height: wh,
                title: '关于创新平台', maximized: true,
                href:"getAbout.ashx",
                tools: [{
                    iconCls:'icon-page_edit',
                    handler: function () {
                        $.sr_edit_dialog("aboutEdit.aspx", { title: "修改关于", form: "newsEditForm" }, function (data) {
                            data = $.parseJSON(data);
                            if (data.status === 1) {
                                $.messager.show({ title: "提示", msg: data.msg, timeout: 2000 })
                                $('#about_panel').panel("refresh");
                            } else {
                                $.messager.alert("错误", data.msg, "error");
                            }
                        });
                    }
                }]
            });
        })

    </script>
</body>
</html>
