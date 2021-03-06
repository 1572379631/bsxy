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
      <div class="xinxitj"><span style="color: red">所在位置</span>>>历史公告</div>
      <form class="am-form am-form-horizontal" action="${pageContext.request.contextPath}/query/queryBulletin" method="POST">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-1 am-text-right"> 发布人</div>
            <div class="am-u-sm-8 am-u-md-3">
				<input style="width: 200px;height: 36px;font-size: 14px" type="text" id="mtdept" name="mtdept" placeholder="维护单位">
            </div>
             <div class="am-u-sm-4 am-u-md-3 am-text-right">
            </div>
            <div class="am-margin" style="text-align: right; margin-top: 10px;">
				    <button  type="submit" class="am-btn am-btn-success am-radius "><font size="1px">查询</font></button>
				    <button  type="reset" class="am-btn am-btn-primary am-radius "><font size="1px">取消</font></button>
				  </div>
          </div>
          
          </form>
      <form class="am-form am-g">
          <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
            <thead>
              <tr class="am-success">
                <th width="20%" class="table-title">发布人</th>
                <th width="40%" class="table-type">公告内容</th>
                <th width="20%" class="table-author am-hide-sm-only">发布时间</th>
                <th width="20%" class="table-set">操作</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${listPlaceInfo}" var="list">
	              <tr>
	                <td>${list.bulletinPerson }</td>
	                <td>${list.bulletinCon}</td>
	                <td>${list.bulletinTime }</td>
	                <td>
	                	<div class="am-btn-toolbar">
	                    <div class="am-btn-group-xs">
	                        <a href="javascript:;" class="am-text-success am-icon-file" title="查看"> 查看公告内容</a>&nbsp;&nbsp;
	                    	<a href="javascript:;" onclick="deleteBulletin('${list.bulletinId}')" class="am-icon-trash-o am-text-danger" title="删除"> 删除公告</a>
	                    </div>
	                  </div>
	                </td>
	              </tr>
              </c:forEach>
            </tbody>
          </table>
              <ul class="am-pagination am-fr">
									<c:if test="${page.currnav>1}">
										<li><a href="${pageContext.request.contextPath}/query/queryBulletin?currnav=${page.first}">首页</a></li>
									</c:if>
									<c:if test="${page.currnav>1}">
										<li><a href="${pageContext.request.contextPath}/query/queryBulletin?currnav=${page.currnav-1}">«</a></li>
									</c:if>
									<c:forEach begin="${page.begin }" end="${page.end }" var="num">
									<c:choose>
									<c:when test="${page.currnav==num }">
										<li class="am-active"><a href="${pageContext.request.contextPath}/query/queryBulletin?currnav=${num}">${num}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${pageContext.request.contextPath}/query/queryBulletin?currnav=${num}">${num}</a></li>
									</c:otherwise>
									</c:choose>
									</c:forEach>
									<c:if test="${page.currnav< page.last }">
										<li><a href="${pageContext.request.contextPath}/query/queryBulletin?currnav=${page.currnav+1}">»</a></li>
									</c:if>
									<c:if test="${page.currnav< page.last }">
										<li><a href="${pageContext.request.contextPath}/query/queryBulletin?currnav=${page.end}">尾页</a></li>
									</c:if>
								</ul>
								显示第${page.currnav }页，共 ${page.navcount }页
          <hr />
        </form>
      
    </div>

<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>

<script type="text/javascript">
var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

function deleteBulletin(bulletinId){
	debugger;
	$.ajax({
		type : 'post',
		url : projectName + '/delete/deleteBulletinById',
		dataType : 'json',
		data:{bulletinId:bulletinId},
		success : function(data) {
			if(data.status=='3'){
				parent.layer.alert(data.massage);
				window.location.href = projectName+"/login.jsp";
			}else{
				parent.layer.alert(data.massage);
			}
		}
	}); 
}
</script>

</body>
</html>