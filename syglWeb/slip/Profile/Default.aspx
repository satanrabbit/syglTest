<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Share/NestedMasterPageProfile.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="syglWeb.slip.Profile.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderProflie" runat="server">
     <div class="pro_right">
        <div class="pf_prj_titile">
            <h3>我的项目</h3>
        </div> 

        <div class="pf_prj_items"> 
            <asp:Repeater ID="RepeaterProjects" runat="server" 
                onitemdatabound="RepeaterProjects_ItemDataBound">
            <ItemTemplate>
            <table class="odr_bigtable">
	                <thead>
		                <tr>
			                <th colspan="3" class="cfl">
			                    <span class="datetime">
                                 <asp:Label ID="LabelStatusTip" runat="server" Text="" ForeColor="Maroon"></asp:Label> &emsp; 申请日期：<%#DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicPostTime ")%></span><span>项目：</span>
			                    <a href=""><%#DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicTitle")%></a>	
                            </th>
		                </tr>
	                </thead>
	                <tbody>
		                <tr>
			                <td class="btd1 notd">
				                <table class="odr_smtable">
					                <tbody>
						                <tr>
							                <td class="std1">						         
							                    <div class="divorder">
							                        <a class="mimg" href="../Profile/Prj/ProjectPic.aspx?tid=<%# DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicID ") %>" title="点击进入项目图片管理">
                                                        <asp:Image ID="ImageTopicLogo" runat="server" Width="80" />
                                                    </a>							       
							                    &nbsp;&nbsp;</div>
							                </td>
							                <td class="std2">
								                <span><%# DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "userName")%></span>
							                </td>
							                <td class="std3">课题概述：
								                <p><%# DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicInfo")%></p>
                                            </td>
						                </tr>
					                </tbody>
				                </table>
			                </td>
			                <td class="btd2">
				                <span class="block">暂无人员</span>
			                </td>
			                <td class="btd3">
                                
                                <a class="agray" href="Prj/ProjectManage.aspx?tid=<%# DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicID ") %>">项目管理</a>
				                <a href="../Projects/ProjectDetail.aspx?tid=<%# DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicID ") %>" class="agray">项目预览</a>
                                <a href="../Profile/Prj/ProjectPic.aspx?tid=<%# DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicID ") %>" class="agray">图片管理</a>
                                 
                                 <a class="agray delete_pic" topic_id="<%# DataBinder.Eval(Container.DataItem as System.Data.DataRowView, "topicID ") %>" href="">删除项目</a
                            </td>
		                </tr>

	                </tbody>
                    
                </table>
            </ItemTemplate>
            </asp:Repeater>
               
        </div>
     </div>

     <div id="tips_dialog" style=" display:none;"></div>
    <input id="HiddenPageFrom" class="HiddenPageFrom"  type="hidden" runat="server"  />
    <script type="text/javascript">
        $(function () {
            //删除项目
            $(".delete_pic").click(function () {
                var o = $(this);
                var topicID = $(this).attr("topic_id");
                var r = confirm("删除该项目后，该项目相关的资料也将一并删除！\n 请确认！！");
                if (r) {
                    $.post("Prj/DeleteTopic.ashx", { tid: topicID }, function (data) {
                        data = $.parseJSON(data);
                        if (data.status == 0) {
                            o.parent().parent().parent().parent().remove();
                            $("#tips_dialog").empty().append("删除成功！").dialog({
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
                                    setTimeout(function () { $("#tips_dialog").dialog("close"); }, 3000);
                                }
                            });
                        } else {
                            alert(data.msg);
                        }

                    });

                }

                return false;
            });

            var pageFrom = $(".HiddenPageFrom").val();
            var tipsText = "";
            switch (pageFrom) {
                case "newTopic":
                    tipsText = "您已经成功提交开放基金题目！";
                    break;
            }
            if (tipsText != "") {
                $("#tips_dialog").empty().append(tipsText).dialog({
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
                        setTimeout(function () { $("#tips_dialog").dialog("close"); }, 3000);
                    }
                });


            }


        });
    </script>


</asp:Content>
