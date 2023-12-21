<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Добавление/Редактирование товара</title>
<link rel="stylesheet" href="css/form.css">
</head>
<body>
	<header><br>
				<a href="<%=request.getContextPath()%>/list_pr" class="headerer"><h4>Товары</h4></a>
				<c:if test="${product != null}"><form action="update_pr" method="post">
				</c:if>
				<c:if test="${product == null}"><form action="insert_pr" method="post">
				</c:if>

					<h3>
						<c:if test="${product != null}">
            			Редактирование товара
            		</c:if>
						<c:if test="${product == null}">
            			Добавление товара
            		</c:if>
					</h3>
					<br>
	</header><br>
	<nav>
				<c:if test="${product != null}">
					<input type="hidden" name="id" value="<c:out value='${product.id}' />" />
				</c:if>
				<fieldset>
					<label>Название<br></label> 
					<input type="text" value="<c:out value='${product.name}' />" name="name" required="required">
				</fieldset>

				<fieldset>
					<label>Цена<br></label>
					<input type="text" value="<c:out value='${product.price}' />"name="price" required="required">
				</fieldset>
				
				
				<fieldset>
				<button type="submit" >Сохранить</button><br>
				</fieldset>
	</nav>
</body>
</html>