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
       <div class="xinxitj">申请单详细信息</div>
       
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
              是否个人申请
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
            	<c:if test="${list.teamYesnot eq '1' }">
                <input type="text" class="am-input-sm" value="个人">
            	</c:if>
            	<c:if test="${list.teamYesnot eq '2' }">
                <input type="text" class="am-input-sm" value="集体">
            	</c:if>
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
	            <c:if test="${list.teamYesnot eq '2' }">
	                           申请部门
	           </c:if>
	           <c:if test="${list.teamYesnot eq '1' }">
	                         部门/班级
	           </c:if>
            </div>
            <div class="am-u-sm-8 am-u-md-3">
               <c:if test="${list.teamYesnot eq '2' }">
	                <input type="text" class="am-input-sm" value="${list.deptName }">
	           </c:if>
	           <c:if test="${list.teamYesnot eq '1' }">
              		<input type="text" class="am-input-sm" value="${list.postulantDept }">
	           </c:if>
            </div>
            <div class="am-u-sm-4 am-u-md-3 am-text-right">
              申请人编号
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
              <input type="text" class="am-input-sm" value="${list.studentNum }">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              负责人电话
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" value="${list.principalTell }">
            </div>
            <div class="am-u-sm-4 am-u-md-3 am-text-right">
            申请场地
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
              <input type="text" class="am-input-sm" value="${list.placeDivision }${list.placeLieu }${list.placeName }">
              <c:if test="${list.applyStatus !=1 and list.applyStatus !=2 }">
	              	<c:if test="${result ==1}">
	               		<a href="javascript:;" style="color: blue;">${resultQurey} </a>
	               </c:if>
	               <c:if test="${result ==0 or result ==2}">
	               		<a href="javascript:;" style="color: red;">${resultQurey} </a>
	               </c:if>
	               <c:if test="${result ==3}">
	                	<a href="javascript:;" onclick="checkPlaceStutas('${list.placeName }','fla')" style="color: red">${resultQurey} </a>
	               </c:if>
              </c:if>
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              开始时间
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" value="${list.applyTimeStart }">
            </div>
            <div class="am-u-sm-4 am-u-md-3 am-text-right">
              结束时间
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
              <input type="text" class="am-input-sm" value="${list.applyTimeEnd }">
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
             主办方
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" value="${list.sponsor }">
            </div>
            <div class="am-u-sm-4 am-u-md-3 am-text-right">
              活动名称
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
              <input type="text" class="am-input-sm" value="${list.activityName }">
            </div>
          </div>
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
             活动内容
            </div>
            <div class="am-u-sm-12 am-u-md-10" style="float: left;">
              <textarea rows="2" placeholder="请使用富文本编辑插件" >${list.activityContent }</textarea>
            </div>
          </div>
          
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
            活动性质
            </div>
            <div class="am-u-sm-12 am-u-md-10" style="float: left;">
              <textarea rows="2" placeholder="请使用富文本编辑插件">${list.activityNature }</textarea>
            </div>
          </div>
          <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
            参与人员
            </div>
            <div class="am-u-sm-12 am-u-md-10" style="float: left;">
              <textarea rows="2" placeholder="请使用富文本编辑插件">${list.participant }</textarea>
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right">
              参与人数
            </div>
            <div class="am-u-sm-8 am-u-md-3">
              <input type="text" class="am-input-sm" value="${list.participantSum }"/>
            </div>
            <div class="am-u-sm-4 am-u-md-3 am-text-right">
            审批结果
            </div>
            <div class="am-u-sm-8 am-u-md-3" style="float: left">
              <select data-am-selected="{btnSize: 'sm'}" id="ResultApply" onchange="ApplyAdvace(this.value)" <c:if test="${list.applyStatus ==1 or list.applyStatus ==2 }">style="disabled:disabled"</c:if> >
              <option >---请选择----</option>
              <option value="1" <c:if test="${list.applyStatus == 1 }">selected="selected"</c:if>>通过</option>
              <option value="2" <c:if test="${list.applyStatus == 2 }">selected="selected"</c:if>>驳回</option>
            </select>
            </div>
          </div>
          
           <div class="am-g am-margin-top-sm" id="advise" style="display: none">
            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
            驳回原因
            </div>
            <div class="am-u-sm-12 am-u-md-10" style="float: left;">
              <textarea style="color: red" id="advisetext" rows="2" placeholder="请使用富文本编辑插件" >${list.advise }</textarea>
            </div>
          </div>
		  <%-- <div class="am-margin" style="text-align: center;<c:if test="${list.applyStatus == 1 or list.applyStatus == 2 }">display: none</c:if>">
		    <button id="yes" onclick="ResultApproval(${list.placeApplyId },'1')" type="button" class="am-btn am-btn-success am-radius "><font size="1px">同意</font></button>
		    <button id="no" onclick="ResultApproval(${list.placeApplyId },'2')" type="button" class="am-btn am-btn-primary am-radius "><font size="1px">驳回审批</font></button>
		  </div> --%>
    <div style="width:100%; position:fixed; left:0; bottom:0; text-align: center;background-color: #C1CDCD">
		   <div class="am-margin" style="text-align: center;<c:if test="${list.applyStatus == 1 or list.applyStatus == 2 }">display: none</c:if>">
		    <button id="yes" onclick="ResultApproval(${list.placeApplyId },'1',${list.placeId })" type="button" class="am-btn am-btn-success am-radius "><font size="1px">同意</font></button>
		    <button id="no" onclick="ResultApproval(${list.placeApplyId },'2',${list.placeId })" type="button" class="am-btn am-btn-primary am-radius "><font size="1px">驳回审批</font></button>
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
	debugger;
	var val  = $("#ResultApply").val();
	ApplyAdvace(val);//调用审批意见函数
})

//审批按钮
function ResultApproval(id,status,placeId){
	debugger;
	var advise = $("#advisetext").val();//获取驳回原因
	var select = $.trim($("#ResultApply").val());
	if(select=='---请选择----'){
		parent.layer.alert("请选择审批结果！");
		return;
	}
	window.parent.ResultApproval(id,status,advise,placeId);//调用父页面的方法
}

//审批意见函数
function ApplyAdvace(val){
	
	if(val=='2'){
		$("#advise").show();
		$("#yes").removeAttr("disabled");
		$("#no").removeAttr("disabled");
		$("#yes").attr("disabled","disable");
	}else if(val=='1'){
		$("#advise").hide();
		$("#yes").removeAttr("disabled");
		$("#no").removeAttr("disabled");
		$("#no").attr("disabled","disable");
		$("#advisetext").val("");
	}else {
		$("#advise").hide();
		$("#advisetext").val("");
		$("#no").removeAttr("disabled");
		$("#yes").removeAttr("disabled");
	}
}

/*从申请单跳转到场地使用状态页面方法  fla用于判断精确查询还是到审批表中查询*/
function checkPlaceStutas(placeName,fla){
	window.parent.checkPlaceStutas(placeName,fla);//调用父页面的方法
}
</script>
</body>
</html>