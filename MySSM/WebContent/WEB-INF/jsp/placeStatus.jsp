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
<script type="text/javascript" src="/MySSM/js/jquery.min.js"></script>
<body>
	<div class="am-cf">
		<div class="admin-content">
			<div class="admin-content-body">
				<div class="am-cf am-padding am-padding-bottom-0">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">可使用场地查询</strong> / <small>Site to retrieve</small>
					</div>
				</div>
				<hr>
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-12 am-u-md-pull-1">
						<form class="am-form am-form-horizontal">
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">选择校区</div>
								<div class="am-u-sm-8 am-u-md-4">
									<select data-am-selected="{btnSize: 'sm'}" name="placeDivision"
										onchange="getLieu(this.value)">
										<option value="0">--请选择--</option>
										<c:forEach items="${pDivision }" var="pd">
											<option value="${pd.placeDivision }">${pd.placeDivision }</option>
										</c:forEach>
									</select>
								</div>

								<div class="am-u-sm-4 am-u-md-2 am-text-right">选择方位</div>
								<div class="am-u-sm-8 am-u-md-4">
									<select id="lieu" data-am-selected="{btnSize: 'sm'}" name="placeLieu">
										<option value="0">--请选择--</option>
									</select>
								</div>
							</div>

							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">场地名称</div>
								<div id="place_name_div">
									<input type="text" id="place_name" name="place_name" placeholder="场地名称">
								</div>
								<div class="am-u-sm-4 am-u-md-2 am-text-right"></div>
								<div class="am-u-sm-8 am-u-md-4" style="position: relative;float: right;right:-400px">
									<button type="button" class="am-btn am-btn-primary" onclick="submitFrom()">查询</button>
									<button type="reset" class="am-btn am-btn-primary">取消</button>
								</div>
							</div>
							
						</form>
					</div>

					<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
						<br>
					</div>
					<!-- 用于换行 -->
					<!-----------------分页开始---------------------------------  -->
					<!-----------------分页开始---------------------------------  -->
					<div id="tt" class="am-u-sm-12 am-u-md-12 am-u-md-pull-0" style="width: 100%;height: 2000px;" >
						<iframe src="${pageContext.request.contextPath}/query/placeStatusList" frameborder="0" align="left" width="100%" height="100%" scrolling="no"></iframe>
					</div>
				</div>
			</div>
		</div>

	</div>

	<a href="#"
		class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<script
		src="${pageContext.request.contextPath}/amazeUI/assets/js/jquery.min.js"></script>
	<!--<![endif]-->
	<script
		src="${pageContext.request.contextPath}/amazeUI/assets/js/amazeui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/amazeUI/assets/js/app.js"></script>
	<script type="text/javascript">
		function getLieu(division) {
			$("#lieu").find("option").remove();
			var lieu = document.getElementById("lieu");
			var pathName = window.document.location.pathname;
			var projectName = pathName.substring(0, pathName.substr(1).indexOf(
					'/') + 1);
			$.ajax({
				type : 'post',
				url : projectName + '/query/placeLieu',
				dataType : 'json',
				data : {
					division : division,
				},
				success : function(data) {
					var opt1 = document.createElement("option");
					opt1.value = "0";
					opt1.innerText = "--请选择--";
					lieu.appendChild(opt1);
					for (var i = 0; i < data.length; i++) {
						var opt = document.createElement("option");
						opt.value = data[i].placeLieu;
						opt.innerText = data[i].placeLieu;
						lieu.appendChild(opt);
					}
				},
				error : function(jqXHR) {
					$("#data").html("发生错误:" + jqXHR.status);
				}
			});
		}
function submitFrom(){
	debugger;
	$("#tt").find("iframe").remove();
	var placeDivision=  $("select[name='placeDivision']").find("option:selected").val();
	var placeLieu=  $("select[name='placeLieu']").find("option:selected").val();
	var place_name = $("#place_name").val();
	
	$("#tt").append('<iframe src="${pageContext.request.contextPath}/query/placeStatusList?placeDivision='+placeDivision+'&placeLieu='+placeLieu+'&place_name='+place_name+'" frameborder="0" align="left" width="100%" height="100%" scrolling="no"></iframe>');
}

function addPlaceAppleInfo(){
	window.parent.addPlaceAppleInfo();
}
	</script>
</body>
</html>