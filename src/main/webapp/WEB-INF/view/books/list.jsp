<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>List books</title>
</head>
<body>
<div> <a href="/bookstore/">Home</a> </div>
<h2>Książki:</h2>
<div>
    <table>
        <tr>
            <th>Nazwa</th>
            <th>Wydawnictwo</th>
            <th>Cena</th>
            <th>Kategoria</th>
        </tr>
        <c:forEach var="book" items="${books}" >
            <c:url var="edit" value="/books/edit">
                <c:param name="bookId" value="${book.id}"/>
            </c:url>
            <c:url var="delete" value="/books/delete">
                <c:param name="bookId" value="${book.id}"/>
            </c:url>
            <c:url var="details" value="/books/details">
                <c:param name="bookId" value="${book.id}"/>
            </c:url>
            <tr>
                <td>${book.name}</td>
                <td>${book.publisher}</td>
                <td>${book.price}</td>
                <td>${book.category.name}</td>
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${edit}">Edytuj</a></td> </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${delete}">Usuń</a></td> </sec:authorize>
                <sec:authorize access="isAuthenticated()"> <td><a href="${details}">Szczegóły</a></td> </sec:authorize>
            </tr>
        </c:forEach>
    </table>
</div>
<sec:authorize access="hasRole('ROLE_ADMIN')"> <div> <input type="button" value="Dodaj książkę" onclick="window.location.href='add';return false;" /> </div> </sec:authorize>

</body>
</html>