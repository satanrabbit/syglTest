<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="SupportDetail.aspx.cs" Inherits="syglWeb.slip.Support.SupportDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server"><div class="tit tit_left">
    <h2><a href="#">项目支持</a></h2>
</div>
<div class="art_dt_wp">
    <div class="art_dt_tl"><h2><asp:Label ID="LabelNewsTitle" runat="server" Text="标题"></asp:Label></h2></div>
    <div class="art_dt_ct"><asp:Label ID="LabelNewsContent" runat="server" Text="内容"></asp:Label></div>
</div>

</asp:Content>
