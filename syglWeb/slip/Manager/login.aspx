<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="syglWeb.slip.Manager.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server">
<form runat="server">
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
</asp:Content>
