<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="FountModule/include/top.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">

<script type="text/javascript" src="lib/jquery-3.1.1.js"></script>
<script type="text/javascript" src="lib/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="FountModule/css/FountModule.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
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
  </body>
  <%@ include file="FountModule/include/Footer.jsp"%>
</html>

