<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/NestedMasterPageProfile.master" AutoEventWireup="true" CodeBehind="ProjectManage.aspx.cs" Inherits="syglWeb.slip.Profile.Prj.ProjectManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderProflie" runat="server">
    <div class="pro_right">
        <div class="pf_prj_titile">
            <h3><asp:Label ID="LabelTopicTitle" runat="server" Text=""></asp:Label></h3>
        </div>
        <div class="pf_prj_titile">
            <h4>当前进度</h4>
            
        </div>
         
        <div class="clear"></div>
        <div class="proj_detail">
         <div class="tit tit_left">
              <h2> <a   href="javascript:void(0);" class="show_art_p">课题概述</a></h2>  
          <div class="reversegrid down"> 
              <asp:HyperLink ID="HyperLinkEditTopicInfo" runat="server" CssClass="show_art_edit">修改</asp:HyperLink>
          </div>
         </div>
        <div class="art_p">
        <p>
            <asp:Label ID="LabelTopicIntro" runat="server" Text=""></asp:Label>
        </p>
         </div>
         <div class="tit tit_left">
              <h2> <a   href="javascript:void(0);" class="show_art_p">开题报告</a></h2>  
          <div class="reversegrid down"><asp:HyperLink ID="HyperLinkEditTopicDetail" runat="server" CssClass="show_art_edit">修改</asp:HyperLink> </div>
         </div>
        <div class="art_p"><p>
            <asp:Label ID="LabelTopicDetail" runat="server" Text=""></asp:Label>
            </p>
        </div>
        <div class="tit tit_left">
          <h2>  <a   href="javascript:void(0);" class="show_art_p">项目说明</a></h2>  
          <div class="reversegrid down"> <asp:HyperLink ID="HyperLinkEditProjectIntro" runat="server" CssClass="show_art_edit"></asp:HyperLink> </div>
        </div>
        <div class="art_p">
            <p><asp:Label ID="LabelProjectIntro" runat="server" Text=""></asp:Label></p>
        </div>
         <div class="tit tit_left">
              <h2> <a   href="javascript:void(0);" class="show_art_p">实施方案</a></h2>  
          <div class="reversegrid down"> <asp:HyperLink ID="HyperLinkEditProjectPlan" runat="server" CssClass="show_art_edit"></asp:HyperLink></div>
         </div>
        <div class="art_p">
          <p><asp:Label ID="LabelProjectPlan" runat="server" Text=""></asp:Label></p>
        </div>
        <div class="tit tit_left">
          <h2> <a   href="javascript:void(0);" class="show_art_p">项目成果</a></h2>  
          <div class="reversegrid down"> <asp:HyperLink ID="HyperLinkEditProjectResult" runat="server" CssClass="show_art_edit" Text="W3School"/> </div>
       </div>
        <div class="art_p">
          <p><asp:Label ID="LabelProjectResult" runat="server" Text=""></asp:Label></p>
        </div>
         <div class="tit tit_left">
          <h2> <a   href="javascript:void(0);" class="show_art_p">项目图片</a></h2>  
          <div class="reversegrid down">  
              <asp:HyperLink ID="HyperLinkMProjImg" runat="server">管理</asp:HyperLink>  </div>
       </div>
        <div class="art_p">
        </div>
         <div class="tit tit_left">
          <h2> <a   href="javascript:void(0);" class="show_art_p">项目成员</a></h2>  
          <div class="reversegrid down">  
              <asp:HyperLink ID="HyperLinkMProjMember" runat="server">管理</asp:HyperLink></div>
       </div>
        <div class="art_p">
            
        </div>
      </div>
      <script type="text/javascript">
          $(function () {
              $(".show_art_p").click(function () {
                  var srt_p = $(this).parent().parent().next(".art_p");
                  srt_p.siblings(".art_p").slideUp(500, function () {
                      srt_p.slideDown();
                  });
                  //$(".show_art_p").show();
                  //$(this).hide();

              });
              $(".art_p").hide().first().show();
          });
      </script>

      <div class="clear"></div>
    </div>
</asp:Content>
