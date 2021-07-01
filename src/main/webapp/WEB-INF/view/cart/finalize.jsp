<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 01.07.2021
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Koszyk finalizacja</title>
</head>
<body>
<nav>
    <div>
        <a href="${contextPath}">Strona główna</a>
    </div>
</nav>
<div>
    <h3>Dziękujemy za zamówienie</h3>
    Twoje zamówienie ma numer ${lastOrderedCart.orderNum}
</div>
</body>
</html>
