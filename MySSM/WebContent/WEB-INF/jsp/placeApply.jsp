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

input{
	height:33px;
}
select{
	height:33px;
	padding-top: 4px;
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
						<strong class="am-text-primary am-text-lg">场地申请信息填写</strong> / <small>The venue application information is completed</small>
					</div>
				</div>

				<hr />

				<div class="am-g">
						<form id="placeApplyInfo" class="am-form am-form-horizontal"  action="${pageContext.request.contextPath}/Add/placeApplyInfo" method="post">
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">申请人姓名</div>
								<div class="am-u-sm-8 am-u-md-4">
									<input type="hidden" id="postulantId" name="postulantId" value="${sessionScope.postulantId}" />
									<input style="width:200px" type="text" id="postulantName" name="postulantName" readonly="readonly" value="${sessionScope.postulantName}"/>
								</div>
								<div class="am-u-sm-8 am-u-md-2 am-text-right">是否个人申请</div>
								<div class="am-u-sm-8 am-u-md-4">
									<select style="width: 200px;padding-top: 4px;" id="teamYesnot" data-am-selected="{btnSize: 'sm'}" name="teamYesnot" onchange="showDept()" required>
										<option value="">--请选择--</option>
										<option value="1">个人</option>
										<option value="2">团体</option>
									</select>
								</div>
							</div>
							<div class="am-g am-margin-top" style="display: none" id="dtNdiv">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">申请单位</div>
								<div class="am-u-sm-8 am-u-md-4">
									<input type="hidden" id="deptId" name="detpId" value="${sessionScope.deptId}"/>
									 <input style="width:200px" type="text" id="deptName" name="deptName" minlength="3" placeholder="输入申请单位" />
								</div>
								<div class="am-u-sm-4 am-u-md-2 am-text-right"></div>
								<div class="am-u-sm-8 am-u-md-4">
								</div>
							</div>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">申请开始时间</div>
								<div class="am-u-sm-8 am-u-md-4">
									<input style="width:200px" type="datetime-local" id="applyTimeStart" name="applyTimeStart" placeholder="时间" class="am-form-field" required>
								</div>
								<div class="am-u-sm-4 am-u-md-2 am-text-right">申请结束时间</div>
								<div class="am-u-sm-8 am-u-md-4">
									<input style="width:200px" type="datetime-local" id="applyTimeEnd" name="applyTimeEnd" placeholder="时间" class="am-form-field" required>
								</div>
							</div>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">选择场地方式</div>
								<div class="am-u-sm-8 am-u-md-4">
									<select style="width: 200px;padding-top: 4px;" id="ApplyPlaceType" name="ApplyPlaceType" 
										onchange="ChangplaceStyle(this.value)" required>
										<option value="">--请选择--</option>
										<option value="1">自定义</option>
										<option value="2">快速选择</option>
									</select>
								</div>
								 <div class="am-u-sm-4 am-u-md-2 am-text-right">负责人电话</div>
						            <div class="am-u-sm-8 am-u-md-3" style="float: left;width: ">
						              <!-- <input type="text" class="am-input-sm" style="width: 200px;"> -->
						              <input type="text" id="principalTell" name="principalTell"  placeholder="11位数字的电话号码" pattern="^\d{11}$" required data-foolish-msg="请输入负责人电话！" style="width: 200px;"/>
						            </div>
							</div>
							<div class="am-g am-margin-top" style="display: none" id="zDyPlace">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">选择校区</div>
								<div class="am-u-sm-8 am-u-md-4">
									<select style="width: 200px;padding-top: 4px;" id="placeDivision1" data-am-selected="{btnSize: 'sm'}" name="placeDivision1" >
										<option value="">--请选择--</option>
										<option value="东合">东合</option>
										<option value="澄碧">澄碧</option>
									</select>
								</div>
								<div class="am-u-sm-4 am-u-md-2 am-text-right">场地名称</div>
								<div class="am-u-sm-8 am-u-md-4"> 
									<input style="width:200px" type="text" id="placeName1" name="placeName1" placeholder="请输入申请场地的具体位置" >
								</div>
								
							</div>
							<div class="am-g am-margin-top" style="display: none" id="PlDiv">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">选择校区</div>
								<div class="am-u-sm-8 am-u-md-4">
									<select style="width: 200px;padding-top: 4px;" data-am-selected="{btnSize: 'sm'}" id="placeDivision2" name="placeDivision" 
										onchange="getLieu(this.value)">
										<option value="">--请选择--</option>
										<c:forEach items="${pDivision }" var="pd">
											<option value="${pd.placeDivision }">${pd.placeDivision }</option>
										</c:forEach>
									</select>
								</div>

								<div class="am-u-sm-4 am-u-md-2 am-text-right">选择方位</div>
								<div class="am-u-sm-8 am-u-md-4">
									<select style="width: 200px;padding-top: 4px;" id="lieu" data-am-selected="{btnSize: 'sm'}" name="placeLieu" onchange="getPl_name(this.value)">
										<option value="">--请选择--</option>
									</select>
								</div>
							</div>

							<div class="am-g am-margin-top" style="display: none" id="PName">
								<div class="am-u-sm-4 am-u-md-2 am-text-right">场地名称</div>
								<div id="place_name_div" >
								<select style="width: 200px;padding-top: 4px;" data-am-selected="{btnSize: 'sm'}" id="placeName2"  name="placeName" onchange="tt()">
										<option value="">--请选择--</option>
									</select>
								</div>
							</div>
              				<div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
             主办方
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" style="width:200px" class="am-input-sm" name="sponsor" class="am-form-field" required>
            </div>
            <div class="am-u-sm-4 am-u-md-3 am-text-right">
              活动名称
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
              <input type="text" style="width:200px" class="am-input-sm" name="activityName" class="am-form-field" required>
            </div>
          </div>
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">
             活动内容
            </div>
            <div class="am-u-sm-12 am-u-md-9" style="float: left;">
              <textarea rows="2" placeholder="" name="activityContent" class="am-form-field" required></textarea>
            </div>
          </div>
          
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">
            活动性质
            </div>
            <div class="am-u-sm-12 am-u-md-9" style="float: left;">
              <textarea rows="2" placeholder="" name="activityNature" class="am-form-field" required></textarea>
            </div>
          </div>
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">
            参与人员
            </div>
            <div class="am-u-sm-12 am-u-md-9" style="float: left;">
              <textarea rows="2" placeholder="" name="participant" class="am-form-field" required></textarea>
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              参与人数
            </div>
            <div class="am-u-sm-8 am-u-md-3">
             <!--  <input type="text" class="am-input-sm" name="participantSum"/> -->
              <input type="text" id="participantSum" name="participantSum" placeholder="请输入数字" pattern="(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)" required data-foolish-msg="请输入参与总人数！"/>
            </div>
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="hidden" class="am-input-sm"/>
            </div>
            </div>
              				<div class="am-g am-margin-top">
								<div class="am-u-sm-12 am-u-md-2 am-text-right admin-form-text">备注</div>
								<div class="am-u-sm-12 am-u-md-9" style="float: left;">
					                <textarea  class="" rows="2" id="reamk" name="reamk" class="am-form-field" required></textarea>
	              				</div>
              				</div>
							<div class="am-g am-margin-top">
								<div class="am-margin" style="text-align: center;">
							      <button type="submit" class="am-btn am-btn-primary" onclick="submitFrom()">提交申请</button>
							      <button type="reset" class="am-btn am-btn-primary">取消</button>
							    </div>
						    </div>
						</form>
				</div>
			</div>

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
	//获取下拉款信息
		function getLieu(division) {
			$("#lieu").find("option").remove();
			var lieu = document.getElementById("lieu");
			var pathName = window.document.location.pathname;
			var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
			$.ajax({
				type : 'post',
				url : projectName + '/query/placeLieu',
				dataType : 'json',
				data : {
					division : division,
				},
				success : function(data) {
					var opt1 = document.createElement("option");
					opt1.value = "";
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

///获取场地名称及场地id下拉框
function getPl_name(Place_lieu){
	$("#placeName2").find("option").remove();
	var place_name = document.getElementById("placeName2");
	//获取项目路劲
	var pathName = window.document.location.pathname;
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	$.ajax({
		type : 'post',
		url : projectName + '/query/placeName',
		dataType : 'json',
		data : {
			Place_lieu : Place_lieu,
		},
		success : function(data) {
			var opt1 = document.createElement("option");
			opt1.value = "";
			opt1.innerText = "--请选择--";
			place_name.appendChild(opt1);
			for (var i = 0; i < data.length; i++) {
				var opt = document.createElement("option");
				opt.value = data[i].placeId;
				opt.innerText = data[i].placeName;
				place_name.appendChild(opt);
			}
		},
		error : function(jqXHR) {
			$("#data").html("发生错误:" + jqXHR.status);
		}
	});
}
		
function showDept(){
	var teamyesnot= $("#teamYesnot").val();
	if(teamyesnot=='2'){
		$("#dtNdiv").show();
		$("#deptName").addClass("am-form-field");
		$("#deptName").attr("required","");
	}else{
		$("#dtNdiv").hide();
		$("#deptName").removeClass();
		$("#deptName").removeAttr("required");
		$("#deptName").val("");//将申请部门的值置空
	}
}

function ChangplaceStyle(obj){
	if(obj=='1'){
		$("#zDyPlace").show();
		$("#PlDiv").hide();
		$("#PName").hide();
		$("#placeName1").addClass("am-form-field");//添加必填校验
		$("#placeName1").attr("required","");//添加必填校验
		$("#placeDivision1").attr("required","");//必填校验
		
		$("#placeDivision2").removeAttr("required","");//删除必填校验
		$("#lieu").removeAttr("required","");//删除必填校验
		$("#placeName2").removeAttr("required","");//删除必填校验
		$("#placeDivision2").val("");
		$("#lieu").val("");
		$("#placeName2").val("");
	}else if(obj=='2'){
		$("#zDyPlace").hide();
		$("#PlDiv").show();
		$("#PName").show();
		$("#placeName1").removeClass();
		$("#placeName1").removeAttr("required");
		$("#placeName1").val("");
		$("#placeDivision1").removeAttr("required","");//必填校验
		$("#placeDivision1").val("");
		
		$("#placeDivision2").attr("required","");//必填校验
		$("#lieu").attr("required","");//必填校验
		$("#placeName2").attr("required","");//必填校验
	}else{
		$("#zDyPlace").hide();
		$("#PlDiv").hide();
		$("#PName").hide();
		$("#placeName1").removeClass("am-form-field");
		$("#placeName1").removeAttr("required");
		$("#placeName1").val("");
		
		$("#placeDivision1").val("");
		$("#placeDivision2").val("");
		$("#lieu").val("");
		$("#placeName2").val("");
	}
}

function submitFrom(){
	debugger;
	var pathName = window.document.location.pathname;
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	var placeDivision1 = $("#placeDivision1").val();
	var placeName1 = $("input[name='placeName1']").val();
	var applyTimeStart = $("#applyTimeStart").val();
	var applyTimeEnd = $("#applyTimeEnd").val();
	var placeNametext=   $("#placeName2").find("option:selected").text();
	$("#placeApplyInfo").ajaxForm({
		data:{placeDivision1:placeDivision1,
			placeName1:placeName1,
			placeNametext : placeNametext},
		success:function(data){
			 if (data.status == '01') {
             	parent.layer.alert(data.massage);
                /*  window.setTimeout(function(){
						window.location.href = projectName+"/placeApply/placeApplyStatus";
             	},2000); */
             }else if(data.status == '02'){
             	parent.layer.alert(data.massage);
             	
             }else{
             	parent.layer.alert(data.massage);
             }
		}
	})
}


	</script>
</body>
</html>