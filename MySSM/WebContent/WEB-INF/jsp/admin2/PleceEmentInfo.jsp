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
       <div class="xinxitj">场地设备信息</div>
       
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
	                          使用状态
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
	             <input type="text" class="am-input-sm" value="${list.placeStatus }" readonly="readonly">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              	场地设备总金额
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm"  name="SumMoney" id="SumMoney" value="${list.summoney }" readonly="readonly">
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right"></div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
	             <input type="hidden" class="am-input-sm" >
            </div>
          </div>
          
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
             场地设备
            </div>
            <div class="am-u-sm-12 am-u-md-8" style="float: left;">
              <textarea rows="2"  name="placeInstallation" >${list.placeInstallation}</textarea>
            </div>
          </div>
          
          <div style="display: none" id="em"><!--场地变动记录div  -->
          	<div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
             	新增场地设备
            </div>
            <div class="am-u-sm-12 am-u-md-8" style="float: left;">
              <textarea rows="2" name="placeinstallationadd"></textarea>
            </div>
          </div>
          <div class="am-g am-margin-top-sm">
          	<div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
             	撤出设备信息
            </div>
            <div class="am-u-sm-12 am-u-md-8" style="float: left;">
              <textarea rows="2" name="placeinstallationrep"></textarea>
            </div>
           </div>
          
          <div class="am-g am-margin-top">	
          	<div class="am-u-sm-4 am-u-md-1 am-text-right">新增场地设备总金额</div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
	             <input type="text" class="am-input-sm" name="summoneyadd" >
            </div>
            <div class="am-u-sm-4 am-u-md-2 am-text-right">撤出设备总金额</div>
            <div class="am-u-sm-8 am-u-md-3" style="float:left">
	             <input type="text" class="am-input-sm" name="summoneyrep" >
            </div>
          </div> 
	        <div class="am-g am-margin-top-sm">
	            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
	             	维护说明
	            </div>
	            <div class="am-u-sm-12 am-u-md-8" style="float: left;">
	              <textarea rows="2" name="mtmaintenance"></textarea>
	            </div>
	          </div>
          		
          </div>
          
          <div style="display: none" id="sstime"><!-- 维护时间div -->
          		<div class="am-g am-margin-top">
				<div class="am-u-sm-4 am-u-md-1 am-text-right">维护开始时间</div>
				<div class="am-u-sm-8 am-u-md-3">
					<input style="width:200px" type="datetime-local" id="mttimestart" name="mttimestart" placeholder="时间">
				</div>
				<div class="am-u-sm-4 am-u-md-2 am-text-right">维护结束时间</div>
				<div class="am-u-sm-8 am-u-md-3" style="float:left">
					<input style="width:200px" type="datetime-local" id="mttimeend" name="mttimeend" placeholder="时间">
				</div>
				</div>
				
				<div class="am-g am-margin-top">
		            <div class="am-u-sm-4 am-u-md-1 am-text-right">维护单位</div>
		            <div class="am-u-sm-8 am-u-md-3">
		              <input type="text" class="am-input-sm" name="mtdept">
		            </div>
		            <div class="am-u-sm-4 am-u-md-2 am-text-right">维护负责人电话</div>
		            <div class="am-u-sm-8 am-u-md-3" style="float:left">
			             <input type="text" class="am-input-sm" name="mtpersontell">
		            </div>
	          </div>
	          <div class="am-g am-margin-top">
		            <div class="am-u-sm-4 am-u-md-1 am-text-right">维护总金额</div>
		            <div class="am-u-sm-8 am-u-md-3">
		              <input type="text" class="am-input-sm" name="mtsummoney">
		            </div>
		            <div class="am-u-sm-4 am-u-md-2 am-text-right"></div>
		            <div class="am-u-sm-8 am-u-md-3" style="float:left">
			             <input type="hidden" class="am-input-sm">
		            </div>
	          </div>
          </div>
          
          <a id="u" href="javasricpt:;" onclick="updateem('u')">场地设备变动？</a>
          <a id ="r" style="display: none" href="javasricpt:;" onclick="updateem('r')">取消变动？</a>
		  <a id="in" style="display: none" href="javasricpt:;" onclick="enStatus('in')">进入维护状态？</a>
          <a id="out" href="javasricpt:;" onclick="enStatus('out')" style="display: none">退出维护状态？</a>
		 </c:forEach>
        </form>
    <!-- 置低div -->
    </div>
    <div style="width:100%; position:fixed; left:0; bottom:0; text-align: center;background-color: #C1CDCD">
     <div class="am-margin" style="text-align: center;<c:if test="${list.applyStatus == 1 or list.applyStatus == 2 }">display: none</c:if>">
		    <button  onclick="savePlaceEmentInfo('0')" type="button" class="am-btn am-btn-success am-radius "><font size="1px">保存</font></button>
		  	<button  onclick="savePlaceEmentInfo('1')" type="button" class="am-btn am-btn-primary am-radius "><font size="1px">保存并进入维护状态</font></button>
		  	<button  type="reset" class="am-btn am-btn-primary am-radius "><font size="1px">取消</font></button>
		  </div>
    </div>
<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>
<script type="text/javascript">

var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
//进入设施变更
function updateem(str){
	debugger;
	if(str=='u'){
		$("#u").hide();//隐场地设施变动
		$("#em").show();//场地变动记录div
		$("#r").show();//小时取消变动
		$("#in").show();//显示进入维护状态a标签
		$("#out").hide();
	}else{//退出
		$("textarea[name='placeinstallationadd']").val("");
		$("textarea[name='placeinstallationrep']").val("");
		$("textarea[name='mtmaintenance']").val("");
		$("input[name='summoneyadd']").val("");
		$("input[name='summoneyrep']").val("");
		$("input[name='mttimestart']").val("");
		$("input[name='mttimeend']").val("");
		$("input[name='mtdept']").val("");
		$("input[name='mtpersontell']").val("");
		$("input[name='mtsummoney']").val("");
		
		$("#em").hide();
		$("#r").hide();
		$("#out").hide();
		$("#in").hide();
		$("#sstime").hide();//隐藏进入维护div
		$("#u").show();
	}
}
//进入维护状态
function enStatus(str){
	if(str=='in'){
		$("#in").hide();
		$("#out").show();
		$("#sstime").show();
	}else{
		$("input[name='mttimestart']").val("");
		$("input[name='mttimeend']").val("");
		$("input[name='mtdept']").val("");
		$("input[name='mtpersontell']").val("");
		$("input[name='mtsummoney']").val("");
		$("#out").hide();
		$("#in").show();
		$("#sstime").hide();
	}
}

function savePlaceEmentInfo(obj){
	debugger;
	var placeId = $("input[name='placeId']").val();
	var placeinstallation = $("textarea[name='placeInstallation']").val();
	var placeinstallationadd = $("textarea[name='placeinstallationadd']").val();
	var placeinstallationrep = $("textarea[name='placeinstallationrep']").val();
	var summoneyadd = $("input[name='summoneyadd']").val();
	
	var summoney = $("input[name='SumMoney']").val();
	var summoneyrep = $("input[name='summoneyrep']").val();
	var mtmaintenance = $("textarea[name='mtmaintenance']").val();
	var mttimestart = $("input[name='mttimestart']").val();
	var mttimeend = $("input[name='mttimeend']").val();
	var mtdept = $("input[name='mtdept']").val();
	var mtpersontell = $("input[name='mtpersontell']").val();
	var mtsummoney = $("input[name='mtsummoney']").val();
	$.ajax({
		type : 'post',
		url : projectName + '/update/upPlaceEmentnInfo',
		dataType : 'json',
		data:{obj:obj,placeId:placeId,placeinstallation:placeinstallation,
			placeinstallationadd:placeinstallationadd,summoney:summoney,
			placeinstallationrep:placeinstallationrep,summoneyadd:summoneyadd,
			summoneyrep:summoneyrep,mtmaintenance:mtmaintenance,
			mttimestart:mttimestart,mttimeend:mttimeend,mtdept:mtdept,
			mtpersontell:mtpersontell,mtsummoney:mtsummoney},
		success : function(data) {
			if(data.status=='0'){
				parent.layer.alert(data.massage);
			}else if(data.status=='1'){
				parent.layer.alert(data.massage);
			}else if(data.status=='2'){
				parent.layer.alert(data.massage);
				window.location.href = projectName+"/login.jsp";
			}
		}
	}); 
}

</script>
</body>
</html>