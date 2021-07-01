<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 30.06.2021
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
<div>
    Koszyk
</div>
<c:choose>
    <c:when test = "${cart == null || cart.cartLines == null || cart.cartLines.isEmpty()}">
        <div>
            <h2>W koszyku nie ma książek.</h2>
            <a href="${contextPath}/books/list">Książki</a>
        </div>
    </c:when>
    <c:otherwise>
        <form:form action="${contextPath}/cart/add" modelAttribute="cart" method="POST">
            <div>
            <table>
            <tr>
                <th>Nazwa</th>
                <th>Wydawnictwo</th>
                <th>Kategoria</th>
                <th>Cena</th>
                <th>Ilość</th>
                <th>Na magazynie</th>
            </tr>
            <c:forEach var="cartLine" items="${cart.cartLines}" varStatus="cartLineInfo">
                    <form:hidden path="cartLines[${cartLineInfo.index}].productInfo.id"/>
                    <tr>
                        <td>
                            ${cartLine.productInfo.name}
                            <form:hidden path="cartLines[${cartLineInfo.index}].productInfo.name"/>
                        </td>
                        <td>
                            ${cartLine.productInfo.publisher}
                            <form:hidden path="cartLines[${cartLineInfo.index}].productInfo.publisher"/>
                        </td>
                        <td>
                            ${cartLine.productInfo.category}
                            <form:hidden path="cartLines[${cartLineInfo.index}].productInfo.category.id"/>
                        </td>
                        <td>
                            ${cartLine.productInfo.price}
                            <form:hidden path="cartLines[${cartLineInfo.index}].productInfo.price"/>
                        </td>
                        <c:choose>
                            <c:when test = "${cartLine.productInfo.category.id == 3 || cartLine.productInfo.category.id == 7}">
                                <td>
                                    ${cartLine.quantity}
                                    <form:hidden path="cartLines[${cartLineInfo.index}].quantity"  id="quantity"/>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>
<%--                                    <label for="cartLines[${cartLineInfo.index}].quantity"></label>--%>
                                    <form:input path="cartLines[${cartLineInfo.index}].quantity"  id="quantity"/>
                                </td>
                            </c:otherwise>
                        </c:choose>
                        <td>
                            <c:if test="${cartLine.productInfo.quantity != -1}">
                                ${cartLine.productInfo.quantity}
                            </c:if>
                        </td>
                        <td>
                            <c:url var="remove" value="/books/remove">
                                <c:param name="bookId" value="${cartLine.productInfo.id}"/>
                            </c:url>
                            <a href="${remove}">Usuń</a>
                        </td>
                    </tr>
            </c:forEach>
            </table>
            </div>
            <button type="submit" >Zmień ilość</button>
            <a href="${contextPath}/books/list">Książki</a>
            <a href="${contextPath}/cart/confirm">Podsumowanie</a>
        </form:form>
    </c:otherwise>
</c:choose>
</body>
</html>
