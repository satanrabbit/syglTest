<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogOn.aspx.cs" Inherits="syglWeb.slip.Admin.LogOn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="text/css" rel="stylesheet" href="~/Slip/Style/Style.css" />
    <link type="text/css" rel="stylesheet" href="~/Slip/Style/iFadeSlide.css" /> 
    <script src="/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script> 
    <title>创新平台</title>
</head>
<body>
     <div id="top_link">
        <div id="top_link_box"> 天津科技大学 </div>
    </div>
    <div id="header">
        <div id="logo">.</div>
        <div id="sub_logo">
            <asp:Panel ID="Panel1" runat="server">
            </asp:Panel> 
         </div>
        <div id="dock">联系我们</div>
        <div id="intro_dock"> </div>
        
     
    </div>
    <div id="nav">
        <ul>
          <li>
              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/slip/">首页</asp:HyperLink>
          </li>
          <li>
              <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Slip/news.aspx">创新资讯</asp:HyperLink></li>
          <li><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Slip/op.aspx">创新成果</asp:HyperLink> </li>
          <li><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Slip/Support/Defualt.aspx">项目支持</asp:HyperLink></li>
          <li><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Slip/Profile/">项目管理</asp:HyperLink></li>
          <li><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Slip/Discuss/">创新论坛</asp:HyperLink></li>
          <li><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Slip/about.aspx">关于</asp:HyperLink></li>
        </ul>
      </div>
     
    <div id="page">
        
    <form id="form1" runat="server">
     <div class="m_login"> 
        <p><label><span>帐号</span></label><asp:TextBox ID="TextBoxAdminAccount" runat="server"  CssClass="input_text"></asp:TextBox><asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" runat="server" ErrorMessage="请填写帐号！" ControlToValidate="TextBoxAdminAccount"></asp:RequiredFieldValidator></p>
        <p><label><span>密码</span></label><asp:TextBox ID="TextBoxAdminPWD" runat="server" CssClass="input_text"></asp:TextBox><asp:RequiredFieldValidator
                ID="RequiredFieldValidator2" runat="server" ErrorMessage="请填写密码!" ControlToValidate="TextBoxAdminPWD"></asp:RequiredFieldValidator></p>
                <p>
                    <asp:Label ID="Label1" runat="server" Text=""  ForeColor="Red"></asp:Label></p>
        <p> <a class="login_submit_link"><asp:Button ID="ButtonLogin" runat="server" Text="登录" CssClass="login_btn" /> </a></p>
        
    </div>
    </form>
  <div class="clear"></div>
  </div>
  <div id="footer">
  		 ©&nbsp;天津科技大学实验室与设备管理处  <a href="/slip/LogOn.aspx" style="color:#000;">管理</a><br />
河西校区：天津市河西区大沽南路1038号 邮编：300222<br /> 泰达校区：天津经济技术开发区第十三大街29号 邮编：300457<br />
<br />
  </div>
</body>
</html>
