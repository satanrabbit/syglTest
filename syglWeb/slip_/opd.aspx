<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="opd.aspx.cs" Inherits="syglWeb.slip_.opd" %>

<%@ Register Src="~/slip_/hd.ascx" TagPrefix="uc1" TagName="hd" %>
<!DOCTYPE html>
<!--旧的项目成果详细页--->
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
                <div class="crumb"> 
                    <a href="#" >创新平台</a>
					&gt; <a href="pf.aspx" >创新成果</a>
					&gt; <asp:HyperLink ID="opTypeLink" runat="server"></asp:HyperLink>
                    						
                </div>
                <div class="help-detail">
        			<h2 class="detail-title">
        				<asp:Label ID="opTitle" runat="server"></asp:Label>
        			</h2>
        			<table class="ui-table ui-table-noborder ">
                        <tbody>
                            <tr>          
                                <td width="120"> <asp:Image ID="opImage" runat="server" ImageUrl="~/slip_/file/200.png" Width="100" /></td>
                                <td>
                                    <p>负责人：<asp:Label runat="server" ID="opLeader"></asp:Label> &emsp; &emsp;联系邮箱：<asp:Label runat="server" ID="opEmail"></asp:Label> &emsp; &emsp;单位：<asp:Label runat="server" ID="opDepartment"></asp:Label></p>
                                    <br />
                                    <p>项目时间：<asp:Label runat="server" ID="opYear"></asp:Label>&emsp; &emsp;项目成员：<asp:Label runat="server" ID="opNum"></asp:Label></p>
                                </td>
                            </tr>        
                        </tbody>
                    </table> 
                    <div  style="margin:10px;">
                        <asp:Label runat="server" ID="opContent"></asp:Label>
                    </div>
		        </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>