<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%-- <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png"> --%>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/amazeUI/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/admin2/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin2/assets/css/amazeui.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin2/assets/css/admin.css">
<script src="${pageContext.request.contextPath}/admin2/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin2/assets/js/app.js"></script>


<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script> 
	<script src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/hplus.js?v=4.1.0"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contabs.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contabs.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/content.min.js"></script>

</head>
<body>

<header class="am-topbar admin-header">
  <div class="am-topbar-brand"><img src="${pageContext.request.contextPath}/admin2/assets/i/p1.png"></div>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

   <li class="am-dropdown tognzhi" data-am-dropdown>
   <button class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o" data-am-dropdown-toggle> 待审批任务<span class="am-badge am-badge-danger am-round" id="approvalNot"></span></button>
	  <!-- <ul class="am-dropdown-content">
	    <li class="am-dropdown-header">所有消息都在这里</li>
	    <li><a href="#">未激活会员 <span class="am-badge am-badge-danger am-round">556</span></a></li>
	    <li><a href="#">未激活代理 <span class="am-badge am-badge-danger am-round">69</span></a></a></li>
	    <li><a href="#">未处理汇款</a></li>
	    <li><a href="#">未发放提现</a></li>
	    <li><a href="#">未发货订单</a></li>
	    <li><a href="#">低库存产品</a></li>
	    <li><a href="#">信息反馈</a></li>
	  </ul> -->
</li>
<li class="am-dropdown tognzhi" data-am-dropdown>
  <button onclick="OutLogin()" style="position: relative;margin-top: 11px" class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius" data-am-dropdown-toggle>退出登录<span class="am-badge am-badge-danger am-round"></span></button>
</li>
      <li class="am-hide-sm-only" style="float: right;"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main"> 

<div class="nav-navicon admin-main admin-sidebar">
    
    
    <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎场地管理员：${sessionScope.postulantName }</div>
    <div class="sideMenu">
      <h3 class="am-icon-flag"><em></em> <a href="#">审批管理</a></h3>
      <ul>
        <li onclick="Dialog('approval_n','待审批任务')"><a href="javascript:;">待审批任务</a></li>
        <li onclick="Dialog('approval_y','已审批任务')"><a href="javascript:;">已审批任务</a></li>
        <li onclick="Dialog('place_find','场地检索')"> <a href="javascript:;">场地检索</a></li>
      </ul>
     
      <h3 class="am-icon-flag"><em></em> <a href="#">场地设备管理</a></h3>
      <ul>
        <li onclick="Dialog('einfo','场地设备信息')"><a href="javascript:;">场地设备信息</a></li>
      	<!-- <li onclick="Dialog('approval_y','已审批任务')"><a href="javascript:;">场地维护</a></li> -->
      	<li onclick="Dialog('mrd','场地维护记录')"><a href="javascript:;">场地维护记录</a></li>
      	<li onclick="Dialog('eadd','新增场地信息')"><a href="javascript:;">新增场地信息</a></li>
      </ul>
      <h3 class="am-icon-flag"><em></em> <a href="#">维护单位管理</a></h3>
      <ul>
        <li onclick="Dialog('qf','查看维护单位信息')"><a href="javascript:;">查看维护单位信息</a></li>
        <li onclick="Dialog('inf','录入维护单位信息')"><a href="javascript:;">录入维护单位信息</a></li>
      </ul>
      
       <h3 class="am-icon-flag"><em></em> <a href="#">公告管理</a></h3>
      <ul>
        <li onclick="Dialog('gg','发布新公告')"><a  href="javascript:;">发布新公告</a></li>
        <li onclick="Dialog('ggh','历史公告')"><a href="javascript:;">历史公告</a></li>
      </ul>
      
       <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 审批人信息</a></h3>
      <ul>
        <li onclick="Dialog('queryinfo','个人信息')"><a href="javascript:;">个人信息</a></li>
        <li onclick="Dialog('updateinfo','信息修改')"><a href="javascript:;">信息修改</a></li>
      </ul>
      
    </div>
    <!-- sideMenu End --> 
    
    <!--公告弹窗开始  -->
    <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
	    <div class="am-modal-dialog">
	    <div class="am-modal-hd">Amaze UI</div>
	    <div class="am-modal-bd">
	      来来来，吐槽点啥吧
	      <input type="text" class="am-modal-prompt-input">
	    </div>
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
	    </div>
	   </div>
   </div>
    <!--公告弹窗结束  -->
    <script type="text/javascript">
			jQuery(".sideMenu").slide({
				titCell:"h3", //鼠标触发对象
				targetCell:"ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
				effect:"slideDown", //targetCell下拉效果
				delayTime:300 , //效果时间
				triggerTime:150, //鼠标延迟触发时间（默认150）
				defaultPlay:true,//默认是否执行效果（默认true）
				returnDefault:true //鼠标从.sideMen移走后返回默认状态（默认false）
				});
		</script>
    
</div>

<div class=" admin-content">
	
		<div class="daohang" >
			<ul id="daohang">
				<li id="approval_n"><button type="button" onclick="showHide('approval_n')" class="am-btn am-btn-default am-radius am-btn-xs">待审批任务<a onclick="closedailog('approval_n');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
			</ul>
</div>
	
	


<div class="admin" id="admin">
	<iframe  name="approval_n" src="${pageContext.request.contextPath}/query/approvadNot?flagb=0" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>
		
</div>
		


</div>


</div>

<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>

<!--<![endif]-->
<script type="text/javascript">
var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
function Dialog(str,name){
	debugger;
	showHide(str);
	var len = $("#daohang").find("li").length;
	for (var i = 0; i < len; i++) {
		var t = $("#daohang").find("li").eq(i).attr("id");
		if(t==str){
			return ;
		}
	}
	$("#daohang").append('<li id="'+str+'"><button type="button" onclick="showHide('+"'"+str+"'"+')" class="am-btn am-btn-default am-radius am-btn-xs">'+name+'<a onclick="closedailog('+"'"+str+"'"+');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>');
	if(name=='已审批任务'){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/query/approvadNot?flagb=1" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=='待审批任务'){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/query/approvadNot?flagb=0" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=='场地检索'){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/query/placeUseStatus" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=='个人信息'){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/query/queryApprovalPersonInfo" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=='信息修改'){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/update/updateApprovalPersonInfo" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=='场地设备信息'){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/query/queryPlace" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=='场地维护记录'){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/query/queryFaclitiesChange" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=='新增场地信息'){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/add/addPlaceinfo" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=='查看维护单位信息'){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/query/queryMuInfo" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=='录入维护单位信息'){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/query/addMuInfo" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=="发布新公告"){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/add/addBulletin" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}else if(name=="历史公告"){
		$("#admin").append('<iframe name="'+str+'" src="'+projectName+'/query/queryBulletin" frameborder="0" align="left" width="100%" height="100%" scrolling="auto"></iframe>');
	}
	
	showHide(str);
}

//删除对话页面
function closedailog(str){
	debugger;
	$("#"+str).remove();
	$("iframe[name='"+str+"']").remove();
	//显示最后一个对话框
	var len = $("#admin").find("iframe").length;
	var t = $("#admin").find("iframe").eq((len-1)).attr("name");
	$("iframe[name='"+t+"']").show();
}


function showHide(str){
	debugger;
	//遍历循环，如果子页面中不含有传过来的iframe的name值就不继续执行（主要用于解决删除iframe时候显示最后的iframe）
	var len = $("#admin").find("iframe").length;
	for (var i = 0; i < len; i++) {
	    var t = $("#admin").find("iframe").eq((i-1)).attr("name");
		if(t==str&&i<=len-1){
			break;
		}else if(i==len-1&&t!=str){
			return;
		}
	}
	ShowAndHideUtil(str);//调用循环遍历显示和隐藏函数

}
//循环遍历显示和隐藏函数
function ShowAndHideUtil(str){
	var len = $("#admin").find("iframe").length;
	for (var i = 0; i < len; i++) {
	    var t = $("#admin").find("iframe").eq((i-1)).attr("name");
		if(t==str){
			$("iframe[name='"+str+"']").show();
		}else{
			$("iframe[name='"+t+"']").hide();
		}
	}
}

 
 
//定时器，统计未审批的申请单
$(function(){
	function approvalCountNot(){
		$.ajax({
			type : 'post',
			url : projectName + '/query/queryApprovalNotCount',
			dataType : 'json',
			success : function(data) {
				$("#approvalNot").text(data.massage);
			}
		});
	}
   setInterval(approvalCountNot,2000);
	});
	
//审批查看申请单据
function queryApprovalBill(id){
	debugger;
	var len = $("#daohang").find("li").length;
	for (var i = 0; i < len; i++) {
		var t = $("#daohang").find("li").eq(i).attr("id");
		if(t=='1'){
			parent.layer.alert("不能同时打开多个申请单详细信息");
			return ;
		}
	}
	var str = 1;
	$("#daohang").append('<li id="'+str+'"><button type="button" onclick="showHide('+str+')" class="am-btn am-btn-default am-radius am-btn-xs">申请单详细信息<a onclick="closedailog('+str+');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>');
	ShowAndHideUtil('1');
	$("#admin").append('<iframe name="1" src="'+projectName+'/query/checkApprovalBill?placeApplyId='+id+'" frameborder="5" align="left" width="100%" height="800px" scrolling="auto" " ></iframe>');
}

//查看申请人
function queryApplyPerson(id){
	debugger;
	var len = $("#daohang").find("li").length;
	for (var i = 0; i < len; i++) {
		var t = $("#daohang").find("li").eq(i).attr("id");
		if(t=='personinfo'){
			parent.layer.alert("不能同时打开多个申请详细信息");
			return ;
		}
	}
	var str = 'personinfo';
	$("#daohang").append('<li id="'+str+'"><button type="button" onclick="showHide('+"'"+str+"'"+')" class="am-btn am-btn-default am-radius am-btn-xs">申请人详细信息<a onclick="closedailog('+"'"+str+"'"+');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>');
	ShowAndHideUtil('personinfo');
	$("#admin").append('<iframe name="personinfo" src="'+projectName+'/query/queryApplyPerson?postulantId='+id+'" frameborder="5" align="left" width="100%" height="100%" scrolling="auto" style="padding-bottom:50px" ></iframe>');
}

//场地审批按钮
function ResultApproval(id,status,advise,placeId){
	$.ajax({
		type : 'post',
		url : projectName + '/approval/apporvalApplyBill',
		dataType : 'json',
		data:{id:id,status:status,advise:advise,placeId:placeId},
		success : function(data) {
			if(data.status=='0'){
				parent.layer.alert(data.massage);
			}else if(data.status=='1'){
				parent.layer.alert(data.massage);
			}else if(data.status=='2'){
				parent.layer.alert(data.massage);
			}else if(data.status=='3'){
				parent.layer.alert(data.massage);
				window.location.href = projectName+"/login.jsp";
			}
		}
	});
}

/*从申请单跳转到场地使用状态页面方法  */
function checkPlaceStutas(placeName,fla){//fla用于判断精确查询还是到场地审批表中查询
	debugger;
	var len = $("#daohang").find("li").length;
	for (var i = 0; i < len; i++) {
		var t = $("#daohang").find("li").eq(i).attr("id");
		if(t=='place_find'){
			parent.layer.alert("不能同时打开多场地检索页面,请先关闭打开的检索页面");
			return ;
		}
	}
	var str = 'place_find';
	$("#daohang").append('<li id="'+str+'"><button type="button" onclick="showHide('+"'"+str+"'"+')" class="am-btn am-btn-default am-radius am-btn-xs">场地检索<a onclick="closedailog('+"'"+str+"'"+');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>');
	ShowAndHideUtil('place_find');
	$("#admin").append('<iframe name="place_find" src="'+projectName+'/query/placeUseStatus?placeName='+placeName+'&fla='+fla+'" frameborder="5" align="left" width="100%" height="100%" scrolling="auto" style="padding-bottom:50px" ></iframe>');
}

/*从审批人信息查看到审批人信息修改  */
function updateApprovalInfo(){
	var len = $("#daohang").find("li").length;
	for (var i = 0; i < len; i++) {
		var t = $("#daohang").find("li").eq(i).attr("id");
		if(t=='updateinfo'){
			parent.layer.alert("不能同时打开信息修改页面,请先关闭打开的信息修改页面");
			return ;
		}
	}
	var str = 'updateinfo';
	$("#daohang").append('<li id="'+str+'"><button type="button" onclick="showHide('+"'"+str+"'"+')" class="am-btn am-btn-default am-radius am-btn-xs">信息修改<a onclick="closedailog('+"'"+str+"'"+');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>');
	ShowAndHideUtil('updateinfo');
	$("#admin").append('<iframe name="updateinfo" src="'+projectName+'/update/updateApprovalPersonInfo'+'" frameborder="5" align="left" width="100%" height="100%" scrolling="auto" style="padding-bottom:50px" ></iframe>');
}

/*从场地设备页面跳转到场地设备信息维护  */
function queryPlaceEment(placeId){
	var len = $("#daohang").find("li").length;
	for (var i = 0; i < len; i++) {
		var t = $("#daohang").find("li").eq(i).attr("id");
		if(t=='einfoU'){
			parent.layer.alert("不能同时打开多个场地设备变更页面,请先关闭打开的场地设备变更页面");
			return ;
		}
	}
	var str = 'einfoU';
	$("#daohang").append('<li id="'+str+'"><button type="button" onclick="showHide('+"'"+str+"'"+')" class="am-btn am-btn-default am-radius am-btn-xs">场地设备变更<a onclick="closedailog('+"'"+str+"'"+');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>');
	ShowAndHideUtil('einfoU');
	$("#admin").append('<iframe name="einfoU" src="'+projectName+'/query/queryPlaceEmentInfo?placeId='+placeId+'" frameborder="5" align="left" width="100%" height="100%" scrolling="auto" style="padding-bottom:50px" ></iframe>');
}


/*冲场地变更lis页面跳转到场地变更具体页面  */
function queryFacutilitiesChangeSin(mtId){
	var len = $("#daohang").find("li").length;
	for (var i = 0; i < len; i++) {
		var t = $("#daohang").find("li").eq(i).attr("id");
		if(t=='fc'){
			parent.layer.alert("不能同时打开多个场地设备变更明细页面,请先关闭打开的场地设备变更明细页面");
			return ;
		}
	}
	var str = 'fc';
	$("#daohang").append('<li id="'+str+'"><button type="button" onclick="showHide('+"'"+str+"'"+')" class="am-btn am-btn-default am-radius am-btn-xs">场地设备变更明细<a onclick="closedailog('+"'"+str+"'"+');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>');
	ShowAndHideUtil('fc');
	$("#admin").append('<iframe name="fc" src="'+projectName+'/query/queryFacutilitiesChangSin?mtId='+mtId+'" frameborder="5" align="left" width="100%" height="100%" scrolling="auto" style="padding-bottom:50px" ></iframe>');
 }
 
/*从场地检索页面跳转到查看产地具体信息页面  */
 function queryPlaceInfo(placeId){
	 var len = $("#daohang").find("li").length;
		for (var i = 0; i < len; i++) {
			var t = $("#daohang").find("li").eq(i).attr("id");
			if(t=='qp'){
				parent.layer.alert("不能同时打开多个场地详细信息页面,请先关闭打开的场地详细信息页面");
				return ;
			}
		}
		var str = 'qp';
		$("#daohang").append('<li id="'+str+'"><button type="button" onclick="showHide('+"'"+str+"'"+')" class="am-btn am-btn-default am-radius am-btn-xs">场地详细信息<a onclick="closedailog('+"'"+str+"'"+');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>');
		ShowAndHideUtil('qp');
		$("#admin").append('<iframe name="qp" src="'+projectName+'/query/queryPlaceinfoByid?placeId='+placeId+'" frameborder="5" align="left" width="100%" height="100%" scrolling="auto" style="padding-bottom:50px" ></iframe>');	 
		
 }
 
 //退出登录
 function OutLogin(){
	 $.ajax({
			type : 'post',
			url : projectName + '/out/OutLogin',
			dataType : 'json',
			success : function(data) {
				if(data.status=='1'){
					window.location.href = projectName+"/login.jsp";
				}else if(data.status=='1'){
					parent.layer.alert("退出失败！");
				}
			}
		});
 }
</script>


</body>
</html>