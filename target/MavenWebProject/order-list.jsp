<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>Список заказов</title>
	<link rel="stylesheet" href="css/list.css">
</head>
<body>
					<header> <br>
			<a class="headerer" href="<%=request.getContextPath()%>/historylist"><h3>Список заказов</h3></a><br>
	</header><br>
			<br>
			<div style="text-align: center;">
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>ID пользователя</th>
						<th>СУММА заказа</th>
					</tr>
				</thead>
					<c:forEach var="orders" items="${listOrder}">

						<tr>
							<td><c:out value="${orders.id}" /></td>
							<td><c:out value="${orders.iduser}" /></td>
							<td><c:out value="${orders.sum}" /></td>
						</tr>
					</c:forEach>

			</table>
<a href="<%=request.getContextPath()%>/administration.jsp" class="headerer"><h5>Администрирование</h5></a>
</body>
</html>
