<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Добавление/Редактирование пользователя</title>
<link rel="stylesheet" href="css/form.css">
</head>
<body>
	<header><br>
				<a href="<%=request.getContextPath()%>/list" class="headerer"><h4>Пользователи</h4></a>
				<c:if test="${user != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insert" method="post">
				</c:if>

					<h3>
						<c:if test="${user != null}">
            			Редактирование пользователя
            		</c:if>
						<c:if test="${user == null}">
            			Добавление пользователя
            		</c:if>
					</h3>
					<br>
	</header><br>
	<nav>
				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>
				<fieldset>
					<label>Имя<br></label> 
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
				<button type="submit" >Сохранить</button><br>
				</fieldset>
	</nav>
</body>
</html>