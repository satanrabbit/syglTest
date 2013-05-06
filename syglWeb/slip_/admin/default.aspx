<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="syglWeb.slip_.admin._default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>创新平台-天津科技大学</title>
    <link href="../source/Alice/one-full.css" rel="stylesheet" />
    <link href="../source/easyui/themes/bootstrap/easyui.css" rel="stylesheet" />
    <link href="../source/easyui/themes/icon.css" rel="stylesheet" />
    <link href="../css/slip.css" rel="stylesheet" />
    <script src="../js/jquery-1.8.0.min.js"></script>
    <script src="../source/easyui/jquery.easyui.min.js"></script>
    <script src="../source/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="../source/easyui/easyui_ex.js"></script>
    <script src="../source/easyui/jquery_easyUI_dialog_form.js"></script>
    <script type="text/javascript">
        $(function () {
            //增加tab页
            $(".menuLink").click(function () {
                var $this = $(this);
                var nd = { text: $this.text(), attributes: { url: $this.attr("href") } };
                $.addTab(nd, centerTabs);
                return false;
            });
            var centerTabs = $('#centerTabs').tabs({
                fit: true,
                border: false
            });
        });
    </script>
    <style type="text/css" >
        
        .op-memu {
            text-align:center;
        }
            .op-memu p {
                margin:8px auto;
            }
    </style>  
</head>
<body  class="easyui-layout"  >
		<div region="north"  style="height:50px;background-color:#f0f0f0;">
            <div style="position:relative; height:45px;">
                <div style="position:absolute; right:30px;bottom:2px;">
                      <p><a class="easyui-linkbutton" href="#" data-options="iconCls:'icon-door_out'">退出</a></p>
                </div>
            </div>
            
		</div>
		<div region="south"  style="height:40px;" ></div>
		<div region="east" data-options="iconCls:'icon-reload',title:'关于',split:true,collapsed:true" style="width:180px;"></div>
		<div region="west" split="true" title="控制面板" style="width:190px;">
            <div id="p" class="easyui-panel"   style="  padding:10px;background:#fafafa;" data-options="noheader: true">
		        <p>管理员：夏千祥</p>
		        <p>身份：管理员</p>
                <p><a class="easyui-linkbutton menuLink" href="#" data-options="iconCls:'icon-user_edit'">修改密码</a></p>
	        </div>
            <div   class="easyui-panel" title="内容管理" style=" padding:10px;background:#fbfbfb;" data-options="iconCls:'icon-cog'">
		        <div class="op-memu" >
                    <p ><a class="easyui-linkbutton menuLink" href="news.aspx" data-options="iconCls:'icon-report_edit'" >创新资讯</a></p>
                    <p ><a class="easyui-linkbutton menuLink"  href="of.aspx" data-options="iconCls:'icon-note'">创新成果(旧)</a></p>
                    <p ><a class="easyui-linkbutton menuLink" href="spts.aspx"  data-options="iconCls:'icon-chart_bar'" >项目支持</a></p
                    <p ><a class="easyui-linkbutton menuLink"  data-options="iconCls:'icon-chart_bar'" >帮助中心</a></p>
		        </div>
                     
	        </div>
            <div  class="easyui-panel" title="项目管理" style=" padding:10px;background:#fbfbfb;" data-options="iconCls:'icon-book'">
		        <div class="op-memu" >
                    <p ><a class="easyui-linkbutton menuLink" data-options="iconCls:'icon-report_edit'" >项目进度</a></p>
                    <p ><a class="easyui-linkbutton menuLink"  data-options="iconCls:'icon-note'">项目审核</a></p>
                    <p ><a class="easyui-linkbutton menuLink"  data-options="iconCls:'icon-chart_bar'" >成果展示</a></p>
		        </div>
                     
	        </div>
		</div>
		<div region="center" >
            <div id="centerTabs">
                <div title="管理首页" style="padding:10px; ">                   
                    
		        </div>                
            </div>
		</div>
    
</body>
</html>
