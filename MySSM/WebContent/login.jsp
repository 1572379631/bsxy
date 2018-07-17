<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>百色学院场地使用管理系统</title>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/amazeUI/assets/i/favicon.png">
<link
	href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico">
<link href="${pageContext.request.contextPath}/css/animate.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/js/plugins/layer/skin/layer.css"
	id="layui_layer_skinlayercss" style="">
	
<link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" >
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6">

<style type="text/css">
body{
	background-image: url("${pageContext.request.contextPath}/images/66.jpg");
}
#login_div{
	border-radius: 5px;
	background-color:rgba(245,245,245,0.5);
}
#register_div{
	background-color:rgba(245,245,245,0.5);
	border-radius: 5px;
}
#kk{
	border-radius: 5px;
	background-color:rgba(245,245,245,0.5);
}

</style>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery1.9.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/dwz.alertMsg.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script> 
	<script src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/hplus.js?v=4.1.0"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contabs.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contabs.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/content.min.js"></script>

</head>
<script type="text/javascript">
//登陆时选择身份函数
function identityChange(){
	var identity = $("select[name='identity']").val();
	if(identity=='1'){
		$("#teacherNum_div").hide();
		$("#approverNum_div").hide();
		$("#administratorNum_div").hide();
		$("#studentNum_div").show();
	}else if(identity=='2'){
		$("#studentNum_div").hide();
		$("#approverNum_div").hide();
		$("#administratorNum_div").hide();
		$("#teacherNum_div").show();
	}else if(identity=='3'){
		$("#studentNum_div").hide();
		$("#teacherNum_div").hide();
		$("#administratorNum_div").hide();
		$("#approverNum_div").show();
	}else if(identity=='4'){
		$("#studentNum_div").hide();
		$("#teacherNum_div").hide();
		$("#approverNum_div").hide();
		$("#administratorNum_div").show();
	}else{
		$("#studentNum_div").hide();
		$("#teacherNum_div").hide();
		$("#approverNum_div").hide();
		$("#administratorNum_div").hide();
	}
}
//注册时选择身份函数
function identityRChange(){
	var identity = $("select[name='identityR']").val();
	if(identity=='1'){
		$("#teacherNumR_div").hide();
		$("#studentNumR_div").show();
	}else if(identity=='2'){
		$("#studentNumR_div").hide();
		$("#teacherNumR_div").show();
	}else{
		$("#studentNumR_div").hide();
		$("#teacherNumR_div").hide();
	}
}

	$(function(){
		//用于刷新验证码
		$("#verId,#verId2").click(function(){
			$("#verId").attr("src","${pageContext.request.contextPath}/image.jsp?date="+new Date().getTime());
		})
	});

function login(){
	$("#commentForm").ajaxForm({
		dataType:'json',
		type : "post", 
		beforeSubmit:function(){
			var postulantName = $.trim($("#postulantName").val());
			var postulantPwd = $.trim($("#postulantPwd").val());
			var Rand = $.trim($("#Rand").val());
			var identity = $("select[name='identity']").val();
			var studentNum = $.trim($("#studentNum").val());
			var teacherNum = $.trim($("#teacherNum").val());
			var approverNum = $.trim($("#approverNum").val());
			var administratorNum = $.trim($("#administratorNum").val());
			
			var nameflag = true;
			var pwdflag = true;
			var verifyflag = true;
			var identityflag= true;
			var num = true;
			if(identity=='0'){
				identityflag = false;
				$("#identityerror").text("请选择身份");
				$("#identityerror").css("color","red");
			}else if(identity=='1'&&studentNum==""){
				num = false;
				$("#studentNumerror").text("学号不能为空");
				$("#studentNumerror").css("color","red");
			}else if(identity=='2'&&teacherNum==""){
				num = false;
				$("#teacherNumerror").text("教师编号不能为空");
				$("#teacherNumerror").css("color","red");
			}else if(identity=='3'&&approverNum==""){
				num = false;
				$("#approverNumerror").text("审批人编号不能为空");
				$("#approverNumerror").css("color","red");
			}else if(identity=='4'&&administratorNum==""){
				num = false;
				$("#administratorNumerror").text("管理员编号不能为空");
				$("#administratorNumerror").css("color","red");
			}
			
			if (postulantName == "") {
				nameflag = false;
				$("#postulantNameerror").text("用户名不能为null");
				$("#postulantNameerror").css("color","red");
			}
			if (postulantPwd == "") {
				pwdflag = false;
				$("#postulantPwderror").text("密码不能为null");
				$("#postulantPwderror").css("color","red");
			}
			if (Rand == "") {
				verifyflag = false;
				$("#Randerror").text("验证码不能为空");
				$("#Randerror").css("color","red");
			}
			return nameflag && pwdflag && verifyflag &&identityflag&& num;
		},
		success:function(data){
			if (data.status=="1") {
				debugger;
				window.location.href = "/MySSM/query/Postulant2";
			} else {
				parent.layer.alert(data.massage);
			}
		}
	});
}

/* 注册校验 */
function register(){
	debugger;
	var pathName = window.document.location.pathname;
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	$("#commentRegisterForm").ajaxForm({
		dataType:'json',
		type : "post", 
		beforeSubmit:function(){
			var postulantName = $.trim($("#postulantNameR").val());
			var postulantPwd = $.trim($("#postulantPwdR").val());
			var postulantPwdNew = $.trim($("#postulantPwdNew").val());
			var Rand = $.trim($("#RandR").val());
			var identity = $("select[name='identityR']").val();
			var studentNum = $.trim($("#studentNumR").val());
			var teacherNum = $.trim($("#teacherNumR").val());
			
			var nameflag = true;
			var pwdflag = true;
			var pwdNewflag = true;
			var verifyflag = true;
			var pwdNewpwd = true;
			var identityflag= true;
			var num = true;
			
			if(identity=='0'){
				identityflag = false;
				$("#identityRerror").text("请选择身份");
				$("#identityRerror").css("color","red");
			}else if(identity=='1'&&studentNum==""){
				num = false;
				$("#studentNumRerror").text("学号不能为空");
				$("#studentNumRerror").css("color","red");
			}else if(identity=='2'&&teacherNum==""){
				num = false;
				$("#teacherNumRerror").text("教师编号不能为空");
				$("#teacherNumRerror").css("color","red");
			}

			if (postulantName == "") {
				nameflag = false;
				$("#postulantNameerrorR").text("用户名不能为null");
				$("#postulantNameerrorR").css("color","red");
			}
			if (postulantPwd == "") {
				pwdflag = false;
				$("#postulantPwderrorR").text("密码不能为null");
				$("#postulantPwderrorR").css("color","red");
			}
			if (postulantPwdNew == "") {
				pwdNewflag = false;
				$("#postulantPwdNewerror").text("密码不能为null");
				$("#postulantPwdNewerror").css("color","red");
			}
			if(postulantPwd!=postulantPwdNew){
				pwdNewpwd = false;
				$("#postulantPwdNewerror").text("两次输入的密码不一致");
				$("#postulantPwdNewerror").css("color","red");
			}
			if (Rand == "") {
				verifyflag = false;
				$("#RanderrorR").text("验证码不能为空");
				$("#RanderrorR").css("color","red");
			}
			return nameflag && pwdflag && verifyflag && pwdNewflag && pwdNewpwd &&identityflag&& num;
		},
		success:function(data){
			if(data.status=="01"){
				parent.layer.alert(data.massage);
			}else if(data.status=="02"){
				parent.layer.alert(data.massage);
			}
			if (data.status=="03") {
				parent.layer.alert(data.massage);
				window.setTimeout(function(){
					window.location.href = projectName+"/login.jsp";
            	},2000);
			} else {
				parent.layer.alert(data.massage);
			}
		}
	});
}

//选择登陆登陆或注册页面
function chooseLoginOrRegister(obj){
	if(obj=='login'){
		$("#log").removeAttr("style");
		$("#reg").removeAttr("style");
		$("#log").attr("style",'position:absolute; right:300px;top:40px;border-bottom: 1px solid blue;');
		$("#reg").attr("style",'position:absolute; right:200px;top:40px;');
		$("#register").hide();
		$("#login").show();
	}else if(obj=='register'){
		$("#log").removeAttr("style");
		$("#reg").removeAttr("style");
		$("#reg").attr("style",'position:absolute; right:200px;top:40px;border-bottom: 1px solid blue;');
		$("#log").attr("style",'position:absolute; right:300px;top:40px;');
		$("#login").hide();
		$("#register").show();
	}
}

</script>
<div id="head" style="width: 100%;height: 80px;background-color: #CDC9C9;background-repeat: no-repeat;background-image: url('${pageContext.request.contextPath}/images/bt4.png');">
	<div>
		<a id="log" href="JavaScript:;" style="position:absolute; right:300px;top:40px;border-bottom: 1px solid blue;" onclick="chooseLoginOrRegister('login')"><font size="5px">登 陆</font></a>
		<a id="reg" href="JavaScript:;" style="position:absolute; right:200px;top:40px;" onclick="chooseLoginOrRegister('register')"><font size="5px">注 册</font></a>
	</div>
</div>
<div id="kk" style="position: absolute;float: left;left:20px;width: 60%;height:300px;margin-top:80px;">
<span style="font-size: 40px;color: red;margin-left: 200px;margin-top: 50px;padding-top: 50px">
	欢迎使用：
</span><br>
<span style="font-size: 50px;color: red;margin-left: 200px;">
	百色学院场地使用管理系统
</span>
<%-- <div class="layui-carousel" id="test1" lay-filter="test1" >
<div class="carousel slide" id="carousel1">
<div class="carousel-inner" >
<div class="item">
<img style="margin-left:auto;margin-right:auto; alt="image" class="img-responsive" src="${pageContext.request.contextPath}/images/05.jpg">
</div>
<div class="item">
<img style="margin-left:auto;margin-right:auto;" alt="image" class="img-responsive" src="${pageContext.request.contextPath}/images/06.jpg">
</div>
<div class="item active">
<img style="margin-left:auto;margin-right:auto;" alt="image" class="img-responsive" src="${pageContext.request.contextPath}/images/07.jpg">
</div>
<div class="item">
<img style="margin-left:auto;margin-right:auto;" alt="image" class="img-responsive" src="${pageContext.request.contextPath}/images/88.jpg">
</div>
</div>
<a data-slide="prev" href="carousel.html#carousel1" class="left carousel-control">
<span class="icon-prev"></span>
</a>
<a data-slide="next" href="carousel.html#carousel1" class="right carousel-control">
<span class="icon-next"></span>
</a>
</div>
</div>  --%>
</div>
<div class="col-sm-3" id="login" style="position: absolute;right: 50px;">
	<div class="ibox-content" id="login_div">
		<form class="form-horizontal m-t" id="commentForm"  action="${pageContext.request.contextPath}/query/Postulant" method="post"
			novalidate="novalidate">
			<div class="form-group">
				<!-- <label class="col-sm-3 control-label" style="color: red">选择身份：</label> -->
				<div class="col-sm-10">
					<select style="width: 100%;height:35px;border: 1; " data-am-selected="{btnSize: 'sm'}" name="identity" onchange="identityChange()">
						<option value="0">--选择身份--</option>
						<option value="1">学生</option>
						<option value="2">教师</option>
						<option value="3">场地管理员</option>
						<!-- <option value="4">管理员</option> -->
					</select>
					 <label class="control-label" for="inputError1" id="identityerror"></label>
				</div>
			</div>
			<div class="form-group">
				<!-- <label class="col-sm-3 control-label" style="color: red">姓名：</label> -->
				<div class="col-sm-10">
					<input id="postulantName" name="postulantName" minlength="2" type="text"
						class="form-control" required="" aria-required="true" placeholder="姓名">
				    <label class="control-label" for="inputError1" id="postulantNameerror"></label>
				</div>
			</div>
			<div class="form-group" style="display: none" id="studentNum_div">
				<!-- <label class="col-sm-3 control-label" style="color: red">学号：</label> -->
				<div class="col-sm-10">
					<input id="studentNum" name="studentNum" minlength="2" type="text"
						class="form-control" required="" aria-required="true" placeholder="学号">
				    <label class="control-label" for="inputError1" id="studentNumerror"></label>
				</div>
			</div>
			<div class="form-group" style="display: none" id="teacherNum_div">
				<!-- <label class="col-sm-3 control-label" style="color: red">教师编号：</label> -->
				<div class="col-sm-10">
					<input id="teacherNum" name="teacherNum" minlength="2" type="text"
						class="form-control" required="" aria-required="true" placeholder="教师编号">
				    <label class="control-label" for="inputError1" id="teacherNumerror"></label>
				</div>
			</div>
			<div class="form-group" style="display: none" id="approverNum_div">
				<!-- <label class="col-sm-3 control-label" style="color: red">审批人编号：</label> -->
				<div class="col-sm-10">
					<input id="approverNum" name="approverNum" minlength="2" type="text"
						class="form-control" required="" aria-required="true" placeholder="审批人编号">
				    <label class="control-label" for="inputError1" id="approverNumerror"></label>
				</div>
			</div>
			<div class="form-group" style="display: none" id="administratorNum_div">
				<!-- <label class="col-sm-3 control-label" style="color: red">管理员编号：</label> -->
				<div class="col-sm-10">
					<input id="administratorNum" name="administratorNum" minlength="2" type="text"
						class="form-control" required="" aria-required="true" placeholder="管理员编号">
				    <label class="control-label" for="inputError1" id="administratorNumerror"></label>
				</div>
			</div>
			<div class="form-group">
				<!-- <label class="col-sm-3 control-label" style="color: red">密码：</label> -->
				<div class="col-sm-10">
					<input id="postulantPwd" type="password" class="form-control" name="postulantPwd"
						required="" aria-required="true" placeholder="密码">
					<label class="control-label" for="inputError1" id="postulantPwderror"></label>
				</div>
			</div>
			<div class="form-group">
				<!-- <label class="col-sm-3 control-label" style="color: red">验证码：</label> -->
				<div class="col-sm-10">
					<input id="Rand" type="text" class="form-control" name="Rand" 
						required="" aria-required="true" placeholder="验证码">
					<label class="control-label" for="inputError1" id="Randerror"></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"></label>
				<div class="col-sm-10">
					<span> <img src="${pageContext.request.contextPath}/image.jsp" id="verId">
					</span> <a href="javascript:void(0)" id="verId2">看不清？点击图片更换</a><br> 
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-3">
					<button class="btn btn-primary" type="submit" onclick="login()">登陆</button>
					<button class="btn btn-primary" type="reset">取消</button>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 注册div -->
<div class="col-sm-3" id="register" style="display: none;position: absolute;right: 50px;" >
	<div class="ibox-content" id="register_div">
		<form class="form-horizontal m-t" id="commentRegisterForm"  action="${pageContext.request.contextPath}/add/Postulant" method="post"
			novalidate="novalidate">
			<div class="form-group">
				<!-- <label class="col-sm-3 control-label" style="color: red">选择身份：</label> -->
				<div class="col-sm-10">
					<select style="width: 100%;height:35px;border: 1; " data-am-selected="{btnSize: 'sm'}" name="identityR" onchange="identityRChange()">
						<option value="0">--选择身份--</option>
						<option value="1">学生</option>
						<option value="2">教师</option>
					</select>
					 <label class="control-label" for="inputError1" id="identityRerror"></label>
				</div>
			</div>
			<div class="form-group">
				<!-- <label class="col-sm-3 control-label" style="color: red">姓名：</label> -->
				<div class="col-sm-10">
					<input id="postulantNameR" name="postulantName" minlength="2" type="text"
						class="form-control" required="" aria-required="true" placeholder="姓名">
				    <label class="control-label" for="inputError1" id="postulantNameerrorR"></label>
				</div>
			</div>
			<div class="form-group" style="display: none" id="studentNumR_div">
				<!-- <label class="col-sm-3 control-label" style="color: red">学号：</label> -->
				<div class="col-sm-10">
					<input id="studentNumR" name="studentNumR" minlength="2" type="text"
						class="form-control" required="" aria-required="true" placeholder="学号">
				    <label class="control-label" for="inputError1" id="studentNumRerror"></label>
				</div>
			</div>
			<div class="form-group" style="display: none" id="teacherNumR_div">
				<!-- <label class="col-sm-3 control-label" style="color: red">教师编号：</label> -->
				<div class="col-sm-10">
					<input id="teacherNumR" name="teacherNumR" minlength="2" type="text"
						class="form-control" required="" aria-required="true" placeholder="教师编号">
				    <label class="control-label" for="inputError1" id="teacherNumRerror"></label>
				</div>
			</div>
			<div class="form-group">
				<!-- <label class="col-sm-3 control-label" style="color: red">密码：</label> -->
				<div class="col-sm-10">
					<input id="postulantPwdR" type="password" class="form-control" name="postulantPwd"
						required="" aria-required="true" placeholder="密码">
					<label class="control-label" for="inputError1" id="postulantPwderrorR"></label>
				</div>
			</div>
			<div class="form-group">
				<!-- <label class="col-sm-3 control-label" style="color: red">确认密码：</label> -->
				<div class="col-sm-10">
					<input id="postulantPwdNew" type="password" class="form-control" name="postulantPwdNew"
						required="" aria-required="true" placeholder="确认密码">
					<label class="control-label" for="inputError1" id="postulantPwdNewerror"></label>
				</div>
			</div>
			<div class="form-group">
				<!-- <label class="col-sm-3 control-label" style="color: red">验证码：</label> -->
				<div class="col-sm-10">
					<input id="RandR" type="text" class="form-control" name="Rand" 
						required="" aria-required="true" placeholder="验证码">
					<label class="control-label" for="inputError1" id="RanderrorR"></label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label"></label>
				<div class="col-sm-10">
					<span> <img src="${pageContext.request.contextPath}/image.jsp" id="verId">
					</span> <a href="javascript:void(0)" id="verId2">看不清？点击图片更换</a><br>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-10 col-sm-offset-3">
					<button class="btn btn-primary" type="submit" onclick="register()">注册</button>
					<button class="btn btn-primary" type="reset">取消</button>
				</div>
			</div>
		</form>
	</div>
</div>

</body>
<body>
</html>