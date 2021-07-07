<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 01.07.2021
  Time: 13:46
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
    <title>Lista zamówień</title>
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
                <h1 class="h1 mb-3 fw-normal">Lista zamówień</h1>
            </div>
            <div class="col-3 themed-grid-col">
                Imię i nazwisko
            </div>
            <div class="col-3 themed-grid-col">
                Data
            </div>
            <div class="col-2 themed-grid-col">
                Kwota
            </div>
            <div class="col-1 themed-grid-col">
                Status
            </div>
            <div class="col-3 themed-grid-col">
            </div>
            <c:forEach var="orderInfo" items="${orderInfos}" >
                <c:url var="send" value="/orders/send">
                    <c:param name="orderId" value="${orderInfo.id}"/>
                </c:url>
                <c:url var="details" value="/orders/details">
                    <c:param name="orderId" value="${orderInfo.id}"/>
                </c:url>
                <div class="col-3 themed-grid-col">
                    ${orderInfo.customerName} ${orderInfo.customerSurname}
                </div>
                <div class="col-3 themed-grid-col">
                    ${orderInfo.orderDate}
                </div>
                <div class="col-2 themed-grid-col">
                    <fmt:formatNumber value = "${orderInfo.amount}" type = "currency"/>
                </div>
                <div class="col-1 themed-grid-col">
                    ${orderInfo.status}
                </div>
                <div class="col-3 themed-grid-col">
                    <c:set var = "status" scope = "session" value = "zlozono"/>
                    <sec:authorize access="isAuthenticated()"><a href="${details}" class="btn btn-primary">Szczegóły</a> </sec:authorize>
                    <c:if test = "${orderInfo.status == status}">
                        <sec:authorize access="hasRole('ROLE_ADMIN')"> <a href="${send}" class="btn btn-success">Wyślij</a> </sec:authorize>
                    </c:if>
                </div>
            </c:forEach>
        </div>
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

<%--<div>--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>Imię i nazwisko</th>--%>
<%--            <th>Data</th>--%>
<%--            <th>Kwota</th>--%>
<%--            <th>Status</th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="orderInfo" items="${orderInfos}" >--%>
<%--            <c:url var="send" value="/orders/send">--%>
<%--                <c:param name="orderId" value="${orderInfo.id}"/>--%>
<%--            </c:url>--%>
<%--            <c:url var="details" value="/orders/details">--%>
<%--                <c:param name="orderId" value="${orderInfo.id}"/>--%>
<%--            </c:url>--%>
<%--            <tr>--%>
<%--                <td>${orderInfo.customerName} ${orderInfo.customerSurname}</td>--%>
<%--                <td>${orderInfo.orderDate}</td>--%>
<%--                <td>${orderInfo.amount}</td>--%>
<%--                <td>${orderInfo.status}</td>--%>
<%--                <c:set var = "status" scope = "session" value = "zlozono"/>--%>
<%--                <c:if test = "${orderInfo.status == status}">--%>
<%--                    <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${send}">Wyślij</a></td> </sec:authorize>--%>
<%--                </c:if>--%>
<%--                <sec:authorize access="isAuthenticated()"> <td><a href="${details}">Szczegóły</a></td> </sec:authorize>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
