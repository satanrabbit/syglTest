<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="spts.aspx.cs" Inherits="syglWeb.slip_.admin.spts" %>

<!DOCTYPE html>
<!--- 项目支持管理页---->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>创新平台-天津科技大学</title>
    <link href="../source/Alice/one-full.css" rel="stylesheet" />
    <link href="../source/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="../source/easyui/themes/icon.css" rel="stylesheet" />
    <link href="../css/slip.css" rel="stylesheet" />
    <script src="../js/jquery-1.8.0.min.js"></script>
    <script src="../source/easyui/jquery.easyui.min.js"></script>
    <script src="../source/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="../source/easyui/easyui_ex.js"></script>
    <script src="../source/easyui/jquery_easyUI_dialog_form.js"></script>
</head>
<body   class="easyui-layout">
        <div region="center">
           	<table id="sptdg"></table>
		</div>
    <script>
        $sptdg = $("#sptdg");
        $sptdg.datagrid({
            url: 'sptl.ashx', fitColumns: true, pagination: true, idField: "supportID", fit: true, fitColumns: true, iconCls: "icon-wrench",
            title: '项目支持',
            columns: [[
			    { field: 'supportID', title: '编号', align: 'center', width: 80, sortable: true, checkbox: true },
			    { field: 'supportTitle', title: '标题', align: 'center' ,width:220},
                {
                    title: "操作",
                    field: "_newsID",
                    align: 'center',width:200,
                    formatter: function (value, rowData, rowIndex) {
                        var aid = rowData.supportID;
                        var html = '<a href="../ps.aspx?id=' + aid +
                            '" class="art_view_btn" target="_blank">查看</a><a href="javascript:;" aid=' + aid +
                            ' class="art_edit_btn">修改</a>';
                        return html;
                    }
                }
            ]]
            ,
            onClickRow: function (rowIndex, rowData) {

            },
            onDblClickRow: function (rowIndex, rowData) {

            },
            onLoadSuccess: function (data) {
                //数据加载完成后，格式化数据单元格内的按钮
                $(".art_view_btn").linkbutton({ plain: true, iconCls: 'icon-page' });
                $(".art_edit_btn").linkbutton({ plain: true, iconCls: 'icon-pencil' });
                //数据单元格内的，按钮绑定事件
                //修改
                $(".art_edit_btn").click(function () {
                    var aid = $(this).attr("aid");
                    $.sr_edit_dialog("espt.aspx", { title: '修改项目支持', form: 'editSupport', id: aid, width: 600, maximized: true, maximizable: true, modal: true }, function (data) {
                        data = $.parseJSON(data);
                        if (data.stauts === 1) {
                            //成功，刷新datagrid，提醒
                            $.messager.show({ title: '添加成功', msg: data.msg, timeout: 2000 });
                            $sptdg.datagrid('reload');
                        } else {
                            $.messager.alert('错误', data.msg, 'error');
                        }
                    });
                });
            }
        });
    </script>
</body>

</html>
