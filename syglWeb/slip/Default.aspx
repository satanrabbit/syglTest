<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="syglWeb.slip.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript" src="../Scripts/jquery.iFadeSlide.pack.js" ></script>
<script type="text/javascript">
    $(function () {
        $('div#slide').iFadeSlide();
    });
</script>
</asp:Content>

<asp:Content ID="ContentActive" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server">

<div class="grid left_side">
      <div id="slide"> <a href=''><img src="Sources/Pictures/1.jpg" alt='' width='602' height='2<h2>0</h2>0' /></a> <a href=''><img src='Sources/Pictures/2.jpg' alt='' width='602' height='220' /></a> <a href=''><img src='Sources/Pictures/3.jpg' alt='' width='602' height='220' /></a> <a href=''><img src='Sources/Pictures/4.jpg' alt='' width='602' height='220' /></a> <a href=''><img src='Sources/Pictures/5.jpg' alt='' width='602' height='220' /></a>
        <div class="ico"></div>
      </div>
      <div class="clear"></div>
      <div class="softs">
        <div class="tit tit_left">
          <h2><a href="/Slip/Projects/">创新成果</a></h2>
          <a class="more"  href="#">更多&gt;&gt;</a> </div>
        <div class="softs_detail">
            <asp:Repeater ID="RepeaterTopic" runat="server">
            <ItemTemplate>
                <dl class="clear">
                    <dt><a href="#"><img width="80" src="<%# Eval("topicLogoMini") %>" /></a></dt>
                    <dd>
                      <div class="grid info"> <a href="/slip/Projects/ProjectDetail.aspx?tid=<%# Eval("topicID") %>"><%# Eval("topicTitle") %></a> <span>项目负责人：<%# Eval("userName") %></span> </div>
                      <div class="reversegrid down"> <a  href="/slip/Projects/ProjectDetail.aspx?tid=<%# Eval("topicID") %>">详细&gt;&gt;</a> </div>
                    </dd>
                    <dd class="describe"><%# Eval("topicInfo") %></dd>
                  </dl>
            </ItemTemplate>
            </asp:Repeater>

          
        </div>
      </div>
    </div>
    <div class="grid right_side">
      <div class="grid mac_rightside">
        <div class="r_top"><span class="s_t_zj"></span> <span class="r_t_mid_right"></span> <span class="s_t_yj"></span> </div>
        <div class="r_mid_right">
          <div class="info_title"><a href="javascript:;">新闻资讯</a></div>
          <div class="info_content">
            <ul class="ui-sortable">
                <asp:Repeater ID="RepeaterNews" runat="server">
                <ItemTemplate>
                <li style="position: relative; left: 0px; top: 0px;"><s></s><a target="_blank"  href="NewsDetail.aspx?nid=<%# Eval("newsID") %>" class=""><%# Eval("newsTitle") %></a></li>
                </ItemTemplate>
                </asp:Repeater>
              
             </ul>
          </div>
        </div>
        <div class="r_bottom"> <span class="s_b_zj"></span> <span class="r_b_mid_right"></span> <span class="s_b_yj"></span> </div>
      </div>
      <div class="more_recommended">
		<div class="tit tit_right">
          	<h2><a href="/slip/Support/Defualt.aspx">项目支持</a></h2>
        </div>
        <div class="ul_support">
          <a  href="Support/SupportDetail.aspx?sid=1">经费支持</a>          
          <a  href="Support/SupportDetail.aspx?sid=2">条件保障</a>
          <a  href="Support/SupportDetail.aspx?sid=3">院系合作</a>
          <a  href="Support/SupportDetail.aspx?sid=4">校企联合</a>
          <a  href="Support/SupportDetail.aspx?sid=5">创新竞赛</a>
          <a  href="Support/SupportDetail.aspx?sid=6">创新训练基地</a>
        </div>
      </div>
       
      <div class="discuss">
        <div class="tit tit_right">
          <h2>创新论坛</h2>
        </div>
        <div class="discuss_box">
        	<ul>
            	<li><em class="hot">1</em><a  href="#">3屏幕产能不足 iPad mini未上市将缺货</a><p><a>111123人参与</a></p></li>
                <li><em class="hot">1</em><a  href="#">3屏幕产能不足 iPad mini未上市将缺货</a><p><a>23人参与</a></p></li>
                <li><em class="hot">1</em><a  href="#">3屏幕产能不足 iPad mini未上市将缺货</a><p><a>23人参与</a></p></li>
                <li><em>1</em><a  href="#">3屏幕产能不足 iPad mini未上市将缺货</a><p><a>23人参与</a></p></li>
                <li><em>1</em><a  href="#">3屏幕产能不足 iPad mini未上市将缺货</a><p><a>23人参与</a></p></li>
            </ul>
        </div>
      </div>
    </div>

</asp:Content>
