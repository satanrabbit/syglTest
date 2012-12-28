<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="LogOn.aspx.cs" Inherits="syglWeb.slip.LogOn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title >登陆</title>
</asp:Content>
<asp:Content ID="ContentActive" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server"> 

<form runat="server"  method="post" submitdisabledcontrols="False" action="">
<div class="login_wp">
    <div class="login_box">
        <div><h1>登陆创新平台</h1></div>
        <div class="login_item">
            <label for="user_account" class="tilte_label">帐号</label>
            <asp:TextBox ID="user_account" CssClass="login_text" runat="server"></asp:TextBox>*
            <asp:RequiredFieldValidator runat="server" ErrorMessage="请填写您的帐号" 
                ID="RequiredFieldValidatorUserAccount" ControlToValidate="user_account" 
                Display="Dynamic" CssClass="login_error_tips"></asp:RequiredFieldValidator>
        </div>
        <div class="login_item">
            <label for="user_password" class="tilte_label">密码</label>
            <asp:TextBox ID="user_password" CssClass="login_text" TextMode="Password" runat="server"></asp:TextBox>*<asp:RequiredFieldValidator
                ID="UserPWD" runat="server" ErrorMessage="请填写密码！" Display="Dynamic" 
                CssClass="login_error_tips" ControlToValidate="user_password"></asp:RequiredFieldValidator>
        </div>
        <div class="login_item">
            <asp:Label ID="LabelLoginUserTip" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <div class="about_password">
            <input class="remerber_password" type="checkbox" id="remerber_password" />
            <label for="remerber_password">记住登录状态</label>
            <a class="forgetPassword" href="#" target="_blank">忘记密码？</a>
        </div>
        <div class="login_submit_wp">
            <a class="login_submit_link" href="javascript:void(0);" >
                <asp:Button ID="loginBtn" runat="server" Text="登录" CssClass="login_btn" UseSubmitBehavior="True" />
            </a>
        </div>
        <div class="login_regist_link">
           没有帐号？ <a href="Regist.aspx" class="user_regist">注册</a>
        </div>
    </div>
    <div class="login_tips">
        <asp:Label ID="LabelNewUserTip" runat="server" Text="" CssClass="tips_txt"></asp:Label>
    </div>
</div>
</form>

</asp:Content>
