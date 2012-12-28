<%@ Page Title="" Language="C#" validateRequest="false" MasterPageFile="~/slip/Share/NestedMasterPageProfile.master" AutoEventWireup="true" CodeBehind="TopicCollect.aspx.cs" Inherits="syglWeb.slip.Profile.Prj.TopicCollect" %>  
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderProflie" runat="server">
<script type="text/javascript">
    	 
		KindEditor.ready(function(K) {
		    var editor1 = K.create('.TopicDetaile', {
		        width: '580px',
                items:[
                        'source', 'undo', 'redo', '|', 'preview', 'paste',
                        'plainpaste', 'wordpaste', '|',  'justifyleft', 'justifycenter', 'justifyright',
                        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                        'superscript', 'selectall', '|', 'fullscreen', '/',
                        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'insertfile', 'table', 'hr', 'pagebreak',
                        'anchor', 'link', 'unlink', '|', 'about'
                ],
                uploadJson: "../../Sources/kindeditor_4.1.3/asp.net/upload_json.ashx",
				fileManagerJson: '../../Sources/kindeditor_4.1.3/asp.net/file_manager_json.ashx',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						K('form[name=example]')[0].submit();
					});
				}
			});
			prettyPrint();
		});
	 
</script>
<div class="pro_right">

        <div class="pf_prj_titile">
            <h3>申请课题</h3>
        </div>
        <div class="pf_prj_items">
               <table class="odr_bigtable">
	                <thead>
		                <tr>
			                <th colspan="2" class="cfl">
                                <span style=" margin:0 7px;">课题题目：</span><asp:HiddenField ID="HiddenFieldTopicID" runat="server" /> 
                                <asp:TextBox ID="TextBoxTopicTitle" runat="server" CssClass="titile_text"></asp:TextBox>
                            </th>
		                </tr>
	                </thead>
	                <tbody>
		                <tr>
                            <td  class="text_td_label">课题概述</td><td>
                                <asp:TextBox ID="TextBoxTopicInfo" runat="server" TextMode="MultiLine" CssClass="mini_text_area"></asp:TextBox></td>
		                </tr>
                        <tr>
                            <td  class="text_td_label">开题报告</td><td>                                
                                <asp:TextBox  ID="TextBoxTopicDetaile" runat="server" TextMode="MultiLine"  CssClass="big_text_area TopicDetaile"></asp:TextBox></td>
		                </tr>
                        <tr>
                            <td  class="text_td_label"><input name="TopicFile" id="TopicFile" type="hidden" /></td><td></td>
		                </tr>
                        <tr>
                            <td  colspan="2">
                                <asp:Button ID="ButtonSubmit" runat="server" Text="提交" />
                            </td>
		                </tr>

	                </tbody>
                </table>
        </div>
     </div>
</asp:Content>
