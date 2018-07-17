<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>百色学院场地使用管理系统</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/amazeUI/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/amazeUI/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/amazeUI/assets/css/amazeui.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/amazeUI/assets/css/admin.css">
	
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script> 
	<script src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/hplus.js?v=4.1.0"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contabs.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contabs.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/content.min.js"></script>

<script
		src="${pageContext.request.contextPath}/amazeUI/assets/js/amazeui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/amazeUI/assets/js/app.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/md5.js"></script>
	
<style type="text/css">
#place_name_div {
	width: 200px;
	position: relative;
	float: left;
	left: 18px;
}

#place_name {
	float: left;
	height: 33px;
}

#pagefenye {
	position: relative;
	float: left;
}

</style>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<body>
	<div class="am-cf">
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">完善个人资料</strong> / <small>Improve personal data</small>
					</div>
				</div>

				<hr />

				<div class="am-g">
						<form id="placeApplyInfo" class="am-form am-form-horizontal">
							<c:forEach items="${posList }" var="list">
								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-2 am-text-right">院系</div>
									<div class="am-u-sm-8 am-u-md-4">
										<input style="width:200px" type="text" id="postulantFaculte" name="postulantFaculte" value="${list.postulantFaculte}" readonly="readonly"/>
									</div>
									<c:if test="${sessionScope.identity==2 }">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">部门</div>
										<div class="am-u-sm-8 am-u-md-4">
											<input style="width:200px" type="text" id="deptName" name="deptName"  value="${list.postulantDept }" readonly="readonly"/>
										</div>
									</c:if>
									<c:if test="${sessionScope.identity==1 }">
										<div class="am-u-sm-4 am-u-md-2 am-text-right">班级</div>
										<div class="am-u-sm-8 am-u-md-4">
											<input style="width:200px" type="text" id="className" name="className"  value="${list.postulantDept }" readonly="readonly"/>
										</div>
									</c:if>
								</div>
								<div class="am-g am-margin-top">
									<div class="am-u-sm-4 am-u-md-2 am-text-right">电话</div>
									<div class="am-u-sm-8 am-u-md-4">
										<input style="width:200px" type="text" id="postulantTell" name="postulantTell" value="${list.postulantTell }" />
									</div>
									<div class="am-u-sm-4 am-u-md-2 am-text-right">邮箱</div>
									<div class="am-u-sm-8 am-u-md-4">
										<input style="width:200px" type="text" id="postulantEmaill" name="postulantEmaill" value="${list.postulantEmaill }"/>
									</div>
								</div>
								
							<div id="pwd" style="display:none">
					          <div class="am-g am-margin-top">
					            <div class="am-u-sm-4 am-u-md-2 am-text-right">原密码</div>
					            <div class="am-u-sm-8 am-u-md-4">
					              <input style="width:200px" type="password" class="am-input-sm" name="postulantPwd">
					            </div>
					            <div class="am-u-sm-4 am-u-md-2 am-text-right">新密码</div>
					            <div class="am-u-sm-8 am-u-md-4" style="float:left">
						             <input style="width:200px" type="password" class="am-input-sm" name="postulantPwdNew">
					            </div>
					          </div>
					           <div class="am-g am-margin-top">
					            <div class="am-u-sm-4 am-u-md-2 am-text-right">确认密码</div>
					            <div class="am-u-sm-8 am-u-md-4">
					              <input style="width:200px" type="password" class="am-input-sm" name="postulantPwdNew2">
					            </div>
					            <div class="am-u-sm-4 am-u-md-2 am-text-right">
					            </div>
					            <div class="am-u-sm-8 am-u-md-4" style="float:left">
						             <input  type="hidden" class="am-input-sm">
					            </div>
					          </div>
					          </div>
								<a id="t" href="javasricpt:;" onclick="updatePwd('t')">修改密码？</a>
          						<a id="f" style="display: none" href="javasricpt:;" onclick="updatePwd('f')">不修改密码？</a>
								<div class="am-g am-margin-top" style="position:fixed; left:700px; bottom:200px;">
									<div class="am-margin" style="text-align: center;">
								      <button type="button" class="am-btn am-btn-primary" onclick="submitFrom()">修改</button>
								      <button type="reset" class="am-btn am-btn-primary">取消</button>
								    </div>
							    </div>
						    </c:forEach>
						</form>
				</div>
			</div>
		</div>
	</div>

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<script type="text/javascript">
	var flag = false;
	//提交form表单
	function submitFrom(){
		debugger;
		var postulantTell = $("#postulantTell").val();
		var postulantEmaill = $("#postulantEmaill").val();
		
		var sessionPwd = '<%= session.getAttribute("postulantPwd")%>';//获取session中的密码
		var postulantPwd = $.trim($("input[name='postulantPwd']").val());
		postulantPwd = hex_md5(postulantPwd);
		
		var postulantPwdNew = $.trim($("input[name='postulantPwdNew']").val());
		var postulantPwdNew2 = $.trim($("input[name='postulantPwdNew2']").val());
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
		//获取项目路劲 
		var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
		$.ajax({
	            dataType: "json",
	            type:'post',
				url:projectName+'/update/updatePostulantuserInfo',
				data:{postulantTell:postulantTell,
					postulantEmaill:postulantEmaill,
					postulantPwdNew:postulantPwdNew
					},
	            success: function (data) {
	                if (data.status == '01') {
	                	parent.layer.alert(data.massage);
	                }else if(data.status == '02'){
	                	parent.layer.alert(data.massage);
	                	
	                }else{
	                	parent.layer.alert(data.massage);
	                }
	            },
	            error : function() {
	                alert("异常！");
	            }
	        }); 
	 
		
	}
	
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
	</script>
</body>
</html>