<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/13/2022
  Time: 9:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:choose>
    <c:when test="${message.equals('')}">
        <h2>
            Result: ${first_operand} ${operator} ${second_operand} = ${result}
        </h2>
    </c:when>
    <c:otherwise>
        <h2>
                ${message}
        </h2>
    </c:otherwise>
</c:choose>
</body>
</html>

