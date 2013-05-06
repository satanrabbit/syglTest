<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pf.aspx.cs" Inherits="syglWeb.slip_.pf" %>
<%@ Register Src="~/slip_/hd.ascx" TagPrefix="uc1" TagName="hd" %>
<!DOCTYPE html>
<!--项目成果列表页--->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <form id="form1" runat="server">
    <div class="wrapper">
       <uc1:hd runat="server" id="hd" />
         <div class="ui-grid-row">
            <div class="ui-grid-5">
                     <div class="ui-box"> 
                     <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">历届优秀成果展示</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <div class="ul_support">
                                  <a  href="#">2013年开放基金优秀项目</a>
                                  <a  href="#">2012年开放基金优秀项目</a>
                                  <a  href="#">2011年开放基金优秀项目</a>
                                  <a  href="#">2010年开放基金优秀项目</a>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="ui-box  ui-box-follow">
                    <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">创新资讯</h3>
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
                            <h3 class="ui-box-head-title">创新成果</h3>
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
            <div class="ui-grid-20">
                <div class="crumb">        			              																																																													<a href="http://help.alipay.com/lab/index.htm" seed="helpCrumb-link" smartracker="on">帮助中心</a>
					&gt; <a href="#" >付款方式</a>
					&gt; <a href="#" >快捷支付（含卡通）</a>
					&gt; <a href="#" ><font style="font-weight:bold">快捷支付（含卡通）介绍</font></a>							
                </div>
                <div class="help-detail">
        			<h2 class="detail-title">
        				快捷支付（含卡通）介绍
        			</h2>
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
                    <br />
                    <br /> 
                      <div class="ui-paging">

                    <%if (page>1) { %>
                          <a href="ns.aspx?page=<%= page-1 %>" class="ui-paging-prev">
                        <i class="iconfont" title="左三角形"></i> 上一页
                    </a>
                    <%}
                      for(int i =1; i<=pages;i++){
                          int li =Math.Abs( page - i);
                          if (i == 1||i==pages||page<=8)
                          {
                             %> <a href="pf.aspx?type=<%=type %>&page=<%=i %>" class="ui-paging-item <% if (li == 0) { %>ui-paging-current<%}%>"><%= i %></a><%
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
                                    %><a href="pf.aspx?type=<%=type %>&page=<%= i %>" class="ui-paging-item <% if (li == 0) { %>ui-paging-current<%}%>"><%= i %></a> <% 
                                }
                                
                              }
                          } 
                    } 
                      if(page<pages){ %>
                    <a href="pf.aspx?type=<%=type %>&page=<%= page+1 %>" class="ui-paging-next">
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
                             window.location.href = "pf.aspx??type=<%=type %>page=" + $("#page-to").val();
                         });

                     });
                 </script>
		        </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>