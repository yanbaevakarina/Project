<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>Список пользователей</title>
	<link rel="stylesheet" href="css/list.css">
</head>
<body>

  
	<header> <br>
				<a href="<%=request.getContextPath()%>/new" class="headerer""><h4>Добавить пользователя</h4></a>


			<a class="headerer" href="<%=request.getContextPath()%>/list"><h3>Список пользователей</h3></a><br>
	</header><br>
				
			<br>
			<div style="text-align: center;">
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>ИМЯ</th>
						<th>ПОЧТА</th>
						<th>ПАРОЛЬ</th>
						<th>ДЕЙСТВИЕ</th>
					</tr>
				</thead>
					<c:forEach var="user" items="${listUser}">

						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.password}" /></td>
							<td><a href="edit?id=<c:out value='${user.id}' />">Редактировать</a> &nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="delete?id=<c:out value='${user.id}' />">Удалить</a></td>
						</tr>
					</c:forEach>

			</table>
<a href="<%=request.getContextPath()%>/administration.jsp" class="headerer"><h5>Администрирование</h5></a>
</body>
</html>
