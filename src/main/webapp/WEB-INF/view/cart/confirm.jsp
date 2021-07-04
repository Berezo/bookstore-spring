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
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Potwierdzenie zamówienia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/grid.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <div class="container-fluid">
        <a class="navbar-brand" href="${contextPath}">
            <c:set var="resources" scope="session" value="/resources/icons"/>
            <c:set var="covers" scope="session" value="/resources/covers/"/>
            <c:set var="icon" scope="session" value="${contextPath}${resources}/books.svg"/>
            <img src="${icon}" alt="Tekst alternatywny" width="40" height="40">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <sec:authorize access="!isAuthenticated()">
                    <a class="nav-item nav-link active" aria-current="page" href="${contextPath}/login">Zaloguj się</a>
                    <a class="nav-item nav-link" href="${contextPath}/register">Zarejestruj się</a>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <a class="nav-item nav-link active" href="${contextPath}/user">Profil</a>
                    <a class="nav-item nav-link" href="${contextPath}/cart">Koszyk</a>
                    <a class="nav-item nav-link" href="${contextPath}/orders/list">Zamówienia</a>
                    <a class="nav-item nav-link" href="${contextPath}/logout">Wyloguj się</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</nav>
<main>
<div class="container">
    <div class="row ">
        <div class="col-12">
            <h1 class="h1 mb-3 fw-normal">Potwierdzenie</h1>
        </div>
        <div class="col-12">
            <h3 class="h3 mb-3 fw-normal">Informacje o kliencie</h3>
            <ul class="list-group">
                <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Imie: ${cart.customerInfo.name}</li>
                <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Nazwisko: ${cart.customerInfo.surname}</li>
                <li class="list-group-item " style="border: 0; background-color: #f5f5f5">E-mail: ${cart.customerInfo.email}</li>
                <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Telefon: ${cart.customerInfo.phone}</li>
                <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Adres: ${cart.customerInfo.address}</li>
            </ul>
        </div>
        <div class="col-12">
            <h3 class="h3 mb-3 fw-normal">Podsumowanie koszyka</h3>
            <ul class="list-group">
                <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Ilość produktów: ${cart.quantityTotal}</li>
                <li class="list-group-item " style="border: 0; background-color: #f5f5f5">
                    Kwota do zapłaty: <fmt:formatNumber value = "${cart.amountTotal}" type = "currency"/>
                </li>
            </ul>
        </div>
        <div class="col-4 themed-grid-col">
            Nazwa
        </div>
        <div class="col-3 themed-grid-col">
            Wydawnictwo
        </div>
        <div class="col-3 themed-grid-col">
            Kategoria
        </div>
        <div class="col-1 themed-grid-col">
            Cena
        </div>
        <div class="col-1 themed-grid-col">
            Ilość
        </div>
        <c:forEach var="cartLine" items="${cart.cartLines}" varStatus="cartLineInfo">
            <div class="col-4 themed-grid-col">
                    ${cartLine.productInfo.name}
            </div>
            <div class="col-3 themed-grid-col">
                    ${cartLine.productInfo.publisher}
            </div>
            <div class="col-3 themed-grid-col">
                    ${cartLine.productInfo.category}
            </div>
            <div class="col-1 themed-grid-col">
                    <fmt:formatNumber value = "${cartLine.productInfo.price}" type = "currency"/>
            </div>
            <div class="col-1 themed-grid-col">
                    ${cartLine.quantity}
            </div>
        </c:forEach>
        <div class="col-12 themed-grid-col" style="border: 0;">
            <form:form action="confirm" modelAttribute="cart" method="POST">
                <a href="${contextPath}/cart" class="btn btn-primary">Koszyk</a>
                <a href="${contextPath}/user" class="btn btn-dark">Użytkownik</a>
                <!-- Send/Save -->
                <button type="submit" class="btn btn-success">Potwierdź</button>
            </form:form>
        </div>
    </div>
</body>
</main>
<footer class="footer mt-auto py-3" style="background-color: #e3f2fd; margin: 0;">
    <div class="container">
        <span class="text-muted">
            Projekt stworzony na zaliczenie przedmiotu Systemy klasy enterprise - persystencje. Wykorzystane ikony zostały wykonane przez <a href="https://www.flaticon.com/authors/payungkead" title="Payungkead">Payungkead</a> i są dostępne na stronie <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
        </span>
    </div>
</footer>
</body>
</html>

<%--<div>--%>
<%--    <h3> Informacje o kliencie </h3>--%>
<%--    <ul>--%>
<%--        <li>Imie: ${cart.customerInfo.name} </li>--%>
<%--        <li>Nazwisko: ${cart.customerInfo.surname}</li>--%>
<%--        <li>E-mail: ${cart.customerInfo.email}</li>--%>
<%--        <li>Telefon: ${cart.customerInfo.phone}</li>--%>
<%--        <li>Adres: ${cart.customerInfo.address}</li>--%>
<%--    </ul>--%>
<%--    <h3>Podsumowanie koszyka:</h3>--%>
<%--    <ul>--%>
<%--        <li>Ilość: ${cart.quantityTotal} </li>--%>
<%--        <li>Kwota do zapłaty: ${cart.amountTotal} </li>--%>
<%--    </ul>--%>
<%--    <form:form action="confirm" modelAttribute="cart" method="POST">--%>
<%--        <!-- Edit Cart -->--%>
<%--        <a href="${contextPath}/cart">Koszyk</a>--%>
<%--        <!-- Edit Customer Info -->--%>
<%--        <a href="${contextPath}/user">Użytkownik</a>--%>
<%--        <!-- Send/Save -->--%>
<%--        <button type="submit" >Potwierdź</button>--%>
<%--    </form:form>--%>
<%--</div>--%>
<%--<c:forEach var="cartLine" items="${cart.cartLines}" varStatus="cartLineInfo">--%>
<%--    <div>--%>
<%--        <ul>--%>
<%--            <li>--%>
<%--                Nazwa: ${cartLine.productInfo.name}--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                Wydawnictwo: ${cartLine.productInfo.publisher}--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                Kategoria: ${cartLine.productInfo.category}--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                Cena: ${cartLine.productInfo.price}--%>
<%--            </li>--%>
<%--            <li>--%>
<%--                Ilość: ${cartLine.quantity}--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</c:forEach>--%>