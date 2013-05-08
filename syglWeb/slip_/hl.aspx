<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hl.aspx.cs" Inherits="syglWeb.slip_.hl" %>

<%@ Register Src="~/slip_/hd.ascx" TagPrefix="uc1" TagName="hd" %>
<!DOCTYPE html>

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
   
    <div class="wrapper">
        <uc1:hd runat="server" id="hd" />
        <div class="ui-grid-row">
            <div class="ui-grid-7">
                <div class="ui-box "> 
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
            </div>
            <div class="ui-grid-18">
                <div class="crumb"><a href="default.aspx" >创新平台</a>
					&gt; <a href="ns.aspx" >帮助中心</a>
                </div>
                <table class="ui-table ui-table-noborder">
                    <tbody>
                                <asp:Repeater ID="HelpRepeater" runat="server">
                            <ItemTemplate>
                                 <tr>  
                                    <td >
                                        <p>
                                            <a href="n.aspx?n=<%# Eval("helpID")%>"><%#Eval("helpTitle") %></a>
                                        </p>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>            
                    </tbody>
                </table>
            </div>
                     
        </div>
    </div> 
</body>
</html>
