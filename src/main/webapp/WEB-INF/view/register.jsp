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
</head>
<body>
<nav>
    <div>
        <a href="${contextPath}">Strona główna</a>
    </div>
</nav>
<h3>Rejestracja</h3>
<c:if test="${not empty validator}"><p class="text-danger"><c:out value="${validator}"/></p></c:if>
<form:form method="post" modelAttribute="user">
    <table>
        <tbody>
        <tr>
            <td><label for="username">Nazwa:</label></td>
            <td><form:input path="username" id="username" class="form-control"/></td>
        </tr>
        <tr>
            <td><label for="password">Hasło:</label></td>
            <td><form:password path="password" id="password" class="formcontrol"/></td>
        </tr>
        <tr>
            <td><label for="name">Imię:</label></td>
            <td><form:input path="name" id="name" class="form-control"/></td>
        </tr>
        <tr>
            <td><label for="surname">Nazwisko:</label></td>
            <td><form:input path="surname" id="surname" class="form-control"/></td>
        </tr>
        <tr>
            <td><label for="address">Adres:</label></td>
            <td><form:input path="address" id="address" class="form-control"/></td>
        </tr>
        <tr>
            <td><label for="email">E-mail:</label></td>
            <td><form:input path="email" id="email" class="form-control"/></td>
        </tr>
        <tr>
            <td><label for="phone">Telefon:</label></td>
            <td><form:input path="phone" id="phone" class="form-control"/></td>
        </tr>
        <tr>
            <td>
                <button type="submit">Zarejestruj</button>
            </td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>
