<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/SlipSite.Master" AutoEventWireup="true" CodeBehind="ProjectDetail.aspx.cs" Inherits="syglWeb.slip.Projects.ProjectDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
     #galleria{height:320px;}
     .style2{width: 27%;}
    </style>
<script type="text/javascript" src="/Scripts/galleria-1.2.8.min.js" ></script>
<script type="text/javascript">
    $(function () {
        // Load the classic theme
        Galleria.loadTheme('<%=ResolveUrl("~/Scripts/galleriaThemes/classic/galleria.classic.min.js")%>');
        // Initialize Galleria
        Galleria.run('#galleria');

        $(".show_art_p").click(function () {
            var srt_p = $(this).parent().parent().next(".art_p");           
            srt_p.siblings(".art_p").slideUp(500,function(){
                srt_p.slideDown();
            }); 
        });
        $(".art_p").hide().first().show();
    });
</script>
</asp:Content>
<asp:Content ID="ContentActive" ContentPlaceHolderID="ContentPlaceHolderActive" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPage" runat="server">

    <form id="form1" runat="server">

    <div class="tit tit_left">
        <h2> 天津科技大学材料、易耗品申购和领取流程 </h2>
    </div>
<div class="grid left_side">
      <div id="galleria">
          <asp:Repeater ID="RepeaterTopicImg" runat="server" 
              DataSourceID="AccessDataSourceTopicImg">
            <ItemTemplate>                 
            <a href="<%# Eval("topicImgFile") %>">
                <img data-title=""
                     data-description="<%# Eval("topicImgInfo") %>"
                     src="<%# Eval("topicImgMini") %>">
            </a>
            </ItemTemplate>
          </asp:Repeater>
           
          <asp:AccessDataSource ID="AccessDataSourceTopicImg" runat="server" 
              DataFile="~/App_Data/slipDB.mdb" 
              SelectCommand="SELECT * FROM [topicImgTB] WHERE ([forTopic] = ?)">
              <SelectParameters>
                  <asp:QueryStringParameter Name="forTopic" QueryStringField="tid" Type="Int32" />
              </SelectParameters>
          </asp:AccessDataSource>
      </div>
      <div class="clear"></div>
      <div class="proj_detail">
        <div class="tit tit_left">
          <h2>  <a   href="javascript:void(0);" class="show_art_p">项目说明</a></h2>  
          <div class="reversegrid down"> <a  href="javascript:void(0);" class="show_art_p">详细</a> </div>
        </div>
        <div class="art_p">
            <asp:Label ID="LabelTopicInfo" runat="server" Text=""></asp:Label>
        </div>
         <div class="tit tit_left">
              <h2> <a   href="javascript:void(0);" class="show_art_p">实施方案</a></h2>  
              <div class="reversegrid down"> <a  href="javascript:void(0);" class="show_art_p">详细</a> </div>
         </div>
        <div class="art_p">
            <asp:Label ID="LabelProjectPlan" runat="server" Text="暂无说明"></asp:Label>
        </div>
        <div class="tit tit_left">
          <h2> <a   href="javascript:void(0);" class="show_art_p">项目成果</a></h2>  
          <div class="reversegrid down"> <a  href="javascript:void(0);" class="show_art_p">详细</a> </div>
       </div>
        <div class="art_p">
            <asp:Label ID="LabelProjectResult" runat="server" Text="暂无说明"></asp:Label>
        </div>
      </div>
    </div>
    <div class="grid right_side">
      <div class="grid mac_rightside">
        <div class="r_top"><span class="s_t_zj"></span> <span class="r_t_mid_right"></span> <span class="s_t_yj"></span> </div>
        <div class="r_mid_right" style=" height:auto;">
          <div class="info_title"><a href="javascript:;">项目负责人</a></div>
          <div class="info_content">            
              <table align="center" cellpadding="0" cellspacing="0" style="width:100%; line-height:2em;">
                  <tr>
                      <td rowspan="3"  align="center">
                          <asp:Image ID="ImageAvata" runat="server" Width="100" />
                      </td>
                      <td align="center">
                          <asp:Label ID="LabelUserName" runat="server" Text=""></asp:Label>
                      </td>
                      <td align="center">
                        <asp:Label ID="LabelUserPst" runat="server" Text=""></asp:Label>
                      </td>                      
                  </tr>
                  <tr>
                      <td colspan="2">所在单位:<br /><asp:Label ID="LabelUserCollege" runat="server" Text=""></asp:Label>
                      </td>
                  </tr>
                  <tr>
                      <td colspan="2" >研究方向:<br /><asp:Label ID="LabelUserMajor" runat="server" Text=""></asp:Label>
                      </td>
                  </tr>
                  <tr>
                    <td colspan="3">
                        <p style="line-height:2em; text-indent:2em; padding: 0 5px;">
                            <asp:Label ID="LabelUserIntro" runat="server" Text=""></asp:Label>
                        </p>
                    </td>
                  </tr>
              </table>
            
          </div>
        </div>
        <div class="r_bottom"> <span class="s_b_zj"></span> <span class="r_b_mid_right"></span> <span class="s_b_yj"></span> </div>
      </div>
      <div class="more_recommended">
		<div class="tit tit_right">
          	<h2><a href="#">项目成员</a></h2>
            <script type="text/javascript">
                $(function () {
                    $(".proj_mumber_link").hover(function () {
                        $(this).siblings().stop().slideDown();
                    }, function () { $(this).siblings().stop().slideUp(); });
                    $(".proj_mumber_infor").hover(function () {
                        $(this).stop().slideDown();
                    }, function () { $(this).stop().slideUp(); });
                });
    </script>
        </div>
        <div class="proj_number">
            <asp:Repeater ID="RepeaterTopicMb" runat="server" 
                DataSourceID="AccessDataSourceTopicMb">
                <ItemTemplate>                    
                <div class="proj_mumber_item">
                <a href="javascript:void(0);" class="proj_mumber_link"><%# Eval("topicMbName") %>——<%# Eval("topicMbCollege") %></a>
                <div class="proj_mumber_infor">
                    <table cellpadding="0" cellspacing="0" style="width:240px;" align="center">
                    <tr>
                        <td align="center" valign="middle" class="style2"><%# Eval("topicMbPst") %>                          
                        </td>
                        <td align="right">专业方向:</td>
                        <td width="50%" align="left"><%# Eval("topicMbMajor") %></td>
                    </tr>
                    <tr>
                        <td align="center" class="style2">项目分工：
                            
                        </td>
                        <td colspan="2" align="left"><%# Eval("topicMbWork") %>   
                          
                        </td>
                      </tr>
                </table>
                </div>                
            </div>
                </ItemTemplate>
            </asp:Repeater>
            
            <asp:AccessDataSource ID="AccessDataSourceTopicMb" runat="server" 
                DataFile="~/App_Data/slipDB.mdb" 
                SelectCommand="SELECT * FROM [topicMbTb] WHERE ([mbForTopic] = ?) ORDER BY [topicMbIdentity], [topicMbID]">
                <SelectParameters>
                    <asp:QueryStringParameter Name="mbForTopic" QueryStringField="tid" 
                        Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>
            
        </div>
      </div>
       
      <div class="discuss">
        <div class="tit tit_right">
          <h2>创新论坛</h2>
        </div>
        <div class="discuss_box">
        	<ul>
            	<li><em class="hot">1</em><a  href="#">3屏幕产能不足 iPad mini未上市将缺货</a><p><a>111123人参与</a></p></li>
                <li><em class="hot">1</em><a  href="#">3屏幕产能不足 iPad mini未上市将缺货</a><p><a>23人参与</a></p></li>
                <li><em class="hot">1</em><a  href="#">3屏幕产能不足 iPad mini未上市将缺货</a><p><a>23人参与</a></p></li>
                <li><em>1</em><a  href="#">3屏幕产能不足 iPad mini未上市将缺货</a><p><a>23人参与</a></p></li>
                <li><em>1</em><a  href="#">3屏幕产能不足 iPad mini未上市将缺货</a><p><a>23人参与</a></p></li>
            </ul>
        </div>
      </div>
    </div>
    </form>
</asp:Content>
