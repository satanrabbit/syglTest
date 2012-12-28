<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="syglWeb.slip.NewsDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server">

<div class="tit tit_left">
    <h2><a href="#">新闻资讯</a></h2>
</div>
<div class="art_dt_wp">
    <div class="art_dt_tl"><h2><asp:Label ID="LabelNewsTitle" runat="server" Text="新闻标题"></asp:Label></h2></div>
    
    <div class="art_dt_tl"><asp:Label ID="LabelNewsPostTime" runat="server" Text="时间"></asp:Label></div>
    <div class="art_dt_ct"><asp:Label ID="LabelNewsContent" runat="server" Text="内容"></asp:Label></div>
</div>
</asp:Content>
