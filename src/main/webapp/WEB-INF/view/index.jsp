<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 21.06.2021
  Time: 09:14
  To change this template use File | Settings | File Templates.
  Icons made by <a href="https://www.flaticon.com/authors/payungkead" title="Payungkead">Payungkead</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Strona główna</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="d-flex flex-column min-vh-100">
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
            </div>
        </div>
    </div>
</nav>
<main class="flex-shrink-0">
    <br>
    <div class="container">
        <div class="card text-white bg-primary">
            <div class="card-body">
                <h5 class="card-title">Książki</h5>
                <h6 class="card-subtitle mb-2 text-muted"></h6>
                <p class="card-text">W tym segemencie użytkownik ma dostęp do wszystkich książek, które może zakupić w naszej księgarni.</p>
                <sec:authorize access="isAuthenticated()">
                    <a href="${contextPath}/books/list" class="btn btn-light">Przejdź</a>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                    <p class="card-text">Dostęp tylko dla zalogowanych użytkowników. Zaloguj bądź zarejestruj się z linków powyżej.</p>
                </sec:authorize>
            </div>
        </div>
        <br>
        <div class="card text-white bg-primary">
            <div class="card-body">
                <h5 class="card-title">Kategorie</h5>
                <h6 class="card-subtitle mb-2 text-muted"></h6>
                <p class="card-text">W tym segemencie użytkownik ma dostęp do wszystkich kategorii, na jakie są podzielone książki. Po naciśnięciu na kategorie w następnej stronie. Książki zostaną odfiltrowane tylko do danej kategorii.</p>
                <sec:authorize access="isAuthenticated()">
                    <a href="${contextPath}/categories/list" class="btn btn-light">Przejdź</a>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                    <p class="card-text">Dostęp tylko dla zalogowanych użytkowników. Zaloguj bądź zarejestruj się z linków powyżej.</p>
                </sec:authorize>
            </div>
        </div>
        <br>
        <div class="card text-white bg-primary">
            <div class="card-body">
                <h5 class="card-title">Autorzy</h5>
                <h6 class="card-subtitle mb-2 text-muted"></h6>
                <p class="card-text">W tym segemencie użytkownik ma dostęp do wszystkich autorów, których książki znajdują się w księgarni. Po naciśnięciu na danego autora w następnej stronie. Książki zostaną odfiltrowane tylko do danego autora.</p>
                <sec:authorize access="isAuthenticated()">
                    <a href="${contextPath}/authors/list" class="btn btn-light">Przejdź</a>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                    <p class="card-text">Dostęp tylko dla zalogowanych użytkowników. Zaloguj bądź zarejestruj się z linków powyżej.</p>
                </sec:authorize>
            </div>
        </div>
        <br>
        <div class="card text-white bg-primary">
            <div class="card-body">
                <h5 class="card-title">Koszyk</h5>
                <h6 class="card-subtitle mb-2 text-muted"></h6>
                <p class="card-text">W tym segemencie użytkownik ma dostęp do koszyka, w którym zapisane są wszystkie pozycje wybrane do zakupu przez użytkownika. Po przejściu na stronę można modyfikować zawartość koszyka lub potwierdzić zakup</p>
                <sec:authorize access="isAuthenticated()">
                    <a href="${contextPath}/cart" class="btn btn-light">Przejdź</a>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                    <p class="card-text">Dostęp tylko dla zalogowanych użytkowników. Zaloguj bądź zarejestruj się z linków powyżej.</p>
                </sec:authorize>
            </div>
        </div>
        <br>
        <div class="card text-white bg-primary" style="padding: 10px;">
            <div class="card-body">
                <h5 class="card-title">Zamówienia</h5>
                <h6 class="card-subtitle mb-2 text-muted"></h6>
                <p class="card-text">W tym segemencie użytkownik ma dostęp do zamówień, które użytkownik w przeszłości realizował. Po przejściu na stronę może przeglądać szczegóły poszczególnych zamówień.</p>
                <sec:authorize access="isAuthenticated()">
                    <a href="${contextPath}/orders/list" class="btn btn-light">Przejdź</a>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                    <p class="card-text">Dostęp tylko dla zalogowanych użytkowników. Zaloguj bądź zarejestruj się z linków powyżej.</p>
                </sec:authorize>
            </div>
        </div>
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
