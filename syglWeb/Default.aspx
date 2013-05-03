<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Site.Master" AutoEventWireup="true" EnableViewState="false"  CodeBehind="Default.aspx.cs" Inherits="syglWeb.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Style/iFadeSlide.css" rel="stylesheet" type="text/css" />
   <%-- <link href="slip_/source/Alice/one-full.css" rel="stylesheet" />--%>
    <script src="Scripts/jquery.iFadeSlide.pack.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('div#slide').iFadeSlide();
        });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="layout"> 
        <div class="chief fl">
            <div class="chief_main fl">
                <h1><a href="/clm.aspx?clm=1" class="h1title">通知公告</a><a href="/clm.aspx?clm=1" class="h1more">更多</a></h1>
                <ul>
                    <asp:Repeater ID="Repeater_tzgg" runat="server" OnItemDataBound="Repeater_tzgg_ItemDataBound" >
                        <ItemTemplate>
                            <li>
                                <h4>
                                    <asp:HyperLink ID="HyperLink_tzgg_title" runat="server"></asp:HyperLink>
                                </h4> 
                                <asp:Label ID="Label_tzgg_postTime" runat="server" Text="" CssClass="time_sp l23"></asp:Label>
                            </li> 
                        </ItemTemplate>
                    </asp:Repeater>
                   
                </ul>
            </div>
            <div class="chief_sub fr">                 
                    <div id="slide">
                        <asp:Repeater runat="server" ID="marquee">
                            <ItemTemplate>
                                <a href='<%# Eval("imgLink") %>'><img src='<%# Eval("imgFile") %>' alt="##"   /></a>
                            </ItemTemplate>
                        </asp:Repeater>
				        <div class="ico"></div>
			        </div>                 
                 <h1><a href="/clm.aspx?clm=2" class="h1title">工作动态</a><a href="/clm.aspx?clm=2" class="h1more">更多</a></h1>
                <ul >
                    <asp:Repeater ID="Repeater_gzdt" runat="server" OnItemDataBound="Repeater_gzdt_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="HyperLink_gzdt_title" runat="server"></asp:HyperLink> 
                                <asp:Label ID="Label_gzdt_postTime" runat="server" CssClass="time_sp l23" Text=""></asp:Label> 
                            </li> 
                        </ItemTemplate>
                    </asp:Repeater>
                     
                </ul>
            </div> 
        </div>
        <div class="extra fl">
            <h1><a href="/clm.aspx?clm=3" class="h1title">招标采购</a><a href="/clm.aspx?clm=3" class="h1more">更多</a></h1>
                <ul id="cg">
                    <asp:Repeater ID="Repeater_zbcg" runat="server" OnItemDataBound="Repeater_zbcg_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="HyperLink_zbcg_title" runat="server"></asp:HyperLink>
                                <asp:Label ID="Label_zbcg_postTime" runat="server" Text="" CssClass="time_sp l23"></asp:Label>
                            </li> 
                        </ItemTemplate>
                    </asp:Repeater>                          
                </ul>
        </div>
    </div>
    <div class="layout">
    <br />
         <div class="area_top"></div>
    
        <div class="subdoors">
            <ul>
                <li class="longTile"><a href="http://www.tust.edu.cn" class="subdoor" title="资产管理数字化平台从校园门户登陆！" ><i id="door1" class="door1">.</i><span class="sdtext">资产管理数字化平台</span></a></li>
                <li class="longTile"><a href="http://210.31.141.73/dzyh/Default_Stu.aspx" class="subdoor" ><i id="door2" class="door2">.</i><span class="sdtext">低值易耗品申领系统</span></a></li>
                <li class="longTile"><a href="http://210.31.141.73/dxyq/index.aspx" class="subdoor" ><i id="door3" class="door3">.</i><span class="sdtext">大型仪器预约系统</span></a></li>
                <li class="longTile"><a href="http://sygl.tust.edu.cn/webdecl/login.aspx" class="subdoor" ><i id="door6" class="door6">.</i><span class="sdtext">实验室信息上报系统</span></a></li>
                 <li class="shortTile"><a href="/slip/" target="_blank" class="subdoor" ><i id="door4" class="door4">.</i><span class="sdtext">创新平台</span></a></li>
                <li class="shortTile"><a href="/sf/index.html" class="subdoor" ><i id="door5" class="door5">.</i><span class="sdtext">示范中心</span></a></li>
            </ul>
            <script type="text/javascript">
                $(function () {
                    $(".subdoor").mouseenter(function () {
                        $(this).find("i").attr("class", function () {
                            return $(this).attr("id") + "h";
                        });
                    });
                    $(".subdoor").mouseleave(function () {
                        $(this).find("i").attr("class", function () {
                            return $(this).attr("id");
                        });
                    });
                });
            </script>
        </div>
    </div>
    <div class="layout">
    
        <div class="area_top"></div>
    <br />
        <div class="chief fl">
            <div class="chief_main fl">
                
                 <h1><a href="/clm.aspx?clm=4" class="h1title">办事流程</a><a href="/clm.aspx?clm=4" class="h1more">更多</a></h1>
                <ul id="home_bslc">
                    <asp:Repeater ID="Repeater_bslc" runat="server" OnItemDataBound="Repeater_bslc_ItemDataBound" >
                        <ItemTemplate>
                            <li>
                                <asp:HyperLink ID="HyperLink_bslc_title" runat="server"></asp:HyperLink>
                            </li> 
                        </ItemTemplate>
                    </asp:Repeater>
                      
                </ul>

                
                <h1><a href="downList.aspx" class="h1title">文档下载</a><a href="downList.aspx" class="h1more">更多</a></h1>
                <ul id="home_wdxz">
                    <asp:Repeater ID="Repeater_wdxz" runat="server" OnItemDataBound="Repeater_wdxz_ItemDataBound">
                        <ItemTemplate>
                             <li><asp:HyperLink ID="HyperLink_wdxz_title" runat="server"></asp:HyperLink></li>      
                        </ItemTemplate>
                    </asp:Repeater>
                              
                </ul>

            </div>
            <div class="chief_sub fr">
                <div class="pic_focus">
                    <img width="320" height="90" src="slip/Sources/Pictures/5.jpg" />
                </div>
                 <h1><a href="/clm.aspx?clm=5" class="h1title">规章制度</a><a href="/clm.aspx?clm=5" class="h1more">更多</a></h1>
                <ul style="height:280px; overflow:hidden;">
                    <asp:Repeater ID="Repeater_gzzd" runat="server"  OnItemDataBound="Repeater_gzzd_ItemDataBound" >
                        <ItemTemplate>
                             <li>
                                 <asp:HyperLink ID="HyperLink_gzzd_title" runat="server"></asp:HyperLink>
                                 
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                      
                </ul>
            </div> 
        </div>
        <div class="extra fl">
            
                <h1><a href="Department.aspx" class="h1title">机构设置</a><a href="Department.aspx" class="h1more">详细</a></h1>
                <ul id="ptm">   
                    <li id="pmt4"><a href="Department.aspx#pmt4">规划建设科 </a></li> 
                    <li id="pmt2"><a href="Department.aspx#pmt2">供应科</a></li> 
                    <li id="pmt3"><a href="Department.aspx#pmt3">物资设备管理科</a></li> 
                    <li id="pmt1"><a href="Department.aspx#pmt1">实验室管理科</a></li>
                    <li id="pmt5"><a href="Department.aspx#pmt5">计算中心</a> </li>  
                    <li id="pmt6"><a href="Department.aspx#pmt6">教育技术中心</a></li>  
                    <li id="pmt7"><a href="Department.aspx#pmt7">现代分析技术研究中心</a></li>
                </ul>
            <div id="home_flink" >
                <h3><a href="javascript:;" title="" >友情连接</a></h3>
                <ul>
                    <li><a href="http://www.tust.edu.cn">天津科技大学</a></li>
                    <li><a href="http://jw.tust.edu.cn">教务处</a></li>
                    <li><a href="http://www.tust.edu.cn">信息化办公室</a></li>
                    <li><a href="http://news.tust.edu.cn">科大新闻</a></li>
                </ul>
            </div>

        </div>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
