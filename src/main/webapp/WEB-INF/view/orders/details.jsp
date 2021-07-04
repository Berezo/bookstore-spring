<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 01.07.2021
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Zamówienia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/grid.css" rel="stylesheet">
</head>
<body>
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
<main style="height: auto">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h3 class="h1 mb-3 fw-normal">Zamówienie</h3>
            </div>
            <div class="col-12">
                <h3 class="h3 mb-3 fw-normal">Dane podstawowe</h3>
                <ul class="list-group">
                    <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Id: ${order.id}</li>
                    <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Data: ${order.orderDate}</li>
                    <li class="list-group-item " style="border: 0; background-color: #f5f5f5">
                        Kwota: <fmt:formatNumber value = "${order.amount}" type = "currency"/>
                    </li>
                    <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Status: ${order.status}</li>
                </ul>
            </div>
            <div class="col-12">
                <h3 class="h3 mb-3 fw-normal">Dane zamawiającego</h3>
                <ul class="list-group">
                    <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Imie: ${order.user.name}</li>
                    <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Nazwisko: ${order.user.surname}</li>
                    <li class="list-group-item " style="border: 0; background-color: #f5f5f5">E-mail: ${order.user.email}</li>
                    <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Telefon: ${order.user.phone}</li>
                    <li class="list-group-item " style="border: 0; background-color: #f5f5f5">Adres: ${order.user.address}</li>
                </ul>
            </div>
            <div class="col-12">
                <h3 class="h3 mb-3 fw-normal">Produkty</h3>
            </div>
            <div class="col-4 themed-grid-col">
                Nazwa
            </div>
            <div class="col-3 themed-grid-col">
                Ilość
            </div>
            <div class="col-3 themed-grid-col">
                Cena detaliczna
            </div>
            <div class="col-2 themed-grid-col">
                Kwota
            </div>
            <c:forEach var="orderDetailInfo" items="${orderDetailInfos}" >
                <div class="col-4 themed-grid-col">
                    ${orderDetailInfo.productName}
                </div>
                <div class="col-3 themed-grid-col">
                        ${orderDetailInfo.quantity}
                </div>
                <div class="col-3 themed-grid-col">
                    <fmt:formatNumber value = "${orderDetailInfo.price}" type = "currency"/>
                </div>
                <div class="col-2 themed-grid-col">
                    <fmt:formatNumber value = "${orderDetailInfo.amount}" type = "currency"/>
                </div>
            </c:forEach>
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

<%--<h3>Szczegóły zamówienia</h3>--%>
<%--<h5>Dane postawowe</h5>--%>
<%--<div>--%>
<%--    <table>--%>
<%--        <tbody>--%>
<%--        <tr>--%>
<%--            <td>Id: ${order.id}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Data: ${order.orderDate}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Kwota: ${order.amount}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Status: ${order.status}</td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Zamawiający: ${order.user.name} ${order.user.surname}</td>--%>
<%--        </tr>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</div>--%>
<%--<div>--%>
<%--    <h5>Dane szcegółowe</h5>--%>
<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>Nazwa</th>--%>
<%--            <th>Ilosc</th>--%>
<%--            <th>Cena detaliczna</th>--%>
<%--            <th>Kwota</th>--%>
<%--        </tr>--%>
<%--        <c:forEach var="orderDetailInfo" items="${orderDetailInfos}" >--%>
<%--            <tr>--%>
<%--                <td>${orderDetailInfo.productName}</td>--%>
<%--                <td>${orderDetailInfo.quantity}</td>--%>
<%--                <td>${orderDetailInfo.price}</td>--%>
<%--                <td>${orderDetailInfo.amount}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>
