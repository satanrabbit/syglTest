<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="syglWeb.slip.Projects.Defualt" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="ContentActive" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server">
    <div class="softs_detail">
        <asp:Repeater ID="RepeaterTopic" runat="server">
        <ItemTemplate>            
          <dl class="half_left">
            <dt><a href="#"><img alt="qq" width="80" src="<%# Eval("topicLogoMini") %>" /></a></dt>
            <dd>
                <div class="grid info"> <a href="#" style="display:block; margin:5px 0;"><%# Eval("topicTitle")%></a> 
                <span>结题日期</span><span>|</span>
                <span><%# Eval("userName")%></span> </div>
                <div class="reversegrid down"> <a  href="ProjectDetail.aspx?tid=<%#  Eval("topicID") %>">详细&gt;&gt;</a> </div>
            </dd>
            <dd class="describe">
                <%# Eval("topicInfo")%>
            </dd>
          </dl>
        </ItemTemplate>

        </asp:Repeater> 
        
    <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <div class="pager">
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">7</a>
        <a href="#">8</a>
    </div>
</asp:Content>
