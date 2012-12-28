<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uploadPrjFile.aspx.cs" Inherits="syglWeb.slip.Profile.Prj.uploadPrjFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript" src="../../Scripts/jquery-1.7.2.min.js"></script>
<style type="text/css">
    .hidden
    {
        display:none;
    }
</style>
</head>
<body>

<%if (IsPostBack)
  {
      %>
      <script type="text/javascript">
          $(function () {
              var parentDom = $(window.parent.document.body);
              var oldImg = parentDom.find("#old_img");
              var data = $.parseJSON($("#LabelData").text());

              //console.info(data);
              parentDom.find("#target_wrapper").empty().append("<img src='" + data.imgNamePath + "' id='target' alt='头像' /> ");
              parentDom.find("#preview").attr("src", data.imgNamePath);
              parentDom.find("#trigger_btn").trigger("click");
              parentDom.find("#avatar_img").val(data.imgNamePath);
              parentDom.find("#old_img").val(data.path);
          });
      </script>
      <%
  } %>

    <form id="form1" runat="server">
    <div>
    <asp:fileupload ID="Fileupload" runat="server"></asp:fileupload><br />
        <asp:Button ID="Button" runat="server" Text="上传" />
    </div>
    </form>
    <asp:Label ID="LabelData" runat="server" Text=""  CssClass="hidden"></asp:Label>
</body>
</html>
