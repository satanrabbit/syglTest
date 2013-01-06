<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ptm.aspx.cs" Inherits="syglWeb.Admin.pages.ptm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
	<div data-options="region:'north',title:'领导信息'" style="height:200px;background:#fefefe;padding:5px"> 
        <div id="panel_header"></div>       
    </div>
   	<div data-options="region:'center',title:'下属科室'">
    	<table id="art_tt" ></table>
    </div>
    <script type="text/javascript">
        $(function () {
            $.extend({
                //添加修改文章
                edit_art: function (title, href) {
                    $(".art_edit_dialog").dialog("destroy");
                    $("body").append('<div class="art_edit_dialog"></div>');
                    var $editDialog = $(".art_edit_dialog:first");
                    $editDialog.load(href, function () {
                        $editDialog.dialog({
                            title: title, maximizable: true, closable: true, modal: true, maximized: true, resizable: true,
                            top: 10, left: 10,
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
                                                $(".art_edit_dialog").dialog("close");
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
                                    $('.art_edit_dialog').dialog('close');
                                }
                            }]
                        });
                    });
                }
                 
            });
            /**初始化领导信息面板
            */
            var $leader_panel = $("#panel_header").panel({
                href: 'leader.aspx',
                maximized: true,
                border:false
            });

            /**
            *初始化文章列表
            */
            var $art_tt = $("#art_tt").datagrid({
                //title: "各科室",
                rownumbers: true,
                url: "getPtmList.ashx",
                queryParams: { clm: "<%= Request.QueryString["clm"]%>" },
                iconCls: "icon-wrench",
                pagination: true,
                pageSize: 15,
                pageList: [15, 20, 25, 30, 35, 40],
                fit: true,
                fitColumns: true,
                nowarp: false,//设置是否折行，false为折行
                border: true,//设置是否显示border
                idField: 'ptmID',//设置跨页选择的标识栏
                sortName: "ptmID",
                SortOrder: "asc",
                columns: [[
                     {
                        title: "科室",
                        field: "ptmName", sortable: true,
                        width: 480,
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            var pid = rowData.ptmID;
                            var html = '<a href="/Department.aspx#pmt' + pid +
                                '" target="_blank">' + value + '</a>';
                            return html;
                        }
                    }, {
                        title: "操作",
                        field: "_ptmID",
                        width: 220,
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            var pid = rowData.ptmID;                            
                            var html = '<a href="/Department.aspx#pmt' + pid +
                                '" class="art_view_btn" target="_blank">查看</a><a href="javascript:;" pid=' + pid +
                                ' class="art_edit_btn">修改</a> ';
                            return html;
                        }
                    }
                ]] , 
                onLoadSuccess: function (data) {
                    //数据加载完成后，格式化数据单元格内的按钮
                    $(".art_view_btn").linkbutton({ plain: true, iconCls: 'icon-page' });
                    $(".art_edit_btn").linkbutton({ plain: true, iconCls: 'icon-pencil' });
                    
                    //数据单元格内的，按钮绑定事件
                    //修改
                    $(".art_edit_btn").click(function () {
                        var aid = $(this).attr("pid");
                        $.edit_art("修改", 'ptmEdit.aspx?aid=' + aid);
                    }); 
                }
            });
            //绑定修改介绍事件
            $("#ptm_edit_intro").live("click", function () {
                $.edit_art("修改部门介绍", 'ptmIntroEdit.aspx');
            });
        });
    </script>
</body>
</html>
