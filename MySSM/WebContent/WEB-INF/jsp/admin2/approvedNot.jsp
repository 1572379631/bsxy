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
<%-- <c:set var="listPlaceInfo" value='<%=session.getAttribute("listPlaceInfo") %>' />  --%>
<%-- <c:set var="listPlaceInfo" value='${sessionScope.listPlaceInfo }' /> --%>
</head>
<body>

    <div class="admin-biaoge">
      <div class="xinxitj">待审批申请</div>
      <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success">
                <!-- <th class="table-check"><input type="checkbox" /></th> -->
                <!-- <th class="table-id"></th> -->
                <th class="table-title">申请人</th>
                <th class="table-type">申请单位</th>
                <th class="table-author am-hide-sm-only">场地名称</th>
                <th class="table-author am-hide-sm-only">开始时间</th>
                <th class="table-date am-hide-sm-only">结束时间</th>
                <th width="200px" class="table-set">详细</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${listPlaceInfo}" var="list">
	              <tr>
	             <td><a href="javascript:;" onclick="queryApplyPerson(${list.postulantId})" class="am-text-secondary" title="查看审批人信息">${list.postulantName}</a></td>
	             <c:if test="${list.teamYesnot eq '1' }">
	                	<td>个人</td>
	                </c:if>
	                <c:if test="${list.teamYesnot eq '2' }">
	                	<td>${list.deptName }</td>
	                </c:if>
	                <c:if test="${list.teamYesnot ne '2' and list.teamYesnot ne '1'}">
	                	<td></td>
	                </c:if>
	                <td>${list.placeDivision }${list.placeLieu }${list.placeName }</td>
	                <td>${list.applyTimeStart }</td>
	                <td>${list.applyTimeEnd }</td>
	                <td>
	                	<div class="am-btn-toolbar">
	                    <div class="am-btn-group am-btn-group-xs" >
	                    	<a href="javascript:;" onclick="queryApprovalBill(${list.placeApplyId })" title="查看申请单详情" class="am-text-success am-icon-file" style="margin-left: 20px"> 查看</a>
	                    	 &nbsp;&nbsp;&nbsp;
	                    	 <a href="javascript:;" onclick="ResultApproval(${list.placeApplyId },'1','null')" class="am-icon-pencil-square-o am-text-secondary" title="同意审批"> 同意审批</a>
	                    </div>
	                  </div>
	                </td>
	              </tr>
              </c:forEach>
            </tbody>
          </table>
              <ul class="am-pagination am-fr">
									<c:if test="${page.currnav>1}">
										<li><a href="${pageContext.request.contextPath}/query/approvadNot?flagb=0&currnav=${page.first}">首页</a></li>
									</c:if>
									<c:if test="${page.currnav>1}">
										<li><a href="${pageContext.request.contextPath}/query/approvadNot?flagb=0&currnav=${page.currnav-1}">«</a></li>
									</c:if>
									<c:forEach begin="${page.begin }" end="${page.end }" var="num">
									<c:choose>
									<c:when test="${page.currnav==num }">
										<li class="am-active"><a href="${pageContext.request.contextPath}/query/approvadNot?flagb=0&currnav=${num}">${num}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/query/approvadNot?flagb=0&currnav=${num}">${num}</a></li>
									</c:otherwise>
									</c:choose>
									</c:forEach>
									<c:if test="${page.currnav< page.last }">
										<li><a href="${pageContext.request.contextPath}/query/approvadNot?flagb=0&currnav=${page.currnav+1}">»</a></li>
									</c:if>
									<c:if test="${page.currnav< page.last }">
										<li><a href="${pageContext.request.contextPath}/query/approvadNot?flagb=0&currnav=${page.end}">尾页</a></li>
									</c:if>
								</ul>
								显示第${page.currnav }页，共 ${page.navcount }页
          <hr />
        </form>
      
    </div>

<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>

<script type="text/javascript">
//审批查看申请单据，,条用分页面的方法id:申请单id
function queryApprovalBill(id){
	window.parent.queryApprovalBill(id);
}
////场地审批按钮
function ResultApproval(id,status,advise){
	window.parent.ResultApproval(id,status,advise);
}
//查看申请人
function queryApplyPerson(id){
	window.parent.queryApplyPerson(id);
}

</script>

</body>
</html>