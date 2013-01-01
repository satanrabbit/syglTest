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
               <a class="easyui-linkbutton" data-options="iconCls:'icon-delete'">删除</a>
           </div>
       </div>
    
   </div>

</asp:Content>
