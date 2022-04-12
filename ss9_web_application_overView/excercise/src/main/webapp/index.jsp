<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/12/2022
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Product Discount Calculator</h1>
  <form action="/display-discount" method="post">
    Product Description: <input type="text" name="product_description">
    List Price: <input type="text" name="list_price">
    Discount Percent: <input type="text" name="discount_percent">
    <button type="submit">Calculate Discount</button>
  </form>
  </body>
</html>
