<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${mode=='1' }">
<img src="/img/${imageName }" style="width: 150px;height:150px;">
<input type="hidden" value="${imageName }" id="photo1" name="photo1">
</c:if>
<c:if test="${mode=='2' }">
<img src="/img/${imageName }" style="width: 150px;height:150px;">
<input type="hidden" value="${imageName }" id="photo2" name="photo2">
</c:if>
<c:if test="${mode=='3' }">
<img src="/img/${imageName }" style="width: 150px;height:150px;">
<input type="hidden" value="${imageName }" id="photo3" name="photo3">
</c:if>
</body>
</html>