<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="include/top.jsp"%>
<%@ include file="include/plainSearch.jsp"%>
<%
String orderpath = request.getContextPath();
String orderbasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+orderpath+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=orderbasePath%>">
    <title>订单页面</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
	$(function(){
	$("a[orderStatus]").click(function(){
		var orderStatus = $(this).attr("orderStatus");
		if('all' == orderStatus){
			$("table[orderStatus]").show();
		}else{
			$("table[orderStatus]").hide();
			$("table[orderStatus="+orderStatus+"]").show();
		}
		$("#orderType div").removeClass("selectedOrderType");
		$(this).parent("div").addClass("selectedOrderType");
	});
	//下面是后台交互
	$("a.deleteOrderLink").click(function(){
        deleteOrderid = $(this).attr("oid");
        deleteOrder = false;
        $("#deleteConfirmModal").modal("show");
    });
    $("button.deleteConfirmButton").click(function(){
        deleteOrder = true;
        $("#deleteConfirmModal").modal('hide');
    }); 
    $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
        if(deleteOrder){
            $.post(
                    "forealipay!deleteOrder",
                    {"oid":deleteOrderid},
                    function(){
                            $("table.orderListItemTable[oid="+deleteOrderid+"]").hide();
                    }
                );
        }
    })      
	
	$(".btn").click(function(){
	 var oid = $(this).attr("oid");
		$.post(
			"forebought!orderpost",
			{"oid":oid},
			function(){
				$(".btn").css({"display":"none"});
				$("#waitDelivery").html("请刷新");
			}
		);
	});
	});
	</script>
  </head>
  <body>
  <div id="boughtDiv">
  	<div id="orderType">
  		<div class="selectedOrderType"><a href="javascript:;" orderStatus="all">所有订单</a></div>
  		<div class=""><a href="javascript:;" orderStatus="waitPay">待付款</a></div>
  		<div class=""><a href="javascript:;" orderStatus="waitDelivery">待发货</a></div>
  		<div class=""><a href="javascript:;" orderStatus="waitConfirm">待收货</a></div>
  		<div class=""><a class="noRightborder" href="javascript:;" orderStatus="waitReview">待评价</a></div>
  		<div class="orderTypeLastOne"></div>
  	</div>
  	<div style="clear:both;"></div>
  	<div id="orderListTitle">
  		<table id="orderListTitleTable">
  			<tbody>
  				<tr>
  					<td>宝贝</td>
  					<td style="width: 100px;">单价</td>
  					<td style="width: 100px;">数量</td>
  					<td style="width: 120px;">实付款</td>
  					<td style="width: 100px;">操作</td>
  				</tr>
  			</tbody>
  		</table>
  	</div>
  	<div class="orderListItem">
        <c:forEach items="${os}" var="o">
            <table class="orderListItemTable" orderStatus="${o.status}" oid="${o.id}">
                <tr class="orderListItemFirstTR">
                    <td colspan="2">
                    <b><fmt:formatDate value="${o.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></b> 
                    <span>订单号: ${o.orderCode} 
                    </span>
                    </td>
                    <td  colspan="2"><img width="13px" src="FountModule/img/site/orderItemTmall.png">天猫商场</td>
                    <td colspan="1">
                        <a class="wangwanglink" href="#nowhere">
                            <div class="orderItemWangWangGif"></div>
                        </a>
                         
                    </td>
                    <td class="orderItemDeleteTD">
                        <a class="deleteOrderLink" oid="${o.id}" href="javascript:;">
                            <span  class="orderListItemDelete glyphicon glyphicon-trash"></span>
                        </a>
                         
                    </td>
                </tr>
                <c:forEach items="${o.orderItems}" var="oi" varStatus="st">
                    <tr class="orderItemProductInfoPartTR" >
                        <td class="orderItemProductInfoPartTD"><img width="80" height="80" src="FountModule/img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
                        <td class="orderItemProductInfoPartTD">
                            <div class="orderListItemProductLinkOutDiv">
                                <a href="foreproduct?pid=${oi.product.id}">${oi.product.name}</a>
                                <div class="orderListItemProductLinkInnerDiv">
                                            <img src="FountModule/img/site/creditcard.png" title="支持信用卡支付">
                                            <img src="FountModule/img/site/7day.png" title="消费者保障服务,承诺7天退货">
                                            <img src="FountModule/img/site/promise.png" title="消费者保障服务,承诺如实描述">                       
                                </div>
                            </div>
                        </td>
                        <td  class="orderItemProductInfoPartTD" width="100px">
                         
                            <div class="orderListItemProductOriginalPrice">￥<fmt:formatNumber type="number" value="${oi.product.orignalPrice}" minFractionDigits="2"/></div>
                            <div class="orderListItemProductPrice">￥<fmt:formatNumber type="number" value="${oi.product.barginPrice}" minFractionDigits="2"/></div>
         
                        </td>
                        <c:if test="${st.count==1}">
                            <td valign="top" rowspan="${fn:length(o.orderItems)}" class="orderListItemNumberTD orderItemOrderInfoPartTD" width="100px">
                                <span class="orderListItemNumber">${o.totalNumber}</span>
                            </td>
                            <td valign="top" rowspan="${fn:length(o.orderItems)}" width="120px" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD">
                                <div class="orderListItemProductRealPrice">￥<fmt:formatNumber  minFractionDigits="2"  maxFractionDigits="2" type="number" value="${o.total}"/></div>
                                <div class="orderListItemPriceWithTransport">(含运费：￥0.00)</div>
                            </td>
                            <td valign="top" rowspan="${fn:length(o.orderItems)}" class="orderListItemButtonTD orderItemOrderInfoPartTD" width="100px">
                                <c:if test="${o.status=='waitConfirm' }">
                                    <a href="foreconfirmPay?oid=${o.id}">
                                        <button class="orderListItemConfirm">确认收货</button>
                                    </a>
                                </c:if>
                                <c:if test="${o.status=='waitPay' }">
                                    <a href="alipay.jsp?oid=${o.id}&total=${o.total}">
                                        <button class="orderListItemConfirm">付款</button>
                                    </a>                              
                                </c:if>
                                 
                                <c:if test="${o.status=='waitDelivery' }">
                                    <span id="waitDelivery">待发货</span>
                                    <button class="btn btn-info btn-sm ask2delivery" oid="${o.id}">催卖家发货</button>
                                </c:if>
 
                                <c:if test="${o.status=='waitReview' }">
                                    <a href="forereview?oid=${o.id}">
                                        <button  class="orderListItemReview">评价</button>
                                    </a>
                                </c:if>
                            </td>                     
                        </c:if>
                    </tr>
                </c:forEach>      
                 
            </table>
        </c:forEach>
  	</div>
  </body>
</html>
