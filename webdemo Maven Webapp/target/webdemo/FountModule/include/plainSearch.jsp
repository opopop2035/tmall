<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <% String plainSearchpath = request.getContextPath();
   String plainSearchbasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+plainSearchpath+"/";%>

<html>
<head>
<base href="<%=plainSearchbasePath%>">

	<!--  
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <div style="width: 1200px;margin: 5px auto;">
  	<a href="index"><img id="plainLogo" alt="home" src="FountModule/img/site/simpleLogo.png"></a>
  	<form action="foresearch" method="post" > 
  	<div id="simpleSearchDiv" class="pull-right">
  		<input type="text" placeholder="请输入想要搜索的内容" value="${param.keyword}" id="searchText">
  		<button id="searchButton" type="submit">搜天猫</button>
  		<div id="searchBelow">
            <c:forEach items="${categorysByRow}" var="c" varStatus="st">
                <c:if test="${st.count>=8 and st.count<=11}">
                    <span>
                        <a href="forecategory?cid=${c.id}">
                            ${c.name}
                        </a>
                        <c:if test="${st.count!=11}">             
                            <span>|</span>              
                        </c:if>
                    </span>           
                </c:if>
            </c:forEach>          
        </div>
  	</div>
  	</form>
  	<div style="clear:both"></div>
  	</div>
  </body>
</html>
