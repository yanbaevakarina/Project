<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Администрирование</title>
<link rel="stylesheet" href="css/administration.css">
</head>
<body>
  <a href="<%=request.getContextPath()%>/logout"><img src="images/logout.png"  width="60" height="70"></a>
	<nav>
<br>
					<a href="<%=request.getContextPath()%>/list"><h4>Пользователи</h4></a>
<br>
					<a href="<%=request.getContextPath()%>/list_pr"><h4>Товары</h4></a>
<br>
					<a href="<%=request.getContextPath()%>/orderlist"><h4>Заказы</h4></a>
<br>
				
	</nav>
</body>
</html>