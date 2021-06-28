<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 21.06.2021
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Category add</title>
</head>
<body>
<form:form action="add" modelAttribute="category" method="POST">
    <table>
        <tbody>
        <tr>
            <td><form:hidden path="id"/></td>
        </tr>
        <tr>
            <td><label for="name">Nazwa:</label></td>
            <td><form:input path="name"  id="name"/></td>
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
