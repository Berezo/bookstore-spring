<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 04.07.2021
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Rejestracja</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/login.css" rel="stylesheet">
</head>
<body class="text-center">
<main class="form-signin">
    <c:if test="${not empty validator}">
    <p class="text-danger"><c:out value="${validator}"/></p>
    </c:if>
    <form:form method="post" modelAttribute="user">
        <c:set var="resources" scope="session" value="/resources/icons/books.svg"/>
        <c:set var="icon" scope="session" value="${contextPath}${resources}"/>
    <a href="${contextPath}">
        <img class="mb-4" src="${icon}" alt="" width="100" height="100">
    </a>
    <h3 class="h3 mb-3 fw-normal">Zmiana danych osobowych użytkownika ${user.username}</h3>
    <div class="form-floating">
        <form:hidden path="password"/>
    </div>
    <div class="form-floating">
        <form:input path="name" id="name" name="name" cssClass="form-control"/>
        <label for="name">Imię</label>
    </div>
    <div class="form-floating">
        <form:input path="surname" id="surname" name="surname" cssClass="form-control"/>
        <label for="surname">Nazwisko</label>
    </div>
    <div class="form-floating">
        <form:input path="address" id="address" name="address" cssClass="form-control"/>
        <label for="address">Adres</label>
    </div>
    <div class="form-floating">
        <form:input path="email" id="email" name="email" cssClass="form-control"/>
        <label for="email">E-mail</label>
    </div>
    <div class="form-floating">
        <form:input path="phone" id="phone" name="phone" cssClass="form-control"/>
        <label for="phone">Telefon</label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Zmień</button>
    </form:form>
</body>
</html>
