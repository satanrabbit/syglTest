<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/NestedMasterPageProfile.master" AutoEventWireup="true" CodeBehind="msgd.aspx.cs" Inherits="syglWeb.slip.Profile.Prj.msgd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderProflie" runat="server">
    
   <div class="pro_right">
    <div class="pf_prj_titile">
        <h3> 
        &emsp;消息中心   . &emsp;<asp:Label ID="MsgTypeName"  runat="server"></asp:Label>
        </h3>
       
    </div>
       <div class="msg_wp">
            <div style="margin:4px 0;">
                <h5><asp:Label ID="MsgTitle" runat="server" Text=""></asp:Label></h5>                
            </div>
           <div style="margin:15px 0; padding:10px;line-height:2em;  border:1px solid #0094ff;">
               <p><asp:Label ID="MsgContent" runat="server" Text=""></asp:Label></p>
           </div>
           <div style="margin:5px 0;">
               <a class="easyui-linkbutton msg_delete_btn" mid="<%= Request.QueryString["m"] %>" data-options="iconCls:'icon-delete'">删除</a>
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
                       $.messager.alert("错误", data.msg, "info", function () {
                          window.location.href= window.history.back(-1);
                       });
                   }
                   else {
                       $.messager.alert("错误", data.msg, "error");
                   }
               });
           });
       });
   </script>
</asp:Content>
