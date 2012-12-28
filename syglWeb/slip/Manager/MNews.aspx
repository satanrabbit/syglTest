<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Manager/Share/Manager.Master" AutoEventWireup="true" CodeBehind="MNews.aspx.cs" Inherits="syglWeb.slip.Manager.MNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="mguider">
    <span>管理首页 >> 新闻资讯 </span>
</div>

<asp:AccessDataSource ID="NewsDataSource" runat="server" 
    DataFile="~/App_Data/slipDB.mdb" 
    SelectCommand="SELECT newsID, newsTitle ,newsPostTime FROM [newsTB] ORDER BY [newsPostTime] DESC">
</asp:AccessDataSource>
<div class="mcontent">
    <ul class="mnews_ul">
    <li><span class="mnews_opt"> <a  href="EditNews.aspx" class="mNews_btn" target="_self" >添加新闻资讯</a></span></li>        
     <asp:Repeater ID="RepeaterNews" runat="server" DataSourceID="NewsDataSource">
        <ItemTemplate>
        <li>
            <span class="mnews_titile"><a href="../NewsDetail.aspx?nid=<%# Eval("newsID") %>" target="_blank"><%# Eval("newsTitle")  %></a></span>
            <span class="mnews_time"><%# Eval("newsPostTime")  %> </span>
            <span class="mnews_opt">
                <a href="EditNews.aspx?nid=<%# Eval("newsID") %>" class="mNews_btn" target="_self" >修改</a>
                <a href="javascript:;" nid="<%# Eval("newsID") %>" class="mNews_btn delete_news_btn">删除</a>
            </span></li>
        
        </ItemTemplate>
    </asp:Repeater>
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
<div id="dialog_div" style=" display:none;"></div>

<script type="text/javascript">
    $(function () {
        $(".delete_news_btn").click(function () {
            btn = $(this);
            nid = btn.attr("nid")
            $.post("Handlers/DeleteNews.ashx", { nid: nid }, function (data) {
                data = $.parseJSON(data);
                if (data.error == 0) {
                    console.info(btn);
                    btn.parent().parent().remove();
                }
                $("#dialog_div").empty().append(data.message).dialog({
                    autoOpen: true,
                    title: "提示",
                    closeText: "关闭",
                    show: 800,
                    hide: 1200,
                    position: 'top',
                    buttons: {
                        "确定": function () {
                            $(this).dialog("close");
                        }
                    },
                    open: function (event, ui) {
                        setTimeout(function () { $("#dialog_div").dialog("close"); }, 3000);
                    }
                });
            });
        });
    });
</script>
</asp:Content>
