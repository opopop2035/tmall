// JavaScript Document
$(function(){
	"use strict";
	$("#password2").blur(
		$.post(
			"/FountModule/UserRegister.jsp",
			function(){
				if($(this).val !== $("#password1").val)
				{
					window.alert("!!")
					$("vaildateResult").html("密码不一致！");//验证密码是否一致.css("color:red")
				}
			})
		);
	
	//function callback(data){
	//	var jqueryObj = $(data);
	//	$("#userExist").html("用户名重复");
	//	}

});