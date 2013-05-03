<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hd.ascx.cs" Inherits="syglWeb.slip_.hd" %>
<!--头部logo和导航菜单-->
<div class="ui-grid-row">
    <div class="ui-grid-8">
        <div id="logo">.</div>
    </div>
</div>
<div class="ui-grid-row">
    <div class="ui-grid-25">
        <div class="ui-nav ui-nav-nosub">
            <ul class="ui-nav-main">
                <li class="ui-nav-item ui-nav-item-current">
                    <a href="Default.aspx">首页</a>
                </li>
                <li class="ui-nav-item ">
                    <a href="ns.aspx">创新资讯</a>
                    <%--<ul class="ui-nav-submain">
                        <li class="ui-nav-subitem"><a href="#">二级导航 2-1</a></li>
                        <li class="ui-nav-subitem ui-nav-subitem-current"><a href="#">二级导航 2-2</a></li>
                        <li class="ui-nav-subitem"><a href="#">二级导航 2-3</a></li>
                        </ul>--%>
                </li>
                <li class="ui-nav-item">
                    <a href="pf.aspx">创新成果</a>
                </li>
                <li class="ui-nav-item"><a href="pm.aspx">项目管理</a></li>
                <li class="ui-nav-item"><a href="ps.aspx">项目支持</a></li>
                <li class="ui-nav-item"><a href="h.aspx">帮助中心</a></li>
            </ul>
            <div class="ui-nav-subcontainer"></div>
        </div>
    </div>
</div>
