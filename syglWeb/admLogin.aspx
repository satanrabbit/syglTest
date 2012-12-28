<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Site.Master" AutoEventWireup="true" CodeBehind="admLogin.aspx.cs" Inherits="syglWeb.admLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
    #adminLoginBox{width:380px;border:1px solid #95c6fb;border-radius:6px;padding:20px 0 0 30px; margin: 20px auto;}
    #adminLoginBox dl{margin:10px 5px;overflow:auto;zoom:1;font-size:14px;font-family:"微软雅黑","黑体",tahoma;line-height:35px;}
    #adminLoginBox dl dt{width:80px;float:left;}
    #adminLoginBox dl dd{width:260px;float:left;}
    .tbox{ width:200px; border:1px solid #bccccb; height:30px;font-size: 20px;background: #FFF;outline: none;border-radius: 3px;-webkit-border-radius: 3px;-webkit-transition: -webkit-box-shadow .1s linear;-moz-transition: box-shadow .1s linea}
    .login_btn {display: inline-block;width: 100px;height: 35px;border-radius: 3px; border: 1px solid #106ec8; ;line-height: 25px;font-size: 16px;font-weight: bold;color: white;background: #1c52cc;cursor: pointer;}
    .redFont{ color:Red;}
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="adminLoginBox">
    <asp:Label ID="LabelLoginTip" runat="server" Text="" Visible="false" CssClass="redFont" ></asp:Label>
    <dl>
        <dt>帐号</dt>
        <dd>
            <asp:TextBox ID="TextBoxAccount" runat="server" CssClass="tbox"></asp:TextBox><span class="redFont">*</span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="必填" ControlToValidate="TextBoxAccount"></asp:RequiredFieldValidator>
        </dd>
    </dl>
    <dl>
        <dt>密码</dt>
        <dd>
            <asp:TextBox ID="TextBoxPwd" runat="server" TextMode="Password" CssClass="tbox"></asp:TextBox><span class="redFont">*</span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="必填" ControlToValidate="TextBoxPwd"></asp:RequiredFieldValidator>
        </dd>
    </dl>
    <dl><dt>&emsp;</dt><dd><asp:Button ID="Button1" runat="server" Text="登录" CssClass="login_btn" /></dd></dl>
    <a href="#">忘记密码？</a>
</div>
</asp:Content>
