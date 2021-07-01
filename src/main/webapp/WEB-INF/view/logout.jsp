<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 21.06.2021
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Wylogowywanie</title>
</head>
<body>
<h1>Wylogowałeś się</h1>
<sec:authorize access="!isAuthenticated()"><a href="${contextPath}/login">Zaloguj się</a></sec:authorize>
<sec:authorize access="!isAuthenticated()"><a href="${contextPath}/register">Zarejestruj się</a></sec:authorize>
<sec:authorize access="isAuthenticated()"><a href="${contextPath}/logout">Wyloguj się</a></sec:authorize>
</body>
</html>
