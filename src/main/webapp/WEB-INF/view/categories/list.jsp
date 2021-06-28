<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>List categories</title>
</head>
<body>
<div> <a href="/bookstore/">Home</a> </div>
<h2>Kategorie:</h2>
<div>
    <table>
        <tr>
            <th>ID</th>
            <th>Nazwa</th>
        </tr>
        <c:forEach var="category" items="${categories}" >
            <c:url var="edit" value="/categories/edit">
                <c:param name="categoryId" value="${category.id}"/>
            </c:url>
            <c:url var="delete" value="/categories/delete">
                <c:param name="categoryId" value="${category.id}"/>
            </c:url>
            <c:url var="books" value="/categories/books">
                <c:param name="categoryId" value="${category.id}"/>
            </c:url>
            <tr>
                <td>${category.id}</td>
                <td>${category.name}</td>
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${edit}">Edytuj</a></td> </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${delete}">Usuń</a></td> </sec:authorize>
                <sec:authorize access="isAuthenticated()"> <td><a href="${books}">Książki</a></td> </sec:authorize>
            </tr>
        </c:forEach>
    </table>
</div>
<sec:authorize access="hasRole('ROLE_ADMIN')"> <div> <input type="button" value="Dodaj kategorię" onclick="window.location.href='add';return false;" /> </div> </sec:authorize>
</body>
</html>
