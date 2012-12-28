<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="tpNotice.aspx.cs" Inherits="syglWeb.slip.tpNotice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server">

<div class="tit tit_left">
    <h2><a href="#">项目进度公告</a></h2>
</div>
<div class="art_dt_wp">
    <div class="art_dt_tl"><h2><asp:Label ID="LabelNoticeTitle" runat="server" Text="标题"></asp:Label></h2></div>
    
    <div class="art_dt_tl"><asp:Label ID="LabelNoticePostTime" runat="server" Text="时间"></asp:Label></div>
    <div class="art_dt_ct"><asp:Label ID="LabelNoticeContent" runat="server" Text="内容"></asp:Label></div>
    <div class="art_dt_ct">
        <asp:HyperLink ID="HyperLinkOpt" runat="server" CssClass="tp_opt"></asp:HyperLink>
    </div>

</div>



</asp:Content>
