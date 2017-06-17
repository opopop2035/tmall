<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp"%>
<%@ include file="include/plainSearch.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String shoppingcartpath = request.getContextPath();
String shoppingcartbasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+shoppingcartpath+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=shoppingcartbasePath%>">
    
    <title>购物车</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	var deleteOrderItem = false;
	var deleteOrderItemid = 0;
	$(function() {
	$("a.deleteOrderItem").click(function(){
        deleteOrderItem = false;
        var oiid = $(this).attr("oiid")
        deleteOrderItemid = oiid;
        $("#deleteConfirmModal").modal('show');    
    });
    $("button.deleteConfirmButton").click(function(){
        deleteOrderItem = true;
        $("#deleteConfirmModal").modal('hide');
    });
     
    $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
        if(deleteOrderItem){
            var page="forecart!deleteOrderItem";
            $.post(
                    page,
                    {"oiid":deleteOrderItemid},
                    function(){
                            $("tr.cartProductItemTR[oiid="+deleteOrderItemid+"]").hide();
                    }
                );
             
        }
    });
    $("button.createOrderButton").click(function(){
        var params = "";
        $(".cartProductItemIfSelected").each(function(){
            if("selectit"==$(this).attr("selectit")){
                var oiid = $(this).attr("oiid");
                params += "&oiid="+oiid;
            }
        });
        params = params.substring(1);
        location.href="forebuy?"+params;
    });
			function formatMoney(num) {//格式化价格
				num = num.toString().replace(/\$|\,/g, '');
				if (isNaN(num))
					num = "0";
				sign = (num == (num = Math.abs(num)));
				num = Math.floor(num * 100 + 0.50000000001);
				cents = num % 100;
				num = Math.floor(num / 100).toString();
				if (cents < 10)
					cents = "0" + cents;
				for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
					num = num.substring(0, num.length - (4 * i + 3)) + ',' +
					num.substring(num.length - (4 * i + 3));
				return (((sign) ? '' : '-') + num + '.' + cents);
			}
			function syncCreateOrderButton(){
				var selectAny = false;
				$(".cartProductItemIfSelected").each(function(){
					if("selectit"==$(this).attr("selectit")){
						selectAny = true;
					}
				});
				if (selectAny) {
					$(".createOrderButton").css("background-color", "#C40000");
					$(".createOrderButton").removeAttr("disabled");
				} else {
					$(".createOrderButton").css("background-color", "#AAAAAA");
					$(".createOrderButton").attr("disabled", "disabled");
				}
				}
			function syncSelect(){//全选同步
				var selectAll = true;
				$(".cartProductItemIfSelected").each(function(){
						if("false" == $(this).attr("selectit")){
							selectAll = false;
					}
				});
				if (selectAll) {
					$("img.selectAllItem").attr("src", "FountModule/img/site/cartSelected.png");
				} else {
					$("img.selectAllItem").attr("src", "FountModule/img/site/cartNotSelected.png");
				}
			}
			function calcCartSumPriceAndNumber() {//显示被选中的商品总数，以及总价格
				var sum = 0;
				var totalNumber = 0;
				$("img.cartProductItemIfSelected[selectit='selectit']").each(function() {
					var oiid = $(this).attr("oiid");
					var price = $(".cartProductItemSmallSumPrice[oiid=" + oiid + "]").text();
					price = price.replace(/,/g, "");
					price = price.replace(/￥/g, "");
					sum += new Number(price);
					var num = $(".orderItemNumberSetting[oiid=" + oiid + "]").val();
					totalNumber += new Number(num);
				});
				$("span.cartSumPrice").html("￥" + formatMoney(sum));
				$("span.cartTitlePrice").html("￥" + formatMoney(sum));
				$("span.cartSumNumber").html(totalNumber);
			}
			function syncPrice(pid, num, price) {
				$(".orderItemNumberSetting[pid=" + pid + "]").val(num);
				var cartProductItemSmallSumPrice = formatMoney(num * price);
				$(".cartProductItemSmallSumPrice[pid=" + pid + "]").html("￥" + cartProductItemSmallSumPrice);
				calcCartSumPriceAndNumber();
				var page = "forecart!changeOrderItem";
				$.post(
					page,
					{
						"pid" : pid,
						"number" : num
					}
					);
			}
			$("img.cartProductItemIfSelected").click(function() {
				var selectit = $(this).attr("selectit")
				if ("selectit" == selectit) {
					$(this).attr("src", "FountModule/img/site/cartNotSelected.png");
					$(this).attr("selectit", "false")
					$(this).parents("tr.cartProductItemTR").css("background-color", "#fff");
				} else {
					$(this).attr("src", "FountModule/img/site/cartSelected.png");
					$(this).attr("selectit", "selectit")
					$(this).parents("tr.cartProductItemTR").css("background-color", "#FFF8E1");
				}
				syncSelect();
				syncCreateOrderButton();
				calcCartSumPriceAndNumber();
			});
			$("img.selectAllItem").click(function() {
				var selectit = $(this).attr("selectit")
				if ("selectit" == selectit) {
					$("img.selectAllItem").attr("src", "FountModule/img/site/cartNotSelected.png");
					$("img.selectAllItem").attr("selectit", "false")
					$(".cartProductItemIfSelected").each(function() {
						$(this).attr("src", "FountModule/img/site/cartNotSelected.png");
						$(this).attr("selectit", "false");
						$(this).parents("tr.cartProductItemTR").css("background-color", "#fff");
					});
				} else {
					$("img.selectAllItem").attr("src", "FountModule/img/site/cartSelected.png");
					$("img.selectAllItem").attr("selectit", "selectit")
					$(".cartProductItemIfSelected").each(function() {
						$(this).attr("src", "FountModule/img/site/cartSelected.png");
						$(this).attr("selectit", "selectit");
						$(this).parents("tr.cartProductItemTR").css("background-color", "#FFF8E1");
					});
				}
				syncCreateOrderButton();
				calcCartSumPriceAndNumber();
			});
			$(".numberPlus").click(function() {
				var pid = $(this).attr("pid");
				var stock = $("span.orderItemStock[pid=" + pid + "]").text();
				var price = $("span.orderItemPromotePrice[pid=" + pid + "]").text();
				var num = $(".orderItemNumberSetting[pid=" + pid + "]").val();
				num++;
				if (num > stock)
					num = stock;
				syncPrice(pid, num, price);
			});
			$(".numberMinus").click(function() {
				var pid = $(this).attr("pid");
				var stock = $("span.orderItemStock[pid=" + pid + "]").text();
				var price = $("span.orderItemPromotePrice[pid=" + pid + "]").text();
				var num = $(".orderItemNumberSetting[pid=" + pid + "]").val();
				--num;
				if (num <= 0)
					num = 1;
				syncPrice(pid, num, price);
			});
			$(".orderItemNumberSetting").keyup(function() {
				var pid = $(this).attr("pid");
				var stock = $("span.orderItemStock[pid=" + pid + "]").text();
				var price = $("span.orderItemPromotePrice[pid=" + pid + "]").text();
				var num = $(".orderItemNumberSetting[pid=" + pid + "]").val();
				num = parseInt(num);
				if (isNaN(num))
					num = 1;
				if (num <= 0)
					num = 1;
				if (num > stock)
					num = stock;
				syncPrice(pid, num, price);
			});
		});
	</script>
  </head>
  <body>
  <div id="cartDiv">
  <div class="cartTitle pull-right">
  	<span>已选商品(不含运费)</span>
  	<span class="cartTitlePrice">￥0.00</span>
  	<button class="createOrderButton" style="background-color: rgb(170, 170, 170);" disabled="disabled">结  算</button>
  	 <div style="clear:both"></div>
  </div>
  <!-- 订单 -->
  <div class="cartProductList">
        <table class="cartProductTable">
            <thead>
                <tr>
                    <th class="selectAndImage">
                            <img src="FountModule/img/site/cartNotSelected.png" class="selectAllItem" selectit="false">
                            	全选
                    </th>
                    <th>商品信息</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th width="120px">金额</th>
                    <th class="operation">操作</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${ois}" var="oi">
                    <tr class="cartProductItemTR" oiid="${oi.id}">
                        <td>
                            <img src="FountModule/img/site/cartNotSelected.png" class="cartProductItemIfSelected" oiid="${oi.id}" selectit="false">
                           <!-- <a href="#nowhere" style="display:none"><img src="FountModule/img/site/cartSelected.png"></a> --> 
                            <img width="40px" src="FountModule/img/productSingle_middle/${oi.product.firstProductImage.id}.jpg" class="cartProductImg">
                        </td>
                        <td>
                            <div class="cartProductLinkOutDiv">
                                <a class="cartProductLink" href="foreproduct?pid=${oi.product.id}">${oi.product.name}</a>
                                <div class="cartProductLinkInnerDiv">
                                    <img title="支持信用卡支付" src="FountModule/img/site/creditcard.png">
                                    <img title="消费者保障服务,承诺7天退货" src="FountModule/img/site/7day.png">
                                    <img title="消费者保障服务,承诺如实描述" src="FountModule/img/site/promise.png">
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="cartProductItemOringalPrice">￥${oi.product.orignalPrice}</span>
                            <span class="cartProductItemPromotionPrice">￥${oi.product.barginPrice}</span>
                        </td>
                        <td>
                            <div class="cartProductChangeNumberDiv">
                                <span pid="${oi.product.id}" class="hidden orderItemStock ">${oi.product.stock}</span>
                                <span pid="${oi.product.id}" class="hidden orderItemPromotePrice">${oi.product.barginPrice}</span>
                                <a href="javascript:;" class="numberMinus" pid="${oi.product.id}">-</a>
                                <input value="${oi.number}" autocomplete="off" class="orderItemNumberSetting" oiid="${oi.id}" pid="${oi.product.id}">
                                <a href="javascript:;" class="numberPlus" pid="${oi.product.id}" stock="${oi.product.stock}">+</a>
                            </div>                    
                         </td>
                        <td>
                            <span pid="${oi.product.id}" oiid="${oi.id}" class="cartProductItemSmallSumPrice">￥<fmt:formatNumber value="${oi.product.barginPrice*oi.number}" minFractionDigits="2"  type="number" /></span>
                        </td>
                        <td>
                            <a href="javascript:;" oiid="${oi.id}" class="deleteOrderItem">删除</a>
                        </td>
                    </tr>
                    </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- 结算 -->
  <div class="cartFoot">
  	<img src="FountModule/img/site/cartNotSelected.png" class="selectAllItem" selectit="false">
  	<span>全选</span>
  	<div class="pull-right">
  		<span>已选商品<span class="cartSumNumber">0</span>件</span>
  		<span>合计（不含运费）：</span>
  		<span class="cartSumPrice">￥0.00</span>
  		<button class="createOrderButton" style="background-color: rgb(170, 170, 170);" disabled="disabled">结  算</button>
  	</div>
  </div>
  </div>
  </body>
</html>
