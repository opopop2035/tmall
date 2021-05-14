<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="include/top.jsp"%>
<%
String paypath = request.getContextPath();
String paybasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+paypath+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=paybasePath%>">
    
    <title>支付页面</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <div class="aliPayPageDiv">
    <div class="aliPayPageLogo">
        <img class="pull-left" src="FountModule/img/site/simpleLogo.png">
        <div style="clear:both"></div>
    </div>
     
    <div>
        <span class="confirmMoneyText">扫一扫付款（元）</span>
        <span class="confirmMoney"> ￥<fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/></span>
    </div>
    <div>
        <img class="aliPayImg" src="FountModule/img/site/alipay2wei.png">
    </div>
 
    <div>
        <a href="forepayed?oid=${oid}&total=${total}"><button class="confirmPay">确认支付</button></a>
    </div>
 </div>
  </body>
  <%@ include file="include/Footer.jsp" %>
</html>
