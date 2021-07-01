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
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Zamówienia</title>
</head>
<body>
<nav>
    <div>
        <a href="${contextPath}">Strona główna</a>
    </div>
</nav>
<h3>Szczegóły zamówienia</h3>
<h5>Dane postawowe</h5>
<div>
    <table>
        <tbody>
        <tr>
            <td>Id: ${order.id}</td>
        </tr>
        <tr>
            <td>Data: ${order.orderDate}</td>
        </tr>
        <tr>
            <td>Kwota: ${order.amount}</td>
        </tr>
        <tr>
            <td>Status: ${order.status}</td>
        </tr>
        <tr>
            <td>Zamawiający: ${order.user.name} ${order.user.surname}</td>
        </tr>
        </tbody>
    </table>
</div>
<div>
    <h5>Dane szcegółowe</h5>
    <table>
        <tr>
            <th>Nazwa</th>
            <th>Ilosc</th>
            <th>Cena detaliczna</th>
            <th>Kwota</th>
        </tr>
        <c:forEach var="orderDetailInfo" items="${orderDetailInfos}" >
            <tr>
                <td>${orderDetailInfo.productName}</td>
                <td>${orderDetailInfo.quantity}</td>
                <td>${orderDetailInfo.price}</td>
                <td>${orderDetailInfo.amount}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
