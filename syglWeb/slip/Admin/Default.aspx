<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="syglWeb.slip.Admin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     
    <!--引入样式表，含js框架样式和自定义样式-->
    <!--easyui样式-->
    <link href="../../Sourse/jquery_easyui/themes/metro/easyui.css" type="text/css" rel="stylesheet" />
    <link href="../../Sourse/jquery_easyui/themes/icon.css" rel="stylesheet" type="text/css"  />
    <!--基础样式-->     
    <link href="style/base.css" rel="stylesheet" />
    <!--页面样式--> 
    <!--引入js库-->
    <script src="../../Scripts/jquery-1.8.2.min.js"></script>
    <script src="../../Sourse/kindeditor_4.1.3/kindeditor-all-min.js"></script>
    <script src="../../Sourse/jquery_easyui/jquery.easyui.min.js"></script>
    <script src="../../Sourse/jquery_easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="../../Scripts/less-1.3.0.min.js"></script>
    <script src="../../Sourse/jquery_easyui/easyui_ex.js"></script>
    <script type="text/javascript">
        $(function () {
            var centerTabs = $('#centerTabs').tabs({
                fit: true,
                border: false
            });
            $.extend({
                addTab: function (node, centerTabs) {
                    if (centerTabs.tabs('exists', node.text)) {
                        centerTabs.tabs('select', node.text);
                    }
                    else {
                        if (node.attributes.url && node.attributes.url.length > 0) {
                            $.messager.progress({
                                text: '页面加载中....',
                                interval: 100
                            });
                            centerTabs.tabs('add', {
                                title: node.text,
                                closable: true,
                                content: '<iframe  src="' + node.attributes.url + '"  frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>'
                            });
                        }
                        else {
                            centerTabs.tabs('add', {
                                title: node.text,
                                closable: true,
                                herf: node.attributes.url
                            });
                        }
                    }
                },
                msg_progress_close: function () {
                    window.setTimeout(function () {
                        $.messager.progress('close');
                    }, 200);
                }
            });
            $(".menuLink").click(function () {
                var $this = $(this);
                var nd = { text: $this.text(), attributes: { url: $this.attr("href") } };
                $.addTab(nd, centerTabs);
                return false;
            });
        });
    </script>
</head>
<body class="easyui-layout">
    <form id="form1" runat="server">
	    <div data-options="region:'north',border:false"   style="height:50px;padding:0 10px;">
		    <div style="position:relative;height:45px;">
                创新平台后台管理系统
                <div style="position:absolute;right:20px;bottom:2px;">
                     <a class="easyui-linkbutton" href="/" target="_blank" data-options="iconCls:'icon-photo'">网站首页</a>
                    <a class="easyui-linkbutton" href="logOut.ashx" data-options="iconCls:'icon-door_out'">退出</a>
                </div>
		    </div>
	    </div >
	    <div data-options="region:'east',iconCls:'icon-reload',collapsed:true,split:true" title="关于" style="width:180px;">
            <div style=" margin:5px auto; text-align:center;">
                <p>本系统由&emsp;<em style="color:#9d0808; text-decoration:line-through;">夏千祥</em>&emsp;制作；</p><p>
                    功能完善中</p>
                <p> 
                </p>
                <p>
                    <a target="_blank" href="http://sighttp.qq.com/authd?IDKEY=7f760ae65ebc912e2fae2a8eb892bf4d965de99d8b77905c">
                        <img border="0"  src="http://wpa.qq.com/imgd?IDKEY=7f760ae65ebc912e2fae2a8eb892bf4d965de99d8b77905c&pic=50" alt="点击这里给我发消息" title="点击这里给我发消息">
                    </a>
                </p>
            </div>
	    </div>
	    <div data-options="region:'west',split:true" title="管理面板" style="width:180px;padding:1px;overflow:hidden;">
		    <div class="easyui-accordion" data-options="fit:true,border:false">
			    <div title="账号" style="padding:10px;overflow:auto;" data-options="selected:true">
				   
			    </div>
			    <div title="内容管理"  style="padding:10px 0; text-align:left;">
				    <ul style="padding:3px 0; text-align:left;">
                        <li><a href="news.aspx" class="menuLink easyui-linkbutton" data-options="iconCls:'icon-page_white_gear',plain:true">创新资讯</a></li>
                        <li><a href="op.aspx" class="menuLink easyui-linkbutton" data-options="iconCls:'icon-page_white_gear',plain:true">创新成果（旧）</a></li>
                        <li><a href="spt.aspx" class="menuLink easyui-linkbutton" data-options="iconCls:'icon-page_white_gear',plain:true">项目支持</a></li>                        
                        <li><a href="about.aspx" class="menuLink easyui-linkbutton" data-options="iconCls:'icon-page_white_gear',plain:true">关于</a></li>
                        
				    </ul>
			    </div>
                
			    <div title="项目管理" style="padding:10px 0;text-align:left;">
                <ul style="padding:3px  0px;text-align:left;">
                    <li><a href="pc.aspx" class="menuLink easyui-linkbutton" data-options="iconCls:'icon-page_white_gear',plain:true">进度管理</a></li>
                    <li><a href="pm.aspx" class="menuLink easyui-linkbutton" data-options="iconCls:'icon-page_white_gear',plain:true">项目评审</a></li> 
                    <li><a href="#" class="menuLink easyui-linkbutton" data-options="iconCls:'icon-page_white_gear',plain:true">用户管理</a></li>                        
				</ul>
			    </div>
                <div title="论坛管理" style="padding:10px 0;text-align:left;">
                <ul style="padding:3px  0px;text-align:left;">
                    <li><a href="pages/marquee.aspx" class="menuLink easyui-linkbutton" data-options="iconCls:'icon-page_white_gear',plain:true">论坛话题</a></li>
                    <li><a href="#" class="menuLink easyui-linkbutton" data-options="iconCls:'icon-page_white_gear',plain:true">评论回复</a></li>                         
				</ul>
			    </div>
		    </div>
	    </div>
	    <div data-options="region:'center'"  style="overflow:hidden;">
		    <div id="centerTabs" >
              <div title="首页">
                <div id="system_intro">管理系统</div>
              </div>
            </div>
	    </div>
    </form>
</body> 
</html>
