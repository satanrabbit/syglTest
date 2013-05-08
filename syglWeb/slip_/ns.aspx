<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ns.aspx.cs" Inherits="syglWeb.slip_.ns" %>
<%@ Register Src="~/slip_/hd.ascx" TagPrefix="uc1" TagName="hd" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>创新平台-天津科技大学</title> 
    <link href="source/Alice/one-full.css" rel="stylesheet" />
    <link href="source/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="source/easyui/themes/icon.css" rel="stylesheet" />
    <link href="css/slip.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.min.js"></script> 
    <script src="source/easyui/jquery.easyui.min.js"></script>
    <script src="source/easyui/locale/easyui-lang-zh_CN.js"></script>
<%--    <script src="source/easyui/easyui_ex.js"></script>--%>
    <script src="source/easyui/jquery_easyUI_dialog_form.js"></script>
</head>
<body>
   
    <div class="wrapper">
        <uc1:hd runat="server" id="hd" />
        <div class="ui-grid-row">
            <div class="ui-grid-7">
                <div class="ui-box">
                    <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">最新资讯</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <ul class="ui-list">
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                                <li class="ui-list-item"><a href="#">如何提现？</a></li>
                                <li class="ui-list-item"><a href="#">支付宝数字证书有什么作用？</a></li>
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ui-box ui-box-follow"> 
                     <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">项目支持</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
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
                </div>
                <div class="ui-box ui-box-follow">
                    <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">帮助</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <ul class="ui-list">
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                                <li class="ui-list-item"><a href="#">如何提现？</a></li>
                                <li class="ui-list-item"><a href="#">支付宝数字证书有什么作用？</a></li>
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
            </div>
            <div class="ui-grid-18">
                <div class="crumb"><a href="default.aspx" >创新平台</a>
					&gt; <a href="ns.aspx" >创新资讯</a>
                </div>
                <table class="ui-table ui-table-noborder">
                    <tbody>
                        <asp:Repeater ID="NewsRepeater" runat="server">
                            <ItemTemplate>
                                 <tr>  
                                    <td >
                                        <p>
                                            <a href="n.aspx?n=<%# Eval("newsID")%>"><%#Eval("newsTitle") %></a>
                                        </p>
                                    </td>
                                    <td width="100"><%# Convert.ToDateTime(Eval("newsPostTime")).ToString("yyyy年MM月dd日") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                       
                    </tbody>
                </table> 
                    <div class="ui-paging">

                    <%if (page>1) { %><a href="ns.aspx?page=<%= page-1 %>" class="ui-paging-prev">
                        <i class="iconfont" title="左三角形"></i> 上一页
                    </a>
                    <%}for(int i =1; i<=pages;i++){
                          int li =Math.Abs( page - i);
                          if (i == 1||i==pages||page<=8)
                          {
                             %> <a href="#" class="ui-paging-item <% if (li == 0) { %>ui-paging-current<%}%>"><%= i %></a><%
                          }else
                          {
                            if (page > 8) {
                               
                                  if (li == 5)
                                  {
                                      %>…<%
                                  }
                                if (li == 0)
                                {
                                    %> <a href="#" class="ui-paging-item ui-paging-current "><%= i %></a><%
                                }
                                if (li < 5)
                                {
                                    %><a href="#" class="ui-paging-item <% if (li == 0) { %>ui-paging-current<%}%>"><%= i %></a> <% 
                                }
                                
                              }
                          } 
                    } 
                      if(page<pages){ %>
                    <a href="ns.aspx?page=<%= page+1 %>" class="ui-paging-next">
                        下一页 <i class="iconfont" title="右三角形"></i>
                    </a>
                    <%} %>
                    <span class="ui-paging-info"><span class="ui-paging-bold"><%=page %>/<%=pages %></span>页</span>
                    <span class="ui-paging-which"><input id="page-to" name="some_name" value="1" type="text" /></span>
                    <a class="ui-paging-info ui-paging-goto" id="jump-page" href="#">跳转</a>
                </div>
                 <script type="text/javascript">
                     $(function () {
                         $("#jump-page").click(function () {
                             window.location.href = "ns.aspx?page=" + $("#page-to").val();
                         });
                         
                     });
                 </script>
            </div>
                     
        </div>
    </div> 
</body>
</html>
