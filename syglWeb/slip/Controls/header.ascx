<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="syglWeb.slip.Controls.header" %>

<div id="top_link">
    <div id="top_link_box">天津科技大学 </div>
</div>
<div id="header">
    <div id="logo">.</div>
    <div id="sub_logo"></div>
    <div id="dock">联系</div>
    <div id="intro_dock">信息</div>

</div>
<div id="nav">
    <ul>
        <li>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/slip/">首页</asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Slip/news.aspx">创新资讯</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Slip/Projects/">创新成果</asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Slip/Support/Defualt.aspx">项目支持</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Slip/Profile/">项目管理</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Slip/Discuss/">创新论坛</asp:HyperLink></li>
        <li>
            <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Slip/news.aspx">关于</asp:HyperLink></li>
    </ul>
</div>
