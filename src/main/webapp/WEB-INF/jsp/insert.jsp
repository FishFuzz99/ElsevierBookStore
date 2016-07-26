<%@ page import="Models.Book" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: GRAY1
  Date: 7/20/2016
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Book bookybook = (Book)request.getAttribute("testbook");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <p>${book.title}</p>
    <p>${book.authors[0]}</p>
    <c:forEach var="listValue" items="${book.authors}">
        <li>${listValue}</li>
    </c:forEach>


</body>
</html>
