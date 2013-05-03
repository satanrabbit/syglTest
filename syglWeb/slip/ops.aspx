<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ops.aspx.cs" Inherits="syglWeb.slip.ops" %>

<%@ Register Src="~/Share/FootControl.ascx" TagPrefix="uc" TagName="FootControl" %>
<%@ Register Src="~/Share/HeaderControl.ascx" TagPrefix="uc" TagName="HeaderControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>创新成果</title>
    <link type="text/css" rel="stylesheet" href="Style/Style.css" />
    <script src="/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <style type="text/css">
        .op-nav-wp {

        }
            .op-nav-wp ul {
                zoom: 1;
                overflow: auto;
            }
                .op-nav-wp ul li {
                    display: block;
                    width:300px;
                    float:left;
                }
                    .op-nav-wp ul li a {
                        display:block;
                        width:285px;
                        background-color:#0094ff;
                        color:#FFF;
                        font-size:14px;
                        text-decoration:none;
                        font-weight:600;
                    }
                        .op-nav-wp ul li a i {
                            display:block;
                            text-align:center;
                            font-size:28px;
                            line-height:45px;
                        }
                        .op-nav-wp ul li a span {
                            display:block; 
                            line-height:38px;
                            padding-left:10px;
                        }
                        .op-nav-wp ul li a:hover,.op-nav-wp ul li a.select {
                            background-color:#b34f2c; text-decoration:none;
                        }
        .op-list-wp {
            margin:10px 0 ;
        }
            .op-list-wp h4 {
                font-size:20px;
                color:#0094ff;
                line-height:35px;
            }
            .op-list-wp ul {
                padding:10px;
            }
                .op-list-wp ul li {
                    margin:5px 0;
                    border-bottom:1px dotted #999;
                    padding:5px 0;
                }
                    .op-list-wp ul li h5 {
                        line-height:30px;
                        zoom:1;
                        overflow:auto;
                    }
                    .op-list-wp ul li h5 a.title {
                        display:block;
                        float:left;
                        font-size:14px;
                        line-height:28px;
                        color:#3E62A6;
                    }
                     .op-list-wp ul li h5 a.more {
                          display:block;
                        float:left;
                        font-style:normal;
                        margin:0 15px;
                        width:60px;
                        background:url("Style/Images/xx.gif") no-repeat top left;  
                        text-decoration:none;  
                        text-indent:-99999px;          
                    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc:HeaderControl runat="server" id="HeaderControl" />
        <div id="page">
        <div class="tit tit_left">
            <h2><a href="#">创新成果</a></h2>
        </div>
        <div class="op-nav-wp">
            <ul>
                <li><a href="#" class="select"><i>2013</i><span>2013年创新成果</span></a></li>
                <li><a href="#"><i>2012</i><span>2012年创新成果</span></a></li>
                <li><a href="#"><i>2011</i><span>2011年创新成果</span></a></li>
            </ul>
        </div>
        <div class="op-list-wp">
            <h4><asp:Label ID="LbOpTitle" runat="server" >2013年度创新项目</asp:Label></h4>
            
            <ul>
                <asp:Repeater ID="RpOpList" runat="server">
                    <ItemTemplate>
                        <li>
                            <h5><a class="title" href="opd.aspx?did=<%# Eval("opID") %>"><%# Eval("opTitle") %></a><a class="more" href="opd.aspx?did=<%# Eval("opID") %>">.</a></h5>
                            <p>
                                项目编号：1001A203 &emsp;&emsp;&emsp;项目主持人：赵俊芬 (zhaozhao@tust.edu.cn)&emsp;&emsp;&emsp;部门：机械工程学院
                            </p>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                
               
            </ul>
        </div>

        <!-- div class="pager">
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">7</a>
            <a href="#">8</a>
        </div !-->

        <div class="clear"></div>
    </div>
    <uc:FootControl runat="server" id="FootControl" />
    </form>
</body>
</html>
