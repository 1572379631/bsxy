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
</head>
<body>

    <div class="admin-biaoge">
      <div class="xinxitj">场地设备信息</div>
      <form class="am-form am-form-horizontal" action="${pageContext.request.contextPath}/query/queryPlace" method="POST">
       <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
                    校区
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
              <select name="placeDivision" style="width: 200px;height: 36px;font-size: 14px" onchange="getLieu(this.value)">
					<option value="0">--请选择--</option>
					<c:forEach items="${pDivision }" var="pd">
					<option value="${pd.placeDivision }">${pd.placeDivision }</option>
					</c:forEach>
			   </select>
            </div>
             
             <div class="am-u-sm-4 am-u-md-3 am-text-right">
                     方位
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
              <select id="lieu" style="width: 200px;height: 36px;font-size: 14px" name="placeLieu">
					<option value="0">--请选择--</option>
			   </select>
            </div>
          </div>
          <!--------------------  -->
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
                   场地名称
            </div>
            <div class="am-u-sm-8 am-u-md-3">
				<input style="width: 200px;height: 36px;font-size: 14px" type="text" id="place_name" name="placeName" placeholder="场地名称">
            </div>
             <div class="am-u-sm-4 am-u-md-3 am-text-right">
            </div>
              <div class="am-margin" style="text-align: center; margin-top: 10px;">
				    <button  onclick="submitFrom()" type="button" class="am-btn am-btn-success am-radius "><font size="1px">查询</font></button>
				    <button  type="reset" class="am-btn am-btn-primary am-radius "><font size="1px">取消</font></button>
				  </div>
          </div>
          </form>
       <div id="fenye">
       		<iframe src="${pageContext.request.contextPath}/query/queryEmentInfoList" frameborder="0" align="left" width="100%" height="500px" scrolling="no"></iframe>
       </div>
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

function queryPlaceEment(placeId){
	window.parent.queryPlaceEment(placeId);
}

function submitFrom(){
	$("#fenye").find("iframe").remove();
	var placeDivision=  $("select[name='placeDivision']").find("option:selected").val();
	var placeLieu=  $("select[name='placeLieu']").find("option:selected").val();
	var place_name = $("#place_name").val();
	$("#fenye").append('<iframe src="${pageContext.request.contextPath}/query/queryEmentInfoList?placeDivision='+placeDivision+'&placeLieu='+placeLieu+'&placeName='+place_name+'" frameborder="0" align="left" width="100%" height="500px" scrolling="no"></iframe>');
	
}

</script>

</body>
</html>