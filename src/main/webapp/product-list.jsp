<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Товары</title>
	<link rel="stylesheet" href="css/list.css">
</head>
<body>
  
	<header> <br>
				<a href="<%=request.getContextPath()%>/new_pr" class="headerer""><h4>Добавить товар</h4></a>


	</header><br>
				
			<br>
			<div style="text-align: center;">
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>НАЗВАНИЕ</th>
						<th>ЦЕНА</th>
						<th>ДЕЙСТВИЕ</th>
					</tr>
				</thead>
					<c:forEach var="product" items="${listProduct}">

						<tr>
							<td><c:out value="${product.id}" /></td>
							<td><c:out value="${product.name}" /></td>
							<td><c:out value="${product.price}" /></td>
							<td><a href="edit_pr?id=<c:out value='${product.id}' />">Редактировать</a> &nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="delete_pr?id=<c:out value='${product.id}' />">Удалить</a></td>
						</tr>
					</c:forEach>

			</table>
<a href="<%=request.getContextPath()%>/administration.jsp" class="headerer"><h5>Администрирование</h5></a>
</body>
</html>
