<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Site.Master" EnableViewState="false" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="syglWeb.Department" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dpt_main">
        <div id="dpt_intro_wp">
            <div id="dpt_intro_left">
                <h2 style="color:#b34f2c;"><em>实验室与设备管理处</em>介绍</h2>
                <asp:Label ID="LabelIntro" runat="server" Text=""></asp:Label>
                
            </div>
            <div id="dpt_intro_right">
                <div class="leaders">
                    <div class="leader_item">
                        <dl><dt>处长</dt><dd><asp:Label ID="LabelHeader" runat="server" Text=""></asp:Label></dd></dl>
                        <dl>
                            <dt>办公电话</dt>
                            <dd>
                                <dl>
                                    <dt>河西</dt>
                                    <dd>
                                        <asp:Label ID="LabelHHexiTele" runat="server" Text=""></asp:Label></dd>
                                </dl>
                                <dl>
                                    <dt>泰达</dt>
                                    <dd><asp:Label runat="server" ID="LabelHTedaTele"></asp:Label></dd>
                                </dl>
                            </dd>
                        </dl>
                        
                        
                    </div>
                     <div class="leader_item">
                        <dl><dt>副处长</dt><dd>
                            <asp:Label ID="LabelSubHeader" runat="server" Text=""></asp:Label></dd></dl>
                        <dl>
                            <dt>办公电话</dt>
                            <dd>
                                <dl>
                                    <dt>河西</dt>
                                    <dd> <asp:Label ID="LabelShHexiTell" runat="server" Text=""></asp:Label></dd>
                                </dl>
                                <dl>
                                    <dt>泰达</dt>
                                    <dd> <asp:Label ID="LabelShTedaTell" runat="server" Text=""></asp:Label></dd>
                                </dl>
                            </dd>
                        </dl>
                        
                        
                    </div>
                </div>
            </div>
        </div>
        <div id="dpt_set">
            <h2 style="color:#b34f2c;">机构设置</h2>
            <h4  id="pmt4"><a href="#pmt4" name="pmt4">规划建设科<i class="guid_arrow">.</i></a></h4>
            <div class="dpt_set_detail">
                <asp:Label ID="Label_ptm4" runat="server" Text=""></asp:Label>                
            </div>
            <h4  id="pmt2"><a href="#pmt2" class="" name="pmt2">供应科<i class="guid_arrow">.</i></a></h4>
            <div class="dpt_set_detail">
                <asp:Label ID="Label_ptm2" runat="server" Text=""></asp:Label>
            </div>
            <h4  id="pmt3"><a href="#pmt3"  name="pmt3">物资设备管理科<i class="guid_arrow">.</i></a></h4>
            <div class="dpt_set_detail">
                <asp:Label ID="Label_ptm3" runat="server" Text=""></asp:Label>
            </div>
            <h4  id="pmt1"><a href="#pmt1"  name="pmt1">实验室管理科<i class="guid_arrow">.</i></a></h4>
            <div class="dpt_set_detail">
                <asp:Label ID="Label_ptm1" runat="server" Text=""></asp:Label>
            </div>
            <h4  id="pmt5"><a href="#pmt5"  name="pmt5">计算中心<i class="guid_arrow">.</i></a></h4>
            <div class="dpt_set_detail">
                <asp:Label ID="Label_ptm5" runat="server" Text=""></asp:Label>
            </div>
           <h4  id="pmt6"><a href="#pmt6"  name="pmt6">教育技术中心<i class="guid_arrow">.</i></a></h4>
            <div class="dpt_set_detail">
                <asp:Label ID="Label_ptm6" runat="server" Text=""></asp:Label>
            </div>
            <h4  id="pmt7"><a href="#pmt7" name="pmt7">现代分析技术研究中心<i class="guid_arrow">.</i></a></h4>
            <div class="dpt_set_detail">
                <asp:Label ID="Label_ptm7" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            $("#dpt_set > h4 > a").hover(
                function () {
                    $(this).find("i").attr("class", "guid_arrow_h");
                },
                  function () {
                      if ($(this).attr("class") == "h") {
                      } else {
                          $(this).find("i").attr("class", "guid_arrow");
                      }
                  });
            $("#dpt_set > h4 > a").click(function () {
                $this = $(this);
                if ($this.attr("class") == "h") {
                    $this.parent().next(".dpt_set_detail").slideUp("slow");
                    $this.attr("class", "");
                } else {
                    $this.parent().next(".dpt_set_detail").slideDown("slow", function () {
                        var targetOffset = $this.offset().top;
                        var obj = document.documentElement;
                        if (jQuery.browser.safari)
                            obj = document.body
                        if (jQuery.browser.msie)
                            obj = 'html';
                        $(obj).animate({ scrollTop: targetOffset }, 1000);
                    });
                    $this.attr("class", "h");
                }
                return false;
            });
            //
            var ptm = window.location.hash;
            if (ptm == "" || ptm == null) {

            } else {
                //alert(ptm);
                $(ptm).find("a").attr("class", 'h');
                $(ptm).find("i").attr("class", "guid_arrow_h");
                $(ptm).next(".dpt_set_detail").slideDown("slow", anchorScoll(ptm));
            }
            function anchorScoll(anchor) {
                var targetOffset = $(anchor).offset().top;
                var obj = document.documentElement;
                if (jQuery.browser.safari)
                    obj = document.body
                if (jQuery.browser.msie)
                    obj = 'html';
                $(obj).animate({ scrollTop: targetOffset }, 1000);
            }
        });
    </script>
</asp:Content>
