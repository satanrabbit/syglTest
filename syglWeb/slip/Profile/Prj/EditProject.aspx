<%@ Page Title="" validateRequest="false"  Language="C#" MasterPageFile="~/slip/Share/NestedMasterPageProfile.master" AutoEventWireup="true" CodeBehind="EditProject.aspx.cs" Inherits="syglWeb.slip.Profile.Prj.EditProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderProflie" runat="server">


<script type="text/javascript">

    KindEditor.ready(function (K) {
        var editor1 = K.create('.TopicDetaile', {
            width: '660px',
            height:'500px',
            items: [
                        'source', 'undo', 'redo', '|', 'preview', 'paste',
                        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                        'superscript', 'selectall', '|', 'fullscreen', '/',
                        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'insertfile', 'table', 'hr', 'pagebreak',
                        'anchor', 'link', 'unlink', '|', 'about'
                ],
            uploadJson: "/Slip/Sources/kindeditor_4.1.3/asp.net/upload_json.ashx",
            fileManagerJson: '/Slip/Sources/kindeditor_4.1.3/asp.net/file_manager_json.ashx',
            allowFileManager: true,
            afterCreate: function () {
                var self = this;
                K.ctrl(document, 13, function () {
                    self.sync();
                    K('form[name=example]')[0].submit();
                });
                K.ctrl(self.edit.doc, 13, function () {
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
            <h3><asp:Label ID="LabelOptTip" runat="server" Text=""></asp:Label></h3>
        </div>
        <div class="pf_prj_items">
               <table class="odr_bigtable">
	                <thead>
		                <tr>
			                <th colspan="2" class="cfl">
                                <span style=" margin:0 7px;">课题题目：</span>
                                <asp:HiddenField ID="HiddenFieldTopicID" runat="server" />
                                <asp:HiddenField ID="HiddenFieldOptTip" runat="server" /> 
                                <asp:HiddenField ID="HiddenFieldContent" runat="server" />
                                <asp:Label ID="LabelTopicTitle" runat="server" Text=""></asp:Label>
                            </th>
		                </tr>
	                </thead>
	                <tbody>
                        <tr>
                            <td  class="text_td_label"  colspan="2">                              
                                <asp:TextBox  ID="TextBoxEditProject" runat="server" TextMode="MultiLine"  CssClass="big_text_area TopicDetaile"></asp:TextBox></td>
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
