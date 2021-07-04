<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 21.06.2021
  Time: 19:27
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
    <title>Logowanie</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="${contextPath}/resources/css/login.css" rel="stylesheet">
</head>
<body class="text-center">
<main class="form-signin">
    <c:if test="${(param.error != null) && (not empty SPRING_SECURITY_LAST_EXCEPTION)}">
        <p><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/></p>
    </c:if>
    <form:form method="post">
        <c:set var="resources" scope="session" value="/resources/icons/books.svg"/>
        <c:set var="icon" scope="session" value="${contextPath}${resources}"/>
        <a href="${contextPath}">
            <img class="mb-4" src="${icon}" alt="" width="100" height="100">
        </a>
        <h1 class="h3 mb-3 fw-normal">Logowanie</h1>
        <div class="form-floating">
            <input type="text" class="form-control" id="username" name="username">
            <label for="username">Nazwa użytkownika</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="password" name="password">
            <label for="password">Hasło</label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Zaloguj</button>
    </form:form>
</main>
</body>
</html>
