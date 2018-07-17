<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>百色学院场地使用管理系统</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/admin2/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin2/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin2/assets/css/admin.css">
<script src="${pageContext.request.contextPath}/admin2/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin2/assets/js/app.js"></script>
<style type="text/css">
* input{
with:200px;
height:37px;
}
</style>
</head>
<body>
    <div class="admin-biaoge">
       <div class="xinxitj">申请人基本信息修改</div>
       
       <form class="am-form">
       	<c:forEach items="${listPlaceInfo}" var="list">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              姓名
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="with:200px;height:36px"> 
              <input style="with:200px;height:36px" type="text" class="am-input-sm" value="${list.postulantName }" readonly="readonly">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
	                      教职工号            
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
               <input type="text" class="am-input-sm" value="${list.postulantNum }" readonly="readonly">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              所属院系
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" value="${list.faculteName }" readonly="readonly">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
	                           所属部门
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
	             <input type="text" class="am-input-sm" value="${list.deptName }" readonly="readonly">
            </div>
          </div>
          
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              联系电话
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" value="${list.postulantTell }" name="postulantTell">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              邮箱地址
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
              <input type="text" class="am-input-sm" value="${list.postulantEmaill }" name="postulantEmaill">
            </div>
          </div>
          
          <div id="pwd" style="display: none">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
             原密码
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="password" class="am-input-sm" name="postulantPwd">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
	                           新密码
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
	             <input type="password" class="am-input-sm" name="postulantPwdNew">
            </div>
          </div>
           <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
             确认密码
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="password" class="am-input-sm" name="postulantPwdNew2">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
	             <input type="hidden" class="am-input-sm">
            </div>
          </div>
          </div>
          <a id="t" href="javasricpt:;" onclick="updatePwd('t')">修改密码？</a>
          <a id="f" style="display: none" href="javasricpt:;" onclick="updatePwd('f')">不修改密码？</a>
		 </c:forEach>
		 <div class="am-margin" style="text-align: center;<c:if test="${list.applyStatus == 1 or list.applyStatus == 2 }">display: none</c:if>">
		    <button  onclick="saveApprovalInfo(this)" type="button" class="am-btn am-btn-success am-radius "><font size="1px">修改</font></button>
		  	<button  type="reset" class="am-btn am-btn-primary am-radius "><font size="1px">取消</font></button>
		  </div>
        </form>
    </div>
<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>
<script type="text/javascript">

var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
var flag = false;

function updatePwd(str){
	if(str=='t'){
		$("#pwd").show();
		$("#t").hide();
		$("#f").show();
		flag = true;
	}else{//不修改时，将密码框清空
		$("input[name='postulantPwd']").val("");
		$("input[name='postulantPwdNew']").val("");
		$("input[name='postulantPwdNew2']").val("");
		$("#pwd").hide();
		$("#f").hide();
		$("#t").show();
		flag = false;
	}
}

function saveApprovalInfo(obj){
	debugger;
	var sessionPwd = '<%= session.getAttribute("postulantPwd")%>';//获取session中的密码
	var postulantPwd = $("input[name='postulantPwd']").val();
	var postulantPwdNew = $("input[name='postulantPwdNew']").val();
	var postulantPwdNew2 = $("input[name='postulantPwdNew2']").val();
	var postulantEmaill = $("input[name='postulantEmaill']").val();
	var postulantTell = $("input[name='postulantTell']").val();
	if(flag){
		if(postulantPwd==''||postulantPwd==null||postulantPwdNew==''||postulantPwdNew==null||postulantPwdNew2==''||postulantPwdNew2==null){
			parent.layer.alert("密码输入框不不能为空！");
			return ;
		}else if(postulantPwd!=sessionPwd){
			parent.layer.alert("原始密码错误！");
			return ;
		}else if(postulantPwdNew!=postulantPwdNew2){
			parent.layer.alert("新密码和确认密码不一致！");
			return ;
		}
	}
	$.ajax({
		type : 'post',
		url : projectName + '/update/updatePersonInfo',
		dataType : 'json',
		data:{postulantPwdNew:postulantPwdNew,
			postulantTell:postulantTell,
			postulantEmaill:postulantEmaill},
		success : function(data) {
			if(data.status=='0'){
				parent.layer.alert(data.massage);
			}else if(data.status=='1'){
				parent.layer.alert(data.massage);
			}else if(data.status=='2'){
				parent.layer.alert(data.massage);
			}else if(data.status=='3'){
				parent.layer.alert(data.massage);
				window.location.href = projectName+"/login.jsp";
			}
		}
	}); 
}

</script>
</body>
</html>