<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="et.aspx.cs" Inherits="syglWeb.slip_.et" %>
<%@ Register Src="~/slip_/hd.ascx" TagPrefix="uc1" TagName="hd" %>
<%@ Register Src="~/slip_/lm.ascx" TagPrefix="uc1" TagName="lm" %>
<!DOCTYPE html>
<!-- 添加修改征集题目页-->
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
    <script src="source/easyui/easyui_ex.js"></script>
    <script src="source/easyui/jquery_easyUI_dialog_form.js"></script>
    <script src="source/kindeditor/kindeditor-all-min.js"></script>
    <script src="source/kindeditor/lang/zh_CN.js"></script>

    <style type="text/css">
        .ui-step li { 
            height: 65px;
        }
        .ui-step-icon .ui-step-text {
            left: -45px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="ui-form">
    <div class="wrapper">
        <uc1:hd runat="server" id="hd" />
        <div class="ui-grid-row">
            <div class="ui-grid-7">
                <uc1:lm runat="server" id="lm" />
            </div>
            <div class="ui-grid-18">
                <div class="ui-box">
                     <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">2013年开放基金题目征集</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <fieldset>
                                <legend>表单标题</legend>

                                <div class="ui-form-item">
                                    <label for="" class="ui-label">
                                        <span class="ui-form-required">*</span>题&emsp;&emsp;目 
                                    </label>
                                    <input class="ui-input" type="text" style="width:70%; background-color:#fdfdfd;"> <span class="ui-form-other"></span>
                                    <p class="ui-form-explain">您准备进行的开放基金项目的题目,请准确概述，此题目将作为您以后申请开放基金课题的题目！</p>
                                </div>                                
                                <div class="ui-form-item">
                                    <label for="" class="ui-label">
                                        <span class="ui-form-required">*</span>题目概要
                                    </label>
                                    <div class="ui-poptip">
                                        <div class="ui-poptip-shadow">
                                        <div class="ui-poptip-container">        
                                            <div class="ui-poptip-arrow ui-poptip-arrow-7">
                                                <em>◆</em>
                                                <span>◆</span>
                                            </div>
                                            <div class="ui-poptip-content">
                                                简要概述您的课题内容、研究意义等信息，请保持在150字左右！
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>                          
                                <div class="ui-grid-row">
                                    <textarea class="ui-textarea" style="width:98%; background-color:#fdfdfd;"></textarea>
                                </div>
                                <div class="ui-form-item">
                                    <label for="" class="ui-label">
                                        <span class="ui-form-required">*</span>题目详述
                                    </label>
                                    <div class="ui-poptip">
                                        <div class="ui-poptip-shadow">
                                        <div class="ui-poptip-container">        
                                            <div class="ui-poptip-arrow ui-poptip-arrow-7">
                                                <em>◆</em>
                                                <span>◆</span>
                                            </div>
                                            <div class="ui-poptip-content">
                                                简要请详细描述您的课题内容，涉及图片、文件等请通过编辑器插入文中！
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>                          
                                <div class="ui-grid-row">
                                    <textarea id="editor_id" class="ui-textarea" style="width:98%;"></textarea>
                                </div>
                                <div class="ui-form-item">
                                    <input type="submit" class="ui-button ui-button-morange" value="确定">
                                    <input type="button" class="ui-button ui-button-mwhite" value="取消">
                                </div>   
                            </fieldset>
                        </div>
                    </div>
                </div>
                
           </div>
                    
        </div>
    </div>
    </form>

    <script>
        KindEditor.ready(function (K) {
            window.editor = K.create('#editor_id');
        });
</script>

</body>
</html>
