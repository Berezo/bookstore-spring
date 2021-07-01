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
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Lista zamówień</title>
</head>
<body>
<div><a href="${contextPath}">Strona główna</a></div>
<h2>Lista zamówień:</h2>
<div>
    <table>
        <tr>
            <th>Imię i nazwisko</th>
            <th>Data</th>
            <th>Kwota</th>
            <th>Status</th>
        </tr>
        <c:forEach var="orderInfo" items="${orderInfos}" >
            <c:url var="send" value="/orders/send">
                <c:param name="orderId" value="${orderInfo.id}"/>
            </c:url>
            <c:url var="details" value="/orders/details">
                <c:param name="orderId" value="${orderInfo.id}"/>
            </c:url>
            <tr>
                <td>${orderInfo.customerName} ${orderInfo.customerSurname}</td>
                <td>${orderInfo.orderDate}</td>
                <td>${orderInfo.amount}</td>
                <td>${orderInfo.status}</td>
                <c:set var = "status" scope = "session" value = "zlozono"/>
                <c:if test = "${orderInfo.status == status}">
                    <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${send}">Wyślij</a></td> </sec:authorize>
                </c:if>
                <sec:authorize access="isAuthenticated()"> <td><a href="${details}">Szczegóły</a></td> </sec:authorize>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
