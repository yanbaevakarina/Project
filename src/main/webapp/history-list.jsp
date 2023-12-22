<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>Список купленных товаров</title>
	<link rel="stylesheet" href="css/list.css">
</head>
<body>
			<header> <br>
			<a class="headerer" href="<%=request.getContextPath()%>/orderlist"><h3>Список купленных товаров</h3></a><br>
	</header><br>
			<br>
			<div style="text-align: center;">
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>ID пользователя</th>
						<th>Товар</th>
						<th>Цена</th>
					</tr>
				</thead>
					<c:forEach var="history" items="${listHistory}">

						<tr>
							<td><c:out value="${history.id}" /></td>
							<td><c:out value="${history.idusers}" /></td>
							<td><c:out value="${history.product}" /></td>
							<td><c:out value="${history.price}" /></td>
						</tr>
					</c:forEach>

			</table>
<a href="<%=request.getContextPath()%>/administration.jsp" class="headerer"><h5>Администрирование</h5></a>
</body>
</html>
