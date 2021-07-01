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
</head>
<body>
<nav>
    <div>
        <a href="${pageContext.request.contextPath}">Strona główna</a>
    </div>
</nav>
<h2>Wysłanie zamówienia</h2>
<div>
    <h3>Dane podstawowe:</h3>
    <form:form action="send" modelAttribute="order" method="POST">
        <table>
            <tbody>
            <tr>
                <td>Id: ${order.id}</td>
                <td><form:hidden path="id"/></td>
            </tr>
            <tr>
                <td><label for="orderDate">Data:</label></td>
<%--                    <form:input class="hideinput" path="orderDate" disabled="true" />--%>
                <td>
                    <form:select path="orderDate" id="orderDate">
                        <option value="${order.orderDate}">
                            <fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss.SSS" />
                        </option>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>Kwota: ${order.amount}</td>
                <td><form:hidden path="amount"/></td>
            </tr>
            <tr>
                <td>Status: ${order.status}</td>
                <td><form:hidden path="status"/></td>
            </tr>
            <tr>
                <td>Zamawiający: ${order.user.name} ${order.user.surname}</td>
                <td><form:hidden path="user" id="user" value="${order.user.username}"/></td>
            </tr>
            <tr>
                <td>
                    <button type="submit" >Wyślij</button>
                </td>
            </tr>
            </tbody>
        </table>
    </form:form>
</div>
</body>
</html>
