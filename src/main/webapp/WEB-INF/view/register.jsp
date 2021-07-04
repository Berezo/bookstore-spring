<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 21.06.2021
  Time: 19:28
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
    <h1 class="h3 mb-3 fw-normal">Rejestracja</h1>
    <div class="form-floating">
        <input type="text" class="form-control" id="username" name="username">
        <label for="username">Nazwa użytkownika</label>
    </div>
    <div class="form-floating">
        <input type="password" class="form-control" id="password" name="password">
        <label for="password">Hasło</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="name" name="name">
        <label for="name">Imię</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="surname" name="surname">
        <label for="surname">Nazwisko</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="address" name="address">
        <label for="address">Adres</label>
    </div>
    <div class="form-floating">
        <input type="email" class="form-control" id="email" name="email">
        <label for="email">E-mail</label>
    </div>
    <div class="form-floating">
        <input type="text" class="form-control" id="phone" name="phone">
        <label for="phone">Telefon</label>
    </div>
    <button class="w-100 btn btn-lg btn-primary" type="submit">Zarejestruj</button>
</form:form>
</body>
</html>

<%--<table>--%>
<%--    <tbody>--%>
<%--    <tr>--%>
<%--        <td><label for="username">Nazwa:</label></td>--%>
<%--        <td><form:input path="username" id="username" class="form-control"/></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td><label for="password">Hasło:</label></td>--%>
<%--        <td><form:password path="password" id="password" class="formcontrol"/></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td><label for="name">Imię:</label></td>--%>
<%--        <td><form:input path="name" id="name" class="form-control"/></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td><label for="surname">Nazwisko:</label></td>--%>
<%--        <td><form:input path="surname" id="surname" class="form-control"/></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td><label for="address">Adres:</label></td>--%>
<%--        <td><form:input path="address" id="address" class="form-control"/></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td><label for="email">E-mail:</label></td>--%>
<%--        <td><form:input path="email" id="email" class="form-control"/></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td><label for="phone">Telefon:</label></td>--%>
<%--        <td><form:input path="phone" id="phone" class="form-control"/></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--        <td>--%>
<%--            <button type="submit">Zarejestruj</button>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    </tbody>--%>
<%--</table>--%>
