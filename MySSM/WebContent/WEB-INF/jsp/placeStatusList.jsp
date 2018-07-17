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
				<div class="am-g">

					<!-----------------分页开始---------------------------------  -->
					<!-----------------分页开始---------------------------------  -->
					<div class="am-u-sm-12 am-u-md-12 am-u-md-pull-0">
						<table border="1" bordercolor="#a0c6e5"
							style="border-collapse: collapse;"
							class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th class="table-author am-hide-sm-only">场地名称</th>
									<th class="table-author am-hide-sm-only">所属方位</th>
									<th class="table-type">所在校区</th>
									<th class="table-type">使用状态</th>
									<th class="table-set">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listPlaceInfo }" var="list">
									<tr>
										<td><a href="#">${list.placeName }</a></td>
										<td>${list.placeLieu}</td>
										<td class="am-hide-sm-only">${list.placeDivision }</td>
										<td class="am-hide-sm-only">${list.placeStatus }</td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<button
														class="am-btn am-btn-default am-btn-xs am-text-secondary">
														<span class="am-icon-pencil-square-o"><a href="javascipt:;" onclick="addPlaceAppleInfo()">申请</a></span> 
													</button>
													
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
						<div class="am-cf">
							<div class="am-fr">
								<ul class="am-pagination">
									<c:if test="${page.currnav>1}">
										<li><a href="${pageContext.request.contextPath}/query/placeStatusList?currnav=${page.first}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&place_name=${sessionScope.place_name}">首页</a></li>
									</c:if>
									<c:if test="${page.currnav>1}">
										<li><a href="${pageContext.request.contextPath}/query/placeStatusList?currnav=${page.currnav-1}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&place_name=${sessionScope.place_name}">«</a></li>
									</c:if>
									<c:forEach begin="${page.begin }" end="${page.end }" var="num">
									<c:choose>
									<c:when test="${page.currnav==num }">
										<li class="am-active"><a href="${pageContext.request.contextPath}/query/placeStatusList?currnav=${num}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&place_name=${sessionScope.place_name}">${num}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/query/placeStatusList?currnav=${num}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&place_name=${sessionScope.place_name}">${num}</a></li>
									</c:otherwise>
									</c:choose>
									</c:forEach>
									<c:if test="${page.currnav< page.last }">
										<li><a href="${pageContext.request.contextPath}/query/placeStatusList?currnav=${page.currnav+1}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&place_name=${sessionScope.place_name}">»</a></li>
									</c:if>
									<c:if test="${page.currnav< page.last }">
										<li><a href="${pageContext.request.contextPath}/query/placeStatusList?currnav=${page.end}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&place_name=${plsessionScope.ace_name}">尾页</a></li>
									</c:if>
								</ul>
								显示第${page.currnav }页，共 ${page.navcount }页
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- <footer class="admin-content-footer">
			<hr>
			<p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed
				under MIT license.</p>
			</footer>
 -->
		</div>
		<!-- content end -->

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
	function addPlaceAppleInfo(){
		window.parent.addPlaceAppleInfo();
	}
	</script>
</body>
</html>