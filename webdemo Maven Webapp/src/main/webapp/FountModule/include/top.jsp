<!doctype html>
<%@page import="java.awt.Window"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="zh-CN">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String toppath = request.getContextPath();
String topbasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+toppath+"/";
%>
<head>
<base href=" <%=topbasePath%>">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="lib/jquery-3.1.1.js"></script>
<script type="text/javascript" src="lib/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="FountModule/css/FountModule.css">
</head>
<body>
	<nav id="top">
		<a href="${contextPath}"><span id="homeIcon"class="glyphicon glyphicon glyphicon-home redColor"></span>天猫首页</a> 
		<span>喵，欢迎来到天猫</span>
		<c:if test="${!empty user}">
            <a href="login.jsp">${user.username}</a>
            <a href="login!logout" id="forelogout">退出</a>
        </c:if>
         
        <c:if test="${empty user}">
            <a href="FountModule/UserLog.jsp">请登录</a>
            <a href="userRegister">免费注册</a>     
        </c:if>
 
        <span class="pull-right">
            <a href="forebought">我的订单</a>
            <a href="forecart">
            <span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-shopping-cart redColor"></span>
            购物车<strong>${cartTotalItemNumber}</strong>件</a>       
        </span>
	</nav>
	
	 <div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog deleteConfirmModalDiv">
       <div class="modal-content">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">确认删除？</h4>
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <button class="btn btn-primary deleteConfirmButton" id="submit" type="button">确认</button>
          </div>
        </div> 
      </div>
    </div> 
</body>
</html>
