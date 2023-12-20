<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Оплата заказа</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>

	<nav>
	<h3>Оплата заказа</h3>
	<label>Для оплаты заказа наведите ваш телефон на QR-код для перехода в онлайн-банк.<br> 
		После оплаты нажмите кнопку "Вернуться на страницу"</label>
	<br><a href="http://qrcoder.ru" target="_blank"><img src="http://qrcoder.ru/code/?https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3Dxbks1QDEWNM&4&0" 
	width="400" height="400" border="0" title="QR код"></a>
	
	<a href="basket_id?idusers=<%=session.getAttribute("id")%>"><h3>Вернуться в корзину<h3><br>
	</nav>
	
</body>
</html>