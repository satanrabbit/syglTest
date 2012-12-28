<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/NestedMasterPageProfile.master" AutoEventWireup="true" CodeBehind="EditTopicMb.aspx.cs" Inherits="syglWeb.slip.Profile.Prj.EditTopicMb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderProflie" runat="server">

<div class="pro_right">
    <div class="pf_prj_titile">
        <h3><asp:Label ID="LabelTopicTitle" runat="server" Text=""></asp:Label>&emsp;<asp:HyperLink
                ID="HyperLinkTopicMb" runat="server">成员管理</asp:HyperLink>——
            <asp:Label ID="LabelEdit" runat="server" Text=""></asp:Label>
        </h3>       
    </div>    
    <div class="pf_prj_items">
               <table class="odr_bigtable">	                
	                <tbody> 
                        <tr>
                            <td > 
                                <table class="form_tb">
                                    <tr>
                                        <td align="right">
                                            <label for="text_mbName">姓名</label>
                                            <asp:HiddenField ID="HiddenFieldTopicID"  runat="server" />
                                            <asp:HiddenField ID="HiddenFieldTopicMbID" runat="server" /> 
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="TextBoxMbName" runat="server"></asp:TextBox> 
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ErrorMessage="必填" Text="必填" Display="Dynamic" ControlToValidate="TextBoxMbName"></asp:RequiredFieldValidator>
                                        </td>
                                        <td  align="right">
                                            <label>身份</label>
                                        </td>
                                        <td align="center">
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                                <asp:ListItem Value="0" Selected="True">教师</asp:ListItem>
                                                <asp:ListItem Value="1">学生</asp:ListItem>
                                            </asp:RadioButtonList>
                                            
                                        </td>
                                    </tr>
                                    <tr id="tr_mbPst">
                                        <td align="right">
                                            <label for="text_mbPst">职务职称</label>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="TextBoxMbPst" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="right"></td>
                                        <td align="center"></td>                
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <label for="text_mbNum" id="mbNum_label">教工号</label>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="TextBoxMbNum" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ErrorMessage="必填" Text="必填" Display="Dynamic" ControlToValidate="TextBoxMbNum"></asp:RequiredFieldValidator>
                                        
                                        </td>
                                        <td align="right">
                                            <label for="text_mbPhone">手机</label>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="TextBoxMbPhone" runat="server"></asp:TextBox> 
                                        </td>                
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <label for="text_mbCollege">学院(部门)</label>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="TextBoxMbCollege" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ErrorMessage="必填" Text="必填" Display="Dynamic" ControlToValidate="TextBoxMbCollege"></asp:RequiredFieldValidator> 
                                        </td>
                                        <td align="right">
                                            <label for="text_mbMajor">专业方向</label>
                                        </td>
                                        <td align="center">
                                            <asp:TextBox ID="TextBoxMbMajor" runat="server"></asp:TextBox> 
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ErrorMessage="必填" Text="必填" Display="Dynamic" ControlToValidate="TextBoxMbMajor"></asp:RequiredFieldValidator> 
                                        
                                        </td>                
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <label for="ta_mbWork">项目分工</label>
                                        </td>
                                        <td colspan="3" align="center">
                                            <asp:TextBox ID="TextBoxMbWork" runat="server" TextMode="MultiLine" Width="400" Height="50"></asp:TextBox> 
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                ErrorMessage="必填" Text="必填" Display="Dynamic" ControlToValidate="TextBoxMbWork"></asp:RequiredFieldValidator> 
                                        
                                        </td>
                                    </tr>
                                </table>
                            </td>
		                </tr>
                        <tr><td>
                            <asp:Button ID="Button1" runat="server" Text="提交" /></td></tr>
	                </tbody>
                </table>
        </div>

     </div>
     
   <script type="text/javascript">
       $(function () {
           $(":radio[name='ctl00$ctl00$ContentPlaceHolderPage$ContentPlaceHolderProflie$RadioButtonList1']").change(function () {
               $mbID = $(":radio[name='ctl00$ctl00$ContentPlaceHolderPage$ContentPlaceHolderProflie$RadioButtonList1']:checked").val();
               switch ($mbID) {
                   case "0":
                       $("#tr_mbPst").show();
                       $("#mbNum_label").text("教师");
                       break;
                   case "1":
                       $("#tr_mbPst").hide();
                       $("#mbNum_label").text("学号");
                       break;
                   default:
                       $("#tr_mbPst").show();
                       $("#mbNum_label").text("教师");
                       break;
               }
           });
       });
    </script>


</asp:Content>
