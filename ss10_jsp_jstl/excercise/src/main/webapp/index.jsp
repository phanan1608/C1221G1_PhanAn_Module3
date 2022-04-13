<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/13/2022
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <form action="/calculator-servlet" method="get">
        <h1 class="text-center">Simple Calculator</h1>
        <div class="form-group">
            <label for="first_operand">First Operand</label>
            <input type="text" class="form-control" id="first_operand" name="first_operand">
        </div>

        <div class="form-group">
            <label for="operator_input">Operator</label>
            <select class="form-control" name="operator" id="operator_input">
                <option value="+">addtion</option>
                <option value="-">subtraction</option>
                <option value="*">multiplication</option>
                <option value="/">division</option>
            </select>
        </div>

        <div class="form-group">
            <label for="second_operand">Second Operand</label>
            <input type="text" class="form-control" id="second_operand" name="second_operand">
        </div>

        <div class="d-flex justify-content-center">
            <input class="btn btn-primary" type="submit" value="Submit">
        </div>

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
