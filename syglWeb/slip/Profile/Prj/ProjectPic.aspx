<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/NestedMasterPageProfile.master" AutoEventWireup="true" CodeBehind="ProjectPic.aspx.cs" Inherits="syglWeb.slip.Profile.Prj.ProjectPic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderProflie" runat="server">

    <link type="text/css" rel="Stylesheet" href="/Style/jquery.Jcrop.min.css" />
    <script type="text/javascript" src="/Scripts/jquery.Jcrop.min.js"></script>
    <script src="../../../Scripts/ajaxfileupload.js" type="text/javascript"></script>
<div class="pro_right">
    <div class="pf_prj_titile">
        <h3><asp:Label ID="LabelTopicTitle" runat="server" Text=""></asp:Label>&emsp;图片管理<asp:HiddenField
                ID="HiddenFieldTopicID"  runat="server" />
        </h3>
    </div>
    
        <div class="pf_prj_items">
               <table class="odr_bigtable">
	                <thead>
		                <tr>
			                <th width="30%">
                                <h4>项目标识</h4>
                                <a href="javascript:;" id="upload_logo_btn" class="easyui-linkbutton">更改</a>
                            </th>
                            <th id="project_logo" width="70%">
                                <asp:Image ID="ImageLogo" runat="server" ImageUrl="/Slip/Sources/Pictures/chinaz4.ico"/>                                 
                            </th>                            
		                </tr>                         
	                </thead>
	                <tbody>
                    <tr>
                            <td colspan="2">
                                 <a href="javascript:;" id="add_pic" class="easyui-linkbutton" data-options="iconCls:'icon-photo'">添加图片</a>
                            </td>
		                </tr>
                        <tr>
                            <td  colspan="2"  > 
                                <div class="imgs_wp">
                                <div class="img_item_wp" style=" display:none;"></div>
                                    <asp:Repeater ID="RepeaterProjImg" runat="server">
                                        <ItemTemplate>
                                            <div class="img_item_wp">
                                                <div class="img_wp"><img src="<%# DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicImgMini") %>" /></div>
                                                <div class="img_dist"><%# DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicImgInfo")%></div>
                                                <div class="img_buttoms">
                                                    <a href="javascript:;" imgID="<%# DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicImgID") %>" class='delete_img_btn'>删除</a>
                                                    <a href="javascript:;"  class='edit_dis_btn'>修改描述</a></div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <div class="clear"></div>
                                </div>
                            </td>
		                </tr>
                        

	                </tbody>
                </table>
        </div>
</div>
    <div style=""></div>
<script type="text/javascript">
     
    $(function () {
        //更改标识 
        $("#upload_logo_btn").click(function () {
            $(".upload_dialog").dialog('destroy').remove();
            $("body").append('<div class="upload_dialog">' +
                '<input type="hidden" name="logoImg" />' +
                '<input type="hidden" name="logox" />' +
                '<input type="hidden" name="logoy" />' +
                '<input type="hidden" name="logow" />' +
                '<input type="hidden" name="logoh" />' +
                '<input type="hidden" name="logoOrgImg" />' +
                '<div id="logo_crop_wp"></div>' +
                '<div class="upload_btn_wp" style="margin:10px 0 10px 400px;">' +
                //'<a href="javascript:;" id="up_a_btn">选择图片</a>' +
                //'<span style="display:none;">' +
                '<input id="Filedata" name="Filedata" type="file"  />' +
               // '<span>' +
                '</div></div>'
                );


            //$("#up_a_btn").linkbutton({ iconCls: "icon-photo" });
            //$("#up_a_btn").live("click", function () {               
            //    $("#Filedata").trigger("click");
            //});
            function ajaxFileUpload() {
                $.ajaxFileUpload
                (
                    {
                        url: 'UploadImg.ashx?isComp=true&isTemp=true', //用于文件上传的服务器端请求地址
                        secureuri: false, //是否需要安全协议，一般设置为false
                        fileElementId: 'Filedata', //文件上传域的ID
                        dataType: 'json', //返回值类型 一般设置为json
                        success: function (data, status)  //服务器成功响应处理函数
                        {
                            $('input[name="logoImg"]').val(data.compUrl);
                            $('input[name="logoOrgImg"]').val(data.url);
                            startCorp(data.compUrl, $("input[name='logox']"), $("input[name='logoy']"), $("input[name='logow']"), $("input[name='logoh']"), $("#logo_crop_wp"))
                        },
                        error: function (data, status, e)//服务器响应失败处理函数
                        {
                            alert(e);
                        }
                    }
                )
                return false;
            }
            $("#Filedata").live('change', function () {
                ajaxFileUpload();
            });
            $(".upload_dialog").dialog({
                title: "更改标识",
                width: 700,
                modal: true,
                buttons: [{
                    text: "确定",
                    handler: function () {
                        var px = $("input[name='logox']").val();
                        var py = $("input[name='logoy']").val();
                        var pw = $("input[name='logow']").val();
                        var ph = $("input[name='logoh']").val();
                        var img = $("input[name='logoImg']").val();
                        var oldImg = $("input[name='logoOrgImg']").val();
                        var tid = $("#ctl00_ctl00_ContentPlaceHolderPage_ContentPlaceHolderProflie_HiddenFieldTopicID").val();
                        if (pw == 0) {
                            $.messager.show({ title: "提示", msg: "请先裁剪标识区域！", timeout: 2000 });
                            return false;
                        } else {
                            $.post("/Slip/Handlers/SaveLogo.ashx", { px: px, py: py, pw: pw, ph: ph, img: img, oldImg: oldImg, tid: tid }, function (data) {
                                data = $.parseJSON(data);
                                if (data.status == 0) {
                                    $("#project_logo").empty().append("<img width='100' src='" + data.logoMini + "'/>");
                                    $.messager.show({ title: "提示", msg: "设置成功！", timeout: 2000 });
                                }
                                $(".upload_dialog").dialog('destroy').remove();
                            });
                        }
                    }
                }, {
                    text: "取消",
                    handler: function () {
                        $(".upload_dialog").dialog('destroy').remove();
                    }
                }]
            });
        });
        // 图片上传完成之后执行剪裁
        function startCorp(img, x, y, w, h, crop_wp) {
            crop_wp.empty().append('<table cellpadding="0" cellspacing="0" border="0">' +
                    '<tr>' +
                    '<td>' +
                    '<img src="' + img + '" id="jcrop_target" />' +
                    '</td>' +
                    '<td>' +
                    '<div style="width:100px;height:125px;overflow:hidden;margin-left:5px;">' +
                    '	<img src="' + img + '" id="preview" />' +
                    '</div>' +
                    '</td>' +
                    '</tr>' +
                    '</table>');

            var jcrop_api, boundx, boundy;
            updatePreview = function (c) {
                if (parseInt(c.w) > 0) {
                    x.val(c.x);
                    y.val(c.y);
                    w.val(c.w);
                    h.val(c.h);
                    var rx = 100 / c.w;
                    var ry = 125 / c.h;

                    $('#preview').css({
                        width: Math.round(rx * boundx) + 'px',
                        height: Math.round(ry * boundy) + 'px',
                        marginLeft: '-' + Math.round(rx * c.x) + 'px',
                        marginTop: '-' + Math.round(ry * c.y) + 'px'
                    });
                }
            };


            $('#jcrop_target').Jcrop({
                onChange: updatePreview,
                onSelect: updatePreview,
                aspectRatio: 0.8
            }, function () {
                var bounds = this.getBounds();
                boundx = bounds[0];
                boundy = bounds[1];
                jcrop_api = this;
            });

        }
        //添加图片
        $("#add_pic").click(function () {
            $('.upload_dialog').dialog("destroy").remove();
            $('body').append('<div class="upload_dialog">' +
                '<input id="imgFile" name="imgFile" type="file"  />' +
                '</div>');
            $(".upload_dialog").dialog({
                title: '添加图片',                
                width: 700,
                doSize: true,
                modal: true,
                buttons: [{
                    text: "确定",
                    handler: function () {
                        $.ajaxFileUpload({
                            url: '/slip/Handlers/UploadProjImg.ashx?tid=' + $("#ctl00_ctl00_ContentPlaceHolderPage_ContentPlaceHolderProflie_HiddenFieldTopicID").val(),
                            secureuri: false,  
                            fileElementId: 'imgFile',
                            dataType: 'json',  
                            success: function (data, status)   
                            {
                                if (data.status === 0) {
                                    $(".imgs_wp").prepend('<div class="img_item_wp">' +
                                                '<div class="img_wp"><img src="' + data.imgNamePath + '">" /&gt;</div>' +
                                                '<div class="img_dist"></div>' +
                                                '<div class="img_buttoms">' +
                                                '<a href="javascript:;" imgid="' + data.imgID + '" class="delete_img_btn">删除</a>' +
                                                '<a href="javascript:;" class="edit_dis_btn">修改描述</a></div>' +
                                                '</div>');
                                    $(".upload_dialog").dialog('destroy').remove();
                                } else {
                                    $.messager.alert("错误",data.msg,"error");
                                }
                            },
                            error: function (data, status, e) 
                            {
                                $.message.after("错误",e,"error");
                            }
                        });
                    }
                }, {
                    text: "取消",
                    handler: function () {
                        $(".upload_dialog").dialog('destroy').remove();
                    }
                }]
            });
        });
        //删除图片
        $(".delete_img_btn").live("click", function () {
            var imgID = $(this).attr("imgID")
            $delete_img = $(this).parent().parent();
            $.post("/Slip/Handlers/DeleteTopicImg.ashx", { imgID: imgID }, function (data) {
                data = $.parseJSON(data);

                if (data.status == 0) {
                    $delete_img.remove();
                } else {
                    alert(data.error);
                }
            });
        });

        //修改描述  class='edit_dis_btn'
        $(".edit_dis_btn").live("click", function () {
            $(this).hide();
            $(this).siblings().hide();
            $imgID = $(this).siblings(".delete_img_btn").attr("imgID");
            $text = $(this).parent().siblings(".img_dist").text();
            $(this).after("<a href='javascript:;' class='save_dis'>确定</a><a href='javascript:;' class='cancel_dis' or_text='" + $text + "'>取消</a>");
            $(this).parent().siblings(".img_dist").empty().append("<textarea class='dist_textarea' id='dist_textarea_" + $imgID + "'  imgID='" + $imgID + "'></textarea>");
            $("#dist_textarea_" + $imgID).val($text);
        });
        //保存
        $(".save_dis").live("click", function () {
            $this = $(this);
            $textarea = $(this).parent().siblings(".img_dist").find(".dist_textarea");

            $dist = $textarea.val();
            $topicImgID = $textarea.attr("imgID");

            $.post("/Slip/Handlers/SaveTopicImgDist.ashx", { dist: $dist, imgID: $topicImgID }, function (data) {
                data = $.parseJSON(data);
                if (status == 0) {
                    $this.siblings(".cancel_dis").remove();
                    $this.siblings().show();
                    $this.remove();
                    $textarea.parent().empty().append($dist);
                }
                else {
                    alert(status.error)
                }
            });
        });
        //取消
        $(".cancel_dis").live("click", function () {
            $text = $(this).attr("or_text");
            $(this).parent().siblings(".img_dist").empty().text($text);

            $(this).siblings().show();
            $(this).siblings(".save_dis").remove();
            $(this).remove();
        });


    });
</script>
</asp:Content>
