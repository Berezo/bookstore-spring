<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 21.06.2021
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Lista książek</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/grid.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <div class="container-fluid">
        <a class="navbar-brand" href="${contextPath}">
            <c:set var="resources" scope="session" value="/resources/icons/books.svg"/>
            <c:set var="covers" scope="session" value="/resources/covers/"/>
            <c:set var="icon" scope="session" value="${contextPath}${resources}"/>
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
                <sec:authorize access="hasRole('ADMIN')">
                    <a class="nav-item nav-link active" href="${contextPath}/books/add">Dodaj książkę</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</nav>
<main class="container flex-shrink-0">
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="book" items="${author.books}" >
            <c:url var="edit" value="/books/edit">
                <c:param name="bookId" value="${book.id}"/>
            </c:url>
            <c:url var="delete" value="/books/delete">
                <c:param name="bookId" value="${book.id}"/>
            </c:url>
            <c:url var="details" value="/books/details">
                <c:param name="bookId" value="${book.id}"/>
            </c:url>
            <c:url var="buy" value="/books/buy">
                <c:param name="bookId" value="${book.id}"/>
            </c:url>
            <div class="col-4">
                <div class="card text-white bg-primary h-100">
                    <c:set var="cover" scope="session" value="${contextPath}${covers}${book.cover}"/>
                    <img src="${cover}" class="card-img-top" alt="Tekst alternatywny" width="100%" height="auto">
                    <div class="card-header">
                            ${book.category.name}
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${book.name}</h5>
                        <h6 class="card-subtitle mb-2">${book.publisher}</h6>
                        <c:choose>
                            <c:when test="${book.quantity == -1}">
                                <div>
                                    <p class="card-text">Ilość: nieograniczona</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div>
                                    <p class="card-text">Ilość: ${book.quantity}</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="card-footer">
                        <fmt:formatNumber value = "${book.price}" type = "currency"/>
                        <sec:authorize access="hasRole('USER')"> <a href="${buy}" class="btn btn-success">Kup</a> </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_ADMIN')"> <a href="${edit}" class="btn btn-warning">Edytuj</a> </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_ADMIN')"> <a href="${delete}" class="btn btn-danger">Usuń</a> </sec:authorize>
                        <sec:authorize access="isAuthenticated()"> <a href="${details}" class="btn btn-light">Szczegóły</a> </sec:authorize>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</main>
<footer class="footer mt-auto py-3" style="background-color: #e3f2fd;">
    <div class="container">
        <span class="text-muted">
            Projekt stworzony na zaliczenie przedmiotu Systemy klasy enterprise - persystencje. Wykorzystane ikony zostały wykonane przez <a href="https://www.flaticon.com/authors/payungkead" title="Payungkead">Payungkead</a> i są dostępne na stronie <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
        </span>
    </div>
</footer>
</body>
</html>