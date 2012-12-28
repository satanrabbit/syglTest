<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="leader.aspx.cs" Inherits="syglWeb.Admin.pages.leader" %>

    <form id="formLeader" runat="server">
    <div>
    <table cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" style=" line-height:1.6em;margin:5px auto;">
        <tbody>
            <tr>
                <td align="center" bgcolor="#FFFFFF" style="width:80px;">&nbsp;</td>
                <td align="center" bgcolor="#FFFFFF" style="width:80px;"></td>
                <td colspan="2" align="center" bgcolor="#FFFFFF" style="width:80px;">办公电话</td>
                <td  rowspan="6" align="center" bgcolor="#FFFFFF" style="width:120px;">
                    <a href="javascript:;" id="edit_header_btn" class="easyui-linkbutton" data-options="iconCls:'icon-pencil'">修改</a></td>
                <td align="center" bgcolor="#FFFFFF" style="width:120px;">部门介绍</td>
            </tr>
             <tr>
               <td rowspan="2" align="center" bgcolor="#FFFFFF" style="width:80px;">处长</td>
               <td rowspan="2" align="center" bgcolor="#FFFFFF" style="width:80px;">
                   <asp:label runat="server" text="处长" id="header"></asp:label>
                </td>
                <td align="center" bgcolor="#FFFFFF" style="width:80px;">河西</td>
                <td align="center" bgcolor="#FFFFFF" style="width:180px;">
                    <asp:Label ID="hHexiTele" runat="server" Text="河西电话"></asp:Label>
                 </td>
                <td  rowspan="5" align="center" bgcolor="#FFFFFF" style="width:120px;">
                    <p><a href="/Department.aspx#" target="_blank" id="ptm_view_intro" class="easyui-linkbutton" data-options="iconCls:'icon-page'">查看介绍</a></p>
                    <p><a href="javascript:;" id="ptm_edit_intro" class="easyui-linkbutton" data-options="iconCls:'icon-pencil_green'">修改介绍</a></p></td>
            </tr>
             <tr>
               <td align="center" bgcolor="#FFFFFF" style="width:80px;">泰达</td>
               <td align="center" bgcolor="#FFFFFF" style="width:180px;">
                   <asp:Label ID="hTedaTele" runat="server" Text="泰达电话"></asp:Label>
                 </td>
             </tr>
             <tr>
               <td colspan="4" align="center" bgcolor="#FFFFFF" style="width:80px;">&nbsp;</td>
             </tr>
             <tr>
               <td rowspan="2" align="center" bgcolor="#FFFFFF" style="width:80px;">副处长</td>
               <td rowspan="2" align="center" bgcolor="#FFFFFF" style="width:80px;">
                   <asp:Label ID="subHeader" runat="server" Text="副处长"></asp:Label>
                 </td>
               <td align="center" bgcolor="#FFFFFF" style="width:80px;">河西</td>
               <td align="center" bgcolor="#FFFFFF" style="width:180px;">
                   <asp:Label ID="shHexiTele" runat="server" Text="河西电话"></asp:Label>
                 </td>
             </tr>
             <tr>
               <td align="center" bgcolor="#FFFFFF" style="width:80px;">泰达</td>
               <td align="center" bgcolor="#FFFFFF" style="width:180px;">
                   <asp:Label ID="shTedaTele" runat="server" Text="泰达电话"></asp:Label>
                 </td>
             </tr>
        </tbody>
    </table>
    </div>
    </form> 
<script type="text/javascript">
    $(function () {
        $("#edit_header_btn").click(function () {             
            $("#panel_header").panel({
                href: 'leader_edit.aspx'
            });
            $("#panel_header").panel("refresh");
        });
        
    });
</script>
