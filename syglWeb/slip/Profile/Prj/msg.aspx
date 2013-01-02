<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/NestedMasterPageProfile.master" AutoEventWireup="true" CodeBehind="msg.aspx.cs" Inherits="syglWeb.slip.Profile.Prj.msg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderProflie" runat="server">

   <div class="pro_right">
    <div class="pf_prj_titile">
        <h3> 
              
        &emsp;<a href="msg.aspx">消息中心</a> &emsp; . &emsp;<asp:Label ID="MsgTypeName"  runat="server"></asp:Label>
        </h3>
       
    </div>
       <div class="msg_wp">
           <ul style="line-height:2em;margin:15px 0;">
               <asp:Repeater ID="RepeaterMsg" runat="server" OnItemDataBound="RepeaterMsg_ItemDataBound">
                    <ItemTemplate>
                        <li style="border-bottom:#778 1px dashed;padding:3px 0;overflow:auto ;zoom:1;">
                            <div style="float:left;">[<asp:HyperLink ID="HyperLinkMsgType" runat="server"></asp:HyperLink>]&emsp;</div>
                            <h6 style="font-weight:400; float:left;"><a href="msgd.aspx?m=<%# Eval("msgID") %>"><%# Eval("msgTitle")%></a></h6>
                            <a style="float:right;" mid="<%# Eval("msgID") %>" class="easyui-linkbutton msg_delete_btn" data-options="iconCls:'icon-delete'">删除</a>
                        </li>
                    </ItemTemplate>
               </asp:Repeater>
           </ul>
           <div class="pager">
                <asp:HyperLink ID="HyperLinkPrePage" runat="server"><<</asp:HyperLink>                     
                <asp:Label ID="LabelPages" runat="server" Text=""></asp:Label>
                <asp:HyperLink ID="HyperLinkNextPage" runat="server">>></asp:HyperLink>
            </div>
       </div>
    
   </div>
   
   <script type="text/javascript">
       $(function () {
           $(".msg_delete_btn").click(function () {
               var o = $(this);
               var mID = $(this).attr("mid");
               $.post("msgDelete.ashx", { mid: mID }, function (data) {
                   data = $.parseJSON(data);
                   if (data.status == 1) {
                       //设置提示！
                       o.parent().remove();
                       $.messager.show({title:"提示",msg:data.msg,timeout:2000});
                   }
                   else {
                       $.messager.alert("错误",data.msg,"error");
                   }
               });
           });
       });
   </script>

</asp:Content>
