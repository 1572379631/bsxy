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
<%-- <c:set var="listPlaceInfo" value='<%=session.getAttribute("listPlaceInfo") %>' />  --%>
<%-- <c:set var="listPlaceInfo" value='${sessionScope.listPlaceInfo }' /> --%>
</head>
<body>

    <div class="admin-biaoge">
      <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success">
                <!-- <th class="table-check"><input type="checkbox" /></th> -->
                <!-- <th class="table-id"></th> -->
                <th class="table-title">场地名称</th>
                <th class="table-type">校区</th>
                <th class="table-author am-hide-sm-only">方位</th>
                <th class="table-author am-hide-sm-only">使用状态</th>
                <th width="130px" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${listPlaceInfo}" var="list">
	              <tr>
	                <td>${list.placeName}</td>
	                <td>${list.placeDivision }</td>
	                <td>${list.placeLieu }</td>
	                <td>${list.placeStatus }${list.applyStatus}</td>
	                <td>
	                	<div class="am-btn-toolbar">
	                    <div class="am-btn-group-xs">
	                    	<a href="javascript:;" onclick="queryPlaceInfo(${list.placeId})" title="查看场地信息" class="am-text-success am-icon-file" style="margin-left: 20px"> 查看</a>
	                    </div>
	                  </div>
	                </td>
	              </tr>
              </c:forEach>
            </tbody>
          </table>
              <ul class="am-pagination am-fr">
									<c:if test="${page.currnav>1}">
										<li><a href="${pageContext.request.contextPath}/query/placeUseStatusList?currnav=${page.first}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&placeName=${sessionScope.placeName}&placeStatus=${sessionScope.placeStatus}&fla=${sessionScope.fla}">首页</a></li>
									</c:if>
									<c:if test="${page.currnav>1}">
										<li><a href="${pageContext.request.contextPath}/query/placeUseStatusList?currnav=${page.currnav-1}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&placeName=${sessionScope.placeName}&placeStatus=${sessionScope.placeStatus}&fla=${sessionScope.fla}">«</a></li>
									</c:if>
									<c:forEach begin="${page.begin }" end="${page.end }" var="num">
									<c:choose>
									<c:when test="${page.currnav==num }">
										<li class="am-active"><a href="${pageContext.request.contextPath}/query/placeUseStatusList?currnav=${num}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&placeName=${sessionScope.placeName}&placeStatus=${sessionScope.placeStatus}&fla=${sessionScope.fla}">${num}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/query/placeUseStatusList?currnav=${num}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&placeName=${sessionScope.placeName}&placeStatus=${sessionScope.placeStatus}&fla=${sessionScope.fla}">${num}</a></li>
									</c:otherwise>
									</c:choose>
									</c:forEach>
									<c:if test="${page.currnav< page.last }">
										<li><a href="${pageContext.request.contextPath}/query/placeUseStatusList?currnav=${page.currnav+1}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&placeName=${sessionScope.placeName}&placeStatus=${sessionScope.placeStatus}&fla=${sessionScope.fla}">»</a></li>
									</c:if>
									<c:if test="${page.currnav< page.last }">
										<li><a href="${pageContext.request.contextPath}/query/placeUseStatusList?currnav=${page.end}&placeDivision=${sessionScope.placeDivision}&placeLieu=${sessionScope.placeLieu}&placeName=${sessionScope.placeName}&placeStatus=${sessionScope.placeStatus}&fla=${sessionScope.fla}">尾页</a></li>
									</c:if>
								</ul>
								显示第${page.currnav }页，共 ${page.navcount }页
          <hr />
        </form>
      
    </div>

<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>

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

function queryPlaceInfo(placeId){
	window.parent.queryPlaceInfo(placeId);
}
</script>

</body>
</html>