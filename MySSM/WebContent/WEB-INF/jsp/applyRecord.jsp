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
	
<link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" >
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6">

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
						<strong class="am-text-primary am-text-lg">申请记录</strong> / <small>Application record</small>
					</div>
				</div>

				<hr />

				<div class="am-g">
						<form id="placeApplyRecordInfo" class="am-form am-form-horizontal">
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-1 am-text-left" style="margin-left: 50px;">校区</div>
								<div class="am-u-sm-8 am-u-md-4">
									<select style="width: 200px;" id="placeDivision1" data-am-selected="{btnSize: 'sm'}" name="placeDivision" >
										<option value="0">--请选择--</option>
										<option value="东合">东合</option>
										<option value="澄碧">澄碧</option>
									</select>
								</div>
								<div class="am-u-sm-4 am-u-md-2 am-text-right">场地名称</div>
								<div class="am-u-sm-8 am-u-md-4">
									<input style="width:200px" type="text" id="placeName" name="placeName" placeholder="场地名称"/>
								</div>
								
							</div>
							
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-1 am-text-left" style="margin-left: 50px;">申请时间</div>
								<div class="am-u-sm-8 am-u-md-4">
									<input style="width:200px" type="datetime-local" id="applyTime" name="applyTime" placeholder="申请时间">
								</div>
								<div class="am-u-sm-4 am-u-md-2 am-text-right"></div>
								<div class="am-u-sm-8 am-u-md-4">
							      <button type="button" class="am-btn am-btn-primary" onclick="QueryApplyRecord()">查询</button>
							      <button type="reset" class="am-btn am-btn-primary">取消</button>
							    </div>
						    </div>
						</form>
						<br>
		<!-- ///////分页开始 -->
						<div id="tt" class="am-u-sm12 am-u-md-12 am-u-md-pull-0" style="width: 100%;height: 2000px;" >
						<iframe src="${pageContext.request.contextPath}/query/queryApplyRecordList" frameborder="0" align="left" width="100%" height="100%" scrolling="no"></iframe>
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
	<script
		src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script> 
	<script src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/hplus.js?v=4.1.0"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contabs.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contabs.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/content.min.js"></script>
	
	
	<script type="text/javascript">
	//删除申请信息
	function detelePlaceApplyStatus(placeApplyId){
		var pathName = window.document.location.pathname;
		var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
		
		$.ajax({
			type : 'post',
			url : projectName + '/detele/detelePlaceAppleStatus',
			dataType : 'json',
			data : {
				placeApplyId : placeApplyId,
			},
			success : function(data) {
				if(data.status=='01'){
					parent.layer.alert(data.massage);
					window.setTimeout(function(){
						window.location.href = projectName+"/placeApply/placeApplyStatus";
                	},2000);
				}else if(data.status=='02'){
					parent.layer.alert(data.massage);
				}else if(data.status=='03'){
					parent.layer.alert(data.massage);
					window.setTimeout(function(){
						window.location.href = projectName+"/login";
                	},3000);
				}
			},
			error : function(jqXHR) {
				$("#data").html("发生错误:" + jqXHR.status);
			}
		});
	}
	
function QueryApplyRecord(){
	debugger;
	$("#tt").find("iframe").remove();
	var placeDivision=  $("select[name='placeDivision']").find("option:selected").val();
	var placeName = $("#placeName").val();
	$("#tt").append('<iframe src="${pageContext.request.contextPath}/query/queryApplyRecordList?placeDivision='+placeDivision+'&placeName='+placeName+'" frameborder="0" align="left" width="100%" height="100%" scrolling="no"></iframe>');

}
function addPlaceAppleInfo(){
	window.parent.addPlaceAppleInfo();
}
	</script>
</body>
</html>