<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	if (session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
	%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="author" content="" />
<title>ProSpace - интернет-магазин профессиональной косметики</title>
<link rel="stylesheet" href="css/index.css">
</head>
<body>

	<!-- НАВИГАЦИЯ-->
<header><br>
<table><td>

<b>PROSPACE</b></td>

<td>
<p align="right">
	<a href="order?iduser=<%=session.getAttribute("id")%>"><%=session.getAttribute("name")%></a>
	<a href="basket_id?idusers=<%=session.getAttribute("id")%>"><img src="images/basket.png"  width="60" height="70"></a>
	<a href="<%=request.getContextPath()%>/logout"><img src="images/logout.png"  width="60" height="70"></a>

	</td>
</table>	

<p align="center">
		<img src="images/head.jpg" width=100%>	
</header>
<div id="content">
<ul>

	
<c:forEach var="product" items="${listProduct}">		
	<li class="product-wrapper">
							<div class="product-photo">
							<a href="" class="product">
							<img src="images/<c:out value="${product.name}" />.jpg">
							<h6><c:out value="${product.name}" /></h6>
							<h5><c:out value="${product.price}"/></h5>
							<form action="new_pr_basket" method="post">
							<input type="text" value="<%=session.getAttribute("id")%>" name="idusers" required="required">
							<input type="text" value="<c:out value='${product.id}'/>" name="idproduct" required="required">
							<input type="text" value="<c:out value='${product.price}'/>"name="price" required="required">
							<input type="text" value="<c:out value='${product.name}'/>"name="product" required="required">
							<br><button type="submit" ><h3>ДОБАВИТЬ</h3></button><br>
							</form>
							</a>
							</div>

	</li>	
	</c:forEach>			
	</ul>
</div>
	<br>
	<div class="video"><br><br>
	<h1><p align="center">Блогеры советуют<h1>
	<br>
		<iframe width="1100" height="600" src="https://www.youtube.com/embed/Z3F5dNDTOpU?si=dY9mSKCgtCmVWjgD" 
	title="YouTube video player" frameborder="0" 
	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		<iframe width="1100" height="600" src="https://www.youtube.com/embed/UpCFxyOrnIc?si=WEJ78B35Jd4gt5tz" 
	title="YouTube video player" frameborder="0" 
	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
		<iframe width="1100" height="600" src="https://www.youtube.com/embed/M0NG54D8JGI?si=2dv-rC3oTt_-cO-k" title="YouTube video player" frameborder="0" 
	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	<br><br></div>
	<br><br>

	<!-- ПОДВАЛ -->
	<hr width="100%" size="10" color="#fff0f5">
	<div class="email">
	<br><br>
	<h1>Служба поддержки клиентов</h1>
	<br><br>
	<h2>Для связи используйте один из доступных интернет-сервисов:</h2>
	<br><br><h1>
	<a href="https://vk.com/uryl.otvali"><img src="images/vk.png"  width="60" height="70"></a>
	<a href="https://t.me/plak_k"><img src="images/tg.png"  width="70" height="70"></a>
	<a href="https://mail.google.com/mail/u/?authuser=user@gmail.com"><img src="images/gm.png"  width="60" height="70"></a></h1>
	<br><br>
	</div>
	
	
	<!-- ПОДВАЛ ПОДВАЛА -->
	<br>
	<hr width="100%" size="10" color="#5B2C7F">
	<footer><br>Янбаева Карина Ириковна ИКПИ-15<br><br></footer>
</body>
</html>
