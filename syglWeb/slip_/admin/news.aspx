<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="syglWeb.slip_.admin.news" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        <div  region="north" data-options="title:'查询'" style="height:80px;"></div>
        <div region="center"   >
           	<table id="tt"></table>
		</div>
      
    <script>
        $.extend({
            delete_news: function (aids, href, $tt) {
                $.post(href, { nids: aids }, function (data) {
                    
                    data = $.parseJSON(data);
                    if (data.status === 1) {
                        $.messager.show({ title: "删除成功！", msg: data.msg, timeout: 2000 });
                        $tt.datagrid("reload");
                    } else {
                        $.messager.alert("错误", data.msg, "error");
                    }
                });
            }
        });
        $('#tt').datagrid({
            url: 'nl.ashx', fitColumns: true, pagination: true, idField: "newsID", fit: true, fitColumns: true, iconCls: "icon-wrench",
            title:'新闻资讯',
		    columns:[[
			    { field: 'newsID', title: '编号',  align: 'center' , width: 80,sortable: true,checkbox: true},
			    { field: 'newsTitle', title: '标题', align: 'center' },
			    { field: 'newsPostTime', title: '发布时间', align: 'center' },
                {
			        title: "操作",
			        field: "_newsID",
			        width: 220,
			        align: 'center',
			        formatter: function (value, rowData, rowIndex) {
			            var aid = rowData.newsID;
			            var html = '<a href="../n.aspx?n=' + aid +
                            '" class="art_view_btn" target="_blank">查看</a><a href="javascript:;" aid=' + aid +
                            ' class="art_edit_btn">修改</a><a href="javascript:;" aid=' + aid +
                            ' class="art_del_btn">删除</a>';
			            return html;
			        }
			    }
		    ]],//
		    toolbar: [
                    {
                        text: "增加",
                        iconCls: "icon-add",
                        handler: function () {
                            $.sr_edit_dialog("en.aspx", { title: '修改新闻', form: 'editNews', width: 600, maximized: true, maximizable: true, modal: true }, function (data) {
                                data = $.parseJSON(data);                                
                                if (data.stauts === 1) {
                                    //成功，刷新datagrid，提醒
                                    $.messager.show({ title: '添加成功', msg: data.msg, timeout: 2000 });
                                    $('#tt').datagrid('reload');
                                } else {
                                    $.messager.alert( '错误',data.msg,'error');
                                }
                            });
                        }
                    }, "-", {
                        text: "删除",
                        iconCls: "icon-delete",
                        handler: function () {
                            var rows = $("#tt").datagrid("getSelections");
                            if (rows.length <= 0) {
                                return false;
                            }
                            $.messager.confirm("提示", "删除操作将不可逆！<br />请确认！", function (b) {
                                if (b) {
                                    var ids = [];
                                    $.each(rows, function (i, item) {
                                        ids.push(item.newsID);
                                    });
                                    ids = ids.join(",");
                                    $.delete_news(ids, "ndl.ashx", $("#tt"));
                                }
                            });
                        }
                    },
                    "-"
                ],
            onClickRow: function (rowIndex, rowData) {

            },
            onDblClickRow: function (rowIndex, rowData) {

            },
            onLoadSuccess: function (data) {
                //数据加载完成后，格式化数据单元格内的按钮
                $(".art_view_btn").linkbutton({ plain: true, iconCls: 'icon-page' });
                $(".art_edit_btn").linkbutton({ plain: true, iconCls: 'icon-pencil' });
                $(".art_del_btn").linkbutton({ plain: true, iconCls: 'icon-delete' });
                //数据单元格内的，按钮绑定事件
                //修改
                $(".art_edit_btn").click(function () {
                    var aid = $(this).attr("aid");
                    $.sr_edit_dialog("en.aspx", { title: '修改新闻', form: 'editNews',n:aid, width: 600, maximized:true,maximizable: true, modal: true }, function (data) {
                        data = $.parseJSON(data);
                        if (data.stauts === 1) {
                            //成功，刷新datagrid，提醒
                            $.messager.show({ title: '添加成功', msg: data.msg, timeout: 2000 });
                            $('#tt').datagrid('reload');
                        } else {
                            $.messager.alert('错误', data.msg, 'error');
                        }
                    });
                });

                //删除
                $(".art_del_btn").click(function () {
                    var aid = "0," + $(this).attr("aid");
                    $.messager.confirm("提示", "删除操作将不可逆！<br />请确认！", function (b) {
                        if (b) {                           
                            $.delete_news(aid, "ndl.ashx", $("#tt"));
                        }
                    });
                });
            }
	    });
    </script>
</body>

</html>
