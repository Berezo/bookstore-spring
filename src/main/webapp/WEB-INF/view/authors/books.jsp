<%--
  Created by IntelliJ IDEA.
  User: dynam
  Date: 21.06.2021
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Details</title>
</head>
<body>
<nav>
    <div>
        <a href="${pageContext.request.contextPath}">Strona główna</a>
    </div>
</nav>
<h2>Autor ${author.name} ${author.surname}</h2>
<c:forEach var="book" items="${author.books}" >
    <div>
        <p>
            Nazwa: ${book.name}
        </p>
    </div>
    <div>
        <p>
            Autorzy: ${book.authors}
        </p>
    </div>
    <div>
        <p>
            Wydawnictwo: ${book.publisher}
        </p>
    </div>
    <div>
        <p>
            Cena: ${book.price}
        </p>
    </div>
    <div>
        <p>
            Kategoria: ${book.category.name}
        </p>
    </div>
    <c:choose>
        <c:when test="${book.quantity} == null">
            <div>
                <p>
                    Ilość: nieograniczona
                </p>
            </div>
        </c:when>
        <c:when test="${book.quantity} != null">
            <div>
                <p>
                    Ilość: ${book.quantity}
                </p>
            </div>
        </c:when>
    </c:choose>
    <div>
        <p>
            Opis: ${book.description}
        </p>
    </div>
    <div>
        <p>
            Okładka: ${book.cover}
        </p>
    </div>
    <div>
        <hr>
    </div>
</c:forEach>
<sec:authorize access="hasRole('ROLE_ADMIN')"> <div> <input type="button" value="Dodaj książkę" onclick="window.location.href='add';return false;" /> </div> </sec:authorize>
</body>
</html>
