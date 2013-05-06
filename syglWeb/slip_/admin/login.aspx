<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="syglWeb.slip_.admin.login" %>

<%@ Register Src="~/slip_/hd.ascx" TagPrefix="uc1" TagName="hd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>创新平台-天津科技大学</title>
    <link href="../source/Alice/one-full.css" rel="stylesheet" />
    <link href="../source/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="../source/easyui/themes/icon.css" rel="stylesheet" />
    <link href="../css/slip.css" rel="stylesheet" />
    <script src="../js/jquery-1.8.0.min.js"></script>
    <script src="../source/easyui/jquery.easyui.min.js"></script>
    <script src="../source/easyui/locale/easyui-lang-zh_CN.js"></script>
      
</head>
<body >  
    <div class="wrapper">
        <uc1:hd runat="server" id="hd" />     
    <div style="width:990px; margin:10px auto;" class="fn-clear" >
        <div  style="width:600px;" class="fn-left">
            <div class="ui-box">
                <div class="ui-box-head">
                    <div class="ui-box-head-border">
                        <h3 class="ui-box-head-title">登录</h3>
                    </div>
                </div>
                <div class="ui-box-container">
                    <div class="ui-box-content">
                        <form class="ui-form" name="" method="post" action="#" id="ff" runat="server">
                            <fieldset>
                                <legend>登录</legend>
 
                                <div class="ui-form-item">
                                    <label for="" class="ui-label">
                                        <span class="ui-form-required">*</span>账号：
                                    </label>
                                    <input class="ui-input easyui-validatebox"  type="text" data-options="required:true,missingMessage:'请输登录账号'" name="adminAccount" /> <span class="ui-form-explain">填写注册的邮箱、教工卡号或学号</span>                                   
                                </div>

                                <div class="ui-form-item  ">
                                    <label for="" class="ui-label"> <span class="ui-form-required ">*</span>密码：</label>
                                    <input class="ui-input easyui-validatebox" data-options="required:true,missingMessage:'请输入6-15位的密码！',invalidMessage:'请输入6-15位的密码！'" type="password" name="adminPwd" /> 
                                </div> 
                                <div class="ui-form-item">
                                    <input type="submit" id="submit" class="ui-button ui-button-mblue" value="登录" />
                                    <a href="Regiest.aspx" class="ui-button ui-button-mwhite"  >注册</a>
                                </div>   
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div> 
    </div>
    <script type="text/javascript">
        $(function () {
            $("#submit").click(function () {
                return $("#ff").form('validate');;
            });
        });
    </script>
<asp:panel ID="Panel1" runat="server">
    <script type="text/javascript">
        $('[name=<%=controlName%>]').after('<p class="ui-form-explain ui-tiptext ui-tiptext-error"><%= msg%></p>').change(function () {
            $(this).parent().removeClass('ui-form-item-error');
            $(this).next('p').remove();
        }).parent().addClass('ui-form-item-error');
    </script>
</asp:panel>
        </div>
</body>
</html>
