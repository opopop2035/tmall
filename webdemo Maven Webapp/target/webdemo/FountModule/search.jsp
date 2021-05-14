<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="include/top.jsp"%>
<%@ include file="include/search.jsp"%>
<%
String searchPagepath = request.getContextPath();
String searchPagebasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+searchPagepath+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=searchPagebasePath%>">
    
    <title>查询页面</title>
    
	<link rel="stylesheet" type="text/css" href="FountModule/css/FountModule.css">
  </head>
  
  <body>
  <div id="searchProducts">
     
    <c:forEach items="${ps}" var="p">
        <div class="productUnit" price="${p.barginPrice}">
            <a href="foreproduct?pid=${p.id}">
                <img class="productImage" src="FountModule/img/productSingle/${p.firstProductImage.id}.jpg">
            </a>
            <span class="productPrice">¥<fmt:formatNumber type="number" value="${p.barginPrice}" minFractionDigits="2"/></span>
            <a class="productLink" href="foreproduct?pid=${p.id}">
             ${fn:substring(p.name, 0, 50)}
            </a>
             
            <a class="tmallLink" href="foreproduct?pid=${p.id}">天猫专卖</a>
 
            <div class="productInfo">
                <span class="monthDeal ">月成交 <span class="productDealNumber">${p.saleCount}笔</span></span>
                <span class="productReview">评价<span class="productReviewNumber">${p.reviewCount}</span></span>
                <span class="wangwang"><img src="FountModule/img/site/wangwang.png"></span>
            </div>
        </div>
    </c:forEach>
    <c:if test="${empty ps}">
        <div class="noMatch">没有满足条件的产品</div>
    </c:if>
        <div style="clear:both"></div>
</div>
  </body>
  <%@ include file="include/Footer.jsp"%>
</html>
