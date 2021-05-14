<!doctype html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="modal.jsp" %>
<%
String footerpath = request.getContextPath();
String footerbasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+footerpath+"/";
%>
<html>
<head>
<base href="<%=footerbasePath%>">
<!-- <script type="text/javascript" src="lib/jquery-3.1.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="lib/bootstrap/js/bootstrap.min.js"></script> 
<link rel="stylesheet" type="text/css"
	href="FountModule/css/FountModule.css">-->

</head>
<body>
	<div style="display:block;" id="footer" class="footer">
		<div id="footerEnsure">
			<a href="#"><img alt="天猫吼啊" src="FountModule/img/site/ensure.png"></a>
		</div>
		<div id="footer_desc" class="footer_desc">
			<div class="descColumn">
				<span class="descColumnTitle">购物指南</span> <span><a href="#">免费注册</a></span>
				<a href="#">开通支付宝</a> <a href="#">支付宝充值</a>
			</div>
			<div class="descColumn">
				<span class="descColumnTitle">天猫保障</span> <a href="#">发票保障</a> <a
					href="#">售后规则</a> <a href="#">缺货赔付</a>
			</div>
			<div class="descColumn">
				<span class="descColumnTitle">支付方式</span> <a href="#">快捷支付</a> <a
					href="#">信用卡</a> <a href="#">蚂蚁花呗</a> <a href="#">货到付款</a>
			</div>
			<div class="descColumn">
				<span class="descColumnTitle">商家服务</span> <a href="#">商家入驻</a> <a
					href="#">商家中心</a> <a href="#">天猫智库</a> <a href="#">天猫规则</a> <a
					href="#">物流服务</a> <a href="#">喵言喵语</a> <a href="#">运营服务</a>
			</div>
			<div class="descColumn">
				<span class="descColumnTitle">手机天猫</span> <a href="#"><img
					src="FountModule/img/site/ma.png"></a>
			</div>
		</div>
		<div style="clear:both;"></div>
		<div class="footer" style="display:block;">
			<img src="FountModule/img/site/cateye.png" id="cateye">
			<div id="copyright">
				<div class="whiteLink">
					<a href="#">关于天猫</a> <a href="#">帮助中心</a> <a href="#">开放平台</a> <a
						href="#">诚聘英才</a> <a href="#">联系我们</a> <a href="#">网站合作</a> <a
						href="#">法律声明</a> <a href="#">知识产权</a> <a href="#">廉正举报</a>
				</div>
				<div class="whiteLink">
					<a href="#">阿里巴巴集团</a><span class="slash">|</span> <a href="#">淘宝网</a><span
						class="slash">|</span> <a href="#">天猫</a><span class="slash">|</span>
					<a href="#">聚划算</a><span class="slash">|</span> <a href="#">全球速卖通</a><span
						class="slash">|</span> <a href="#">阿里巴巴国际交易市场</a><span
						class="slash">|</span> <a href="#">1688</a><span class="slash">|</span>
					<a href="#">阿里妈妈</a><span class="slash">|</span> <a href="#">阿里旅行·去啊</a><span
						class="slash">|</span> <a href="#">阿里云计算</a><span class="slash">|</span>
					<a href="#">阿里通信</a><span class="slash">|</span> <a href="#">YunOS</a><span
						class="slash">|</span> <a href="#">万网</a><span class="slash">|</span>
					<a href="#">高德</a><span class="slash">|</span> <a href="#">优视</a><span
						class="slash">|</span> <a href="#">友盟</a><span class="slash">|</span>
					<a href="#">虾米</a><span class="slash">|</span> <a href="#">天天动听</a><span
						class="slash">|</span> <a href="#">来往</a><span class="slash">|</span>
					<a href="#">钉钉</a><span class="slash">|</span> <a href="#">支付宝</a><span
						class="slash">|</span>
				</div>
				<div id="license">
					<span>增值电信业务经营许可证： 浙B2-20110446</span> <span>网络文化经营许可证：浙网文[2015]0295-065号</span>
					<span>互联网药品信息服务资质证书编号：浙-（经营性）-2017-0005</span> <span>增值电信业务经营许可证：
						浙B2-20110446</span>
					<div id="copyRightYear">© 2003-2017 TMALL.COM 版权所有</div>
					<div>
						<img src="FountModule/img/site/copyRight1.jpg"> <img
							src="FountModule/img/site/copyRight2.jpg">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
