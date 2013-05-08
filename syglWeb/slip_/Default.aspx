<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="syglWeb.slip_.Default" %>

<%@ Register Src="~/slip_/hd.ascx" TagPrefix="uc1" TagName="hd" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>创新平台-天津科技大学</title>
    <link type="text/css" href="css/iFadeSlide.css" rel="stylesheet" />
    <link href="source/Alice/one-full.css" rel="stylesheet" />
    <link href="source/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="source/easyui/themes/icon.css" rel="stylesheet" />
    <link href="css/slip.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/jquery.iFadeSlide.pack.js"></script>
    <script src="source/easyui/jquery.easyui.min.js"></script>
    <script src="source/easyui/locale/easyui-lang-zh_CN.js"></script>
<%--    <script src="source/easyui/easyui_ex.js"></script>--%>
    <script src="source/easyui/jquery_easyUI_dialog_form.js"></script>
</head>
<body>
    <div class="wrapper">
        <uc1:hd runat="server" id="hd" />
        <div class="ui-grid-row">            
            <div class="ui-grid-16">                
                <div id="slide">
                    <a href=''><img src="file/1.jpg" alt='' width='602' height='200' /></a> 
                    <a href=''><img src='file/2.jpg' alt='' width='602' height='220' /></a> 
                    <a href=''><img src='file/3.jpg' alt='' width='602' height='220' /></a> 
                    <a href=''><img src='file/4.jpg' alt='' width='602' height='220' /></a> 
                    <a href=''><img src='file/5.jpg' alt='' width='602' height='220' /></a>
                    <div class="ico"></div>
                </div>
            </div> 
            <div class="ui-grid-9">
                <div class="ui-box">
                    <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">新闻资讯</h3>
                            <%--<span class="ui-box-head-text">其他文字</span>--%>
                            <a href="ns.aspx" class="ui-box-head-more">更多</a>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <ul class="ui-list ui-list-graylink"> 
                                    <asp:Repeater runat="server" ID="newsRepeate">
                                        <ItemTemplate>
                                            <li class="ui-list-item"><a href="n.aspx?n=<%#Eval("newsID") %>"><%#Eval("newsTitle") %></a></li>
                                        </ItemTemplate>
                                    </asp:Repeater> 
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui-grid-row">
            <div class="ui-grid-16">
                <div class="ui-box ui-box-light">
                    <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">创新成果</h3> 
                            <a href="pf.aspx" class="ui-box-head-more">更多</a>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <table class="ui-table ">
                                    <tbody>
                                        <asp:Repeater ID="OpsRepeater" runat="server" OnItemDataBound="OpsRepeater_ItemDataBound">
                                            <ItemTemplate>
                                               <tr>          
                                                    <td width="120"> 
                                                        <asp:Image ID="opImage" runat="server" ImageUrl="~/slip_/file/200.png" Width="100" /></td>
                                                    <td>
                                                        <p><a href="opd.aspx?pid=<%# Eval("opID") %>"><%# Eval("opTitle") %></a></p>                                             
                                                        <p>负责人：<%# Eval("opLeader") %>
                                                             &emsp; &emsp;联系邮箱：<%# Eval("opEmail") %>
                                                             &emsp; &emsp;单位：<%# Eval("opDepartment") %></p>
                                            
                                                        <p>项目时间：<%# Eval("opLeader") %>
                                                            &emsp; &emsp;项目成员：<%# Eval("opNum") %></p>
                                                        <p>&emsp;&emsp;<%# Eval("opIntro") %></p>
                                                    </td>
                                                </tr>    
                                                </ItemTemplate>
                                        </asp:Repeater>     
                                    </tbody>
                                </table>
                            </div>
                    </div> 
                </div>
            </div> 
            <div class="ui-grid-9" style="background-color:#fff;">
                <div class="ui-grid-row">
                     <div class="ui-grid-2">                     
                        <div style="
                            width:60px;
                            background-color:#0094ff;
                            text-align:center;
                            font-size:26px;
                            line-height:45px;
                            margin:10px 0 0 0px;
                            "><a style="margin:0 auto;width:30px;display:block; padding:15px 10px;  color:#f0f0f0; text-decoration:none;" href="ps.aspx">项目支持</a></div>
                         </div>
                         <div class="ui-grid-7">
                              <div class="ul_support">
                                  <a  href="ps.aspx?sid=1">经费支持</a>          
                                  <a  href="ps.aspx?sid=2">条件保障</a>
                                  <a  href="ps.aspx?sid=3">院系合作</a>
                                  <a  href="ps.aspx?sid=4">校企联合</a>
                                  <a  href="ps.aspx?sid=5">创新竞赛</a>
                                  <a  href="ps.aspx?sid=6">创新训练基地</a>
                                </div>
                         </div>
                    </div>
                <div class="ui-grid-row">
                    <div class="ui-grid-9">        
                        <div class="ui-box">
                        <div class="ui-box-head">
                            <div class="ui-box-head-border">
                                <h3 class="ui-box-head-title">帮助中心</h3>
                                <%--<span class="ui-box-head-text">其他文字</span>--%>
                                <a href="#" class="ui-box-head-more">更多</a>
                            </div>
                        </div>
                        <div class="ui-box-container">
                            <div class="ui-box-content">
                                <ul class="ui-list ">
                                    <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                                    <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                                    <li class="ui-list-item"><a href="#">支付宝数字证书有什么作用？</a></li>
                                    <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form id="form1" runat="server">
    <div>
    </div>
    </form>
    
<script type="text/javascript">
    $(function () {
        $('div#slide').iFadeSlide();
    });
</script>
</body>
</html>
