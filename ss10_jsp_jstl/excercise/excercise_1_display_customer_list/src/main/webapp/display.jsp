<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/13/2022
  Time: 9:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Display</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container text-align-center">
    <h1 class="text-center$">Danh sách khách hàng</h1>
    <table class="table">
        <tr>
            <th scope="col">Tên</th>
            <th scope="col">Ngày sinh</th>
            <th scope="col">Giới tính</th>
            <th scope="col">Địa chỉ</th>
            <th scope="col">Điểm</th>
            <th scope="col">Xếp hạng</th>
            <th scope="col">Ảnh</th>
        </tr>
        <c:forEach var="customer" items="${customer_list}">
            <tr>
                <td>${customer.getName()}</td>
                <td>${customer.getDayOfBirth()}</td>
                    <%--                <c:choose>--%>
                    <%--                    <c:when test="${customer.getGender() eq 1}">--%>
                    <%--                        <td>Nam</td>--%>
                    <%--                    </c:when>--%>
                    <%--                    <c:otherwise>--%>
                    <%--                        <td>Nữ</td>--%>
                    <%--                    </c:otherwise>--%>
                    <%--                </c:choose>--%>
                <c:if test="${customer.getGender() eq 1}">
                    <td>Nam</td>
                </c:if>
                <c:if test="${customer.getGender() eq 0}">
                    <td>Nữ</td>
                </c:if>
                <td>${customer.getAddress()}</td>
                <td>${customer.getScore()}</td>
                <c:choose>
                    <c:when test="${customer.getScore()>8.5}">
                        <td>Giỏi</td>
                    </c:when>
                    <c:when test="${customer.getScore()>7}">
                        <td>Tốt</td>
                    </c:when>
                    <c:when test="${customer.getScore()>5.5}">
                        <td>Khá</td>
                    </c:when>
                    <c:otherwise>
                        <td>Trung bình</td>
                    </c:otherwise>
                </c:choose>

                <td><img width="150" src="${customer.getImageLink()}" alt=""></td>
            </tr>
        </c:forEach>
    </table>
</div>


</body>
</html>
