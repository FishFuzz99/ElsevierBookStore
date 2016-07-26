<%@ page import="Models.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Book bookybook = (Book)request.getAttribute("testbook");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book</title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <link href="../../css/shop-homepage.css" rel="stylesheet">
</head>
<body>

    <p>${book.title}</p>
    <p>${book.authors[0]}</p>
    <c:forEach var="listValue" items="${book.authors}">
        <li>${listValue}</li>
    </c:forEach>
    <p>${book.}</p>

</body>
</html>