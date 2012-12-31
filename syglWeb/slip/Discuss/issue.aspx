<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" EnableViewState="false" CodeBehind="issue.aspx.cs" Inherits="syglWeb.slip.Discuss.issue" %>

<%@ Register Src="~/slip/Controls/hotTags.ascx" TagPrefix="uc1" TagName="hotTags" %>
<%@ Register Src="~/slip/Controls/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/slip/Controls/footer.ascx" TagPrefix="uc1" TagName="footer" %>


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
    <link type="text/css" rel="stylesheet" href="~/Slip/Style/Style.css" />
    <!--页面样式-->
    <link href="../Style/Discuss.css" rel="stylesheet/less" type="text/css" />
    <!--引入js库-->
    <script src="../../Scripts/jquery-1.8.2.min.js"></script>
    <script src="../../Sourse/kindeditor_4.1.3/kindeditor-all-min.js"></script>
    <script src="../../Sourse/jquery_easyui/jquery.easyui.min.js"></script>
    <script src="../../Sourse/jquery_easyui/locale/easyui-lang-zh_CN.js"></script>
    <script src="../../Scripts/less-1.3.0.min.js"></script>
</head>
<body>        
    <uc1:header runat="server" ID="header" />
    <form id="form1" runat="server">
        <div id="page"> 
        <div id="pg_lf">
            <div id="dsc_guider">
                
            </div>
            <div id="dsc_list">  
                <div id="dsc_li_header">
                    <div id="dsc_li_title">
                        <h2>创新论坛：<asp:Label ID="LabelIssueTitle" runat="server" Text=""></asp:Label></h2> 
                    </div>                    
                </div>
                <div class="dsc_tags">
                    <br />
                    <span class="">标签：</span>
                    <a href="javascript:;" >计算机</a>
                    <a href="javascript:;" >软件</a>
                    <a href="javascript:;" >网络</a>
                </div>
                <br />
                <div class="issue">
                    <div class="issue_side">
                        <div class="isssue_user_pro">
                            <img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="60" />
                        </div>
                        <div class="isssue_user_intro">
                            <div >
                                <asp:Label ID="LabelUserName" runat="server" Text=""></asp:Label>
                                <asp:HiddenField ID="HiddenFieldIssueUserID" runat="server" />
                            </div>
                            <div >
                                <asp:Label ID="LabelMajor" runat="server" Text=""></asp:Label>

                            </div>
                             <div >
                                <asp:Label ID="LabelIssuePostTime" runat="server" Text="Label"></asp:Label>

                            </div>
                        </div>
                    </div>
                    <div class="issue_main">
                        <asp:Label ID="LabelIssueContent" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="comment">
                    <div class="comment_head">
                        <h3>回复：</h3>
                    </div>
                    <div class="comment_list" >
                        <asp:Repeater ID="RepeaterComment" runat="server" OnItemDataBound="RepeaterComment_ItemDataBound">
                            <ItemTemplate>
                                <div class="comment_item">
                                    <div class="comment_side">
                                        <div class="comment_user_pro">
                                            <img src="<%# Eval("avatarMini") %>" width="40" />
                                        </div>
                                    </div>
                                    <div class="comment_main">
                                        <div class="comment_info"><%# DataBinder.Eval(Container.DataItem,"username") %> 回复于 <%# DataBinder.Eval(Container.DataItem,"commentPostTime","{0:yyyy-M-d hh:mm:ss}")%> 
                                            (<a href="javascript:;" class="comment_replay_btn" isrp="false" user_name="<%#DataBinder.Eval(Container.DataItem,"userName") %>" user="<%# DataBinder.Eval(Container.DataItem,"commentUser")  %>" comment="<%# DataBinder.Eval(Container.DataItem,"commentID")  %>" >回复</a>) </div>
                                        <div class="comment_content"> <%# DataBinder.Eval(Container.DataItem,"commentContent") %></div>
                                        <asp:Panel ID="PanelCommentReply" CssClass="comment_replay" runat="server">
                                            <asp:Label ID="LableReplayHead" runat="server">---共条回复---</asp:Label> 
                                            <ul>                                  
                                                <asp:Repeater ID="RepeaterComment_reply" runat="server" OnItemDataBound="RepeaterComment_reply_ItemDataBound" >
                                                    <ItemTemplate>
                                                         <li>
                                                            <div class="replay_user_pro"><a ><img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="30" /></a></div>
                                                            <div>
                                                                <span> @<a href="javscript:;" style="color:#ff6a00;"><%# DataBinder.Eval(Container.DataItem,"replyToUserName") %></a> <%# DataBinder.Eval(Container.DataItem,"replyContent") %></span>
                                                                <span style="color:#666;">(<asp:Label ID="LabelReplyPostTime" runat="server" Text=""></asp:Label> by <%# DataBinder.Eval(Container.DataItem,"UserName") %>)</span>
                                                                (<a href="javascript:;"  class="comment_replay_btn" isrp="true" user_name="<%#DataBinder.Eval(Container.DataItem,"userName") %>" user="<%# DataBinder.Eval(Container.DataItem,"replyUser")  %>" comment="<%# DataBinder.Eval(Container.DataItem,"replyComment")  %>" >回复</a>) 
                                                            </div>
                                                        </li>                                                
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                </ul>    
                                        </asp:Panel> 
                                        <div class="comment_opt"></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="post_comment_wp">
                        <div class="post_comment_head">发表回复：<br />
                            <div>
                                <asp:image id="userAvatar"  runat="server" width="50"  ImageUrl="~/slip/Sources/Portraits/Mini/201211031603526697.jpg" />
                            </div>
                            <span style="color:#808080;">（夏千祥）</span>
                        </div>
                        <div class="post_comment_edit">
                            <textarea id="post_comment" name="post_comment" style="width:90%;"></textarea>
                            <br />
                            <asp:HiddenField ID="HiddenFieldIssueID" runat="server" />
                            <asp:HiddenField ID="HiddenFieldUserID" runat="server" Value="0" />
                            <a href="JavaScript:;" id="post_comment_submit" class="easyui-linkbutton">回复</a>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        <div id="pg_rt"> 
            <a class="dsc_rt_openTopic" href="postIssue.aspx">发起话题</a>
            <uc1:hotTags runat="server" id="hotTags1" />
        </div>
  <div class="clear"></div>
  </div>
    </form>
    <uc1:footer runat="server" ID="footer" />
    <script type="text/javascript">
        var editor;
        KindEditor.ready(function (K) {
            editor = K.create('[name="post_comment"]', {
                width: '98%',
                items: [
                        'source',
                        'justifyleft', 'justifycenter', 'justifyright',
                        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                        'superscript', 'selectall', '|', 'fullscreen', '/',
                        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'insertfile', 'table', 'hr',
                        'anchor', 'link', 'unlink', '|', 'about'
                ],
                uploadJson: "../../Sources/kindeditor_4.1.3/asp.net/upload_json.ashx",
                fileManagerJson: '../../Sources/kindeditor_4.1.3/asp.net/file_manager_json.ashx',
                allowFileManager: true
            });
        });
        $(function () {
            $("#post_comment_submit").click(function () {
                editor.sync(); 
                var comment = $("#post_comment").val();
                if (comment != "") {
                    $.post("PostComment.ashx", {issueUserID:$("#HiddenFieldIssueUserID").val(), issueID: $("#HiddenFieldIssueID").val(), commentContent: comment }, function (data) {
                        data = $.parseJSON(data);
                        if (data.status === 1) {
                            $.messager.show({title:"提示",msg:data.msg,timeout:2000});
                        } else {
                            $.messager.alert("错误",data.msg,"error");
                        }
                    });
                } else {
                    $.messager.show({title:"提示",msg:"请填写评论内容！",timeout:2000});
                }
            });
            $(".comment_replay_btn").live("click", function () {
                //是否登录
                var userID = $("#HiddenFieldUserID").val();
                if (userID == 0) {
                    $.messager.confirm("未登录", "您还没有登录，请登录后回复！", function (b) {
                        if (b) {
                            window.location.href = "/slip/LogOn.aspx?reurl=" + window.location.href;
                        }
                    });
                } else {
                    var $this = $(this);
                    var comment = $this.attr("comment");
                    var user = $this.attr("user");
                    var user_name = $this.attr("user_name");
                    $(".reply_dialog").dialog("destroy").remove();
                    $("body").append("<div class='reply_dialog'><textarea style='width:300px; height:80px;' name='reply_text'></textarea></div>");
                    $(".reply_dialog").dialog({
                        title: "回复:" + user_name,
                        modal: true,
                        buttons: [{
                            text: "回复",
                            iconCls: "icon-pencil",
                            handler: function () {
                                var reply_content = $("textarea[name='reply_text']").val();
                                if (reply_content == "") {
                                    $.messager.show({ title: "提示", msg: "回复内容不能为空！", timeout: 2000 });
                                } else {
                                    //提交回复
                                    $.post("PostReply.ashx",
                                        { comment: comment, user: user, userName: user_name, issueID: $("#HiddenFieldIssueID").val(), reply: reply_content },
                                        function (data) {
                                            data = $.parseJSON(data);
                                            if (data.status === 1) {
                                                //用户头像
                                                var userAvatar = $("img#userAvatar").attr("src");
                                                var $rps;
                                                if ($this.attr("isrp")) {
                                                    $rps = $this.parents(".comment_replay");
                                                    console.info($rps);
                                                } else {
                                                    $rps = $this.parent().siblings(".comment_replay");
                                                }
                                                if ($rps.length === 0) {
                                                    $this.parent().siblings(".comment_content").after(
                                                        '<div id="RepeaterComment_ctl01_PanelCommentReply" class="comment_replay">' +
                                                        '<span id="RepeaterComment_ctl01_LableReplayHead">---共1条回复---</span> ' +
                                                        '<ul><li>' +
                                                        '<div class="replay_user_pro"><a ><img src="' + userAvatar + '" width="30" /></a></div>' +
                                                            '<div>' +
                                                                '<span> @<a href="javscript:;" style="color:#ff6a00;">'+user_name+'</a>' + reply_content + '</span>' +
                                                                '<span>(刚刚) by )</span>' +
                                                                ' (<a href="javascript:;"  class="comment_replay_btn" isrp="true" user_name="' + user_name + '" user="' + userID + '" comment="' + comment + '" >回复</a>)' +
                                                            '</div>' +
                                                        '</li></ul></div> ');
                                                } else {
                                                    var numli=$rps.find("ul>li").length+1;
                                                    $rps.find("span:first").text("-----共" + numli + "条回复-----")
                                                    $rps.find("ul>li:last").after('<li>' +
                                                        '<div class="replay_user_pro"><a ><img src="' + userAvatar + '" width="30" /></a></div>' +
                                                            '<div>' +
                                                                '<span> @<a href="javscript:;" style="color:#ff6a00;">'+user_name+'</a>' + reply_content + '</span>' +
                                                                '<span>(刚刚) by )</span>' +
                                                                ' (<a href="javascript:;"  class="comment_replay_btn" isrp="true" user_name="'+user_name+'" user="'+userID+'" comment="'+comment+'" >回复</a>)' +
                                                            '</div>' +
                                                        '</li>');
                                                }

                                                $(".reply_dialog").dialog("destroy").remove();
                                            } else {
                                                $.messager.alert("错误", data.msg, "error");
                                            }
                                    });
                                }
                            }
                        }, {
                            text: "取消", iconCls: "icon-cross",
                            handler: function () {
                                $(".reply_dialog").dialog("destroy").remove();
                            }

                        }]
                    });
                }
            });
        });
    </script>
</body>
</html>
