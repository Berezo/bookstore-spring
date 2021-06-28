<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>List books</title>
</head>
<body>
<nav>
    <div>
        <a href="${pageContext.request.contextPath}">Strona główna</a>
    </div>
</nav>
<h2>Autorzy:</h2>
<div>
    <table>
        <tr>
            <th>Imię</th>
            <th>Nazwisko</th>
        </tr>
        <c:forEach var="author" items="${authors}" >
            <c:url var="edit" value="/authors/edit">
                <c:param name="authorId" value="${author.id}"/>
            </c:url>
            <c:url var="delete" value="/authors/delete">
                <c:param name="authorId" value="${author.id}"/>
            </c:url>
            <c:url var="books" value="/authors/books">
                <c:param name="authorId" value="${author.id}"/>
            </c:url>
            <tr>
                <td>${author.name}</td>
                <td>${author.surname}</td>
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${edit}">Edytuj</a></td> </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <td><a href="${delete}">Usuń</a></td> </sec:authorize>
                <sec:authorize access="isAuthenticated()"> <td><a href="${books}">Książki</a></td> </sec:authorize>
            </tr>
        </c:forEach>
    </table>
</div>
<sec:authorize access="hasRole('ROLE_ADMIN')"> <div> <input type="button" value="Dodaj autora" onclick="window.location.href='add';return false;" /> </div> </sec:authorize>
</body>
</html>