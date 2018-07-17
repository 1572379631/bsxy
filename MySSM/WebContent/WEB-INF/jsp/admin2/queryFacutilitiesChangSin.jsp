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
       <div class="xinxitj">场地设备维护变更明细</div>
       
       <form class="am-form">
       	<c:forEach items="${listPlaceInfo}" var="list">
       		<input type="hidden" name="placeId" value="${list.placeId }"/>
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
             校区
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="with:200px;height:36px"> 
              <input style="with:200px;height:36px" type="text" class="am-input-sm" value="${list.placeDivision }" readonly="readonly">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
	                      方位           
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
               <input type="text" class="am-input-sm" value="${list.placeLieu }" readonly="readonly">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              名称
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" value="${list.placeName }" readonly="readonly">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              	场地设备总金额
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
              <input type="text" class="am-input-sm" value="${list.summoney }" name="SumMoney">
            </div>
          </div>
          
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
             场地设备
            </div>
            <div class="am-u-sm-12 am-u-md-8" style="float: left;">
              <textarea rows="2"  name="placeInstallation" readonly="readonly">${list.placeInstallation }</textarea>
            </div>
          </div>
          
          <div ><!--场地变动记录div  -->
          	<div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text" >
             	新增场地设备
            </div>
            <div class="am-u-sm-12 am-u-md-8" style="float: left;">
              <textarea rows="2" name="placeinstallationadd">${list.placeinstallationadd }</textarea>
            </div>
          </div>
          <div class="am-g am-margin-top-sm">
          	<div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
             	撤出设备信息
            </div>
            <div class="am-u-sm-12 am-u-md-8" style="float: left;">
              <textarea rows="2" name="placeinstallationrep" >${list.placeinstallationadd }</textarea>
            </div>
           </div>
          
          <div class="am-g am-margin-top">	
          	<div class="am-u-sm-4 am-u-md-1 am-text-right">新增场地设备总金额</div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
	             <input type="text" class="am-input-sm" name="summoneyadd" value="${list.summoneyadd }">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">撤出设备总金额</div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
	             <input type="text" class="am-input-sm" name="summoneyrep" value="${list.summoneyrep }">
            </div>
          </div> 
	        <div class="am-g am-margin-top-sm">
	            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
	             	维护说明
	            </div>
	            <div class="am-u-sm-12 am-u-md-8" style="float: left;">
	              <textarea rows="2" name="mtmaintenance" >${list.mtmaintenance }</textarea>
	            </div>
	          </div>
          		
          </div>
          
          <div><!-- 维护时间div -->
          		<div class="am-g am-margin-top">
				<div class="am-u-sm-4 am-u-md-1 am-text-right">维护开始时间</div>
				<div class="am-u-sm-8 am-u-md-3">
					<input style="width:200px" id="mttimestart" name="mttimestart" value="${list.mttimestart }">
				</div>
				<div class="am-u-sm-4 am-u-md-2 am-text-right">维护结束时间</div>
				<div class="am-u-sm-8 am-u-md-3" style="float:left">
					<input style="width:200px" id="mttimeend" name="mttimeend" value="${list.mttimeend }">
				</div>
				</div>
				
				<div class="am-g am-margin-top">
		            <div class="am-u-sm-4 am-u-md-1 am-text-right">维护单位</div>
		            <div class="am-u-sm-8 am-u-md-3">
		              <input type="text" class="am-input-sm" name="mtdept" value="${list.mtdept }">
		            </div>
		            <div class="am-u-sm-4 am-u-md-2 am-text-right">维护负责人电话</div>
		            <div class="am-u-sm-8 am-u-md-3" style="float:left">
			             <input type="text" class="am-input-sm" name="mtpersontell" value="${list.mtpersontell }">
		            </div>
	          </div>
	          <div class="am-g am-margin-top">
		            <div class="am-u-sm-4 am-u-md-1 am-text-right">登记人</div>
		            <div class="am-u-sm-8 am-u-md-3">
		              <input type="text" class="am-input-sm" value="${list.postulantName }">
		            </div>
		            <div class="am-u-sm-4 am-u-md-2 am-text-right">登记时间</div>
		            <div class="am-u-sm-8 am-u-md-3" style="float:left">
			             <input type="text" class="am-input-sm" value="${list.recordtime }">
		            </div>
	          </div>
	          <div class="am-g am-margin-top">
		            <div class="am-u-sm-4 am-u-md-1 am-text-right">维护总金额</div>
		            <div class="am-u-sm-8 am-u-md-3">
		              <input type="text" class="am-input-sm" name="mtsummoney" value="${list.mtsummoney }">
		            </div>
		            <div class="am-u-sm-4 am-u-md-2 am-text-right"></div>
		            <div class="am-u-sm-8 am-u-md-3" style="float:left">
			             <input type="hidden" class="am-input-sm">
		            </div>
	          </div>
          </div>
		 </c:forEach>
        </form>
    </div>
<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
$(function(){
	$("* input").attr("readonly","readonly");
	$("* textarea").attr("readonly","readonly");
})
</script>
</body>
</html>