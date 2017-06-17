<!doctype html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String userLogpath = request.getContextPath();
String userLogbasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+userLogpath+"/";
%>

<html>
  <head>
    <base href="<%=userLogbasePath%>">
    
    <title>用户登陆</title>
	<%@ include file="include/top.jsp"%>
	<script>
	$(function() {
	 var left = window.innerWidth/2+162;
    $("#loginSmallDiv").css("left",left);
    var msg = "${msg}";
		if (msg != "") {
			$("span.errorMessage").html(msg);
			$("#loginErrorMessageDiv").show();
			}
			$("form.loginForm").submit(function(){
       	 if(0==$("#userName").val().length||0==$("#password").val().length){
            $("span.errorMessage").html("请输入账号密码");
            $("#loginErrorMessageDiv").show();           
            return false;
        }
        return true;
    });
     
    $("form.loginForm input").keyup(function(){
        $("#loginErrorMessageDiv").hide();   
    });
     
   
})
	
	</script>
  </head>

<body>

	<div id="loginDiv" style="position: relative;">
	<div class="simpleLogo">
        <a href="${contextPath}"><img src="FountModule/img/site/simpleLogo.png"></a>
    </div>
    <img id="loginBackgroundImg" class="loginBackgroundImg" src="FountModule/img/site/loginBackground.png">
		<form action="login" method="post" class="loginForm">
			<div id="loginSmallDiv">
				<div id="loginErrorMessageDiv" style="display: none;">
					<div class="alert alert-danger">
						<button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
						<span class="errorMessage"></span>
					</div>
				</div>
				<div class="login_acount_text">账户登录</div>
				<div class="loginInput">
					<span class="loginInputIcon"> 
					<span class="glyphicon glyphicon-user"></span>
					</span> 
					<input id="userName" name="userName" placeholder="手机/会员名/邮箱" type="text" required="required">
				</div>
				<div class="loginInput" >
                <span class="loginInputIcon ">
                    <span class="glyphicon glyphicon-lock"></span>
                </span>
                <input id="password" name="password" type="password" placeholder="密码" type="text" required="required">
            </div>
				<div>
					<a class="notImplementLink" href="#nowhere">忘记登录密码</a> 
						<a href="register.jsp" class="pull-right">免费注册</a>
				</div>
				<div style="margin-top:20px">
					<button class="btn btn-block redButton" type="submit">登录</button>
				</div>
			</div>
		</form>
	</div>
	<s:debug></s:debug>
</body>
<%@ include file="include/Footer.jsp"%>
</html>
