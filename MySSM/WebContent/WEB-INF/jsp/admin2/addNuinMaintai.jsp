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
       <div class="xinxitj">新增维护单位信息</div>
       <form class="am-form">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">维护单位名称</div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
            	<input type="text" class="am-input-sm" name="muName" style="width: 200px;height: 36px;">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right"></div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
               <input type="hidden" class="am-input-sm" style="width: 200px;height: 36px;">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">维护单位地址 </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
               <input type="text" class="am-input-sm" name="muAddress" style="width: 200px;height: 36px;">
            </div>
            <div class="am-u-sm-4 am-u-md-1 am-text-right"></div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
            	<input type="hidden" class="am-input-sm" style="width: 200px;height: 36px;">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">维护单位电话</div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" name="muTell" style="width: 200px;height: 36px;"  placeholder="有效的电话号码" pattern="^\d{11}$" required>
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right"></div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
              <input type="hidden" class="am-input-sm" style="width: 200px;height: 36px;">
            </div>
          </div>
          
        </form>
    <!-- 置低div -->
    </div>
    <div style="width:100%; position:fixed; left:0; bottom:0; text-align: center;background-color: #C1CDCD">
     <div class="am-margin" style="text-align: center;">
		    <button  onclick="addNuinMaintai()" type="button" class="am-btn am-btn-success am-radius "><font size="1px">保存</font></button>
		  	<button  type="reset" class="am-btn am-btn-primary am-radius "><font size="1px">取消</font></button>
	 </div>
    </div>
<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>
<script type="text/javascript">

var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

function addNuinMaintai(){
	debugger;
	var muName = $.trim($("input[name='muName']").val());
	var muAddress = $.trim($("input[name='muAddress']").val());
	var muTell = $.trim($("input[name='muTell']").val());
	$.ajax({
		type : 'post',
		url : projectName + '/add/insertNuinMaintai',
		dataType : 'json',
		data:{muName:muName,muAddress:muAddress,
			muTell:muTell},
			beforeSend: function() {
				if(muName==''||muName==null){
					parent.layer.alert("请输入维修单位名称");
					return false;
				}else if(muAddress==''||muAddress==null){
					parent.layer.alert("请输入维修单位地址");
					return false;
				}else if(muTell==''||muTell==null){
					parent.layer.alert("请输入维修单位电话");
					return false;
				}else{
					return true;
				}
			},
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