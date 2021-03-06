<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/14/2022
  Time: 6:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 class="text-center">Create Product</h1>
    <a class="btn btn-primary" href="/product">Back to Product List</a>
    <form method="post">
        <fieldset>
            <legend>Product information</legend>
            <div class="form-group">
                <table class="table table-striped">
                    <tr>
                        <td>Name Product:</td>
                        <td><input class="form-control" type="text" name="name_product" id="name_product"
                                   value="${product.nameProduct}">
                            <p style="color: red">${error.get("nameProduct")} </p></td>
                    </tr>
                    <tr>
                        <td>Price:</td>
                        <td><input  class="form-control" type="number" name="price_product" id="price_product" value="${product.price}">
                        </td>
                    </tr>
                    <tr>

                        <td>Description:</td>
                        <td><input class="form-control" type="text" name="description_product" id="description_product" value="${product.description}">

                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" class="btn btn-primary" value="Create Product"></td>
                    </tr>
                </table>
            </div>
        </fieldset>
    </form>
</div>

</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
