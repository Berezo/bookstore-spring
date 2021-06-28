<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 26.05.2021
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Book add</title>
</head>
<nav>
    <div>
        <a href="${pageContext.request.contextPath}">Strona główna</a>
    </div>
</nav>
<body>
<form:form action="add" modelAttribute="book" method="POST">
    <table>
        <tbody>
        <tr>
            <td>  </td>
        </tr>
        <tr>
            <td><label for="name">Nazwa:</label></td>
            <td><form:input path="name"  id="name"/></td>
        </tr>
        <tr>
            <td><label for="publisher">Wydawnictwo:</label></td>
            <td><form:input path="publisher"  id="publisher"/></td>
        </tr>
        <tr>
            <td><label for="price">Cena:</label></td>
            <td><form:input path="price"  id="price"/></td>
        </tr>

        <tr> <%-- Dla kategorii --%>
            <td><label for="category">Kategoria:</label></td>
            <td>
                <form:select path="category">
                    <form:options items="${categories}" itemValue="id" itemLabel="name" />
                </form:select>
            </td>
        </tr>

        <tr> <%-- Dla autorów --%>
            <td><label for="authors">autorzy:</label></td>
        <c:forEach var="author" items="${authors}" >
            <%-- <td><form:checkboxes path="autorzy" items="${authors}" itemValue="id" id="authors"/></td> --%>
            <td><form:checkbox path="authors" value="${author.id}"/>${author.name} ${author.surname}</td></tr> <%-- --%>
        </c:forEach>
        </tr>
        <tr>
            <td>
                <button type="submit" >Zapisz</button>
            </td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>
