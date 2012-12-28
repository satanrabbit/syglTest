<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="leader_edit.aspx.cs" Inherits="syglWeb.Admin.pages.leader_edit" %>

    <form id="formLeaderEdit" runat="server">
    <div>
    <table cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style=" line-height:1.6em;margin:5px auto;">
        <tbody>
            <tr>
                <td align="center" bgcolor="#FFFFFF" style="width:80px;">&nbsp;</td>
                <td align="center" bgcolor="#FFFFFF" style="width:80px;"></td>
                <td colspan="2" align="center" bgcolor="#FFFFFF" style="width:80px;">办公电话</td>
                <td  rowspan="7" align="center" bgcolor="#FFFFFF" style="width:120px;">
                    <a href="javascript:;" id="edit_header_save_btn" class="easyui-linkbutton" data-options="iconCls:'icon-disk'">保存</a>
                </td>
            </tr>
             <tr>
                <td rowspan="3" align="center" bgcolor="#FFFFFF" style="width:80px;">处长</td>
                <td rowspan="3" align="center" bgcolor="#FFFFFF" style="width:80px;">
                    <asp:TextBox ID="TextBoxHeader" runat="server" Width="100px"></asp:TextBox>
                     
                </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#FFFFFF" style="width:80px;">河西</td>
                <td align="center" bgcolor="#FFFFFF" style="width:180px;">
                    <asp:TextBox ID="TextBoxHHexiTele" runat="server" Width="120px"></asp:TextBox>
                 </td>
            </tr>
             <tr>
               <td align="center" bgcolor="#FFFFFF" style="width:80px;">泰达</td>
               <td align="center" bgcolor="#FFFFFF" style="width:180px;">
                   <asp:TextBox ID="TextBoxHTedaTele" runat="server" Width="120px"></asp:TextBox>
                 </td>
             </tr>
             <tr>
               <td colspan="4" align="center" bgcolor="#FFFFFF" style="width:80px;">&nbsp;</td>
             </tr>
             <tr>
               <td rowspan="2" align="center" bgcolor="#FFFFFF" style="width:80px;">副处长</td>
               <td rowspan="2" align="center" bgcolor="#FFFFFF" style="width:80px;">
                   <asp:TextBox ID="TextBoxSubHeader" runat="server" Width="80px"></asp:TextBox>
                 </td>
               <td align="center" bgcolor="#FFFFFF" style="width:80px;">河西</td>
               <td align="center" bgcolor="#FFFFFF" style="width:180px;">
                   <asp:TextBox ID="TextBoxShHexiTele" runat="server" Width="120px"></asp:TextBox>
                 </td>
             </tr>
             <tr>
               <td align="center" bgcolor="#FFFFFF" style="width:80px;">泰达</td>
               <td align="center" bgcolor="#FFFFFF" style="width:180px;">
                   <asp:TextBox ID="TextBoxShTedaTele" runat="server" Width="120px"></asp:TextBox>
                 </td>
             </tr>
        </tbody>
    </table>
    </div>
    </form> 
<script type="text/javascript">
    $(function () {
        $("#edit_header_save_btn").click(function () {
            $("#formLeaderEdit").form('submit', {
                url: $(this).attr('action'),
                onSubmit: function () {
                    //return $("#articleEditForm").form("validate");
                },
                success: function (data) {
                    data = $.parseJSON(data);
                    if (data.status == 0) {
                        $.messager.alert("错误", data.msg, "error");
                    } else {
                        $("#panel_header").panel({
                            href: 'leader.aspx'
                        });
                        $("#panel_header").panel("refresh");
                        $.messager.show({ title: "保存成功", msg: data.msg, timeout: 2000 });
                        
                    }
                }
            });
        });
    });
</script>
