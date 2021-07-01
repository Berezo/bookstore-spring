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
<h2>Książki:</h2>
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
    <c:when test="${book.quantity == -1}">
        <div>
            <p>
                Ilość: nieograniczona
            </p>
        </div>
    </c:when>
    <c:otherwise>
        <div>
            <p>
                Ilość: ${book.quantity}
            </p>
        </div>
    </c:otherwise>
</c:choose>
<div>
    <p>
        Opis: ${book.description}
    </p>
</div>
<div>
    <c:set var="resources" scope="session" value="/resources/covers/"/>
    <c:set var="cover" scope="session" value="${contextPath}${resources}${book.cover}"/>
    <img src="${cover}" alt="Tekst alternatywny">
</div>
<div>
    <hr>
</div>
<sec:authorize access="hasRole('ROLE_ADMIN')"> <div> <input type="button" value="Dodaj książkę" onclick="window.location.href='add';return false;" /> </div> </sec:authorize>

</body>
</html>