<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="syglWeb.slip.Discuss.Default" %>

<%@ Register Src="~/slip/Controls/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/slip/Controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/slip/Controls/hotTags.ascx" TagPrefix="uc1" TagName="hotTags" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <link type="text/css" rel="stylesheet" href="~/Slip/Style/Style.css" /> 
    <title>创新平台</title>    
    <link href="../Style/Discuss.css" rel="stylesheet/less" />
     <!--引入js库-->
    <script src="../../Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="../../Sourse/jquery_easyui/jquery.easyui.min.js" type="text/javascript"></script>
    <script src="../../Scripts/less-1.3.0.min.js" type="text/javascript"></script>
</head>
<body>
    <uc1:header runat="server" id="header" />
    
        <div id="page"> 
            <div id="pg_lf">
                <div id="dsc_guider">
                
                </div>
                <div id="dsc_list">  
                    <div id="dsc_li_header">
                        <div id="dsc_li_title">
                            <h2>创新论坛</h2>
                        </div>
                        <div id="dsc_li_sort">
                            <ul>
                                <li  class="dsc_sort_select"><a href="javascript:;">最热</a></li>
                                <li><a href="javascript:;">最新</a></li>
                                <li><a href="javascript:;">最近回复</a></li>
                                <li><a href="javascript:;">尚无回复</a></li>
                            </ul>
                        </div>
                    </div>               
                   <ul id="dsc_ul">

                       <asp:Repeater ID="RepeaterIssues" runat="server" OnItemDataBound="RepeaterIssues_ItemDataBound">
                           <ItemTemplate>
                               <li> 
                                   <asp:HyperLink ID="HyperLinkUserAvatar" runat="server" CssClass="dsc_li_portrait">
                                       <asp:Image ID="ImageUserAvatar" runat="server" width="50" height="50" />
                                   </asp:HyperLink>
                                                                  
                                    <div class="dsc_li_body">
                                       <h4>
                                           <asp:HyperLink ID="HyperLinkIssueTitle" runat="server"></asp:HyperLink>                                        
                                       </h4>
                                        <asp:Panel ID="PanelTags" runat="server" CssClass="dsc_tags">
                                            <asp:Repeater ID="RepeaterTags" runat="server"> 
                                                <ItemTemplate>
                                                     <a href="Default.aspx?tag=<%#Eval("tagID") %>" ><%# Eval("tagName") %></a>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </asp:Panel> 
                                       <div class="dsc_date">
                                           <span>
                                               <asp:HyperLink ID="HyperLinkUserName" runat="server"></asp:HyperLink> 发布于 1小时前 <asp:Label ID="Label1" runat="server" Text=""></asp:Label><asp:HyperLink ID="HyperLinkRepalyUser" runat="server"></asp:HyperLink></span>
                                       </div>
                                   </div>
                                    <a class="dsc_li_status">
                                        <ul>
                                           <li class="dsc_li_replay"><em>20</em>回复</li>
                                           <li class="dsc_li_vote"><em>12</em>赞</li>
                                           <li class="dsc_li_view"><em>45444</em>浏览</li>
                                       </ul>
                                    </a>
                               </li>
                           </ItemTemplate>
                       </asp:Repeater> 
                   </ul>  
         <div class="pager">
                    <asp:HyperLink ID="HyperLinkPrePage" runat="server"><<</asp:HyperLink>                     
                    <asp:Label ID="LabelPages" runat="server" Text=""></asp:Label>
                    <asp:HyperLink ID="HyperLinkNextPage" runat="server">>></asp:HyperLink>
                </div>
                </div>
            
            </div>
            <div id="pg_rt">
                <a class="dsc_rt_openTopic" href="postIssue.aspx">发起话题</a>
                <uc1:hotTags runat="server" id="hotTags1" />
            </div>
      <div class="clear"></div>
      </div>
        <uc1:footer runat="server" id="footer" /> 
</body>
</html>
