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
       <div class="xinxitj">申请人基本信息</div>
       
       <form class="am-form">
       	<c:forEach items="${listPlaceInfo}" var="list">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              申请人姓名
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" value="${list.postulantName }">
            </div>
            <div class="am-u-sm-4 am-u-md-3 am-text-right">
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
                <input type="hidden" class="am-input-sm" value="">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              所属院系
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" value="${list.faculteName }">
            </div>
            <div class="am-u-sm-4 am-u-md-3 am-text-right">
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
                <input type="hidden" class="am-input-sm" value="">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
	            <c:if test="${list.deptName !=null and list.deptName !='' }">
	                           所属部门
	           </c:if>
	           <c:if test="${list.className !=null and list.className !='' }">
	                         所在班级
	           </c:if>
            </div>
            <div class="am-u-sm-8 am-u-md-3">
	            <c:if test="${list.deptName !=null and list.deptName !='' }">
	              <input type="text" class="am-input-sm" value="${list.deptName }">
		        </c:if>
	           <c:if test="${list.className !=null and list.className !=''  }">
	              <input type="text" class="am-input-sm" value="${list.className }">
	           </c:if>
            </div>
		            <div class="am-u-sm-4 am-u-md-3 am-text-right">
		            </div>
		            <div class="am-u-sm-8 am-u-md-3" style="float: left">
		              <input type="hidden" class="am-input-sm" value="">
		            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
	            <c:if test="${list.deptName !=null and list.deptName !='' }">
	                       工号            
	           </c:if>
	           <c:if test="${list.className !=null and list.className !=''    }">
	                         学号
	           </c:if>
            </div>
            <div class="am-u-sm-8 am-u-md-3">
            	<c:if test="${list.deptName !=null and list.deptName !='' }">
                   <input type="text" class="am-input-sm" value="${list.teacher_num }">
	           </c:if>
	           <c:if test="${list.className !=null and list.className !=''   }">
                   <input type="text" class="am-input-sm" value="${list.student_num }">
	           </c:if>
            </div>
		            <div class="am-u-sm-4 am-u-md-3 am-text-right">
		            </div>
		            <div class="am-u-sm-8 am-u-md-3" style="float: left">
		              <input type="hidden" class="am-input-sm" value="">
		            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              联系电话
            </div>
            <div class="am-u-sm-8 am-u-md-3">
            <c:if test="${list.postulantTell ne null and list.postulantTell ne ''}">
              <input type="text" class="am-input-sm" value="${list.postulantTell }">
            </c:if>
            <c:if test="${list.postulantTell eq null or list.postulantTell eq ''}">
              <input type="text" class="am-input-sm" value="未填写">
            </c:if>
            </div>
            <div class="am-u-sm-4 am-u-md-3 am-text-right">
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
              <input type="hidden" class="am-input-sm" value="">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              邮箱地址
            </div>
            <div class="am-u-sm-8 am-u-md-3">
            <c:if test="${list.postulantEmaill ne null and list.postulantEmaill ne ''}">
              <input type="text" class="am-input-sm" value="${list.postulantEmaill }">
            </c:if>
            <c:if test="${list.postulantEmaill eq null or list.postulantEmaill eq ''}">
              <input type="text" class="am-input-sm" value="未填写">
            </c:if>
            </div>
            <div class="am-u-sm-4 am-u-md-3 am-text-right">
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
              <input type="hidden" class="am-input-sm" value="">
            </div>
          </div>
          
		 </c:forEach>
        </form>
    </div>
<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
$(function(){
	$("* input").attr("readonly","true");
	$("* textarea").attr("readonly","true");
	$("#advisetext").removeAttr("readonly");
})

//审批按钮
function ResultApproval(id,status){
	var advise = $("#advisetext").val();//获取驳回原因
	window.parent.ResultApproval(id,status,advise);//调用父页面的方法
}

//审批意见函数
function ApplyAdvace(val){
	if(val=='2'){
		$("#advise").show();
	}else{
		$("#advise").hide();
		$("#advisetext").val("");
	}
}
</script>
</body>
</html>