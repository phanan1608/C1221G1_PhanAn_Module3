<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/14/2022
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 class="text-center">Product management</h1>
    <a class="btn btn-primary" href="/product?action=create" style="margin: 10px 0">Create new product</a>
    <form method="post" action="/product">
        <div class="form-group">
            <div class="form-outline">
                <input name="search_input" type="search" id="form1" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary">
                <a style="color: aliceblue;text-decoration: none" href="/product?action=search"> Search</i>
                </a>
            </button>
        </div>
    </form>

    <table class="table table-striped">
        <tr>
            <th>STT</th>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Description</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="product" items="${products}" varStatus="productStatus">
            <tr>
                <td>${productStatus.count}</td>
                <td>${product.id}</td>
                <td><a href="/product?action=view&id=${product.id}">${product.nameProduct}</a></td>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td><a class="btn btn-info" href="/product?action=edit&id=${product.id}">Edit</a></td>

                    <%--                <td><a class="btn btn-danger" href="/product?action=delete&id=${product.id}">Delete</a></td>--%>

                <!-- Button trigger modal -->
                <td>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#staticBackdrop"
                            onclick="confirmDelete(${product.id},${product.price},'${product.description}')">Delete</a>
                    </button>
                </td>
                <!-- Modal -->

            </tr>
        </c:forEach>
    </table>

</div>
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Delete Confirm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post">
                <div class="modal-body">
                    <h3>Are you sure?</h3>
                    <div id="product_id"></div>
                    <div id="product_price"></div>
                    <div id="product_description"></div>
<%--                    <input type="text" name="id" id="product_price">--%>
<%--                    <input type="text" name="id" id="product_description">--%>

                    <%--                    gửi action lên servlet--%>
                    <input type="hidden" name="action" value="delete">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Yes</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
<script>
    function confirmDelete(id, price, description) {
        document.getElementById("product_id").innerText = "id: " + id;
        document.getElementById("product_price").innerText = "price: " + price;
        document.getElementById("product_description").innerText = "description: " + description;
    }
</script>