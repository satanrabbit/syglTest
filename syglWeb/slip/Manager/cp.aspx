<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Manager/Share/Manager.Master" AutoEventWireup="true" CodeBehind="cp.aspx.cs" Inherits="syglWeb.slip.Manager.tp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="mguider">
    <span>管理首页 >> 项目进度 </span>
</div>
<div class="mcontent">
    <ul class="mnews_ul">
    
    <li><span class="mnews_opt"> <a  href="ecp.aspx" class="mNews_btn" target="_self" >开启新项目</a></span></li>     
        <asp:Repeater ID="RepeaterCp" runat="server" DataSourceID="AccessDataSourceCP">
        <ItemTemplate>
            <li>
                <span class="mtp_name"><a href="" target="_blank"><%# Eval("cpName")%></a></span>
                <span class="mtp_year"><%# Eval("cpYear")%>年度</span>
                <span class="mtp_time"><%# ((DateTime)Eval("cpStartTime")).ToLongDateString()%> 至 <%# ((DateTime)Eval("cpEndTime")).ToLongDateString()%></span>
                <span class="mtp_opt">
                    <a href="cpm.aspx?cpid=<%# Eval("cpID") %>" target="_self" class="mNews_btn delete_tp" >进度管理</a>
                    <a href="ecp.aspx?cpid=<%# Eval("cpID") %>" target="_self" class="mNews_btn" >修改</a>                    
                    <a href="javascript:;" tpid="<%# Eval("cpID") %>" target="_self" class="mNews_btn delete_tp" >删除</a>
                </span>
            </li>
        </ItemTemplate>
        </asp:Repeater>
        <asp:AccessDataSource ID="AccessDataSourceCP" runat="server" 
            DataFile="~/App_Data/slipDB.mdb" 
            SelectCommand="SELECT [cpID], [cpName], [cpYear], [cpStartTime], [cpEndTime], [cpPostTime] FROM [cpTB] ORDER BY [cpYear] DESC, [cpPostTime] DESC, [cpStartTime] DESC">
        </asp:AccessDataSource>
   </ul> 

</div>
<div id="dialog_div" style=" display:none;"></div>

</asp:Content>
