<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String modelPath = request.getContextPath();
String modelBasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+modelPath+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=modelBasePath%>">
    <!-- 
    <script type="text/javascript" src="lib/jquery-3.1.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="FountModule/css/FountModule.css">
<script type="text/javascript" src="lib/bootstrap/js/bootstrap.min.js"></script> -->
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
   <div class="modal" id="loginModal" tabindex="-1" role="dialog">
    <div class="modal-dialog loginDivInProductPageModalDiv">
            <div class="modal-content">
                    <div class="loginDivInProductPage">
                        <div class="loginErrorMessageDiv" hidden="hidden">
                            <div class="alert alert-danger" >
                              <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                                <span class="errorMessage"></span>
                            </div>
                        </div>
                             
                        <div class="login_acount_text">账户登录</div>
                        <div class="loginInput" >
                            <span class="loginInputIcon ">
                                <span class=" glyphicon glyphicon-user"></span>
                            </span>
                            <input id="name" name="name" placeholder="手机/会员名/邮箱" type="text">         
                        </div>
                         
                        <div class="loginInput " >
                            <span class="loginInputIcon ">
                                <span class=" glyphicon glyphicon-lock"></span>
                            </span>
                            <input id="password" name="password"  type="password" placeholder="密码" type="text">           
                        </div>
                        <div>
                            <a href="javascript:;">忘记登录密码</a> 
                            <a href="userRegister" class="pull-right">免费注册</a> 
                        </div>
                        <div style="margin-top:20px">
                            <button class="btn btn-block redButton loginSubmitButton" type="submit">登录</button>
                        </div>
                    </div>    
          </div>
    </div>
</div>
 
<div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog deleteConfirmModalDiv">
       <div class="modal-content">
          <div class="modal-header">
            <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title">确认删除？</h4>
          </div>
          <div class="modal-footer">
            <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
            <button class="btn btn-primary deleteConfirmButton" id="submit" type="button">确认</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
