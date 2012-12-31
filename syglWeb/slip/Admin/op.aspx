<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="op.aspx.cs" Inherits="syglWeb.slip.Admin.op" %>

 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <!--引入KindEditor-->
    <link href="/Sourse/kindeditor_4.1.3/themes/default/default.css" rel="stylesheet" />
    <script src="/Sourse/kindeditor_4.1.3/kindeditor-min.js"></script>
    <script src="/Sourse/kindeditor_4.1.3/lang/zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'查询',iconCls:'icon-search',collapsed:true" style="height:100px;background:#EFEFEF;padding:5px">         
    </div>
   	<div data-options="region:'center',border:false">
    	<table id="dt" ></table>
    </div>
    <script type="text/javascript">
        $(function () {
            $.extend({
                delete_item: function (params, url,dg) {
                    $.messager.confirm("确认删除？", "删除操作不可逆<br />&emsp;请确认！", function (b) {
                        if (b) {
                            $.post(url, params, function (data) {
                                data = $.parseJSON(data);
                                if (data.status === 1) {
                                    $.messager.show({ title: "提示", msg: data.msg, timeout: 2000 });
                                    dg.datagrid('load');
                                } else {
                                    $.messager.alert("错误！",data.msg,"error");
                                }
                            })
                        }
                    });
                }
            })

            /**
           *初始化列表
           */
            var $dt = $("#dt").datagrid({
                //title: "",
                rownumbers: true,
                url: "op_list.ashx",
                //queryParams: { clm: " " },
                iconCls: "icon-wrench",
                pagination: true,
                pageSize: 15,
                pageList: [15, 20, 25, 30, 35, 40],
                fit: true,
                fitColumns: true,
                nowarp: false,//设置是否折行，false为折行
                border: true,//设置是否显示border
                idField: 'opID',//设置跨页选择的标识栏
                sortName: "opID",
                SortOrder: "desc",
                columns: [[
                    {
                        title: "编号",
                        field: "opID",
                        width: 80,
                        sortable: true,
                        checkbox: true
                    }, {
                        title: "标题",
                        field: "opTitle", sortable: true,
                        width: 480,
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            var newsid = rowData.opID;
                            var html = '<a href="/slip/NewsDetail.aspx?nid=' + newsid +
                                '" target="_blank">' + value + '</a>';
                            return html;
                        }
                    }, {
                        title: "时间",
                        field: "opYear", sortable: true,
                        width: 80,
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            var newsid = rowData.opID;
                            var html = '<a href="/slip/NewsDetail.aspx?nid=' + newsid +
                                '" target="_blank">' + value + '</a>';
                            return html;
                        }
                    }, {
                        title: "操作",
                        field: "_articleID",
                        width: 220,
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            var did = rowData.opID;
                            var html = '<a href="/slip/Support/SupportDetail.aspx?sid=' + did +
                                '" class="art_view_btn" target="_blank">查看</a><a href="javascript:;" did=' + did +
                                ' class="art_edit_btn">修改</a> <a href="javascript:;" did=' + did +
                                ' class="art_del_btn">删除</a>';
                            return html;
                        }
                    }
                ]],
                toolbar: [
                    {
                        text: "增加",
                        iconCls: "icon-add",
                        handler: function () {
                            $.sr_edit_dialog("op_edit.aspx", {  title: "添加创新成果", form: "editForm" }, function (data) {
                                data = $.parseJSON(data);
                                if (data.status === 1) {
                                    $.messager.show({ title: "提示", msg: data.msg, timeout: 2000 })
                                    $dt.datagrid("load")
                                } else {
                                    $.messager.alert("错误", data.msg, "error");
                                }
                            });
                        }
                    }, "-", {
                        text: "删除",
                        iconCls: "icon-delete",
                        handler: function () {
                            var rows = $dt.datagrid("getSelections");
                            if (rows.length <= 0) {
                                return false;
                            }
                            var dids = [];
                            $.each(rows, function (i, item) {
                                dids.push(item.opID);
                            });
                            dids = dids.join(",");
                            $.delete_item({ dids: dids }, "op_delete.ashx", $dt);
                        }
                    }, "-", {
                        text: "查询",
                        iconCls: "icon-search",
                        handler: function () {
                            $("body").layout("expand", "north");
                            $dt.datagrid("clearSelections");
                        }
                    },
                    "-"
                ],
                onLoadSuccess: function (data) {
                    //数据加载完成后，格式化数据单元格内的按钮
                    $(".art_view_btn").linkbutton({ plain: true, iconCls: 'icon-page' });
                    $(".art_edit_btn").linkbutton({ plain: true, iconCls: 'icon-pencil' });
                    $(".art_del_btn").linkbutton({ plain: true, iconCls: 'icon-delete' });
                    //数据单元格内的，按钮绑定事件
                    //修改
                    $(".art_edit_btn").click(function () {
                        var did = $(this).attr("did");
                        $.sr_edit_dialog("op_edit.aspx", { opid: did, title: "修改项目支持", form: "editForm" }, function (data) {
                            data = $.parseJSON(data);
                            if (data.status === 1) {
                                $.messager.show({ title: "提示", msg: data.msg, timeout: 2000 })

                            } else {
                                $.messager.alert("错误", data.msg, "error");
                            }
                        });
                    });
                    //删除
                    $(".art_del_btn").click(function () {                        
                        var dids = "0," + $(this).attr("did");
                        $.delete_item({dids:dids}, "op_delete.ashx",$dt);
                    });
                }
            });

        });
    </script>
</body>
</html>
