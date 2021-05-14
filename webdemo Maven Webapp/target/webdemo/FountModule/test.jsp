<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
div.boughtDiv{
    max-width: 1013px;
    margin: 10px auto;
}
div.orderType div{
    border-bottom: 2px solid #E8E8E8;
    float: left;
}
div.orderType a{
    border-right: 1px solid #E8E8E8;
    display:inline-block;
    font-size: 16px;
    font-weight: bold;
    color: black;
    margin-bottom: 10px;
    padding: 0px 20px;
    text-decoration: none;
}
div.orderType a:hover{
    color: #C40000;
    text-decoration: none;
}
div.orderType div.selectedOrderType{
    border-bottom: 2px solid #C40000;
}
div.orderType div.selectedOrderType a{
    color: #C40000;
}
div.orderTypeLastOne{
    overflow: hidden;
    float: none !important;
    border-bottom: 2px solid #E8E8E8;
    height:35px;
}
a.noRightborder{
    border-right-width:0px !important;
}
table.orderListTitleTable{
    border: 1px solid #E8E8E8;
    width: 100%;
    margin: 20px 0px;
    background-color: #F5F5F5;
    text-align: center;
    font-size:12px;
}
table.orderListTitleTable td{
    padding: 12px 0px;
}
</style>
  </head>
  
  <body>
    <div class="boughtDiv">
    <div class="orderType">
        <div class="selectedOrderType"><a href="#nowhere" orderstatus="all">所有订单</a></div>
        <div><a href="#nowhere" orderstatus="waitPay">待付款</a></div>
        <div><a href="#nowhere" orderstatus="waitDelivery">待发货</a></div>
        <div><a href="#nowhere" orderstatus="waitConfirm">待收货</a></div>
        <div><a class="noRightborder" href="#nowhere" orderstatus="waitReview">待评价</a></div>
        <div class="orderTypeLastOne">
       
      </div>
    </div>
    <div style="clear:both"></div>
    <div class="orderListTitle">
        <table class="orderListTitleTable">
            <tbody><tr>
                <td>宝贝</td>
                <td width="100px">单价</td>
                <td width="100px">数量</td>
                <td width="120px">实付款</td>
                <td width="100px">交易操作</td>
            </tr>
        </tbody></table>
    </div>
</div>

  </body>
</html>
