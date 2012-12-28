<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="down.aspx.cs" Inherits="syglWeb.Admin.pages.down" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../style/base.css" rel="stylesheet" />
    <link href="../../Sourse/jquery_easyui/themes/metro/easyui.css" rel="stylesheet" />
    <link href="../../Sourse/jquery_easyui/themes/icon.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="../../Sourse/jquery_easyui/jquery.easyui.min.js" type="text/javascript"></script>    
    <script src="../../Sourse/jquery_easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <script src="../../Sourse/jquery_easyui/easyui_ex.js" type="text/javascript"></script>
</head>
    <body class="easyui-layout">
	<div data-options="region:'north',title:'查询',iconCls:'icon-search',collapsed:true" style="height:100px;background:#EFEFEF;padding:5px">         
    </div>
   	<div data-options="region:'center',border:false">
    	<table id="art_tt" ></table>
    </div>
    <script type="text/javascript">
        $(function () {
            $.extend({
                //添加修改文章
                edit_down: function (title, href) {
                    $(".edit_dialog").dialog("destroy");
                    $("body").append('<div class="edit_dialog"></div>');
                    var $editDialog = $(".edit_dialog:first");
                    $editDialog.load(href, function () {
                        $editDialog.dialog({
                            title: title, maximizable: true, closable: true, modal: true, resizable: true,
                            width:600,height:360,
                            //top: 10, left: 10,
                            buttons: [{
                                text: '保存',
                                iconCls: 'icon-disk',
                                handler: function () {
                                    $("#articleEditForm").form('submit', {
                                        url: $(this).attr('action'),
                                        onSubmit: function () {
                                            return $("#articleEditForm").form("validate");
                                        },
                                        success: function (data) {
                                            data = $.parseJSON(data);
                                            if (data.status == 0) {
                                                $.messager.alert("错误", data.msg, "error");
                                            } else {
                                                $(".edit_dialog").dialog("close");
                                                $.messager.show({ title: "保存成功", msg: data.msg, timeout: 2000 });
                                                $art_tt.datagrid("reload");
                                            }
                                        }
                                    });
                                }
                            }, {
                                text: '取消',
                                iconCls: 'icon-cancel',
                                handler: function () {
                                    $('.edit_dialog').dialog('close');
                                }
                            }]
                        });
                    });
                }
                //删除文章
                , delete_down: function (dids, href) {
                    $.post(href, { dids: dids }, function (data) {
                        data = $.parseJSON(data);
                        if (data.status == 0) {
                            $.messager.alert("错误", data.msg, "error");
                        } else {
                            $.messager.show({ title: "删除成功！", msg: data.msg, timeout: 2000 });
                            $art_tt.datagrid("reload");
                        }
                    });
                }
            });
            /**
            *初始化列表
            */
            var $art_tt = $("#art_tt").datagrid({
                //title: "",
                rownumbers: true,
                url: "getDownList.ashx",
                //queryParams: { clm: "<%= Request.QueryString["clm"]%>" },
                iconCls: "icon-wrench",
                pagination: true,
                pageSize: 15,
                pageList: [15, 20, 25, 30, 35, 40],
                fit: true,
                fitColumns: true,
                nowarp: false,//设置是否折行，false为折行
                border: true,//设置是否显示border
                idField: 'downID',//设置跨页选择的标识栏
                sortName: "downPostTime",
                SortOrder: "desc",
                columns: [[
                    {
                        title: "编号",
                        field: "downID",
                        width: 80,
                        sortable: true,
                        checkbox: true
                    }, {
                        title: "标题",
                        field: "downTitle", sortable: true,
                        width: 480,
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            //console.info(rowData);
                            var did = rowData.downID;
                            var html = '<a href="/down.aspx?did=' + did +
                                '" target="_blank">' + value + '</a>';
                            return html;
                        }
                    }, {
                        title: "发布日期",
                        field: "downPostTime", sortable: true,
                        width: 180,
                        align: 'center'
                    }, {
                        title: "操作",
                        field: "_articleID",
                        width: 220,
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            var did = rowData.downID;
                            var html = '<a href="' + rowData.downFile+
                                '" class="art_view_btn" target="_blank">下载</a><a href="javascript:;" did=' + did +
                                ' class="art_edit_btn">修改</a><a href="javascript:;" did=' + did +
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
                            $.edit_down("添加文档", 'down_edit.aspx');
                        }  
                    }, "-", {
                        text: "删除",
                        iconCls: "icon-delete",
                        handler: function () {
                            var rows = $("#art_tt").datagrid("getSelections");
                            if (rows.length <= 0) {
                                return false;
                            }
                            $.messager.confirm("提示", "将删除"+rows.length+"条记录！<br />操作将不可逆！<br />请确认！", function (b) {
                                if (b) {
                                    var dids = [];
                                    $.each(rows, function (i, item) {
                                        dids.push(item.downID);
                                    });
                                    dids = dids.join(",");
                                    $.delete_art(dids, "down_delete.ashx")
                                }
                            });
                        }
                    }, "-", {
                        text: "查询",
                        iconCls: "icon-search",
                        handler: function () {
                            $("body").layout("expand", "north");
                            $("#art_tt").datagrid("clearSelections");
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
                        var did = $(this).attr("did");
                        $.edit_down("修改文章", 'down_edit.aspx?did=' + did);
                    });

                    //删除
                    $(".art_del_btn").click(function () {
                        var b = confirm("删除操作将不可恢复！\n 请确认！");
                        if (b) {
                            var did = "0," + $(this).attr("did");
                            $.delete_down(did, "down_delete.ashx");
                        }
                    });
                }
            });

        });
    </script>
</body>
</html>
