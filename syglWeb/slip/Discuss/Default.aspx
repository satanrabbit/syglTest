<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="syglWeb.slip.Discuss.Default" %>

<%@ Register Src="~/slip/Controls/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/slip/Controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>



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
                   <li>
                       <a class="dsc_li_portrait"><img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="50" height="50" /></a>
                       <div class="dsc_li_body">
                           <h4><a href="javascript:;" title="">如此理解面向对象编程</a></h4>                           
                           <div class="dsc_tags">
                               <a href="javascript:;" >计算机</a>
                               <a href="javascript:;" >软件</a>
                               <a href="javascript:;" >网络</a>
                           </div>
                           <div class="dsc_date">
                               <span>jakic 发布于 1小时前 ，最后回答(7分钟前)：<a href="javascript:;" class="dsc_rp">苏三</a></span>
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
                   <li>
                       <a class="dsc_li_portrait"><img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="50" height="50" /></a>
                       <div class="dsc_li_body">
                           <h4><a href="javascript:;" title="">Java Web 服务性能优化实践</a></h4>                           
                           <div class="dsc_tags">
                               <a href="javascript:;" >计算机</a>
                               <a href="javascript:;" >软件</a>
                               <a href="javascript:;" >网络</a>
                           </div>
                           <div class="dsc_date">
                               <span>jakic 发布于 1小时前 ，最后回答(7分钟前)：<a href="javascript:;" class="dsc_rp">苏三</a></span>
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
                   <li>
                       <a class="dsc_li_portrait"><img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="50" height="50" /></a>
                       <div class="dsc_li_body">
                           <h4><a href="javascript:;" title="">探索 Python、机器学习和 NLTK 库</a></h4>                           
                           <div class="dsc_tags">
                               <a href="javascript:;" >计算机</a>
                               <a href="javascript:;" >软件</a>
                               <a href="javascript:;" >网络</a>
                           </div>
                           <div class="dsc_date">
                               <span>jakic 发布于 1小时前 ，最后回答(7分钟前)：<a href="javascript:;" class="dsc_rp">苏三</a></span>
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
                   <li>
                       <a class="dsc_li_portrait"><img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="50" height="50" /></a>
                       <div class="dsc_li_body">
                           <h4><a href="javascript:;" title="">java应用（非web应用）中log4j.properties动态修改配置文件，无需重启，就能立即生效---自动加载</a></h4>                           
                           <div class="dsc_tags">
                               <a href="javascript:;" >计算机</a>
                               <a href="javascript:;" >软件</a>
                               <a href="javascript:;" >网络</a>
                           </div>
                           <div class="dsc_date">
                               <span>jakic 发布于 1小时前 ，最后回答(7分钟前)：<a href="javascript:;" class="dsc_rp">苏三</a></span>
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
                   <li>
                       <a class="dsc_li_portrait"><img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="50" height="50" /></a>
                       <div class="dsc_li_body">
                           <h4><a href="javascript:;" title="">Win8系统中文输入法福利,让你使用win7的习惯切换输入法</a></h4>                           
                           <div class="dsc_tags">
                               <a href="javascript:;" >计算机</a>
                               <a href="javascript:;" >软件</a>
                               <a href="javascript:;" >网络</a>
                           </div>
                           <div class="dsc_date">
                               <span>jakic 发布于 1小时前 ，最后回答(7分钟前)：<a href="javascript:;" class="dsc_rp">苏三</a></span>
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
               </ul> 
                

    <div class="pager">
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">7</a>
        <a href="#">8</a>
    </div>
            </div>
            
        </div>
        <div id="pg_rt">
            <a class="dsc_rt_openTopic" href="javascript:;">发起话题</a>

            <div class="dsc_rt_hotTags">
                <h3>热门标签<a class="hot_tg_more" href="javascript:;">全部标签</a></h3>
                <p>
                    <a href="javascript:;">计算机</a>
                    <a href="javascript:;">算法</a>
                    <a href="javascript:;">机械</a>
                    <a href="javascript:;">开英语发</a>
                    <a href="javascript:;">计算机</a>
                    <a href="javascript:;">算法</a>
                    <a href="javascript:;">计算机</a>
                    <a href="javascript:;">算法</a>
                    <a href="javascript:;">机械</a>
                    <a href="javascript:;">开英语发</a>
                    <a href="javascript:;">计算机科学计算机科学</a>
                    <a href="javascript:;">算学法</a>
                    <a href="javascript:;">视频编制</a>
                    <a href="javascript:;">机械</a>
                    <a href="javascript:;">开英语发</a>
                    <a href="javascript:;">计算机科学计算机科学</a>
                    <a href="javascript:;">算学法</a>
                    <a href="javascript:;">视频编制</a>
                    <a href="javascript:;">计算机科学计算机科学</a>
                    <a href="javascript:;">算学法</a>
                    <a href="javascript:;">视频编制</a>
                </p>
            </div>
        </div>
  <div class="clear"></div>
  </div>
    <uc1:footer runat="server" id="footer" />

</body>
</html>
