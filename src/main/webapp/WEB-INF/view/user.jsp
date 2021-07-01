<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 21.06.2021
  Time: 21:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Home</title>
</head>
<body>
<nav>
    <div>
        <a href="${contextPath}">Strona główna</a>
    </div>
</nav>
<div>
    Witaj <sec:authentication property="name"/>!
</div>
<div>
    <a href="${contextPath}/books/list">Książki</a>
    <a href="${contextPath}/categories/list">Kategorie</a>
    <a href="${contextPath}/authors/list">Autorzy</a>
    <a href="${contextPath}/cart/details">Koszyk</a>
    <a href="${contextPath}/orders/list">Zamówienia</a>
</div>
</html>
