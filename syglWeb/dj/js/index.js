
$(function () {
    //菜单按钮点击后，添加新Tab
    $(".menu-button").live('click', function () {
        var $this = $(this);
        var nd = { text: $this.text(), attributes: { url: $this.attr("href") } };
        $.addTab(nd, $('#centerTabs'));
        return false;
    });
    //初始化登陆dialog
    $("#login-dialog").dialog({
        title: '登录',
        iconCls: 'icon-user_gray',
        closed: true,
        modal: true,
        buttons: [{
            text: '登录',
            iconCls: 'icon-ok',
            handler: function () {
                var $loginUrl = $("#login-form").attr("action");
                $("#login-form").form('submit', {
                    url: $loginUrl,
                    onSubmit: function () {                        
                        //如果返回false阻止提交
                        return $("#login-form").form("validate");
                    },
                    success: function (data) {
                        data = $.parseJSON(data);
                        if (data.status === 0) {
                            $.messager.alert("错误", data.msg, "error");
                        } else {
                            $.messager.show({ title: "提示", msg: data.msg, timeout: 2000 });
                        }
                    }
                });

            }
        }, {
            text: '取消',
            iconCls: 'icon-undo',
            handler: function () {
                $("#login-dialog").dialog('close');
            }
        }]
    });
    //绑定登录按钮事件
    $("#login-button").click(function () {
        $("#login-dialog").dialog('open');
    });
});