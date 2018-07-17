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
<script src="${pageContext.request.contextPath}/js/plugins/layer/layer.min.js"></script>
</head>
<body>
    <div class="admin-biaoge">
       <div class="xinxitj"><span style="color: red">所在位置</span>>>发布新公告</div>
       
       <form id="bulletinForm" class="am-form" >
           <div class="am-g am-margin-top-sm">
            <div class="am-u-sm-12 am-u-md-1 am-text-left admin-form-text">
                         公告内容
            </div>
            <div class="am-u-sm-12 am-u-md-10" style="float: left;">
              <textarea style="color: red" id="bulletinCon" name="bulletinCon" rows="3" class="am-form-field"  required>${bulletinCon}</textarea>
            </div>
          </div>
		    <div style="width:100%; position:fixed; left:0; bottom:0; text-align: center;background-color: #C1CDCD">
				   <div class="am-margin" style="text-align: center;">
				    <button  type="button" onclick="suBmitForm()" class="am-btn am-btn-success am-radius " <c:if test="${flag eq 'query'}"> style="display:none"</c:if>><font size="1px">发布</font></button>
				    <button  type="reset" class="am-btn am-btn-primary am-radius "><font size="1px">取消</font></button>
				  </div>
		    </div>
        </form>
    </div>
<script src="${pageContext.request.contextPath}/admin2/assets/js/amazeui.min.js"></script>
<script type="text/javascript">
var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
function suBmitForm(){
	debugger;
	var bulletinCon = $.trim($("#bulletinCon").val());
	$.ajax({
		url:projectName+'/add/addbulletinInfo',
		data:{bulletinCon:bulletinCon},
		type : 'post',
		dataType:"json",
		beforeSend: function() {
			if(bulletinCon==''||bulletinCon==null){
				parent.layer.alert("请填写公告内容");
				return false;
			}else{
				return true;
			}
		},
		success:function(data){
			 if (data.status == '1') {
             	parent.layer.alert(data.massage);
             }else if(data.status == '0'){
             	parent.layer.alert(data.massage);
             }else{
             	parent.layer.alert(data.massage);
             }
		}
	})
}
	


</script>
</body>
</html>