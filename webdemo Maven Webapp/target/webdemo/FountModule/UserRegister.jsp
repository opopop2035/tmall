<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%
	String userRegisterpath = request.getContextPath();
	String userRegisterbasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ userRegisterpath + "/";
%>

<html>
<head>
<base href="<%=userRegisterbasePath%>">
<%@ include file="include/top.jsp"%>
<%@ include file="include/plainSearch.jsp"%>
<title>注册</title>
<script type="text/javascript" src="lib/jquery-3.1.1.js"></script>
<!--  <script type="text/javascript" src="/FountModule/register.js" /></script>-->
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!--password1 : password1.val(),
							password2 : password2.val()-->
<script>
	$(function() {
		"use strict";
		var password1 = $("#password1");
		var passwordFormat = new RegExp("^[a-zA-Z0-9\!\?_-]{6,15}$");
		var isUsernamePass;
		var isPassword1Pass;
		var isPassword2Pass;
		$.ajaxSetup({async:false});
		$("#username").blur(
			function() {
				var thisSelf = this;
				function checkUsername() {
					var usernameFormat = new RegExp("^[\u4E00-\u9fA5a-zA-Z0-9_]{6,16}$");
					if ($(thisSelf).val() == "" || $(thisSelf).val() == " ") {
						isUsernamePass = "用户名不能为空";
					} else if (!usernameFormat.test($(thisSelf).val())) {
						isUsernamePass = "用户名在6到16位之间的中文,英文或下划线";
					} else {
						$.post("preRegister",
							{
								username : $(thisSelf).val()//把用户名传到action方法
							},
							function(data) {
								alert(data);
								if (data == "isExist") {
									isUsernamePass = "用户名已存在";
									return;
								}else{
								isUsernamePass = "用户名可以使用";
								return;
								}
							});
					}
				}
				checkUsername();
				$("#vaildateUsername").html(isUsernamePass).css("color", "red");
			}
		);


		password1.blur(
			function() {
				var thisSelf = $(this);
				function checkPassword1() {
					if (thisSelf.val() == "") {
						return "密码不能为空！";
					} else if (!passwordFormat.test(thisSelf.val())) {
						return "请使用大小写字母，数字或者!?-_密码长度为6-15位";
					} else if (thisSelf.val() != $("#password2").val()) {
						$("#vaildatePassword2").html("密码不一致").css("color", "red");
						return "密码不一致";
					}
					$("#vaildatePassword2").html("").css("color", "red");
					return "";

				}
				isPassword1Pass = checkPassword1();
				$("#vaildatePassword1").html(isPassword1Pass).css("color", "red");
				if (isPassword1Pass == "") {
					isPassword1Pass = true;
					isPassword2Pass = true;
				}
			}
		);

		$("#password2").blur(
			function() {
				var thisSelf = $(this);
				function checkPassword2() {
					if (thisSelf.val() == "") {
						return "确认密码不能为空！";
					} else if (thisSelf.val() != password1.val()) {
						$("#vaildatePassword1").html("密码不一致").css("color", "red");
						return "密码不一致";
					} else if (!passwordFormat.test(thisSelf.val())) {
						return "请使用大小写字母，数字或者!?-_密码长度为6-15位";
					}
					$("#vaildatePassword1").html("").css("color", "red");
					return "";
				}
				isPassword2Pass = checkPassword2();
				$("#vaildatePassword2").html(isPassword2Pass).css("color", "red");
				if (isPassword2Pass == "") {
					isPassword2Pass = true;
					isPassword1Pass = true;
				}
			}
		);
		$("#registerForm").submit(function() {
			if (isUsernamePass == "用户名可以使用" && isPassword2Pass == true && isPassword1Pass == true) {
				return true;
			}
			window.alert("请检查");
			return false;
		});

	});
</script>
</head>

<body>
<div id="registerDiv">
	<form action="userRegister" method="post" id="registerForm">
		<span>用 户 名:</span><input type="text" name="username" id="username" required="required" placeholder="用户名一旦设置成功，无法修改">
			 <br />
		<div id="vaildateUsername"></div>
		<br /> 
		<span>密 码: </span><input type="password" name="password1" id="password1" required="required" placeholder="请输入密码" >
			 <br /><br />
		<div id="vaildatePassword1"></div>
		<span>确认密码:</span> <input type="password" name="password2" id="password2" required="required" placeholder="请再次输入密码"> 
		<br />
		<div id="vaildatePassword2"></div>
		<br /> 
		<input type="submit" value="完成" id="submit" />
		<!-- <input type="hidden" name="isDuplicate" value=""> -->
	</form>
	</div>
</body>
<%@ include file="include/Footer.jsp" %>
</html>
