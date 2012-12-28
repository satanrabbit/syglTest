<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Manager/Share/Manager.Master" AutoEventWireup="true" CodeBehind="Supports.aspx.cs" 
Inherits="syglWeb.slip.Manager.Supports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="mguider">
    <span>管理首页 >> 项目支持 </span>
</div>
 
<div class="mcontent">
    <ul class="mnews_ul">
    
        <li>
            <span class="mnews_titile"><a href="../Support/SupportDetail.aspx?sid=1" target="_blank">经费支持</a></span>
            <span class="mnews_time"> &emsp; </span>
            <span class="mnews_opt">
                <a href="EditSupport.aspx?sid=1" target="_self" class="mNews_btn" >修改</a>
            </span>
        </li>
         
        <li>
            <span class="mnews_titile"><a href="../Support/SupportDetail.aspx?sid=2" target="_blank">条件保障</a></span>
            <span class="mnews_time"> &emsp; </span>
            <span class="mnews_opt">
                <a href="EditSupport.aspx?sid=2" target="_self" class="mNews_btn" >修改</a>
            </span>
        </li>
        <li>
            <span class="mnews_titile"><a href="../Support/SupportDetail.aspx?sid=3" target="_blank">院系合作</a></span>
            <span class="mnews_time"> &emsp; </span>
            <span class="mnews_opt">
                <a href="EditSupport.aspx?sid=3" target="_self" class="mNews_btn" >修改</a>
            </span>
        </li>
        <li>
            <span class="mnews_titile"><a href="../Support/SupportDetail.aspx?sid=4" target="_blank">校企联合</a></span>
            <span class="mnews_time"> &emsp; </span>
            <span class="mnews_opt">
                <a href="EditSupport.aspx?sid=4" target="_self" class="mNews_btn" >修改</a>
            </span>
        </li>
        <li>
            <span class="mnews_titile"><a href="../Support/SupportDetail.aspx?sid=5" target="_blank">创新竞赛</a></span>
            <span class="mnews_time"> &emsp; </span>
            <span class="mnews_opt">
                <a href="EditSupport.aspx?sid=5" target="_self" class="mNews_btn" >修改</a>
            </span>
        </li>
        <li>
            <span class="mnews_titile"><a href="../Support/SupportDetail.aspx?sid=6" target="_blank">创新训练基地</a></span>
            <span class="mnews_time"> &emsp; </span>
            <span class="mnews_opt">
                <a href="EditSupport.aspx?sid=6" target="_self" class="mNews_btn" >修改</a>
            </span>
        </li>
   </ul> 
</div>
<div id="dialog_div" style=" display:none;"></div>


</asp:Content>
