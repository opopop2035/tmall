<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="include/top.jsp"%>
<%@ include file="include/plainSearch.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String productpath = request.getContextPath();
String productbasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+productpath+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=productbasePath%>">
    
    <title>product</title>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script>
	$(function() {
		 $("div.productReviewDiv").hide();
    $("a.productDetailTopReviewLink").click(function(){
        $("div.productReviewDiv").show();
        $("div.productDetailDiv").hide();
    });
    $("a.productReviewTopPartSelectedLink").click(function(){
        $("div.productReviewDiv").hide();
        $("div.productDetailDiv").show();       
    });
    var stock = ${p.stock};
		$(".productNumberSetting").keyup(function() {
			var num = $(".productNumberSetting").val();
			num = parseInt(num);
			if (isNaN(num))
				num = 1;
			if (num <= 0)
				num = 1;
			if (num > stock)
				num = stock;
			$(".productNumberSetting").val(num);
		});

		$(".increaseNumber").click(function() {
			var num = $(".productNumberSetting").val();
			num++;
			if (num > stock)
				num = stock;
			$(".productNumberSetting").val(num);
		});
		$(".decreaseNumber").click(function() {
			var num = $(".productNumberSetting").val();
			--num;
			if (num <= 0)
				num = 1;
			$(".productNumberSetting").val(num);
		});
		
		$(".addCartLink").click(function(){
        var page = "foreproduct!checkLog";
        $.get(
                page,
                function(result){
                    if("success"==result){
                        var pid = ${p.id};
                        var num= $(".productNumberSetting").val();
                        var addCartpage = "foreproduct!addCart";
                        $.get(
                                addCartpage,
                                {"pid":pid,"num":num},
                                function(result){
                                    if("success"==result){
                                    alert(result);
                                        $(".addCartButton").html("已加入购物车");
                                        $(".addCartButton").attr("disabled","disabled");
                                        $(".addCartButton").css("background-color","lightgray")
                                        $(".addCartButton").css("border-color","lightgray")
                                        $(".addCartButton").css("color","black")
                                    }
                                    else{
                                    }
                                }
                        );                          
                    }
                    else{
                        $("#loginModal").modal('show');                     
                    }
                }
        );      
        return false;
    });
    $(".buyLink").click(function(){
        var page = "foreproduct!checkLog";
        $.get(
                page,
                function(result){
                alert(result);
                    if("success"==result){
                        var num = $(".productNumberSetting").val();
                        location.href= $(".buyLink").attr("href")+"&num="+num;
                    }
                    else{
                        $("#loginModal").modal('show');                     
                    }
                }
        );      
        return false;
    });
		 $("button.loginSubmitButton").click(function(){
        var name = $("#name").val();
        var password = $("#password").val();
         
        if(0==name.length||0==password.length){
            $("span.errorMessage").html("请输入账号密码");
            $("div.loginErrorMessageDiv").show();           
            return false;
        }
         
        var page = "foreproduct!modalLogin";
        $.get(
                page,
                {"name":name,"password":password},
                function(data){
                    if("success"==data){
                        location.reload();
                    }
                    else{
                        $("span.errorMessage").html("账号密码错误");
                        $("div.loginErrorMessageDiv").show();                       
                    }
                }
        );          
         
        return true;
    });
     
    $("img.smallImage").mouseenter(function(){
        var bigImageURL = $(this).attr("bigImageURL");
        $("img.bigImg").attr("src",bigImageURL);
    });
     
    $("img.bigImg").load(
        function(){
            $("img.smallImage").each(function(){
                var bigImageURL = $(this).attr("bigImageURL");
                var img = new Image();
                img.src = bigImageURL;
                 
                img.onload = function(){
                    console.log(bigImageURL);   
                    $("div.img4load").append($(img));
                };
            });     
        }
    );
		
	});
</script>
</head>
  <body>
  <!-- 商品图片和基本信息 -->
  <div class="imgAndInfo">
    <div class="imgInimgAndInfo">
        <img src="FountModule/img/productSingle/${p.firstProductImage.id}.jpg" class="bigImg">
        <div class="smallImageDiv">
            <c:forEach items="${p.productSingleImages}" var="pi">
                <img src="FountModule/img/productSingle_small/${pi.id}.jpg" bigImageURL="FountModule/img/productSingle/${pi.id}.jpg" class="smallImage">
            </c:forEach>
        </div>
        <div class="img4load hidden" ></div>
    </div>
    <div class="infoInimgAndInfo">
         <div class="productTitle">
            ${p.name}
        </div>
        <div class="productSubTitle">
            ${p.subTitle} 
        </div>
        <div class="productPrice">
            <div class="juhuasuan">
                <span class="juhuasuanBig">聚划算</span>
                <span>此商品即将参加聚划算，<span class="juhuasuanTime">1天19小时</span>后开始，</span>
            </div>
            <div class="productPriceDiv">
                <div class="gouwujuanDiv"><img height="16px" src="FountModule/img/site/gouwujuan.png">
                <span> 全天猫实物商品通用</span>
                </div>
                <div class="originalDiv">
                    <span class="originalPriceDesc">价格</span>
                    <span class="originalPriceYuan">¥</span>
                    <span class="originalPrice">
                        <fmt:formatNumber type="number" value="${p.orignalPrice}" minFractionDigits="2"/>           
                    </span>
                </div>
                <div class="promotionDiv">
                    <span class="promotionPriceDesc">促销价 </span>
                    <span class="promotionPriceYuan">¥</span>
                    <span class="promotionPrice">
                        <fmt:formatNumber type="number" value="${p.barginPrice}" minFractionDigits="2"/>
                    </span>               
                </div>
            </div>
        </div>
        <div class="productSaleAndReviewNumber">
            <div>销量 <span class="redColor boldWord">${p.saleCount}</span></div>    
            <div>累计评价 <span class="redColor boldWord">${p.reviewCount}</span></div>  
        </div>
        <div class="productNumber">
            <span>数量</span>
            <span>
                <span class="productNumberSettingSpan">
                <input type="text" value="1" class="productNumberSetting">
                </span>
                <span class="arrow">
                    <a class="increaseNumber" href="JavaScript:;">
                    <span class="updown">
                       <img src="FountModule/img/site/increase.png">
                    </span>
                    </a>
                    <span class="updownMiddle"> </span>
                    <a class="decreaseNumber" href="JavaScript:;">
                    <span class="updown">
                        <img src="FountModule/img/site/decrease.png">
                    </span>
                    </a>
                </span>
            件</span>
            <span>库存${p.stock}件</span>
        </div>
        <div class="serviceCommitment">
            <span class="serviceCommitmentDesc">服务承诺</span>
            <span class="serviceCommitmentLink">
                <a href="#">正品保证</a>
                <a href="#">极速退款</a>
                <a href="#">赠运费险</a>
                <a href="#">七天无理由退换</a>
            </span>
        </div>    
       <div class="buyDiv">
            <a class="buyLink" href="forebuyone?pid=${p.id}"><button class="buyButton">立即购买</button></a>
            <a href="javascript:;" class="addCartLink">
            <button class="addCartButton"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button>
            </a>
        </div>
    </div>
    <div style="clear:both"></div>
</div>
<!-- 商品详情 -->
<div class="productDetailDiv" >
    <div class="productDetailTopPart">
        <a href="JavaScript:;" class="productDetailTopPartSelectedLink selected">商品详情</a>
        <a href="JavaScript:;" class="productDetailTopReviewLink">累计评价 <span class="productDetailTopReviewLinkNumber">${p.reviewCount}</span> </a>
    </div>
     
    <div class="productParamterPart">
        <div class="productParamter">产品参数：</div>
         
        <div class="productParamterList">
            <c:forEach items="${pvs}" var="pv">
                <span>${pv.property.name}:  ${fn:substring(pv.value, 0, 10)} </span>
            </c:forEach>
        </div>
        <div style="clear:both"></div>
    </div>
     
    <div class="productDetailImagesPart">
            <c:forEach items="${p.productDetailImages}" var="pi">
                <img src="FountModule/img/productDetail/${pi.id}.jpg">
            </c:forEach>
    </div>
</div>

<div class="productReviewDiv" >
    <div class="productReviewTopPart">
        <a  href="JavaScript:;" class="productReviewTopPartSelectedLink">商品详情</a>
        <a  href="JavaScript:;" class="selected">累计评价 <span class="productReviewTopReviewLinkNumber">${p.reviewCount}</span> </a>
    </div>
     
    <div class="productReviewContentPart">
        <c:forEach items="${reviews}" var="r">
        <div class="productReviewItem">
         
            <div class="productReviewItemDesc">
                <div class="productReviewItemContent">
                    ${r.content }
                </div>
                <div class="productReviewItemDate"><fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd"/></div>
            </div>
            <div class="productReviewItemUserInfo">
             
                ${r.user.anonymousName}<span class="userInfoGrayPart">（匿名）</span>
            </div>
             
            <div style="clear:both"></div>
         
        </div>
        </c:forEach>
    </div>
</div>
		</body>
		<%@ include file="include/Footer.jsp"%>
</html>
