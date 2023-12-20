<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Регистрация</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
<form action="registration" method="post">
	<nav>
	<h3>Регистрация</h3>
	<table>
		<td>
			<table>
				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>
				<fieldset>
					<label>Логин<br></label> 
					<input type="text" value="<c:out value='${user.name}' />" name="name" required="required">
				</fieldset>

				<fieldset>
					<label>Почта<br></label>
					<input type="text" value="<c:out value='${user.email}' />"name="email" required="required">
				</fieldset>
				
				<fieldset>
					<label>Пароль<br></label>
					<input type="text" value="<c:out value='${user.password}' />" name="password" required="required">
				</fieldset>
				
				<fieldset>
				 <a href="login.jsp">
				<button type="submit">Зарегистрироваться</button><br>
				</fieldset>


			      
			    	</tr>
			    </table>
			</td>
						<td class="login">
			<img src="images/logo.jpg"  width="177" height="150">
		<a href="login.jsp">Войти</a>
</td>

	</table>
	</nav>
</body>
</html>