<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mot.aspx.cs" Inherits="syglWeb.slip_.admin.mot" %>
 <!-- 管理旧的项目类型 --> 
    <div id="oldType-datagrid" data-options="toolbar:'#ot-type-toolbar'">
    
    </div>
<div id="ot-type-toolbar" style="height:auto"> 
            <table cellspacing="0" cellpadding="0"><tbody>
                <tr>
                    <td> <a href="#" class="easyui-linkbutton" id="add-type-btn" data-options="iconCls:'icon-add',plain:'true'" title="添加"></a> 
                    </td>
                    <td><div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="#" class="easyui-linkbutton" id="edit-type-btn" data-options="iconCls:'icon-edit',plain:'true'"  title="修改"></a> 
                    </td>
                    <td><div class="datagrid-btn-separator"></div>
                    </td>
                    <td> <a href="#" class="easyui-linkbutton" id="save-type-btn" data-options="iconCls:'icon-save',plain:'true'"  title="保存"></a> 
                    </td>
                    <td><div class="datagrid-btn-separator"></div>
                    </td>
                    <td><a href="#" class="easyui-linkbutton" id="delete-type-btn" data-options="iconCls:'icon-delete',plain:'true'"  title="删除"></a> 
                    </td>
                    <td><div class="datagrid-btn-separator"></div>
                    </td>
                    <td> <a href="#" class="easyui-linkbutton" id="reload-type-btn" data-options="iconCls:'icon-reload',plain:'true'"  title="刷新"></a>
                    </td>
                </tr></tbody></table
    </div>  
<script type="text/javascript">
    $(function () {
        $.extend({
            delete_ot: function (aids, href, dg) {
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
        $.parser.parse();
        var $typedg = $("#oldType-datagrid");
        var editRow = undefined;
        var nextEditRow = -2;
        $typedg.datagrid({
            url: 'otl.ashx',
            width: 430,
            top: 30,
            columns: [[
                {
                    field: 'typeID', title: '编号', width: 100, align: 'center'//, hidden: true
                },
                {
                    field: 'typeName', title: '类型名称', width: 200, align: 'center', editor: {
                        type: 'validatebox', options: {
                            required: true
                        }
                    }
                },
                {
                    field: 'typeIndex', title: '顺序', width: 100, align: 'center', editor: {
                        type: 'numberbox', options: {
                            required: true
                        }
                    }
                }
            ]],
            onDblClickRow: function (rowIndex, rowData) {
                if (editRow != undefined) {
                    nextEditRow = rowIndex;
                    $typedg.datagrid('endEdit', editRow);
                } else {
                    $typedg.datagrid('beginEdit', rowIndex);
                    editRow = rowIndex;
                }
                $typedg.datagrid('unselectAll');
            }
            , onAfterEdit: function (rowIndex, rowData, changes) {
                if (editRow != undefined) {
                    $.post("saveot.ashx", rowData, function (data) {
                        data = $.parseJSON(data);
                        if (data.status === 1) {
                            //保存成功
                            $.messager.show({ title: '保存成功', msg: data.msg, timeout: 2000 });
                            //更新
                            rowData.typeID = data.typeID;
                            $typedg.datagrid("updateRow", { index: rowIndex, row: rowData });
                            //判断保存完成后的下一步活动
                            switch (nextEditRow) {
                                case -2:
                                    editRow = undefined;
                                    break;
                                case -1:
                                    $typedg.datagrid('insertRow', { index: 0, row: { typeIndex: 0 } });
                                    $typedg.datagrid('beginEdit', 0); editRow = 0;
                                    break;
                                default:
                                    $typedg.datagrid('beginEdit', nextEditRow);
                                    editRow = nextEditRow;
                                    break;
                            }
                            nextEditRow = -2;

                        } else {
                            $.messager.alert("错误", data.msg, "error", function () {
                                $typedg.datagrid('load');
                                editRow = undefined;
                            });
                        }
                    });
                }
                $typedg.datagrid('unselectAll');
            }
        });
        $("#add-type-btn").click( 
            function () {
                if (editRow != undefined) {
                    nextEditRow = -1;
                    $typedg.datagrid('endEdit', editRow);
                }else{
                    $typedg.datagrid('insertRow', { index: 0, row: { typeIndex: 0 } });
                    $typedg.datagrid('beginEdit', 0); editRow = 0;
                }
                $typedg.datagrid('unselectAll');
            });
        $("#edit-type-btn").click(function () {
            nextEditRow = $typedg.datagrid('getRowIndex', $typedg.datagrid("getSelected"));
            if (editRow != undefined) { 
                $typedg.datagrid('endEdit', editRow);
            } else {
                $typedg.datagrid('beginEdit', nextEditRow);
                editRow = nextEditRow;
                nextEditRow = -2;
            }
            $typedg.datagrid('unselectAll');
        });
        $("#save-type-btn").click(function () {
            nextEditRow = -2;
            $typedg.datagrid('endEdit', editRow);
            $typedg.datagrid('unselectAll');
        });
        $("#reload-type-btn").click(function () {
            $typedg.datagrid('reload');
            editRow = undefined;
            $typedg.datagrid('unselectAll');
        });
        $("#delete-type-btn").click(function () {
            var rows = $typedg.datagrid("getSelections");
            if (rows.length <= 0) {
                return false;
            }
            $.messager.confirm("提示", "删除操作将不可逆！<br />请确认！", function (b) {
                if (b) {
                    var ids = [];
                    $.each(rows, function (i, item) {
                        ids.push(item.typeID);
                    });
                    ids = ids.join(",");
                    $.delete_ot(ids, "otdel.ashx", $typedg);
                }
            });
        });
    });
</script>
