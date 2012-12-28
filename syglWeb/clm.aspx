<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Site.Master" AutoEventWireup="true" CodeBehind="clm.aspx.cs" Inherits="syglWeb.clm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="layout"> 
        <div class="chief fl"> 
            <div class="">
                <h1>
                    <asp:HyperLink ID="HyperLinkClmTitle" runat="server" CssClass="h1title"></asp:HyperLink>
                </h1>
                <ul>
                    <asp:Repeater ID="RepeaterList" runat="server" OnItemDataBound="RepeaterList_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <h4><asp:HyperLink ID="HyperLinkArtTitle" runat="server"></asp:HyperLink></h4>
                                <asp:Label ID="LabelArtIntro" runat="server" Text="" CssClass="l23"></asp:Label>
                                <asp:Label ID="LabelPostTime" runat="server" Text="" CssClass="time_sp l23"></asp:Label> 
                            </li> 
                        </ItemTemplate>
                    </asp:Repeater>
                     
                </ul>
                <div class="clearfix"></div>
                <div class="pager">
                    <asp:HyperLink ID="HyperLinkPrePage" runat="server"><<</asp:HyperLink>                     
                    <asp:Label ID="LabelPages" runat="server" Text=""></asp:Label>
                    <asp:HyperLink ID="HyperLinkNextPage" runat="server">>></asp:HyperLink>
                </div>
             </div>
        </div>
        <div class="extra fl">
            <h1><a href="#" class="h1title">最新发布</a></h1>
                <ul id="cg">
                    <asp:Repeater ID="RepeaterLatest" runat="server" OnItemDataBound="RepeaterLatest_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="HyperLinkLatestTitle" runat="server"></asp:HyperLink>
                                <asp:Label ID="LabelLatestPostTime" runat="server" Text=""></asp:Label>
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
