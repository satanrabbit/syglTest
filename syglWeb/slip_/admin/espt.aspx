<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="espt.aspx.cs" Inherits="syglWeb.slip_.admin.espt" %>
<link href="../source/kindeditor/themes/default/default.css" rel="stylesheet" />
<!--- 修改文章的表单-->
    <form id="editSupport" runat="server" class="ui-form">
    <div>
        <div class="ui-box-container">
                        <div class="ui-box-content">
                            <fieldset>
                                <legend>表单标题</legend>
                                 <div class="ui-form-item">
                                    <label for="" class="ui-label">
                                        <span class="ui-form-required">*</span>项目支持 
                                    </label>
                                    <asp:textbox id="supportTitle" runat="server" CssClass="ui-input" Width="70%"></asp:textbox> 
                                    
                                </div>    
                                <div class="ui-form-item">
                                    <label for="" class="ui-label">
                                        <span class="ui-form-required">*</span>支持内容
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
                                    <asp:textbox runat="server" id="supportContent" style="height:260px;width:98%;" TextMode="MultiLine"></asp:textbox>
                                    <asp:hiddenfield runat="server" id="supportID"></asp:hiddenfield>
                                </div> 
                            </fieldset>
                        </div>
                    </div>
    </div>
                                <script  type="text/javascript" src="../source/kindeditor/kindeditor-all-min.js"></script>
                                <script type="text/javascript" src="../source/kindeditor/lang/zh_CN.js"></script>
                                <script type="text/javascript">
                                    $(function () {
                                        window.editor = KindEditor.create('#supportContent', {
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
                                    });
                                    </script>
    </form>
