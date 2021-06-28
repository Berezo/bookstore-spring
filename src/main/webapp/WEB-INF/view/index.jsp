<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 21.06.2021
  Time: 09:14
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
        <a href="${pageContext.request.contextPath}">Strona główna</a>
    </div>
</nav>
<div>
    <sec:authorize access="!isAuthenticated()"><a href="${contextPath}/login">Zaloguj się</a></sec:authorize>
    <sec:authorize access="!isAuthenticated()"><a href="${contextPath}/register">Zarejestruj się</a></sec:authorize>
    <sec:authorize access="isAuthenticated()"> Witaj ${user.username} <a href="${contextPath}/logout">Wyloguj się</a> </sec:authorize>
</div>
<div>
    <input type="button" value="Książki"
           onclick="window.location.href='books/list';return false;" />
    <input type="button" value="Kategorie"
           onclick="window.location.href='categories/list';return false;" />
    <input type="button" value="Autorzy"
           onclick="window.location.href='authors/list';return false;" />
</div>
</body>
</html>
