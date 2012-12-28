<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="issue.aspx.cs" Inherits="syglWeb.slip.Discuss.issue" %>

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
                        <h2>创新论坛：</h2> 
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
                            <div >姓名：<span>夏千祥</span></div>
                            <div >研究方向：<span>计算机科学与技术</span></div>
                        </div>
                    </div>
                    <div class="issue_main">
                        <p>张建国副校长在讲话中强调此次校级实验教学示范中心评审是我校实验教学改革工作的重要组成部分，对切实加快我校实验室建设步伐，促进学校优质实验教学资源的整合和共享，提高学生实践能力和创新精神具有重要意义。他表示一方面我们要优中选优，推荐出参加天津市级实验教学示范中心评选的候选单位，另一方面我们也会在未来加强对相对薄弱中心的关注与建设，保证学校各学科专业的均衡发展。</p>
                        <p>此次申报实验教学示范中心的的机械基础实验中心等20个单位负责人分别向评审专家汇报了中心建设的整体概况、建设理念、管理体制、师资队伍、实验教学改革思路以及面向社会的辐射作用，介绍了中心的特色、示范效应以及所取得的各项成果，并对专家组提出的问题给予详细的解答。专家在审阅材料、听取汇报之后，结合之前对各中心的实地考察情况，对中心的建设以及材料撰写提出了富有建设性的意见和建议。</p>
                    </div>
                </div>
                <div class="comment">
                    <div class="comment_head">
                        <h3>回复：</h3>
                    </div>
                    <div class="comment_list">
                        <div class="comment_item">
                            <div class="comment_side">
                                <div class="comment_user_pro">
                                    <img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="40" />
                                </div>
                            </div>
                            <div class="comment_main">
                                <div class="comment_info">Susanno 回答于 2012-12-28 23:47</div>
                                <div class="comment_content">flash么，用的AMF协议，建议用charles 抓包，我以前做过，详情就不说了 </div>
                                <div class="comment_replay">
                                    <span class="replay_head">---共2条回复---</span>
                                    <ul>
                                        <li>
                                            <div class="replay_user_pro"><a ><img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="30" /></a></div>
                                            <div>
                                                <span>读写分离好弄，前段缓存如何解释？ 至于负载平衡，好像编程不能彻底 前段缓存如何解释？前段缓存如何解释？ 至于负载平衡，好像编程不能彻底  至于负载平衡，好像编程不能彻底 至于负载平衡，好像编程不能彻底解决吧</span>
                                                <span>(8个月前 by 诸葛非卿)</span>
                                                <span><a href="javascript:;">回复</a></span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="replay_user_pro"><a ><img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="30" /></a></div>
                                            <div>
                                                <span>读写分离好弄，前段缓存如何解释？段缓存如何解释？ 至于负载平衡，好像编程不能彻底 至于负载平衡，好像编程不能彻底解决吧</span>
                                                <span>(8个月前 by 诸葛非卿)</span>
                                                <a href="javascript:;">回复</a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="comment_opt"></div>
                            </div>
                        </div>
                        <div class="comment_item">
                            <div class="comment_side">
                                <div class="comment_user_pro">
                                    <img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="40" />
                                </div>
                            </div>
                            <div class="comment_main">
                                <div class="comment_info">Susanno 回答于 2012-12-28 23:47</div>
                                <div class="comment_content">flash么，用的AMF协议，建议用charles 抓包，我以前做过，详情就不说了 </div>
                                <div class="comment_replay">
                                    <span class="replay_head">---共2条回复---</span>
                                    <ul>
                                        <li>
                                            <div class="replay_user_pro"><a ><img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="30" /></a></div>
                                            <div>
                                                <span>读写分离好弄，前段缓存如何解释？ 至于负载平衡，好像编程不能彻底 前段缓存如何解释？前段缓存如何解释？ 至于负载平衡，好像编程不能彻底  至于负载平衡，好像编程不能彻底 至于负载平衡，好像编程不能彻底解决吧</span>
                                                <span>(8个月前 by 诸葛非卿)</span>
                                                <span><a href="javascript:;">回复</a></span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="replay_user_pro"><a ><img src="../Sources/Portraits/Mini/201211031603526697.jpg" width="30" /></a></div>
                                            <div>
                                                <span>读写分离好弄，前段缓存如何解释？段缓存如何解释？ 至于负载平衡，好像编程不能彻底 至于负载平衡，好像编程不能彻底解决吧</span>
                                                <span>(8个月前 by 诸葛非卿)</span>
                                                <a href="javascript:;">回复</a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="comment_opt"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
        <div id="pg_rt"> 
            <uc1:hotTags runat="server" id="hotTags1" />
        </div>
  <div class="clear"></div>
  </div>
    </form>
    <uc1:footer runat="server" ID="footer" />    
</body>
</html>
