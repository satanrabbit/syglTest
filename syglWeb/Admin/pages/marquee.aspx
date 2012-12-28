<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="marquee.aspx.cs" Inherits="syglWeb.Admin.pages.marquee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title></title>
    <link href="../style/base.css" rel="stylesheet" />
    <link href="/Style/iFadeSlide.css" rel="stylesheet" type="text/css" />
    
    <link href="../../Sourse/jquery_easyui/themes/metro/easyui.css" rel="stylesheet" />
    <link href="../../Sourse/jquery_easyui/themes/icon.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="../../Sourse/jquery_easyui/jquery.easyui.min.js" type="text/javascript"></script>    
    <script src="../../Sourse/jquery_easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
    <script src="../../Sourse/jquery_easyui/easyui_ex.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery_easyUI_dialog_form.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.iFadeSlide.pack.js" type="text/javascript"></script>
    
    <style type="text/css">
        .marquee_td {width:100%;border-collapse:collapse;border-spacing: 0px;line-height:2em; margin: 0;}
        .marquee_td td {border-left:2px #d8d8d8 solid;border-bottom:1px #d8d8d8 solid;text-align:center;margin:0;padding:0; overflow:auto;}
    </style>
</head>
<body class="easyui-layout">
	<div data-options="region:'east',title:'预览',iconCls:'icon-search',collapsed:false" style="width:335px;padding:5px">         
        <div id="slide"></div>  
    </div>
   	<div data-options="region:'center',title:'全部图片',border:true,tools:[{text: '修改',iconCls:'icon-add',handler:function(){alert('save');}}]">    	 
           <table class="marquee_td"  >
               <thead>
                   <tr><td colspan="3" style="text-align:left; padding:5px 30px  ;">
                       <a class="easyui-linkbutton" id="add_img" data-options="iconCls:'icon-add' ">添加</a>
                       <a class="easyui-linkbutton" id="refresh_btn" data-options="iconCls:'icon-reload' ">刷新</a>
                       </td></tr>
                   <tr><td style="width:35%;">图片</td><td style="width:35%;">链接地址</td><td style="width:30%;">操作</td></tr>
               </thead>
               <tbody>                   
               </tbody>
           </table>
    </div>
    <script type="text/javascript">
        $(function () {
            $.extend({
                //刷新图片数据
                refresh_imgs: function () {
                    $.getJSON("marquee_img_data.ashx?dt=" + $.now(), function (data) {
                        //清空原始数据
                        $("#slide").empty();
                        $(".marquee_td").find("tbody").empty();
                        if (data.total == 0) {
                            $.messager.show({ title: '提示', msg: '暂时没有记录！', timeout: 3000 });
                        } else {                            
                            $.each(data.rows, function (i, item) {
                               //管理列表
                                $(".marquee_td").find("tbody").append('<tr><td  ><img src="' + item.imgFile
                                    + '" style="width:280px;" /></td><td  "><a href="' + item.imgLink
                                    + '" target="_blank">' + ((item.imgLink).length > 30 ? (item.imgLink).substr(0, 30) + "…" : item.imgLink)
                                    + '</a></td><td  "><a href="javascript:;" class="edit_marquee_btn" imgID="'
                                    + item.imgID + '">修改</a><a href="javascript:;" class="delete_marquee_btn" imgFile="' + item.imgFile + '" imgID="'
                                    + item.imgID + '">删除</a></td></tr>');
                                //轮播展示
                                $("#slide").append("<a href='" + item.imgLink + "'><img src='" + item.imgFile + "' /></a>");

                            });
                            $("#slide").append('<div class="ico"></div>');
                            $('div#slide').iFadeSlide();
                            $('.edit_marquee_btn').linkbutton({ iconCls: 'icon-page_edit' });
                            $('.delete_marquee_btn').linkbutton({ iconCls: 'icon-cross' });
                        }
                    });
                }
                 
            });
            //初始化
            $.refresh_imgs();
            //添加
            $("#add_img").click(function () {
                $.sr_edit_dialog("edit_img.aspx", { title: '添加轮播图片', form: 'form_edit_img' }, function (data) {
                    data = $.parseJSON(data);
                    if (data.status == 0) {
                        $.messager.alert("错误", data.msg, "error");
                    } else {
                        $.messager.show({title:"提示",msg:data.msg,timeout:2000});
                        $.refresh_imgs();
                    }
                });
            });
            //刷新
            $("#refresh_btn").click(function () {
                //alert("OK");
                $.refresh_imgs();
            });
            //修改图片
            $(".edit_marquee_btn").live("click",function () {
                var imgID=$(this).attr("imgID");
                $.sr_edit_dialog("edit_img.aspx", { imgID:imgID,title: '修改轮播图片', form: 'form_edit_img' }, function (data) {
                    data = $.parseJSON(data);
                    if (data.status == 0) {
                        $.messager.alert("错误",data.msg,"error");
                    } else {
                        $.messager.show({ title: "提示", msg: data.msg, timeout: 2000 });
                        $.refresh_imgs();
                    }
                });
            });
            //删除图片
            $('.delete_marquee_btn').live("click", function () {
                var imgID = $(this).attr("imgID");
                var imgFile = $(this).attr("imgFile");
                $.messager.confirm("请确认！", "删除操作将不可恢复！<br/>请确认！", function (b) {
                    if (b) {
                        $.post("delete_img.ashx", { imgids: imgID, imgFile: imgFile }, function (data) {
                            data = $.parseJSON(data);
                            if (data.status == 1) {
                                $.messager.show({ title: "提示", msg: data.msg, timeout: 2000 });
                                $.refresh_imgs();
                            } else {
                                $.messager.alert("错误","错误：<br />"+data.msg,"error");
                            }
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>
