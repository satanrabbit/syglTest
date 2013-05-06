<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ps.aspx.cs" Inherits="syglWeb.slip_.ps" %>
<%@ Register Src="~/slip_/hd.ascx" TagPrefix="uc1" TagName="hd" %>
<!DOCTYPE html>
<!--项目支持页面-->
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
            <div class="ui-grid-7">
                     <div class="ui-box"> 
                     <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">项目支持</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <div class="ul_support">
                                  <a  href="Support/SupportDetail.aspx?sid=1">经费支持</a>          
                                  <a  href="Support/SupportDetail.aspx?sid=2">条件保障</a>
                                  <a  href="Support/SupportDetail.aspx?sid=3">院系合作</a>
                                  <a  href="Support/SupportDetail.aspx?sid=4">校企联合</a>
                                  <a  href="Support/SupportDetail.aspx?sid=5">创新竞赛</a>
                                  <a  href="Support/SupportDetail.aspx?sid=6">创新训练基地</a>
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
            <div class="ui-grid-18">
                <div class="crumb"><a href="default.aspx" >创新平台</a>
					&gt; <a href="#" >项目支持</a> 						
                </div>
                <div class="help-detail">
        			<h2 class="detail-title">
        				<asp:Label runat="server" ID="supportTitle"></asp:Label>
        			</h2>
        			<div class="detail-content">
                        <asp:Label runat="server" ID="supportContent"></asp:Label>
        		    </div> 
		</div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
