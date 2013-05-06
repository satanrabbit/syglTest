<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="of.aspx.cs" Inherits="syglWeb.slip_.admin.of" %>

<!DOCTYPE html>
<!---旧的创新成果管理首页--->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
<body class="easyui-layout">
    <div region="center"   >
        <table id="of-datagrid" data-options="toolbar:'#op-toolbar'"></table>
	</div>    
    <div id="op-toolbar"  > 
        <table cellspacing="0" cellpadding="0"><tbody>
            <tr>
                <td> <a href="#" class="easyui-linkbutton" id="add-op-btn" data-options="iconCls:'icon-add',plain:'true'" title="添加"></a> 
                </td>
                <td><div class="datagrid-btn-separator"></div>
                </td>
                <td><a href="#" class="easyui-linkbutton" id="edit-op-btn" data-options="iconCls:'icon-edit',plain:'true'"  title="修改"></a> 
                </td>
                <td><div class="datagrid-btn-separator"></div>
                </td> 
                <td><a href="#" class="easyui-linkbutton" id="delete-op-btn" data-options="iconCls:'icon-delete',plain:'true'"  title="删除"></a> 
                </td>
                <td><div class="datagrid-btn-separator"></div>
                </td>
                <td> <a href="#" class="easyui-linkbutton" id="reload-op-btn" data-options="iconCls:'icon-reload',plain:'true'"  title="刷新"></a>
                </td><td><div class="datagrid-btn-separator"></div>
                </td>
                <td><span>分类筛选：</span> <input id="search-type" name="search-type" value="0"  /></td>
                <td><div class="datagrid-btn-separator"></div>
                </td><td>
                <a class="easyui-linkbutton" 
                    id="manage-oldType-btn" data-options="iconCls:'icon-page_edit',plain:'true'" href="javascript:void(0);">管理分类</a>
                </td>
            </tr></tbody>
        </table>
    </div>
    <script>
        $(function () {
            $.extend({
                delete_op: function (aids, href, dg) {
                    $.post(href, { ids: aids }, function (data) {
                        data = $.parseJSON(data);
                        if (data.status === 1) {
                            $.messager.show({ title: "删除成功！", msg: data.msg, timeout: 2000 });
                            dg.datagrid("reload");
                        } else {
                            $.messager.alert("错误", data.msg, "error");
                            dg.datagrid("reload");
                        }
                    });
                }
            });
            $ofdg = $('#of-datagrid');
            //初始化查询
            $('#search-type').combobox({
                url: 'otl.ashx?al=true',
                value:0,
                valueField: 'typeID', editable: false, width: 200,
                textField: 'typeName',
                onChange: function (newValue, oldValue) {
                    $ofdg.datagrid('load', {type:newValue})
                }
            });

            //管理旧的项目类型
            $("#manage-oldType-btn").click(function () {
                $(".manage-type-dialog").dialog("destroy").remove();
                $('body').first().append("<div class='manage-type-dialog'></div>");
                $('.manage-type-dialog').load("mot.aspx", function () {
                    $('.manage-type-dialog').dialog({
                        title: '项目类型管理', modal: true //,maximized:true
                    });
                });
                return false;
            });
            //初始化datagrid
            $ofdg.datagrid({
                url: 'opl.ashx', fitColumns: true, pagination: true, idField: "newsID", fit: true, fitColumns: true, iconCls: "icon-wrench",
                // title: '创新成果',
                columns: [[
                    { field: 'opID', title: '编号', align: 'center', width: 80, sortable: true, checkbox: true },
                    { field: 'opTitle', title: '项目名称', align: 'center' },
                    { field: 'opYear', title: '进行年度', align: 'center' },
                    { field: 'opLeader', title: '负责人', align: 'center' },
                    { field: 'opTypeName', title: '分类', align: 'center' },
                    {
                        title: "操作",
                        field: "_newsID",
                        width: 220,
                        align: 'center',
                        formatter: function (value, rowData, rowIndex) {
                            var aid = rowData.opID;
                            var html = '<a href="../opd.aspx?pid=' + aid +
                                '" class="art_view_btn" target="_blank">查看</a><a href="javascript:;" aid=' + aid +
                                ' class="art_edit_btn">修改</a><a href="javascript:;" aid=' + aid +
                                ' class="art_del_btn">删除</a>';
                            return html;
                        }
                    }
                ]],
                onClickRow: function (rowIndex, rowData) {

                },
                onDblClickRow: function (rowIndex, rowData) {

                },
                onBeforeLoad: function () {
                    $ofdg.datagrid("clearSelections");
                },
                onLoadSuccess: function (data) {
                    //
                    //数据加载完成后，格式化数据单元格内的按钮
                    $(".art_view_btn").linkbutton({ plain: true, iconCls: 'icon-page' });
                    $(".art_edit_btn").linkbutton({ plain: true, iconCls: 'icon-pencil' });
                    $(".art_del_btn").linkbutton({ plain: true, iconCls: 'icon-delete' });
                    //数据单元格内的，按钮绑定事件
                    //修改
                    $(".art_edit_btn").click(function () {
                        var eopid = $(this).attr("aid");
                        $.sr_edit_dialog("ep.aspx", { title: '修改项目', form: 'editOp', width: 500, maximized: true, maximizable: true, modal: true, opid: eopid }, function (data) {
                            data = $.parseJSON(data);
                            $ofdg.datagrid('reload');
                            if (data.stauts === 1) {
                                //成功，刷新datagrid，提醒
                                $.messager.show({ title: '添加成功', msg: data.msg, timeout: 2000 });
                            } else {
                                $.messager.alert('错误', data.msg, 'error');
                            }
                        });
                    });

                    //删除
                    $(".art_del_btn").click(function () {
                        var ids = "0," + $(this).attr("aid");
                        $.messager.confirm("提示", "删除操作将不可逆！<br />请确认！", function (b) {
                            if (b) {
                                $.delete_op(ids, "opdl.ashx", $ofdg);
                            }
                        });
                    });
                }
            });
            //添加项目
            $("#add-op-btn").click(function () { 
                $.sr_edit_dialog("ep.aspx", { title: '添加项目', form: 'editOp', width: 500, maximized: true, maximizable: true, modal: true }, function (data) {
                    data = $.parseJSON(data);                    
                    if (data.stauts === 1) {
                        //成功，刷新datagrid，提醒
                        $.messager.show({ title: '添加成功', msg: data.msg, timeout: 2000 });                        
                    } else {
                        $.messager.alert('错误', data.msg, 'error');
                    }
                    $ofdg.datagrid('reload');                    
                });
            });
            //修改项目
            $("#edit-op-btn").click(function () {
                var eopid = $ofdg.datagrid("getSelected").opID;
                $.sr_edit_dialog("ep.aspx", { title: '修改项目', form: 'editOp', width: 500, maximized: true, maximizable: true, modal: true,opid:eopid }, function (data) {
                    data = $.parseJSON(data);
                    $ofdg.datagrid('reload');
                    if (data.stauts === 1) {
                        //成功，刷新datagrid，提醒
                        $.messager.show({ title: '添加成功', msg: data.msg, timeout: 2000 });
                    } else {
                        $.messager.alert('错误', data.msg, 'error');
                    }
                });
            });
            //删除项目
            $("#delete-op-btn").click(function () {
                var rows = $ofdg.datagrid("getSelections");
                if (rows.length <= 0) {
                    return false;
                }
                $.messager.confirm("提示", "删除操作将不可逆！<br />请确认！", function (b) {
                    if (b) {
                        var ids = [];
                        $.each(rows, function (i, item) {
                            ids.push(item.opID);
                        });
                        ids = ids.join(",");
                        $.delete_op(ids, "opdl.ashx", $ofdg);
                    }
                });
            });
            //刷新
            $("#reload-op-btn").click(function () {
                $ofdg.datagrid("reload");
            }); 
            
        });
    </script>
</body>
</html>
