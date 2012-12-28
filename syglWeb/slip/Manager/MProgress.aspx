<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Manager/Share/Manager.Master" AutoEventWireup="true" CodeBehind="MProgress.aspx.cs" Inherits="syglWeb.slip.Manager.MProgress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="mguider">
    <span>管理首页 >> 项目进度 </span>
</div>
 
<div class="mcontent">
    <ul class="mnews_ul">
    
    <li><span class="mnews_opt"> <a  href="EditTp.aspx" class="mNews_btn" target="_self" >添加项目进度</a></span></li>     
        <asp:Repeater ID="RepeaterTp" runat="server" DataSourceID="AccessDataSourceTp">
        <ItemTemplate>       
            
            <li>
                <span class="mtp_name"><a href="<%#  Eval("tpNotice")%>" target="_blank"><%# Eval("tpName") %></a></span>
                <span class="mtp_year"><%# Eval("tpYear") %>年度</span>
                <span class="mtp_time"><%# ((DateTime)Eval("tpStartTime")).ToLongDateString() %> 至 <%# ((DateTime)Eval("tpEndTime")).ToLongDateString()%></span>
                <span class="mtp_opt">
                    <a href="EditTp.aspx?tpid=<%# Eval("tpID") %>" target="_self" class="mNews_btn" >修改</a>
                    <a href="javascript:;" tpid="<%# Eval("tpID") %>" target="_self" class="mNews_btn delete_tp" >删除</a>
                </span>
            </li>
        </ItemTemplate>
        </asp:Repeater>
        <asp:AccessDataSource ID="AccessDataSourceTp" runat="server" 
            DataFile="~/App_Data/slipDB.mdb" 
            SelectCommand="SELECT [tpID],[tpNotice], [tpName], [tpStartTime], [tpEndTime], [tpYear], [tpPostTime] FROM [tpTB] ORDER BY [tpStartTime] DESC, [tpPostTime] DESC, [tpYear] DESC">
        </asp:AccessDataSource>
   </ul> 
</div>
<div id="dialog_div" style=" display:none;"></div>

<script type="text/javascript">
    $(function () {
        $(".delete_tp").click(function () {
            var o = $(this);
            var tpid = o.attr("tpid");
            var b = confirm("您确定删除此项目进度？\n 删除后该进度的相关信息也将删除！");
            if (b) {
                $.post("Handlers/DeleteTp.ashx", { tpid: tpid }, function (data) {
                    data = $.parseJSON(data);
                    if (data.error == 0) {
                        //删除页面信息

                        o.parent().parent().remove();
                        //dialog提示
                        $("#dialog_div").empty().append(data.message).dialog({
                            autoOpen: true,
                            title: "删除成功",
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
                    }
                });
                return false;
            } else {
                $("#dialog_div").empty().append(data.message).dialog({
                    autoOpen: true,
                    title: "出现错误",
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
                return false;
            }
        });
    });
</script>
</asp:Content>
