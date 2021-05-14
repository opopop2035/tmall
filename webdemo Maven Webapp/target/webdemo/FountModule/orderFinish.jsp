<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp"%>
<%@ include file="include/plainSearch.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>收货成功</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <div class="orderFinishDiv">
    <div class="orderFinishTextDiv">
        <img src="http://how2j.cn/tmall/img/site/orderFinish.png">
        <span>交易已经成功，卖家将收到您的货款。</span>
    </div>
</div>
  </body>
    <%@ include file="include/Footer.jsp" %>
</html>
