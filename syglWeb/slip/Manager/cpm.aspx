<%@ Page Title="" Language="C#" MasterPageFile="~/slip/Manager/Share/Manager.Master" AutoEventWireup="true" CodeBehind="cpm.aspx.cs" Inherits="syglWeb.slip.Manager.cpm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="mguider">
    <span>管理首页 >> <a href="javascript:;" onclick="history.go(-2)">项目进度</a>  >><a href="javascript:;" onclick="history.go(-1)">进度管理</a> >> </span>
</div>
<div class="mcontent">


<asp:Panel ID="Panel0_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink0_0" runat="server">题目征集</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEcit0_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel0_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink0_1" runat="server">题目征集</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label0_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label0_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEcit0_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>

 
 

<asp:Panel ID="Panel1_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink1_0" runat="server">题目评审</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEdit1_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel1_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink1_1" runat="server">题目评审</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label1_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label1_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEdit1_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>

 


<asp:Panel ID="Panel2_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink2_0" runat="server">发布申报指南</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEdit2_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel2_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink2_1" runat="server">发布申报指南</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label2_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label2_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEdit2_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>

 


<asp:Panel ID="Panel3_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink3_0" runat="server">项目申报</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEdit3_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel3_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink3_1" runat="server">项目申报</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label3_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label3_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEdit3_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>

 


<asp:Panel ID="Panel4_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink4_0" runat="server">项目评审</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEdit4_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel4_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink4_1" runat="server">项目评审</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label4_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label4_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEdit4_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>


<asp:Panel ID="Panel5_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink5_0" runat="server">项目公式及师生互选</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEdit5_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel5_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink5_1" runat="server">项目公式及师生互选</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label5_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label5_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEdit5_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>

 


<asp:Panel ID="Panel6_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink6_0" runat="server">项目实施</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEdit6_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel6_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink6_1" runat="server">项目实施</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label6_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label6_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEdit6_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>

 


<asp:Panel ID="Panel7_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink7_0" runat="server">中期检查</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEdit7_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel7_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink7_1" runat="server">中期检查</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label7_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label7_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEdit7_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>

 


<asp:Panel ID="Panel8_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink8_0" runat="server">中期检查结果公示</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEdit8_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel8_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink8_1" runat="server">中期检查结果公示</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label8_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label8_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEdit8_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>

 


<asp:Panel ID="Panel9_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink9_0" runat="server">开始结题</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEdit9_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel9_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink9_1" runat="server">开始结题</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label9_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label9_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEdit9_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>

 


<asp:Panel ID="Panel10_0" runat="server" CssClass="cpm_item"> 
    <h3>
        <asp:HyperLink ID="HyperLink10_0" runat="server">结题验收</asp:HyperLink>
    </h3>      
    <dl><dd>未开始</dd></dl>        
    <asp:HyperLink ID="HyperLinkEdit10_0" runat="server" CssClass="cp_edit_btn">开启</asp:HyperLink>
    <div class="clear"></div>
</asp:Panel> 

<asp:Panel ID="Panel10_1" runat="server" CssClass="cpm_item">  
    <h3>
        <asp:HyperLink ID="HyperLink10_1" runat="server">结题验收</asp:HyperLink>
    </h3> 
    <dl><dt>开始时间</dt><dd><asp:Label ID="Label10_0" runat="server" Text=""></asp:Label></dd></dl>
    <dl><dt>结束时间</dt><dd><asp:Label ID="Label10_1" runat="server" Text=""></asp:Label></dd></dl>         
    <asp:HyperLink ID="HyperLinkEdit10_1" runat="server"  CssClass="cp_edit_btn">修改</asp:HyperLink>
<div class="clear"></div>
</asp:Panel>
</asp:Content>
