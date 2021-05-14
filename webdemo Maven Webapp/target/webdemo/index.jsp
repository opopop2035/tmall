<!doctype html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="FountModule/include/top.jsp"%>
<%@ include file="FountModule/include/search.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
<base href="<%=basePath%>">

<title>用户注册</title>


<script>
function formatMoney(num){
    num = num.toString().replace(/\$|\,/g,'');  
    if(isNaN(num))  
        num = "0";  
    sign = (num == (num = Math.abs(num)));  
    num = Math.floor(num*100+0.50000000001);  
    cents = num%100;  
    num = Math.floor(num/100).toString();  
    if(cents<10)  
    cents = "0" + cents;  
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
    num = num.substring(0,num.length-(4*i+3))+','+  
    num.substring(num.length-(4*i+3));  
    return (((sign)?'':'-') + num + '.' + cents);  
}
function checkEmpty(id, name){
    var value = $("#"+id).val();
    if(value.length==0){
         
        $("#"+id)[0].focus();
        return false;
    }
    return true;
}
////////////////////////////////////////
	function showProductsAsideCategorys(cid) {
			$(".eachCategory[cid=" + cid + "]").css("background-color", "white");
			$(".eachCategory[cid=" + cid + "] a").css("color", "#87CEFA");
			$(".productsAsideCategorys[cid=" + cid + "]").show();
		}
	function hideProductsAsideCategorys(cid) {
			$(".eachCategory[cid=" + cid + "]").css("background-color", "#e2e2e3");
			$(".eachCategory[cid=" + cid + "] a").css("color", "#000");
			$(".productsAsideCategorys[cid=" + cid + "]").hide();
	}
	$(function() {
		$("a.productDetailTopReviewLink").click(function() {
			$("div.productReviewDiv").show();
			$("div.productDetailDiv").hide();
		});
		$("a.productReviewTopPartSelectedLink").click(function() {
			$("div.productReviewDiv").hide();
			$("div.productDetailDiv").show();
		});

		$("span.leaveMessageTextareaSpan").hide();
		$("img.leaveMessageImg").click(function() {
			$(this).hide();
			$("span.leaveMessageTextareaSpan").show();
			$("div.orderItemSumDiv").css("height", "100px");
		});
		//$("div#footer a[href$=#nowhere]").click(function() {
			//alert("模仿天猫的连接，并没有跳转到实际的页面");
		//});
		$("a.wangwanglink").click(function() {
			alert("模仿旺旺的图标，并不会打开旺旺");
		});
		$("a.notImplementLink").click(function() {
			alert("这个功能没做，蛤蛤~");
		});

		$("#rightMenu span").mouseenter(function() {
			var left = $(this).position().left;
			var top = $(this).position().top;
			var width = $(this).css("width");
			var destLeft = parseInt(left) + parseInt(width) / 2;
			$("img#catear").css("left", destLeft);
			$("img#catear").css("top", top - 20);
			$("img#catear").fadeIn(500);
		});
		$("#rightMenu span").mouseleave(function() {
			$("img#catear").hide();
		});
		$(".eachCategory").mouseenter(function() {
			var cid = $(this).attr("cid");
			showProductsAsideCategorys(cid);
		});
		$(".eachCategory").mouseleave(function() {
			var cid = $(this).attr("cid");
			hideProductsAsideCategorys(cid);
		});
		$(".productsAsideCategorys").mouseenter(function() {
			var cid = $(this).attr("cid");
			showProductsAsideCategorys(cid);
		});
		$(".productsAsideCategorys").mouseleave(function() {
			var cid = $(this).attr("cid");
			hideProductsAsideCategorys(cid);
		});

		$("div.productsAsideCategorys div.row a").each(function() {
			var v = Math.round(Math.random() * 6);
			if (v == 1)
				$(this).css("color", "#87CEFA");
		});
		var left = $("div#carousel-of-product").offset().left;
   			$("div.categoryMenu").css("left",left-20);
    		$("div.categoryWithCarousel div.head").css("margin-left",left);
    		$("div.productsAsideCategorys").css("left",left-20);
		});
</script>
</head>
<body>
<div style="height:50px"></div>
<img class="catear" id="catear" src="FountModule/img/site/catear.png" style="left: 260.5px; top: 159.65px; display: none;">
	<div id="categoryWithCarousel">
		<div class="headbar  show1">
			<div id="head">
				<span class="glyphicon glyphicon-th-list" style="margin-left:10px"></span>
				<span style="margin-left:10px">商品分类</span>
			</div>
			<div id="rightMenu">
				<span><a href="#"><img src="FountModule/img/site/chaoshi.png"></a></span> 
				<span><a href="#"><img src="FountModule/img/site/guoji.png"></a></span>
				<c:forEach items="${categorysByRow}" var="c" varStatus="st">
					<c:if test="${st.count<=4}">
						<span> <a href="forecategory?cid=${c.id}"> ${c.name} </a></span>
					</c:if>
				</c:forEach>
			</div>
			<div style="position: relative;margin-left: 360px;">
				<div id="categoryMenu">
					<c:forEach items="${categorysByRow}" var="c">
						<div cid="${c.id}" class="eachCategory">
							<span class="glyphicon glyphicon-link"></span> 
							<a href="forecategory?cid=${c.id}">
								 ${c.name} </a>
						</div>
					</c:forEach>
				</div>
			</div>
			</div>
			<div style="position: relative;left: 0;top: 0;">
			<c:forEach items="${categorysByRow}" var="c">
				<div cid="${c.id}" class="productsAsideCategorys">
					<c:forEach items="${c.productsByRow}" var="ps">
						<div class="row  show1" id="row">
							<c:forEach items="${ps}" var="p">
								<c:if test="${!empty p.subTitle}">
									<a href="foreproduct?pid=${p.id}">
									 	<c:forEach items="${fn:split(p.subTitle, ' ')}" var="title" varStatus="st">
											<c:if test="${st.index==0}">
                                    		${title}
                                			</c:if>
										</c:forEach>
									</a>
								</c:if>
							</c:forEach>
							<div class="seperator"></div>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
			<!-- <div class="row show1">
						<a href="#nowhere"> 本产品划线价 </a> <a href="#nowhere"> 超值豪礼 </a> <a
							href="#nowhere" style="color: rgb(135, 206, 250);"> ISOFIX </a>
						<div class="seperator"></div>
					</div>
				</div> -->
			</div> 
			<div></div>
			<div data-ride="carousel" class="carousel-of-product carousel slide1" id="carousel-of-product">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-of-product"></li>
					<li data-slide-to="1" data-target="#carousel-of-product" ></li>
					<li data-slide-to="2" data-target="#carousel-of-product" ></li>
					<li data-slide-to="3" data-target="#carousel-of-product"></li>
				</ol>
				<!-- Wrapper for slides -->
				<div role="listbox" class="carousel-inner">
					<div class="item active">
						<img src="FountModule/img/lunbo/1.jpg"
							class="carousel carouselImage">
					</div>
					<div class="item">
						<img src="FountModule/img/lunbo/2.jpg" class="carouselImage">
					</div>
					<div class="item">
						<img src="FountModule/img/lunbo/3.jpg" class="carouselImage">
					</div>
					<div class="item">
						<img src="FountModule/img/lunbo/4.jpg" class="carouselImage">
					</div>
				</div>
				<!-- Controls -->
			</div>
		</div>
		<c:if test="${empty param.categorycount}">
			<c:set var="categorycount" scope="page" value="100" />
		</c:if>

		<c:if test="${!empty param.categorycount}">
			<c:set var="categorycount" scope="page"
				value="${param.categorycount}" />
		</c:if>

		<div class="homepageCategoryProducts">
			<c:forEach items="${categorysByRow}" var="c" varStatus="stc">
				<c:if test="${stc.count<=categorycount}">
					<div class="eachHomepageCategoryProducts">
						<div class="left-mark"></div>
						<span class="categoryTitle">${c.name}</span> <br>
						<c:forEach items="${c.products}" var="p" varStatus="st">
							<c:if test="${st.count<=5}">
								<div class="productItem">
									<a href="foreproduct?pid=${p.id}">
										<img width="100px" src="/webdemo/FountModule/img/productSingle_middle/${p.firstProductImage.id}.jpg"></a>
									<a class="productItemDescLink" href="foreproduct?pid=${p.id}">
										<span class="productItemDesc">[热销]
											${fn:substring(p.name, 0, 20)} </span>
									</a> <span class="productPrice"> 
										<fmt:formatNumber type="number" value="${p.barginPrice}" minFractionDigits="2"/>
									</span>
								</div>
							</c:if>
						</c:forEach>
						<div style="clear:both"></div>
					</div>
				</c:if>
			</c:forEach>

			<img id="endpng" class="endpng" src="FountModule/img/site/end.png">

		</div>
		
</body>
<%@ include file="FountModule/include/Footer.jsp"%>
</html>