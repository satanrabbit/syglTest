<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="op.aspx.cs" Inherits="syglWeb.slip.op" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server">
    
<div class="tit tit_left">
          <h2><a href="#">创新成果</a></h2>
       </div>
    <div class="op-nav-wp">
        <ul>
            <li><a href="#"><i>2011</i>2011年创新成果</a></li>
             <li><a href="#"><i>2012</i>2012年创新成果</a></li>
             <li><a href="#"><i>2013</i>2013年创新成果</a></li>
        </ul>
    </div>
<div class="news_li_wp">
    <ul>
        <asp:Repeater ID="RepeaterNewsList" runat="server">
        <ItemTemplate>
        <li><a class="news_li_tl" href="opd.aspx?did=<%# Eval("opID") %>"><%# Eval("opTitle") %></a><span class="news_time_sp"><%# Eval("opYear") %></span></li>
        </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
    <!-- div class="pager">
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">7</a>
        <a href="#">8</a>
    </div !-->
</asp:Content>
