<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/amazeUI/assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/amazeUI/assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/amazeUI/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/amazeUI/assets/css/admin.css">
  <link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" >
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6">
  <style type="text/css">
ul li{  
	list-style-type:none;  
	
}
#headul li button:hover{
	background-color: red;
	color: #F8F8FF
}
#headul li{
	position: relative;
	float: left;
	left:-30px;
	margin-right: 5px;
}
#headul li button{
	background-color:#FFFAF0;
	border-radius:5px;
}

  </style>	
</head>                                         
<!-- <script type="text/javascript" src="/MySSM/js/jquery.min.js"></script> -->
<body>
<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>百色学院场地使用管理系统</strong> <small>场地申请端</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
    	<li class="am-dropdown tognzhi" data-am-dropdown>
  <button onclick="OutLogin()" style="position: relative;margin-top: 11px" class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius" data-am-dropdown-toggle>退出登录<span class="am-badge am-badge-danger am-round"></span></button>
</li>
      <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li class="admin-parent">
          <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span> 场地申请管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
            <li><a href="javascript:;" onclick="CreatIframe('l1','场地使用状态')" class="am-cf"><span class="am-icon-puzzle-piece"></span> 场地使用情况<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="javascript:;" onclick="CreatIframe('l2','发起场地申请')" class="am-cf"><span class="am-icon-puzzle-piece"></span> 发起场地申请<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="javascript:;" onclick="CreatIframe('l3','场地申请进度')" class="am-cf"><span class="am-icon-puzzle-piece"></span> 场地申请进度<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          </ul>
        </li>
        <!--  -->
        <li class="admin-parent">
          <a class="am-cf am-collapsed" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-file"></span> 个人或单位信息 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
          <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav2">
            <li><a href="javascript:;" onclick="CreatIframe('l4','查看个人资料')" class="am-cf"><span class="am-icon-check"></span> 查看个人资料<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="javascript:;" onclick="CreatIframe('l5','修改个人资料')"  class="am-cf"><span class="am-icon-pencil-square-o"></span> 修改个人资料<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a href="javascript:;" onclick="CreatIframe('l6','申请记录')"  class="am-cf"><span class="am-icon-calendar"></span> 申请记录<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
          </ul>
        </li>
      </ul>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-bookmark"></span> 公告</p>
          <p style="color: red">${bulletinCon }</p>
        </div>
      </div>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-tag"></span> 百色学院场地使用管理系统</p>
          <p>欢迎使用百色学院场地使用管理系统，我们致力于提高您的申请效率</p>
        </div>
      </div>
    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content">
  		<div id="head" style="background-color: #FFDEAD;width: 100%;height: 40px;position:fixed; width:100%; padding-bottom:0px;">
  			<ul id="headul">
				<li id="l1"><button type="button" onclick="showIframe('l1')" class="am-btn am-btn-default am-radius am-btn-xs" style="font-size: 14px">场地使用状况<a  class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>
			</ul>
  		</div>
  		
  		
  		<!-- 子页面div开始 -->
   		<div id="iframediv" style="width: 100%;height: 900px;">
   			<iframe  name="l1" src="${pageContext.request.contextPath}/query/placeStatus" frameborder="0" align="left" width="100%" height="100%" scrolling="auto" style="margin-bottom:40px;margin-top: 30px"></iframe>
   		</div>
   		<!-- 子页面div结束 -->
   		
   		
   <!--版权div开始  -->
		<div style="position:fixed; width:100%; bottom:0;background-color: #F5F5F5">
		    <footer class="admin-content-footer">
		      <hr>
		      <p class="am-padding-left" style="text-align: left;margin-left: 700px">@百色学院</p>
		    </footer>
		</div>
	<!--版权div结束 -->
  </div>

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/amazeUI/assets/js/jquery.min.js"></script> --%>
<!--<![endif]-->              
<script src="${pageContext.request.contextPath}/amazeUI/assets/js/amazeui.min.js"></script>
<script src="${pageContext.request.contextPath}/amazeUI/assets/js/app.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script> 
	<script src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/hplus.js?v=4.1.0"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contabs.js"></script>
	<script src="${pageContext.request.contextPath}/js/plugins/pace/pace.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/contabs.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/content.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/md5.js"></script> 
<script type="text/javascript">
var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

function CreatIframe(str,name){
	debugger;
	//是否存在，如果存在，侧显示，不存在创建，
	var len = $("#headul").find("li").length;
	for (var i = 0; i < len; i++) {
		var t = $("#headul").find("li").eq(i).attr("id");
		if(t==str){
			//调用显示隐藏函数
			showIframe(str);
			return ;
		}
	}
	$("#headul").append('<li id="'+str+'"><button type="button" onclick="showIframe('+"'"+str+"'"+')" class="am-btn am-btn-default am-radius am-btn-xs">'+name+'<a onclick="closedailog('+"'"+str+"'"+');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>');
	if(str=='l2'){
		$("#iframediv").append('<iframe name="'+str+'" src="'+projectName+'/placeApply/addApplyInfo" frameborder="0" align="left" width="100%" height="100%" scrolling="auto" style="margin-bottom:40px;margin-top: 30px"></iframe>');
	}else if(str=='l3'){
		$("#iframediv").append('<iframe name="'+str+'" src="'+projectName+'/placeApply/placeApplyStatus" frameborder="0" align="left" width="100%" height="100%" scrolling="auto" style="margin-bottom:40px;margin-top: 30px"></iframe>');
	}else if(str=='l4'){
		$("#iframediv").append('<iframe name="'+str+'" src="'+projectName+'/query/queryPostulantuser" frameborder="0" align="left" width="100%" height="100%" scrolling="auto" style="margin-bottom:40px;margin-top: 30px"></iframe>');
	}else if(str=='l5'){
		$("#iframediv").append('<iframe name="'+str+'" src="'+projectName+'/update/updatePostulantuser" frameborder="0" align="left" width="100%" height="100%" scrolling="auto" style="margin-bottom:40px;margin-top: 30px"></iframe>');
	}else if(str=='l6'){
		$("#iframediv").append('<iframe name="'+str+'" src="'+projectName+'/query/queryApplyRecord" frameborder="0" align="left" width="100%" height="100%" scrolling="auto" style="margin-bottom:40px;margin-top: 30px"></iframe>');
	}
	showIframe(str);
}
//显示隐藏iframe
function showIframe(str){
	debugger;
	var len = $("#iframediv").find("iframe").length;
	for (var i = 0; i < len; i++) {
	    var t = $("#iframediv").find("iframe").eq((i-1)).attr("name");
		if(t==str&&i<=len-1){
			break;
		}else if(i==len-1&&t!=str){
			return;
		}
	}
	
	for (var i = 0; i < len; i++) {
	    var t = $("#iframediv").find("iframe").eq((i-1)).attr("name");
		if(t==str){
			$("iframe[name='"+str+"']").show();
		}else{
			$("iframe[name='"+t+"']").hide();
		}
	}
}

//删除iframe
function closedailog(str){
	debugger;
	$("#"+str).remove();
	$("iframe[name='"+str+"']").remove();
	//显示最后一个对话框
	var len = $("#iframediv").find("iframe").length;
	var t = $("#iframediv").find("iframe").eq((len-1)).attr("name");
	//$("iframe[name='"+t+"']").show();
	showIframe(t);
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

function addPlaceAppleInfo(){
	var str ='l2';
	var name="发起场地申请";
	var len = $("#headul").find("li").length;
	for (var i = 0; i < len; i++) {
		var t = $("#headul").find("li").eq(i).attr("id");
		if(t==str){
			//调用显示隐藏函数
			showIframe(str);
			return ;
		}
	}
	$("#headul").append('<li id="'+str+'"><button type="button" onclick="showIframe('+"'"+str+"'"+')" class="am-btn am-btn-default am-radius am-btn-xs">'+name+'<a onclick="closedailog('+"'"+str+"'"+');" class="am-close am-close-spin" data-am-modal-close="">×</a></button></li>');
	$("#iframediv").append('<iframe name="'+str+'" src="'+projectName+'/placeApply/addApplyInfo" frameborder="0" align="left" width="100%" height="100%" scrolling="auto" style="margin-bottom:40px;margin-top: 30px"></iframe>');
	showIframe(str);
}
</script>
</body>
</html>