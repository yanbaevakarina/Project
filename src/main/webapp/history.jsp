<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>История заказов</title>
	<link rel="stylesheet" href="css/index.css">
</head>
<body>
<header><br>
<table><td>

<a href="<%=request.getContextPath()%>/index" class="headerer""><b>Страница товаров</b></a></td>

<td>
<p align="right">

	<a href="basket_id?idusers=<%=session.getAttribute("id")%>"><img src="images/basket.png"  width="60" height="70"></a>
	<a href="<%=request.getContextPath()%>/logout"><img src="images/logout.png"  width="60" height="70"></a>
	</td>
</table>	
</header>
<p align="center">	
			<br><br>
			<div style="text-align: center;">
			<table>
				<thead>
					<tr>
						<th><h3 class="basket1">ID ЗАКАЗА</h3></th>
						<th><h3 class="basket1">СУММА ПОКУПКИ</h3></th>
					</tr>
				</thead>
					<c:forEach var="orders" items="${listOrder}">
						<tr>
							<td><h3 class="basket"><br><c:out value="${orders.id}"/></h3></td>
							<td><h3 class="basket"><br><c:out value="${orders.sum}"/></h3></td>
						</tr>
					</c:forEach>
					
			</table>

</body>
</html>
