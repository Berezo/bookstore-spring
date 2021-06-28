<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 21.06.2021
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Author add</title>
</head>
<body>
<form:form action="add" modelAttribute="author" method="POST">
    <table>
        <tr>
            <td><label for="name">Imię:</label></td>
            <td><form:input path="name"  id="name"/></td>
        </tr>
        <tr>
            <td><label for="surname">Nazwisko:</label></td>
            <td><form:input path="surname"  id="surname"/></td>
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
