<!doctype html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
  <%
	String searchpath = request.getContextPath();
	String searchbasePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ searchpath + "/";
%>

<html>
<head>
<base href="<%=searchbasePath%>">
    <title>My JSP 'search.jsp' starting page</title>
    <!-- <script type="text/javascript" src="lib/jquery-3.1.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="lib/bootstrap/js/bootstrap.min.js"></script> -->
	<link rel="stylesheet" type="text/css"
	href="FountModule/css/FountModule.css">

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
  <div>
  	<a href="index"><img id="logo" alt="home" src="FountModule/img/site/logo.gif"></a>
  	<form action="foresearch" method="post" > 
        <div id="searchDiv">
            <input name="keyword" type="text" value="${param.keyword}" placeholder="时尚男鞋  太阳镜 ">
            <button  type="submit" class="searchButton">搜索</button>
            <div id="searchBelow">
                <c:forEach items="${cs}" var="c" varStatus="st">
                    <c:if test="${st.count>=5 and st.count<=8}">
                        <span>
                            <a href="forecategory?cid=${c.id}">
                                ${c.name}
                            </a>
                            <c:if test="${st.count!=8}">              
                                <span>|</span>              
                            </c:if>
                        </span>           
                    </c:if>
                </c:forEach>      
            </div>
        </div>
    </form>   
  	</div>
  </body>
</html>
