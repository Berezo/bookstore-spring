<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 01.07.2021
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Wysyłanie zamówienia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/form.css" rel="stylesheet">
</head>
<body class="text-center" style="height: 100%;">
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
<main class="justify-content-center" style="height: 78%;">
    <form:form action="send" modelAttribute="order" method="POST">
        <h1 class="h3 mb-3 fw-normal">Wysyłka zamówienia o identyfikatorze ${order.id}</h1>
        <form:hidden path="id"/>
        <div class="form-floating">
            <form:select path="orderDate" id="orderDate" cssClass="form-select" disabled="true">
                <option value="${order.orderDate}">
                    <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
                </option>
            </form:select>
            <label for="orderDate">Data zamówienia</label>
        </div>
        <div class="form-floating">
            <form:hidden path="amount"/>
            <p>
                Kwota: <fmt:formatNumber value = "${order.amount}" type = "currency"/>
            </p>
        </div>
        <div class="form-floating">
            <form:input path="status" id="status" name="status" cssClass="form-control" disabled="true"/>
            <label for="status">Status</label>
        </div>
        <div class="form-floating">
            <form:hidden path="user" id="user" value="${order.user.username}" cssClass="form-control"/>
            <p>Zamawiający: ${order.user.name} ${order.user.surname}</p>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Wyślij</button>
    </form:form>
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
<%--    <h3>Dane podstawowe:</h3>--%>
<%--    <form:form action="send" modelAttribute="order" method="POST">--%>
<%--        <table>--%>
<%--            <tbody>--%>
<%--            <tr>--%>
<%--                <td>Id: ${order.id}</td>--%>
<%--                <td><form:hidden path="id"/></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><label for="orderDate">Data:</label></td>--%>
<%--                    &lt;%&ndash;                    <form:input class="hideinput" path="orderDate" disabled="true" />&ndash;%&gt;--%>
<%--                <td>--%>
<%--                    <form:select path="orderDate" id="orderDate">--%>
<%--                        <option value="${order.orderDate}">--%>
<%--                            <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />--%>
<%--                        </option>--%>
<%--                    </form:select>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Kwota: ${order.amount}</td>--%>
<%--                <td><form:hidden path="amount"/></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Status: ${order.status}</td>--%>
<%--                <td><form:hidden path="status"/></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>Zamawiający: ${order.user.name} ${order.user.surname}</td>--%>
<%--                <td><form:hidden path="user" id="user" value="${order.user.username}"/></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <button type="submit" >Wyślij</button>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </form:form>--%>
<%--</div>--%>