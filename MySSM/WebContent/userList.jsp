<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>我是谁，从哪里来？</div>
	<div>
		<table>
			<thead>
			
			</thead>
			<tbody>
				<c:forEach items="${Userlist }" var="user"  >
					<tr>
						<td>${user.username }</td>
						<td>${user.useradaress }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>