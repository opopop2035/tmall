<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="include/top.jsp"%>
<%@ include file="include/search.jsp"%>
<!DOCTYPE html>
<%
String categoryPath = request.getContextPath();
String categoeyBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+categoryPath+"/";
%>

<html>
<head>
<base href="<%=categoeyBasePath%>">
    <title>category</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	$(function(){
	$("input.sortBarPrice").keyup(function(){
    var num= $(this).val();
    if(num.length==0){
        $("div.productUnit").show();
        return;
    }
         
    num = parseInt(num);
    if(isNaN(num))
        num= 1;
    if(num<=0)
        num = 1;
    $(this).val(num);       
     
    var begin = $("input.beginPrice").val();
    var end = $("input.endPrice").val();
    if(!isNaN(begin) && !isNaN(end)){
        console.log(begin);
        console.log(end);
        $("div.productUnit").hide();
        $("div.productUnit").each(function(){
            var price = $(this).attr("price");
            price = new Number(price);
             
            if(price<=end && price>=begin)
                $(this).show();
        });
    }
});});
	</script>
  </head>
<body>
	<div class="categoryPageDiv">
		<img src="FountModule/img/category/72.jpg">
		<div class="categorySortBar">
    		<table class="categorySortBarTable categorySortTable">
        		<tr>
            		<td <c:if test="${'all'==param.sort||empty param.sort}">class="grayColumn"</c:if> ><a href="forecategory?cid=${c.id}&sort=all">综合<span class="glyphicon glyphicon-arrow-down"></span></a></td>
            		<td <c:if test="${'review'==param.sort}">class="grayColumn"</c:if> ><a href="forecategory?cid=${c.id}&sort=review">人气<span class="glyphicon glyphicon-arrow-down"></span></a></td>
            		<td <c:if test="${'date'==param.sort}">class="grayColumn"</c:if>><a href="forecategory?cid=${c.id}&sort=date">新品<span class="glyphicon glyphicon-arrow-down"></span></a></td>
            		<td <c:if test="${'saleCount'==param.sort}">class="grayColumn"</c:if>><a href="forecategory?cid=${c.id}&sort=saleCount">销量<span class="glyphicon glyphicon-arrow-down"></span></a></td>
            		<td <c:if test="${'price'==param.sort}">class="grayColumn"</c:if>><a href="forecategory?cid=${c.id}&sort=price">价格<span class="glyphicon glyphicon-resize-vertical"></span></a></td>
        		</tr>
    		</table>
     
    		<table class="categorySortBarTable">
        		<tr>
    	   			 <td><input class="sortBarPrice beginPrice" type="text" placeholder="请输入"></td>
         	   		<td class="grayColumn priceMiddleColumn">-</td>
            		<td><input class="sortBarPrice endPrice" type="text" placeholder="请输入"></td>
        		</tr>
    		</table>
 
</div>
		<c:if test="${empty param.categorycount}">
    <c:set var="categorycount" scope="page" value="100"/>
</c:if>
 
<c:if test="${!empty param.categorycount}">
    <c:set var="categorycount" scope="page" value="${param.categorycount}"/>
</c:if>
     
<div class="categoryProducts">
    <c:forEach items="${c.products}" var="p" varStatus="stc">
        <c:if test="${stc.count<=categorycount}">
        <div class="productUnit" price="${p.barginPrice}">
            <div class="productUnitFrame">
                <a href="foreproduct?pid=${p.id}">
                    <img class="productImage" src="FountModule/img/productSingle_middle/${p.firstProductImage.id}.jpg">
                </a>
                <span class="productPrice">¥<fmt:formatNumber type="number" value="${p.barginPrice}" minFractionDigits="2"/></span>
                <a class="productLink" href="foreproduct?pid=${p.id}">
                 ${fn:substring(p.name, 0, 50)}
                </a>
                 
                <a  class="tmallLink" href="foreproduct?pid=${p.id}">天猫专卖</a>
     
                <div class="show1 productInfo">
                    <span class="monthDeal ">月成交 <span class="productDealNumber">${p.saleCount}笔</span></span>
                    <span class="productReview">评价<span class="productReviewNumber">${p.reviewCount}</span></span>
                    <span class="wangwang">
                    <a class="wangwanglink" href="#nowhere">
                        <img src="FountModule/img/site/wangwang.png">
                    </a>
                     
                    </span>
                </div>
            </div>
        </div>
        </c:if>
    </c:forEach>
        <div style="clear:both"></div>
</div>

	</div>
</body>
<%@ include file="include/Footer.jsp" %>
</html>
