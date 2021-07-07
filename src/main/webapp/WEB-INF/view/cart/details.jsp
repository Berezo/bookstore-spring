<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 30.06.2021
  Time: 14:37
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
    <title>Koszyk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/grid.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">
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
<main style="margin: 0;">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="aligned">
                    <c:set var="icon2" scope="session" value="${contextPath}${resources}/shopping-cart.svg"/>
                    <img src="${icon2}" alt="Tekst alternatywny" width="40" height="40">
                    <h1 class="h1 mb-3 fw-normal">Koszyk</h1>
                </div>
            </div>
        </div>
        <c:choose>
            <c:when test = "${cart == null || cart.cartLines == null || cart.cartLines.isEmpty()}">
                <div class="row">
                    <div class="col-12">
                        <h2 class="h2 mb-3 fw-normal">W koszyku nie ma książek.</h2>
                        <p>
                            Aby dodać koszyka książki proszę przejść do <a href="${contextPath}/books/list">listy książek</a>
                        </p>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <form:form action="${contextPath}/cart/add" modelAttribute="cart" method="POST">
                    <div class="row">
                        <div class="col-3 themed-grid-col">
                            Nazwa
                        </div>
                        <div class="col-2 themed-grid-col">
                            Wydawnictwo
                        </div>
                        <div class="col-2 themed-grid-col">
                            Kategoria
                        </div>
                        <div class="col-1 themed-grid-col">
                            Cena
                        </div>
                        <div class="col-1 themed-grid-col">
                            Ilość
                        </div>
                        <div class="col-2 themed-grid-col">
                            Na magazynie
                        </div>
                        <div class="col-1 themed-grid-col">

                        </div>
                        <c:forEach var="cartLine" items="${cart.cartLines}" varStatus="cartLineInfo">
                            <form:hidden path="cartLines[${cartLineInfo.index}].productInfo.id"/>

                            <div class="col-3 themed-grid-col">
                                    ${cartLine.productInfo.name}
                                <form:hidden path="cartLines[${cartLineInfo.index}].productInfo.name"/>
                            </div>
                            <div class="col-2 themed-grid-col">
                                    ${cartLine.productInfo.publisher}
                                <form:hidden path="cartLines[${cartLineInfo.index}].productInfo.publisher"/>
                            </div>
                            <div class="col-2 themed-grid-col">
                                    ${cartLine.productInfo.category}
                                <form:hidden path="cartLines[${cartLineInfo.index}].productInfo.category.id"/>
                            </div>
                            <div class="col-1 themed-grid-col">
                                <fmt:formatNumber value = "${cartLine.productInfo.price}" type = "currency"/>
                                <form:hidden path="cartLines[${cartLineInfo.index}].productInfo.price"/>
                            </div>
                            <c:choose>
                                <c:when test = "${cartLine.productInfo.category.id == 3 || cartLine.productInfo.category.id == 7}">
                                    <div class="col-1 themed-grid-col">
                                            ${cartLine.quantity}
                                        <form:hidden path="cartLines[${cartLineInfo.index}].quantity"  id="quantity"/>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-1 themed-grid-col">
                                            <%--                                    <label for="cartLines[${cartLineInfo.index}].quantity"></label>--%>
                                        <form:input path="cartLines[${cartLineInfo.index}].quantity"  id="quantity" cssClass="form-control w-10"/>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <div class="col-2 themed-grid-col">
                                <c:choose>
                                    <c:when test="${cartLine.productInfo.quantity != -1}">
                                        ${cartLine.productInfo.quantity}
                                    </c:when>
                                    <c:otherwise>
                                        Wersja elektroniczna
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="col-1 themed-grid-col">
                                <c:url var="remove" value="/books/remove">
                                    <c:param name="bookId" value="${cartLine.productInfo.id}"/>
                                </c:url>
                                <a href="${remove}" class="btn btn-danger">Usuń</a>
                            </div>
                        </c:forEach>
                        <div class="col-6 themed-grid-col" style="border: 0;">
                            <button class="btn btn-primary" type="submit" >Zmień ilość</button>
                            <a href="${contextPath}/books/list" class="btn btn-dark">Lista książek</a>
                            <a href="${contextPath}/cart/confirm" class="btn btn-success">Podsumowanie</a>
                        </div>
                    </div>
                </form:form>
            </c:otherwise>
        </c:choose>
    </div>
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