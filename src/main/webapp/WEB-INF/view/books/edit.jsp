<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 26.05.2021
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Edycja książki</title>
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
            </div>
        </div>
    </div>
</nav>
<main class="justify-content-center">
    <form:form action="add" modelAttribute="book" method="POST">
        <h1 class="h3 mb-3 fw-normal">Edycja książki o identyfikatorze ${book.id}</h1>
        <form:hidden path="id"/>
        <div class="form-floating">
            <form:input path="name" id="name" name="name" cssClass="form-control"/>
            <label for="name">Nazwa</label>
        </div>
        <div class="form-floating">
            <form:input path="publisher" id="publisher" name="publisher" cssClass="form-control"/>
            <label for="publisher">Wydawnictwo</label>
        </div>
        <div class="form-floating">
            <form:input path="price" id="price" name="price" cssClass="form-control"/>
            <label for="price">Cena</label>
        </div>
        <div class="form-floating">
            <form:input path="quantity" id="quantity" name="quantity" cssClass="form-control"/>
            <label for="quantity">Ilość</label>
        </div>
        <div class="form-floating">
            <form:textarea path="description" id="description" name="description" class="form-control"/>
            <label for="description">Opis</label>
        </div>
        <div class="form-floating">
            <form:select path="category" cssClass="form-select">
                <form:options items="${categories}" itemValue="id" itemLabel="name" />
            </form:select>
            <label for="category">Kategoria</label>
        </div>
        <div class="checkbox mb-3">
            <label for="authors">Autorzy:</label>
            <br>
            <c:forEach var="author" items="${authors}">
                <form:checkbox path="authors" value="${author.id}"/> ${author.name} ${author.surname}
                <br>
            </c:forEach>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Dodaj</button>
    </form:form>
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

<%--<form:form action="add" modelAttribute="book" method="POST">--%>
<%--    <table>--%>
<%--        <tbody>--%>
<%--        <tr>--%>
<%--            <td><form:hidden path="id"/></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><label for="name">Nazwa:</label></td>--%>
<%--            <td><form:input path="name"  id="name"/></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><label for="publisher">Wydawnictwo:</label></td>--%>
<%--            <td><form:input path="publisher"  id="publisher"/></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td><label for="price">Cena:</label></td>--%>
<%--            <td><form:input path="price"  id="price"/></td>--%>
<%--        </tr>--%>

<%--        <tr> &lt;%&ndash; Dla kategorii  &ndash;%&gt;--%>
<%--            <td><label for="category">Kategoria:</label></td>--%>
<%--            <td>--%>
<%--                <form:select path="category">--%>
<%--                    <form:options items="${categories}" itemValue="id" itemLabel="name" />--%>
<%--                </form:select>--%>
<%--            </td>--%>
<%--        </tr>--%>

<%--        <tr> &lt;%&ndash; Dla autorów &ndash;%&gt;--%>
<%--            <td><label for="authors">autorzy:</label></td>--%>
<%--            <c:forEach var="author" items="${authors}" >--%>
<%--                <td><form:checkbox path="authors" value="${author.id}"/>${author.name} ${author.surname}</td>--%>
<%--            </c:forEach>--%>
<%--                &lt;%&ndash;    <td> <form:select multiple="true" path="authors" id="authors"><form:options items="${authors}" itemValue="id" itemLabel="fullName"/></form:select></td> &ndash;%&gt;--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>--%>
<%--                <button type="submit" >Zapisz</button>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</form:form>--%>