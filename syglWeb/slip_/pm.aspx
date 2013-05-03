<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pm.aspx.cs" Inherits="syglWeb.slip_.pm" %>

<%@ Register Src="~/slip_/hd.ascx" TagPrefix="uc1" TagName="hd" %>

<%@ Register Src="~/slip_/lm.ascx" TagPrefix="uc1" TagName="lm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>创新平台-天津科技大学</title> 
    <link href="source/Alice/one-full.css" rel="stylesheet" />
    <link href="source/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="source/easyui/themes/icon.css" rel="stylesheet" />
    <link href="css/slip.css" rel="stylesheet" />
    <script src="js/jquery-1.9.1.min.js"></script> 
    <script src="source/easyui/jquery.easyui.min.js"></script>
    <script src="source/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="source/easyui/easyui_ex.js"></script>
    <script src="source/easyui/jquery_easyUI_dialog_form.js"></script>
    <style type="text/css">
        .ui-step li { 
            height: 65px;
        }
        .ui-step-icon .ui-step-text {
            left: -45px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
        <uc1:hd runat="server" id="hd" />
        <div class="ui-grid-row">
            <div class="ui-grid-7">
                <uc1:lm runat="server" id="lm" />
            </div>
            <div class="ui-grid-18">
                <div class="ui-box">
                     <div class="ui-box-head">
                        <div class="ui-box-head-border">
                            <h3 class="ui-box-head-title">2013年开放基金项目进度</h3>
                        </div>
                    </div>
                    <div class="ui-box-container">
                        <div class="ui-box-content">
                            <ol class="ui-step ui-step-blue ui-step-5">
                                <li class="ui-step-start ui-step-done">
                                    <div class="ui-step-line">-</div>    
                                    <div class="ui-step-icon">        
                                        <i class="iconfont">y</i>
                                        <i class="ui-step-number">1</i>
                                        <span class="ui-step-text">题目征集<br />(3.14-4.16)</span>
                                    </div>
                                </li>
                                <li class="ui-step-done">
                                    <div class="ui-step-line">-</div>    
                                    <div class="ui-step-icon">
                                        <i class="iconfont">y</i>
                                        <i class="ui-step-number">2</i>
                                        <span class="ui-step-text">第二步<br />(4.16-6.17)</span>
                                    </div>
                                </li>
                                <li class="ui-step-done">
                                    <div class="ui-step-line">-</div>        
                                    <div class="ui-step-icon">
                                        <i class="iconfont">y</i>
                                        <i class="ui-step-number">3</i>
                                        <span class="ui-step-text">第三步</span>
                                    </div>
                                </li>
                                <li class="ui-step-active">
                                    <div class="ui-step-line">-</div>    
                                    <div class="ui-step-icon">
                                        <i class="iconfont">y</i>
                                        <i class="ui-step-number">4</i>
                                        <span class="ui-step-text">第四步</span>
                                    </div>
                                </li>
                                <li class="ui-step-end">
                                    <div class="ui-step-line">-</div>    
                                    <div class="ui-step-icon">
                                        <i class="iconfont">y</i>
                                        <i class="iconfont ui-step-number"></i>
                                        <span class="ui-step-text">第五步</span>
                                    </div>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
                <br />
                <div class="ui-tipbox ui-tipbox-warning" style="margin-bottom:8px;">
                    <div class="ui-tipbox-icon">
                        <i class="iconfont" title="提示"></i>
                    </div>
                    <div class="ui-tipbox-content">
                        <h3 class="ui-tipbox-title">您还没有项目</h3>
                        <p class="ui-tipbox-explain">您还没有开放基金的项目，请按照开放基金申请流程申请项目。</p>
                    </div>
                </div>
                <table class="ui-table">
                                <tbody>
                                    <tr>
                                        <td colspan="4" class="ui-table-selected" style="padding:0;">
                                            <div class="ui-box ui-box-light ">
                                                <div class="ui-box-head ">
                                                    <div class="ui-box-head-border">
                                                        <h3 class="ui-box-head-title">我的项目</h3>
                                                         <span class="ui-box-head-text">项目进度：<i style="color:#f14006;"><span>已结题</span></i></span>
                                                    </div>
                                                </div>
                                             </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="80">
                                            <img src="file/0031@2x.png" width="70" alt="项目" />
                                        </td>
                                        <td width="370">
                                            <p>简介：</p>
                                            <p>关于AppGratis被苹果公司从 App Store中撤下，其创始人西蒙·达瓦特（Simon Dawlat）表示他对此“难以置信”。西蒙的反应是正常的。苹果公司的举动似乎有点反复无常，就在几天之前它刚刚批准了AppGratis的iPad版本。</p>
                                        </td>
                                        <td width="70">
                                            <p>主持人：</p>
                                            <p>王凡</p>
                                        </td>
                                        <td >
                                            <p><a href="javascript:;" class="ui-button ui-button-sblue">项目预览</a></p>
                                            <br />
                                            <p><a href="javascript:;" class="ui-button ui-button-sblue">项目管理</a></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="ui-table-selected" style="padding:0;">
                                            <div class="ui-box ui-box-light ">
                                                <div class="ui-box-head ">
                                                    <div class="ui-box-head-border">
                                                        <h3 class="ui-box-head-title">我的项目</h3>
                                                         <span class="ui-box-head-text">其他文字</span>
                                                    </div>
                                                </div>
                                             </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="80">
                                            <img src="file/0031@2x.png" width="70" alt="项目" />
                                        </td>
                                        <td width="370">
                                            <p>简介：</p>
                                            <p>关于AppGratis被苹果公司从 App Store中撤下，其创始人西蒙·达瓦特（Simon Dawlat）表示他对此“难以置信”。西蒙的反应是正常的。苹果公司的举动似乎有点反复无常，就在几天之前它刚刚批准了AppGratis的iPad版本。</p>
                                        </td>
                                        <td width="70">
                                            <p>主持人：</p>
                                            <p>王凡</p>
                                        </td>
                                        <td >
                                            <p><a href="javascript:;" class="ui-button ui-button-sblue">项目预览</a></p>
                                            <br />
                                            <p><a href="javascript:;" class="ui-button ui-button-sblue">项目管理</a></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="ui-table-selected" style="padding:0;">
                                            <div class="ui-box ui-box-light ">
                                                <div class="ui-box-head ">
                                                    <div class="ui-box-head-border">
                                                        <h3 class="ui-box-head-title">我的项目</h3>
                                                         <span class="ui-box-head-text">其他文字</span>
                                                    </div>
                                                </div>
                                             </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="80">
                                            <img src="file/0031@2x.png" width="70" alt="项目" />
                                        </td>
                                        <td width="370">
                                            <p>简介：</p>
                                            <p>关于AppGratis被苹果公司从 App Store中撤下，其创始人西蒙·达瓦特（Simon Dawlat）表示他对此“难以置信”。西蒙的反应是正常的。苹果公司的举动似乎有点反复无常，就在几天之前它刚刚批准了AppGratis的iPad版本。</p>
                                        </td>
                                        <td width="70">
                                            <p>主持人：</p>
                                            <p>王凡</p>
                                        </td>
                                        <td >
                                            <p><a href="javascript:;" class="ui-button ui-button-sblue">项目预览</a></p>
                                            <br />
                                            <p><a href="javascript:;" class="ui-button ui-button-sblue">项目管理</a></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="ui-table-selected" style="padding:0;">
                                            <div class="ui-box ui-box-light ">
                                                <div class="ui-box-head ">
                                                    <div class="ui-box-head-border">
                                                        <h3 class="ui-box-head-title">我的项目</h3>
                                                         <span class="ui-box-head-text">其他文字</span>
                                                    </div>
                                                </div>
                                             </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="80">
                                            <img src="file/0031@2x.png" width="70" alt="项目" />
                                        </td>
                                        <td width="370">
                                            <p>简介：</p>
                                            <p>关于AppGratis被苹果公司从 App Store中撤下，其创始人西蒙·达瓦特（Simon Dawlat）表示他对此“难以置信”。西蒙的反应是正常的。苹果公司的举动似乎有点反复无常，就在几天之前它刚刚批准了AppGratis的iPad版本。</p>
                                        </td>
                                        <td width="70">
                                            <p>主持人：</p>
                                            <p>王凡</p>
                                        </td>
                                        <td >
                                            <p><a href="javascript:;" class="ui-button ui-button-sblue">项目预览</a></p>
                                            <br />
                                            <p><a href="javascript:;" class="ui-button ui-button-sblue">项目管理</a></p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="ui-table-selected" style="padding:0;">
                                            <div class="ui-box ui-box-light ">
                                                <div class="ui-box-head ">
                                                    <div class="ui-box-head-border">
                                                        <h3 class="ui-box-head-title">我的项目</h3>
                                                         <span class="ui-box-head-text">其他文字</span>
                                                    </div>
                                                </div>
                                             </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="80">
                                            <img src="file/0031@2x.png" width="70" alt="项目" />
                                        </td>
                                        <td width="370">
                                            <p>简介：</p>
                                            <p>关于AppGratis被苹果公司从 App Store中撤下，其创始人西蒙·达瓦特（Simon Dawlat）表示他对此“难以置信”。西蒙的反应是正常的。苹果公司的举动似乎有点反复无常，就在几天之前它刚刚批准了AppGratis的iPad版本。</p>
                                        </td>
                                        <td width="70">
                                            <p>主持人：</p>
                                            <p>王凡</p>
                                        </td>
                                        <td >
                                            <p><a href="javascript:;" class="ui-button ui-button-sblue">项目预览</a></p>
                                            <br />
                                            <p><a href="javascript:;" class="ui-button ui-button-sblue">项目管理</a></p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                <div class="ui-paging">
                                <a href="#" class="ui-paging-prev">
                                    <i class="iconfont" title="左三角形"></i>上一页
                                </a>
                                <a href="#" class="ui-paging-item">1</a>
                                <a href="#" class="ui-paging-item ui-paging-current">2</a>
                                <a href="#" class="ui-paging-item">3</a>
                                <a href="#" class="ui-paging-item">4</a>
                                <a href="#" class="ui-paging-item">5</a>
                                <a href="#" class="ui-paging-item">6</a>
                                <a href="#" class="ui-paging-item">7</a>
                                <span class="ui-paging-ellipsis">...</span>
                                <a href="#" class="ui-paging-item">24</a>
                                <a href="#" class="ui-paging-next">下一页 <i class="iconfont" title="右三角形"></i>
                                </a>
                                <span class="ui-paging-info"><span class="ui-paging-bold">5/7</span>页</span>
                                <span class="ui-paging-which"><input name="some_name" value="6" type="text"></span>
                                <a class="ui-paging-info ui-paging-goto" href="#">跳转</a>
                            </div>
           </div>
                    
        </div>
    </div>
    </form>
</body>
</html>
