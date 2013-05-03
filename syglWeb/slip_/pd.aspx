<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pd.aspx.cs" Inherits="syglWeb.slip_.pd" %>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->  <html class="no-js" lang="en"> <!--<![endif]-->
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>创新平台-天津科技大学</title> 
    <link href="source/Alice/one-full.css" rel="stylesheet" />
    <link href="source/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="source/easyui/themes/icon.css" rel="stylesheet" />
    <link href="css/slip.css" rel="stylesheet" />
    <link href="source/jquery.slideViewerPro.1.5/svwp_style.css" rel="stylesheet" />
    <script src="js/jquery-1.8.0.min.js"></script> 
    <script src="source/easyui/jquery.easyui.min.js"></script>
    <script src="source/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="source/easyui/easyui_ex.js"></script>
    <script src="source/easyui/jquery_easyUI_dialog_form.js"></script>
    <script src="source/jquery.slideViewerPro.1.5/jquery.slideViewerPro.1.5.js"></script>
    <script src="source/jquery.slideViewerPro.1.5/jquery.timers.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
        <div class="ui-grid-row">
            <div class="ui-grid-8">
                <div id="logo">.</div>
            </div>
        </div>
        <div class="ui-grid-row">            
            <div class="ui-grid-25">
                <div class="ui-nav ui-nav-nosub">
                    <ul class="ui-nav-main">
                    <li class="ui-nav-item ui-nav-item-current">
                        <a href="#">首页</a> 
                    </li>
                    <li class="ui-nav-item ">
                        <a href="#">创新资讯</a>
                        <ul class="ui-nav-submain">
                        <li class="ui-nav-subitem"><a href="#">二级导航 2-1</a></li>
                        <li class="ui-nav-subitem ui-nav-subitem-current"><a href="#">二级导航 2-2</a></li>
                        <li class="ui-nav-subitem"><a href="#">二级导航 2-3</a></li>
                        </ul>
                    </li>
                    <li class="ui-nav-item">
                        <a href="#">创新成果</a> 
                    </li>
                    <li class="ui-nav-item"><a href="#">项目管理</a></li>
                    <li class="ui-nav-item"><a href="#">项目支持</a></li>
                    <li class="ui-nav-item"><a href="#">创新论坛</a></li>
                    </ul>
                    <div class="ui-nav-subcontainer"></div>
                </div>
            </div>
        </div>
        <div class="ui-grid-row">
             <div class="crumb">        			              																																																													<a href="http://help.alipay.com/lab/index.htm" seed="helpCrumb-link" smartracker="on">帮助中心</a>
					&gt; <a href="#" >付款方式</a>
					&gt; <a href="#" >快捷支付（含卡通）</a>
					&gt; <a href="#" ><font style="font-weight:bold">快捷支付（含卡通）介绍</font></a>							
                </div>
        </div>
        <div class="ui-grid-row"> 
            <div class="ui-grid-18">
                <div class="ui-grid-row">
                        <div class="ui-grid-18">
                           <div id="my-folio-of-works"  class="svwp">
                            <ul>
                                <li><img alt="Meander - P.J. Onori"  src="file/1.jpg" width="700" height="350" /></li>
                                <li><img alt="Flock and Predator - L. Ongaro"  src="file/2.jpg" width="700"  height="350"  /></li>
                                <li><img alt="Empathy - K. McDonald"  src="file/3.jpg" width="700" height="350"  /></li>
                                <li><img alt="DIY 3D Scanner - K. McDonald"  src="file/4.jpg" width="700" height="350"  /></li>
                                <li><img alt="DIY 3D Scanner - K. Scanner - K. McDonaldDIY 3D Scanner - K. McDonaldDIY 3D Scanner - K. McDonaldDIY 3D Scanner - K. McDonaldDIY 3D Scanner - K. McDonald"  src="file/5.jpg" width="700" height="350"  /></li>
                                <li><img alt="DIY 3D Scanner - K. McDonald"  src="file/4.jpg" width="700" height="350"  /></li>
                                <li><img alt="DIY 3D Scanner - K. McDonald"  src="file/5.jpg" width="700" height="350"  /></li>
                                <li><img alt="DIY 3D Scanner - K. McDonald"  src="file/4.jpg" width="700" height="350"  /></li>
                                <li><img alt="DIY 3D Scanner - K. McDonald"  src="file/5.jpg" width="700" height="350"  /></li>
                                <!--eccetera-->
                            </ul>
                        </div>  
                        </div>
                    </div>
                 <div class="ui-grid-row">
                        <div class="ui-grid-18">
                            <div class="help-detail"> 
                                 <div class="ui-box"> 
                     <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">项目负责人</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <div class="ul_support">
                                  <a  href="#">2013年开放基金优秀项目</a>
                                  <a  href="#">2012年开放基金优秀项目</a>
                                  <a  href="#">2011年开放基金优秀项目</a>
                                  <a  href="#">2010年开放基金优秀项目</a>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="ui-box  ui-box-follow">
                    <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">项目成绩</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <ul class="ui-list">
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                                <li class="ui-list-item"><a href="#">如何提现？</a></li>
                                <li class="ui-list-item"><a href="#">支付宝数字证书有什么作用？</a></li>
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ui-box ui-box-follow">
                    <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">项目成员</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <ul class="ui-list">
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                                <li class="ui-list-item"><a href="#">如何提现？</a></li>
                                <li class="ui-list-item"><a href="#">支付宝数字证书有什么作用？</a></li>
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
           

		                    </div>
                        </div>
                    </div>
            </div>
            <div class="ui-grid-7">
                <div class="ui-box"> 
                     <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">项目负责人</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <div class="ul_support">
                                  <a  href="#">2013年开放基金优秀项目</a>
                                  <a  href="#">2012年开放基金优秀项目</a>
                                  <a  href="#">2011年开放基金优秀项目</a>
                                  <a  href="#">2010年开放基金优秀项目</a>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="ui-box  ui-box-follow">
                    <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">项目成绩</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <ul class="ui-list">
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                                <li class="ui-list-item"><a href="#">如何提现？</a></li>
                                <li class="ui-list-item"><a href="#">支付宝数字证书有什么作用？</a></li>
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ui-box ui-box-follow">
                    <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">项目成员</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <ul class="ui-list">
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                                <li class="ui-list-item"><a href="#">如何提现？</a></li>
                                <li class="ui-list-item"><a href="#">支付宝数字证书有什么作用？</a></li>
                                <li class="ui-list-item"><a href="#">如何申请认证？</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
           
            </div>
        </div>
    </div>
    </form>
    <script type="text/javascript">
        $(window).bind("load", function () {
            $("div#my-folio-of-works").slideViewerPro({
                thumbs: 7,
                autoslide: true,
                asTimer: 3500,
                typo: true,
                galBorderWidth: 0,
                thumbsBorderOpacity: 0.8,
                buttonsTextColor: "#707070",
                buttonsWidth: 30,
                thumbsActiveBorderOpacity: 0.8,
                thumbsActiveBorderColor: "aqua",
                shuffle: true
            });
        }); 
    </script>
</body>
</html>