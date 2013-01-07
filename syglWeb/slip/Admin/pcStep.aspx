<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pcStep.aspx.cs" Inherits="syglWeb.slip.Admin.pcStep" %>

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
</head> 
<body class="easyui-layout">
	 
   	<div data-options="region:'center',border:false">
    	<table id="dt" ></table>
    </div>
    <script type="text/javascript">
        $(function () {
            /**
           *初始化列表
           */
            var $art_tt = $("#dt").datagrid({
                title: "2012年项目进度管理",
                //rownumbers: true,
                url: "pcStep_list.ashx",
                queryParams: { pc: "<%=Request.Params["did"] %>" },
                iconCls: "icon-wrench",
               // pagination: true,
               // pageSize: 15,
                //pageList: [15, 20, 25, 30, 35, 40],
                fit: true,
                fitColumns: true,
                nowarp: false,//设置是否折行，false为折行
                border: true,//设置是否显示border
                idField: 'tpID',//设置跨页选择的标识栏
                sortName: "tpID",
                sortOrder: "desc",
                columns: [[
                    {
                        title: "进度编号",
                        field: "tpIndex",
                        width: 60,
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {                            
                            return value+1;
                        }
                        //sortable: true,
                        //checkbox: true
                    }, {
                        title: "进度",
                        field: "tp", //sortable: true,
                        width: 80,
                        align: 'center'
                    }, {
                        title: "进度公告",
                        field: "tpName", //sortable: true,
                        width: 200,
                        align: 'center'
                    }, {
                        title: "开始时间",
                        field: "tpStartTime",// sortable: true,
                        width: 100,
                        align: 'center'
                    }, {
                        title: "结束时间",
                        field: "tpEndTime",// sortable: true, tpPostTime
                        width: 100,
                        align: 'center'
                    }, {
                        title: "发布时间",
                        field: "tpPostTime",// sortable: true, 
                        width: 120,
                        align: 'center'
                    }, {
                        title: "操作",
                        field: "tpID",
                        width: 220,
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            var did = rowData.tpID;
                            
                            var txt;
                            var icon;
                            if (did == "") {
                                txt = "开启";
                                icon = "icon-pencil";
                            } else {
                                txt = "修改";
                                icon = "icon-pencil_green"
                            }
                            var html = '<a href="javascript:;" tp="' + rowData.tp + '"  sw="' + rowData.open + '" tp_index="' + rowData.tpIndex + '" for_cp="' + rowData.forCp + '" class="art_edit_btn" data-options="iconCls: \'' + icon + '\'">' + txt
                                + '</a><a href="/slip/NewsDetail.aspx?nid=' + did +
                                '" class="art_view_btn" target="_self">查看</a>';
                            return html;
                        }
                    }
                ]],//
                toolbar: [
                    {
                        text: '<a href="pc.aspx" id="back_pc" target="_self">返回</a>',
                        iconCls: "icon-back",
                        handler: function () {                            
                        }
                    //}, "-", {
                    //    text: "删除",
                    //    iconCls: "icon-delete",
                    //    handler: function () {
                    //        var rows = $("#art_tt").datagrid("getSelections");
                    //        if (rows.length <= 0) {
                    //            return false;
                    //        }
                    //        $.messager.confirm("提示", "将删除" + rows.length + "条记录！<br />操作将不可逆！<br />请确认！", function (b) {
                    //            if (b) {
                    //                var dids = [];
                    //                $.each(rows, function (i, item) {
                    //                    dids.push(item.downID);
                    //                });
                    //                dids = dids.join(",");
                    //                $.delete_art(dids, "down_delete.ashx")
                    //            }
                    //        });
                    //    }
                    //}, "-", {
                    //    text: "查询",
                    //    iconCls: "icon-search",
                    //    handler: function () {
                    //        $("body").layout("expand", "north");
                    //        $("#art_tt").datagrid("clearSelections");
                    //    }
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
                    $(".art_edit_btn").linkbutton({ plain: true});
                    //$(".art_del_btn").linkbutton({ plain: true, iconCls: 'icon-delete' });
                    //数据单元格内的，按钮绑定事件
                    //修改
                    $(".art_edit_btn").click(function () {
                        var open = $(this).attr("sw");
                       // var did = $(this).attr("did");
                        var tx = $(this).text() + $(this).attr("tp");
                        var tpIndex = $(this).attr("tp_index");
                        var forCp = $(this).attr("for_cp");
                        if (open==0) {
                            $.messager.alert("不可开启", "上一进度未开启，当前进度不可开启！", "warning");
                        } else {
                            
                            $.sr_edit_dialog("tpStep_edit.aspx", { tpIndex:tpIndex,forCp:forCp, title: tx + "进度", form: "newsEditForm" }, function (data) {
                                data = $.parseJSON(data);
                                if (data.status === 1) {
                                    $.messager.show({ title: "提示", msg: data.msg, timeout: 2000 })
                                    $art_tt.datagrid("load");
                                } else {
                                    $.messager.alert("错误", data.msg, "error");
                                }
                            });
                        }
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
