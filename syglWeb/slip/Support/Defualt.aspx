<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="Defualt.aspx.cs" Inherits="syglWeb.slip.Suport.Defualt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server">
    <div class="support">
        <a href="SupportDetail.aspx?sid=1" class="support_link">经费支持</a>
        <a href="SupportDetail.aspx?sid=2" class="support_link">条件保障</a>
        <a href="SupportDetail.aspx?sid=3" class="support_link">院系合作</a>
        <a href="SupportDetail.aspx?sid=4" class="support_link">校企联合</a>
        <a href="SupportDetail.aspx?sid=5" class="support_link">创新竞赛</a>
        <a href="SupportDetail.aspx?sid=6" class="support_link">创新训练基地</a>
        <div class="clear"></div>
    </div>
</asp:Content>
