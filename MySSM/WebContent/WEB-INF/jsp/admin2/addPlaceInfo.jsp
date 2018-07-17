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
    <div class="admin-biaoge"  style=" padding-bottom: 80px;">
       <div class="xinxitj">新增场地</div>
       
       <form class="am-form">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">校区</div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
              <select name="placeDivision" style="width: 200px;height: 36px;font-size: 14px">
					<option value="0">--请选择--</option>
					<c:forEach items="${pDivision }" var="pd">
					<option value="${pd.placeDivision }">${pd.placeDivision }</option>
					</c:forEach>
			   </select>
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">方位 </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
               <input type="text" class="am-input-sm" name="placeLieu" style="width: 200px;height: 36px;">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">名称</div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" name="placeName" style="width: 200px;height: 36px;">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">场地设备总金额</div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
              <input type="text" class="am-input-sm" name="SumMoney" style="width: 200px;height: 36px;">
            </div>
          </div>
          
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
            	 场地设备
            </div>
            <div class="am-u-sm-12 am-u-md-8" style="float: left;">
              <textarea rows="2" name="placeInstallation"></textarea>
            </div>
          </div>

        </form>
    <!-- 置低div -->
    </div>
    <div style="width:100%; position:fixed; left:0; bottom:0; text-align: center;background-color: #C1CDCD">
     <div class="am-margin" style="text-align: center;">
		    <button  onclick="insertPlaceInfo()" type="button" class="am-btn am-btn-success am-radius "><font size="1px">保存</font></button>
		  	<button  type="reset" class="am-btn am-btn-primary am-radius "><font size="1px">取消</font></button>
	 </div>
    </div>
<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>
<script type="text/javascript">

var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

function insertPlaceInfo(){
	debugger;
	var placeDivision = $("select[name='placeDivision']").val();
	var placeLieu = $("input[name='placeLieu']").val();
	var placeName = $("input[name='placeName']").val();
	var SumMoney = $("input[name='SumMoney']").val();
	var placeInstallation = $("textarea[name='placeInstallation']").val();
	$.ajax({
		type : 'post',
		url : projectName + '/add/insertPlaceInfo',
		dataType : 'json',
		data:{placeDivision:placeDivision,placeLieu:placeLieu,
			placeName:placeName,SumMoney:SumMoney,
			placeInstallation:placeInstallation},
		success : function(data) {
			if(data.status=='01'){
				parent.layer.alert(data.massage);
			}else if(data.status=='02'){
				parent.layer.alert(data.massage);
			}else if(data.status=='03'){
				parent.layer.alert(data.massage);
				window.location.href = projectName+"/login.jsp";
			}
		}
	}); 
}

</script>
</body>
</html>