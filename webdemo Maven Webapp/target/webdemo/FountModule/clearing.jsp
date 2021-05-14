<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String clearingpath = request.getContextPath();
String clearingbasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+clearingpath+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=clearingbasePath%>">
    
    <title>结算页面</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script>
	$(function() {
		$("img.leaveMessageImg").click(function() {
			$(this).hide();
			$("span.leaveMessageTextareaSpan").show();
			$("div.orderItemSumDiv").css("height", "100px");
		});
	});
</script>
</head>
  <body>
	<div id="buyPageDiv">
	<form action="forealipay" method="post">
		<div class="buyFlow">
			<img src="FountModule/img/site/simpleLogo.png" class="pull-left">
			<img src="FountModule/img/site/buyflow.png" class="pull-right">
			<div style="clear:both"></div>
		</div>
		<div class="address">
			<div class="addressTip">请输入收货地址</div>
			<div>
				<table class="addressTable">
					<tr>
						<td class="firstColum">详细地址<span class="redStar">*</span></td>
						<td><textarea
								placeholder="建议您如实填写详细收货地址，例如接到名称，门牌号码，楼层和房间号等信息" name="address"></textarea></td>
					</tr>
					<tr>
						<td>邮政编码</td>
						<td><input type="text" placeholder="如果您不清楚邮递区号，请填写000000" name="post"></td>
					</tr>
					<tr>
						<td>收货人姓名<span class="redStar">*</span></td>
						<td><input type="text" placeholder="长度不超过25个字符" name="receiver"></td>
					</tr>
					<tr>
						<td>手机号码 <span class="redStar">*</span></td>
						<td><input type="text" placeholder="请输入11位手机号码" name="mobile"></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="productList">
			<div id="productListTip">确认订单信息</div>
			<table class="productListTable">
				<thead>
					<tr>
						<th class="productListTableFirstColumn" colspan="2"><img
							src="FountModule/img/site/tmallbuy.png" class="tmallbuy"> <a
							href="#nowhere" class="marketLink">店铺：天猫店铺</a> <a
							href="javascript:;" class="wangwanglink"> <span
								class="wangwangGif"></span>
						</a></th>
						<th>单价</th>
						<th>数量</th>
						<th>小计</th>
						<th>配送方式</th>
					</tr>
					<tr class="rowborder">
						<td colspan="2"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</thead>
				<tbody class="productListTableTbody">
					<c:forEach items="${ois}" var="oi" varStatus="st">
						<tr class="orderItemTR">
						<td class="orderItemFirstTD"><img class="orderItemImg" src="FountModule/img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
						<td class="orderItemProductInfo">
						<a href="foreproduct?pid=${oi.product.id}" class="orderItemProductLink">
							${oi.product.name}
						</a>
							<img src="FountModule/img/site/creditcard.png" title="支持信用卡支付">
                            <img src="FountModule/img/site/7day.png" title="消费者保障服务,承诺7天退货">
                            <img src="FountModule/img/site/promise.png" title="消费者保障服务,承诺如实描述">
						</td>
						<td>
							<span class="orderItemProductPrice">￥<fmt:formatNumber type="number" value="${oi.product.orignalPrice}" minIntegerDigits="2" /></span>
						</td>
						<td>
							<span class="orderItemProductNumber">${oi.number}</span>
						</td>
						<td>
							<span class="orderItemUnitSum">￥<fmt:formatNumber type="number" value="${oi.number*oi.product.orignalPrice}" minIntegerDigits="2"/></span>
						</td>
						<c:if test="${st.count==1}">
							<td rowspan="5" class="orderItemLastTD">
							<label class="orderItemDeliveryLabel">
								<input type="radio" value="" checked="checked">
								普通配送
							</label>
							<select class="orderItemDeliverySelect" class="form-control">
								<option>快递 免邮费</option>
							</select>
							</td>
						</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="orderItemSumDiv">
				<div class="pull-left">
					<span class="leaveMessageText">给卖家留言:</span> 
					<span>  
					<img src="FountModule/img/site/leaveMessage.png" class="leaveMessageImg">
					</span> 
					<span class="leaveMessageTextareaSpan" style="display: none;">
						<textarea class="leaveMessageTextarea" name="userMessage"></textarea>
							<div>
							<span>还可以输入200个字符</span>
							</div>
					</span>
				</div>
				<span class="pull-right">店铺合计(含运费): ￥<fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/></span>
			</div>
		</div>
		<div class="orderItemTotalSumDiv">
			<div class="pull-right">
				<span>实付款：</span> <span class="orderItemTotalSumSpan">￥<fmt:formatNumber type="number" value="${total}" minFractionDigits="2"/></span>
			</div>
		</div>
		<div class="submitOrderDiv">
			<button  class="submitOrderButton" type="submit">提交订单</button>
		</div>
		</form>
	</div>
</body>
</html>
