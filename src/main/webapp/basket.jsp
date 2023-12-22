<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>Корзина</title>
	<link rel="stylesheet" href="css/index.css">
</head>
<body>
<header><br>
<table><td>

<a href="<%=request.getContextPath()%>/index" class="headerer""><b>Страница товаров</b></a></td>

<td>
<p align="right">
	<a href="<%=request.getContextPath()%>/logout"><img src="images/logout.png"  width="60" height="70"></a>
	</td>
</table>	
</header>
<p align="center">	
			<br><br>
			<div style="text-align: center;">
			<table class="baskettab">
				<thead>
					<tr>
						<th><h3 class="basket1">ТОВАР</h3></th>
						<th><h3 class="basket1">ЦЕНА</h3></th>
						<th><h3 class="basket1">ДЕЙСТВИЕ</h3></th>
						
					</tr>
					
				</thead>
					<c:forEach var="basket" items="${listBasket}">
						<tr>
							<td><h3 class="basket"><c:out value="${basket.product}"/></h3></td>
							<td><h3 class="basket"><c:out value="${basket.price}"/></h3></td>
							<td><a href="delete_pr_basket?id=<c:out value='${basket.id}'/>&idusers=<c:out value='${basket.idusers}'/>">
							<h3 class="basket"><br>Удалить</h3></a></td>
						</tr>
					</c:forEach>
			<div class="sprava"><h3 class="basket1"><br><br>СУММА ЗАКАЗА: ${sum}</h3><br><br>
      						<form action="insert_order" method="post">
							<input type="text" style="background:#fff0f5;" value="<%=session.getAttribute("id")%>" name="iduser" required="required">
							<input type="text" style="background:#fff0f5;" value="<c:out value='${sum}'/>"name="sum" required="required">
							<br><button type="submit"  id="myButton" style="background:#fff0f5;"><h3>ЗАКАЗАТЬ</h3></button><br>
			</div>
			</table>

</body>
</html>
