$(document).ready(function(){
    //$("#Settings").attr("class","start active");
    //$("#setPsWrd").attr("class","active");
    $("#setPsWrd a").bind('click', function() {
        $("#Settings").attr("class","start active");
        $("#setPsWrd").attr("class","active");
    });

    //密码框显示时触发事件
    $("#resetpwd").on('show.bs.modal',function(){
        clearInput(["curpwd","newpwd","confirmpwd"]);
    });

    //密码框隐藏时触发事件
    $("#resetpwd").on('hide.bs.modal',function(){
        $("#Settings").removeClass('start active');
        $("#setPsWrd").removeClass('active');
        $("#Settings span:eq(1)").removeClass('open');
        $("#setPsWrd").parent()
            .removeAttr('style');
    });

    $("#curpwd").blur(function() {
        alertError($(this),"原",$(this).val());
    });
    $("#newpwd").blur(function() {
        alertError($(this),"新",$(this).val());
    });
    $("#confirmpwd").blur(function() {
        if(alertError($("#confirmpwd"),"确认",$(this).val()))
            return;
        else{
            $("#confirmpwd").get(0).style.borderColor = "red";
            $("#confirmpwd").attr("type","text");
            $("#confirmpwd").val("确认密码与新密码不同，请重新输入！");
        }

    });

    $("#curpwd").focus(function() {
        if($(this).attr("type")=="text"){
            $(this).val("");
            $(this).removeAttr('style');
            $(this).attr("type","password");
        }
    });
    $("#newpwd").focus(function() {
        if($(this).attr("type")=="text"){
            $(this).val("");
            $(this).removeAttr('style');
            $(this).attr("type","password");
        }
    });
    $("#confirmpwd").focus(function() {
        if($(this).attr("type")=="text"){
            $(this).val("");
            $(this).removeAttr('style');
            $(this).attr("type","password");
        }
    });

    $("#confirm").bind("click",function(){
        var oldpwd = $("#curpwd").val();
        var newpwd = $("#newpwd").val();
        var confirmpwd = $("#confirmpwd").val();
        var username = $("#curname").text();

        if(!alertError($("#curpwd"),"原",oldpwd))
            return;
        if(!alertError($("#newpwd"),"新",newpwd))
            return;
        if(!alertError($("#confirmpwd"),"确认",confirmpwd))
            return;

        if(newpwd != confirmpwd){
            $("#confirmpwd").get(0).style.borderColor = "red";
            $("#confirmpwd").attr("type","text");
            $("#confirmpwd").val("确认密码与新密码不同，请重新输入！");
        }else{
            checkPassword(oldpwd,newpwd,username);
        }
    });
});

//弹出错误类型($box:密码输入框，type:原、新、确认)
function alertError($box,type,pwd){
    switch(checkInput(pwd)){
        case 1:
            $box.get(0).style.borderColor = "red";
            $box.attr("type","text");
            $box.val("请输入"+type+"密码！");
            return false;
            break;
        case 2:
            $box.get(0).style.borderColor = "red";
            $box.attr("type","text");
            $box.val(type+"密码位数在6~16位之间");
            return false;
            break;
        default:
            return true;
            break;
    };
}

//清空输入框中的内容
function clearInput(arr){
    $.each(arr,function(key,val){
        $("#"+val).val("");
        $("#"+val).removeAttr('style');
    });
}

//判断输入的内容
function checkInput(str){
    if(str==""||str==null)
        return 1;//""
    if(str.length < 6 || str.length >16)
        return 2;//长度小于6位或大于16位
}
//通过ajax比对密码
function checkPassword(oldpwd,newpwd,username){
    $.ajax({
        url: 'rest/user/pwdreset?newpwd='+encrypt(newpwd)+"&oldpwd="+encrypt(oldpwd)+"&username="+username,
        type: 'GET'
    })
        .done(function(data) {
            var obj = JSON.parse(data);
            if(obj[0].result == 0){
                alert("未能修改密码，请重试！");
            }else if(obj[0].result ==1){
                alert("修改成功!");
                $("#resetpwd").modal('hide');
            }else if(obj[0].result ==3){
                //alert("原密码校验失败，请重新输入！");
                $("#curpwd").get(0).style.borderColor = "red";
                $("#curpwd").attr("type","text");
                $("#curpwd").val("原密码校验失败，请重新输入原密码！");
            }
        });
}
//加密方法
//加密方法
function encrypt(str){
    var encryption = sha256_digest(str);
    return encryption;
}
/*$(document).ready(function(){$("#setPsWrd a").bind("click",function(){$("#Settings").attr("class","start active");$("#setPsWrd").attr("class","active")});$("#resetpwd").on("show.bs.modal",function(){clearInput(["curpwd","newpwd","confirmpwd"])});$("#resetpwd").on("hide.bs.modal",function(){$("#Settings").removeClass("start active");$("#setPsWrd").removeClass("active");$("#Settings span:eq(1)").removeClass("open");$("#setPsWrd").parent().removeAttr("style")});$("#curpwd").blur(function(){alertError($(this),
 "\u539f",$(this).val())});$("#newpwd").blur(function(){alertError($(this),"\u65b0",$(this).val())});$("#confirmpwd").blur(function(){alertError($(this),"\u786e\u8ba4",$(this).val());$("#confirmpwd").get(0).style.borderColor="red";$("#confirmpwd").attr("type","text");$("#confirmpwd").val("\u786e\u8ba4\u5bc6\u7801\u4e0e\u539f\u5bc6\u7801\u4e0d\u540c\uff0c\u8bf7\u91cd\u65b0\u8f93\u5165\uff01")});$("#curpwd").focus(function(){"text"==$(this).attr("type")&&($(this).val(""),$(this).removeAttr("style"),
 $(this).attr("type","password"))});$("#newpwd").focus(function(){"text"==$(this).attr("type")&&($(this).val(""),$(this).removeAttr("style"),$(this).attr("type","password"))});$("#confirmpwd").focus(function(){"text"==$(this).attr("type")&&($(this).val(""),$(this).removeAttr("style"),$(this).attr("type","password"))});$("#confirm").bind("click",function(){var a=$("#curpwd").val(),c=$("#newpwd").val(),b=$("#confirmpwd").val(),d=$("#curname").text();alertError($("#curpwd"),"\u539f",a)&&alertError($("#newpwd"),
 "\u65b0",c)&&alertError($("#confirmpwd"),"\u786e\u8ba4",b)&&(c!=b?($("#confirmpwd").get(0).style.borderColor="red",$("#confirmpwd").attr("type","text"),$("#confirmpwd").val("\u786e\u8ba4\u5bc6\u7801\u4e0e\u539f\u5bc6\u7801\u4e0d\u540c\uff0c\u8bf7\u91cd\u65b0\u8f93\u5165\uff01")):checkPassword(a,c,d))})});
 function alertError(a,c,b){switch(checkInput(b)){case 1:return a.get(0).style.borderColor="red",a.attr("type","text"),a.val("\u8bf7\u8f93\u5165"+c+"\u5bc6\u7801\uff01"),!1;case 2:return a.get(0).style.borderColor="red",a.attr("type","text"),a.val(c+"\u5bc6\u7801\u4f4d\u6570\u57286~16\u4f4d\u4e4b\u95f4"),!1;default:return!0}}function clearInput(a){$.each(a,function(a,b){$("#"+b).val("");$("#"+b).removeAttr("style")})}
 function checkInput(a){if(""==a||null==a)return 1;if(6>a.length||16<a.length)return 2}
 function checkPassword(a,c,b){$.ajax({url:"rest/user/pwdreset?newpwd="+encrypt(c)+"&oldpwd="+encrypt(a)+"&username="+b,type:"GET"}).done(function(a){a=JSON.parse(a);0==a[0].result?alert("\u672a\u80fd\u4fee\u6539\u5bc6\u7801\uff0c\u8bf7\u91cd\u8bd5\uff01"):1==a[0].result?(alert("\u4fee\u6539\u6210\u529f!"),$("#resetpwd").modal("hide")):3==a[0].result&&($("#curpwd").get(0).style.borderColor="red",$("#curpwd").attr("type","text"),$("#curpwd").val("\u539f\u5bc6\u7801\u6821\u9a8c\u5931\u8d25\uff0c\u8bf7\u91cd\u65b0\u8f93\u5165\u539f\u5bc6\u7801\uff01"))})}
 function encrypt(a){return sha256_digest(a)};*/