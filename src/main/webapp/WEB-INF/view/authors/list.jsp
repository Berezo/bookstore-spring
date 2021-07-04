<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Lista autorów</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/form.css" rel="stylesheet">
</head>
<body class="text-center">
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
    <div class="container-fluid">
        <a class="navbar-brand" href="${contextPath}">
            <c:set var="resources" scope="session" value="/resources/icons/books.svg"/>
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
                    <a class="nav-item nav-link active" href="${contextPath}/authors/add">Dodaj autora</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</nav>
<main class="justify-content-center">
    <ul class="list-group">
        <li class="list-group-item list-group-item-primary active" aria-current="true">Autorzy</li>
        <c:forEach var="author" items="${authors}" >
            <c:url var="edit" value="/authors/edit">
                <c:param name="authorId" value="${author.id}"/>
            </c:url>
            <c:url var="delete" value="/authors/delete">
                <c:param name="authorId" value="${author.id}"/>
            </c:url>
            <c:url var="books" value="/authors/books">
                <c:param name="authorId" value="${author.id}"/>
            </c:url>
            <li class="list-group-item list-group-item-primary">
                    ${author.name} ${author.surname}
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${edit}" class="btn btn-warning">Edytuj</a></td> </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${delete}" class="btn btn-danger">Usuń</a></td> </sec:authorize>
                <sec:authorize access="isAuthenticated()"> <td><a href="${books}" class="btn btn-light">Książki</a></td> </sec:authorize>
            </li>
        </c:forEach>
    </ul>
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

<%--<div>--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>Imię</th>--%>
<%--            <th>Nazwisko</th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="author" items="${authors}" >--%>
<%--            <c:url var="edit" value="/authors/edit">--%>
<%--                <c:param name="authorId" value="${author.id}"/>--%>
<%--            </c:url>--%>
<%--            <c:url var="delete" value="/authors/delete">--%>
<%--                <c:param name="authorId" value="${author.id}"/>--%>
<%--            </c:url>--%>
<%--            <c:url var="books" value="/authors/books">--%>
<%--                <c:param name="authorId" value="${author.id}"/>--%>
<%--            </c:url>--%>
<%--            <tr>--%>
<%--                <td>${author.name}</td>--%>
<%--                <td>${author.surname}</td>--%>
<%--                <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${edit}">Edytuj</a></td> </sec:authorize>--%>
<%--                <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${delete}">Usuń</a></td> </sec:authorize>--%>
<%--                <sec:authorize access="isAuthenticated()"> <td><a href="${books}">Książki</a></td> </sec:authorize>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
