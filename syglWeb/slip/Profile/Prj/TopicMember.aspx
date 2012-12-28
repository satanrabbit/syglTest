<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/NestedMasterPageProfile.master" AutoEventWireup="true" CodeBehind="TopicMember.aspx.cs" Inherits="syglWeb.slip.Profile.Prj.TopicMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderProflie" runat="server">

<div class="pro_right">
    <div class="pf_prj_titile">
        <h3> 
            <asp:HyperLink ID="HyperLinkTopic" runat="server"></asp:HyperLink>   
        &emsp;成员管理 <asp:HiddenField
                ID="HiddenFieldTopicID"  runat="server" />
        </h3>
       
    </div>
    <div class="pf_prj_items">
               <table class="odr_bigtable">	                
	                <tbody>
                    <tr>
                            <td colspan="2">
                                <asp:HyperLink ID="HyperLinkAddMb" runat="server">添加成员</asp:HyperLink> 
                            </td>
		                </tr>
                        <tr>
                            <td  colspan="2" > 
                                    <asp:Repeater ID="RepeaterProjMem" runat="server" 
                                        onitemdatabound="RepeaterProjMem_ItemDataBound" >
                                        <ItemTemplate>
                                            <table width="100%" class="mb_item" > 
                                                <tr>
                                                    <td><%# Eval("topicMbName") %></td>
                                                    <td>
                                                        <%# Eval("topicMbPst") %>
                                                        (<asp:Label ID="LabelIdentity" runat="server" Text=""></asp:Label>)
                                                    </td>
                                                    <td>学院(部门)：<%# Eval("topicMbCollege") %></td>
                                                    <td>专业方向：<%# Eval("topicMbMajor") %></td></tr>
                                                <tr>
                                                    <td>项目分工</td>
                                                    <td colspan="2"><%# Eval("topicMbWork") %></td>
                                                    <td>
                                                        <asp:HyperLink ID="HyperLinkEditMb" runat="server">修改</asp:HyperLink>
                                                        <a class="delete_mb" href="javascript:;" mb_id="<%# Eval("topicMbID") %>" >删除</a></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:Repeater>
                            </td>
		                </tr>
	                </tbody>
                </table>
        </div>
    
   </div>
   
   <script type="text/javascript">
       $(function () {
           $(".delete_mb").click(function () {
               var o = $(this);
               var mbID = $(this).attr("mb_id");
               $.post("DeleteMb.ashx", { mbid: mbID }, function (data) {
                   data = $.parseJSON(data);
                   if (data.status == 0) {
                       //设置提示！
                       o.parent().parent().parent().remove();
                   }
                   else {
                       alert(data.msg);
                   }
               });
           });
       });
   </script>
</asp:Content>
