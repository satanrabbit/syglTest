<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Site.Master" AutoEventWireup="true" CodeBehind="Down.aspx.cs" Inherits="syglWeb.Down" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="layout">
        <!--文章内容-->
        <div class="chief fl">
            <h1>
                <asp:HyperLink ID="HyperLinkDownTitle" runat="server" CssClass="h1title">文档下载</asp:HyperLink>
            </h1>
            <h4 class="artcleTitle">
                <asp:Label ID="LabelDownTitle" runat="server" Text=""></asp:Label>
            </h4>
            <div class="artcleInfo">
               
                <asp:Label ID="LabelDownPostTime" runat="server" Text=""></asp:Label>
            </div>
            <asp:Panel ID="Panel1" runat="server" CssClass="artcleIntro">
                <p>
                    <asp:Label ID="LabelDownIntro" runat="server" Text=""></asp:Label></p>
            </asp:Panel>

            <div class="artcleContent_wp">
               附件下载： <asp:HyperLink ID="HyperLinkDownFile" runat="server" Target="_blank"></asp:HyperLink>
            </div>
        </div>
        <div class="extra fl">
            <h1><a href="#" class="h1title">最新发布</a><a href="#" class="h1more">更多</a></h1>
            <ul id="cg">
                <asp:Repeater ID="RepeaterLatest" runat="server" OnItemDataBound="RepeaterLatest_ItemDataBound">
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink ID="HyperLinkLatestTitle" runat="server"></asp:HyperLink>
                            <asp:Label ID="LabelLatestPostTime" runat="server" CssClass="time_sp l23" Text=""></asp:Label>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>

            </ul>
            <h1><a href="#" class="h1title">机构设置</a><a href="#" class="h1more">更多</a></h1>
           <ul id="ptm">   
                    <li id="pmt1"><a href="Department.aspx#pmt1">实验室管理科 </a></li> 
                    <li id="pmt2"><a href="Department.aspx#pmt2">供应科</a></li> 
                    <li id="pmt3"><a href="Department.aspx#pmt3">物资设备管理科</a></li> 
                    <li id="pmt4"><a href="Department.aspx#pmt4">规划建设科</a></li>
                    <li id="pmt5"><a href="Department.aspx#pmt5">计算中心</a> </li>  
                    <li id="pmt6"><a href="Department.aspx#pmt6">现代教育技术中心</a></li>  
                    <li id="pmt7"><a href="Department.aspx#pmt7">现代分析技术研究中心</a></li>
                </ul>
        </div>
    </div>



</asp:Content>
