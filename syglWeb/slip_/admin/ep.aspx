<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ep.aspx.cs" ValidateRequest="false" Inherits="syglWeb.slip_.admin.ep" %>
<link href="../source/kindeditor/themes/default/default.css" rel="stylesheet" />
<!--- 修改或添加旧项目的表单-->
    <form id="editOp" runat="server" class="ui-form">
    <div>
        <style>
            .ui-table td {
                padding:0px;
            }
            .auto-style1 {
                height: 67px;
            }
        </style>
        <div class="ui-box-container">
                        <div class="ui-box-content">
                            <fieldset>
                                <legend>表单标题</legend>     
                                <table class="ui-table ui-table-noborder ">
                                    <tbody>
                                        <tr>
                                            <td width="60%">
                                                <div class="ui-form-item">
                                                    <label for="" class="ui-label">
                                                        <span class="ui-form-required">*</span>题&emsp;&emsp;目
                                                    </label>
                                                    <asp:textbox id="opTitle" runat="server" CssClass="ui-input" Width="90%"></asp:textbox>  
                                                </div>
                                            </td>
                                            <td > 
                                                <div class="ui-form-item">
                                                    <label for="" class="ui-label">
                                                        <span class="ui-form-required">*</span>项目分类 
                                                    </label>
                                                    <asp:textbox id="opType" runat="server" CssClass="ui-input" Width="90%"></asp:textbox>  
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>                 
                                <table class="ui-table ui-table-noborder ">
                                    <tbody>
                                        <tr>
                                            <td width="40%" class="auto-style1">
                                                <div class="ui-form-item">
                                                    <label for="" class="ui-label">
                                                        <span class="ui-form-required">*</span>负责人
                                                    </label>
                                                    <asp:textbox id="opLeader" runat="server" CssClass="ui-input" Width="90%"></asp:textbox>  
                                                </div>  </td>
                                            <td width="40%" class="auto-style1"> <div class="ui-form-item">
                                                    <label for="" class="ui-label">
                                                         联系邮箱
                                                    </label>
                                                    <asp:textbox id="opEmail" runat="server" CssClass="ui-input" Width="90%"></asp:textbox>  
                                                </div>  </td>
                                            <td rowspan="2" width="20%">
                                                <asp:image  width="80" runat="server" ID="opCoverImg" ImageUrl="~/slip_/file/200.png"></asp:image>  
                                                <br />                                            
                                                <asp:hiddenfield runat="server" id="opImg"></asp:hiddenfield>
                                                <input type="button" id="upload-cover" value="更改图片封面" />                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> <div class="ui-form-item">
                                                    <label for="" class="ui-label">
                                                         所在单位
                                                    </label>
                                                    <asp:textbox id="opDepartment" runat="server" CssClass="ui-input" Width="90%"></asp:textbox>  
                                                </div></td>
                                            <td ><div class="ui-form-item">
                                                    <label for="" class="ui-label">
                                                         项目年度
                                                    </label>
                                                    <asp:textbox id="opYear" runat="server" CssClass="ui-input" Width="90%" ></asp:textbox>  
                                                </div></td>
                                            <td></td>
                                        </tr><tr>
                                            <td> <div class="ui-form-item">
                                                    <label for="" class="ui-label">
                                                         项目成员
                                                    </label>
                                                    <asp:textbox id="opNum" runat="server" CssClass="ui-textarea" Width="90%" Height="45" TextMode="MultiLine"></asp:textbox>  
                                                </div></td>
                                            <td colspan="2"><div class="ui-form-item">
                                                    <label for="" class="ui-label">
                                                         项目概述
                                                    </label>
                                                    <asp:textbox id="opIntro" runat="server" CssClass="ui-textarea" Width="90%"  Height="45" TextMode="MultiLine"></asp:textbox>  
                                                </div></td>
                                        </tr> 
                                    </tbody>
                                </table>                         
                                
                                     <div class="ui-form-item">
                                                    <label for="" class="ui-label">
                                                        <span class="ui-form-required">*</span>项目详细
                                                    </label>
                                                    <div class="ui-poptip">
                                                        <div class="ui-poptip-shadow">
                                                        <div class="ui-poptip-container">        
                                                            <div class="ui-poptip-arrow ui-poptip-arrow-7">
                                                                <em>◆</em>
                                                                <span>◆</span>
                                                            </div>
                                                            <div class="ui-poptip-content">
                                                                 涉及图片、文件等请通过编辑器插入文中！
                                                            </div>
                                                        </div>
                                                        </div>
                                                    </div>
                                                </div>      
                                <div class="ui-grid-row">
                                    <asp:textbox runat="server" id="opContent" style="height:200px;width:98%;" TextMode="MultiLine"></asp:textbox>
                                    <asp:hiddenfield runat="server" id="opID"></asp:hiddenfield>
                                </div> 
                            </fieldset>
                        </div>
                    </div>
    </div>
                                <script  type="text/javascript" src="../source/kindeditor/kindeditor-all-min.js"></script>
                                <script type="text/javascript" src="../source/kindeditor/lang/zh_CN.js"></script>
                                <script type="text/javascript">
                                    $(function () {
                                        $.parser.parse();
                                        $('#opType').combobox({
                                            url: 'otl.ashx',
                                            valueField: 'typeID', editable: false, width: 200,
                                            textField: 'typeName',required:true
                                        });
                                        window.editor = KindEditor.create('#opContent', {
                                            basePath: "../source/kindeditor/",
                                            allowImageUpload: true, allowFileUpload: true, allowMediaUpload: true,
                                            uploadJson: 'upload.ashx',
                                            fileManagerJson: 'fileManage.ashx',
                                            afterSelectFile: function (data) {
                                                alert(data);
                                            },
                                            allowFileManager: true,
                                            fullscreenMode: true
                                             , afterBlur: function () {
                                                 this.sync();
                                             }
                                        });
                                        setTimeout(function () { window.editor.fullscreen(false) }, 100);
                                        //上传图片按钮
                                        var uploadbutton = KindEditor.uploadbutton({
                                            button: $('#upload-cover'),
                                            fieldName: 'imgFile',
                                            url: 'upload.ashx?dir=image',
                                            afterUpload: function (data) {
                                                console.info(data);
                                                if (data.error === 0) {
                                                    var url = KindEditor.formatUrl(data.url, 'absolute');
                                                    $("#opImg").attr('value', url);                                                     
                                                    $("#opCoverImg").attr("src", url);
                                                } else {
                                                    alert(data.message);
                                                }
                                            },
                                            afterError: function (str) {
                                                alert('自定义错误信息: ' + str);
                                            }
                                        });
                                        uploadbutton.fileBox.change(function (e) {
                                            uploadbutton.submit();
                                        });
                                        //表单验证
                                        $("#opTitle").validatebox({
                                            required: true
                                        });
                                        $("#opLeader").validatebox({
                                            required: true
                                        });
                                        $("#opEmail").validatebox({ 
                                            validType:'email'
                                        });
                                    });
                                    </script>
    </form>
