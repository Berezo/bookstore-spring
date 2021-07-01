<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 30.06.2021
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Shopping Cart Confirmation</title>
</head>
<body>
<div><h1>Potwierdzenie</h1></div>
<div>
    <h3> Informacje o kliencie </h3>
    <ul>
        <li>Imie: ${cart.customerInfo.name} </li>
        <li>Nazwisko: ${cart.customerInfo.surname}</li>
        <li>E-mail: ${cart.customerInfo.email}</li>
        <li>Telefon: ${cart.customerInfo.phone}</li>
        <li>Adres: ${cart.customerInfo.address}</li>
    </ul>
    <h3>Podsumowanie koszyka:</h3>
    <ul>
        <li>Ilość: ${cart.quantityTotal} </li>
        <li>Kwota do zapłaty: ${cart.amountTotal} </li>
    </ul>
    <form:form action="confirm" modelAttribute="cart" method="POST">
        <!-- Edit Cart -->
        <a href="${contextPath}/cart">Koszyk</a>
        <!-- Edit Customer Info -->
        <a href="${contextPath}/user">Użytkownik</a>
        <!-- Send/Save -->
        <button type="submit" >Potwierdź</button>
    </form:form>
</div>
<c:forEach var="cartLine" items="${cart.cartLines}" varStatus="cartLineInfo">
    <div>
        <ul>
            <li>
                Nazwa: ${cartLine.productInfo.name}
            </li>
            <li>
                Wydawnictwo: ${cartLine.productInfo.publisher}
            </li>
            <li>
                Kategoria: ${cartLine.productInfo.category}
            </li>
            <li>
                Cena: ${cartLine.productInfo.price}
            </li>
            <li>
                Ilość: ${cartLine.quantity}
            </li>
        </ul>
    </div>
</c:forEach>

</body>
</html>
