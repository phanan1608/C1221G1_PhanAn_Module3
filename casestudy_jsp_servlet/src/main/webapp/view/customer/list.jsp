<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/18/2022
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Customer List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="shortcut icon" href="https://furamavietnam.com/wp-content/uploads/2018/07/favicon.png"
          type="image/x-icon">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <%--    Phân trang--%>
    <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css">

</head>
<body>

<header class="header">
    <div class="header-content">
        <div class="container">
            <div class="row">
                <div class="col-auto col-sm-5 col-lg-3 d-flex align-items-center bestel-logo">
                    <a href="https://furamavietnam.com/vi/" class="header-logo"><img
                            src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png" alt="logo "
                            class="img-fluid" width="63" height="100"></a>
                </div>
                <div class="col col-md-auto col-lg-3 d-flex" style="padding: 1rem">
                    <div class="catalog-widget d-none d-sm-block">
                        <div class="catalog-widget-inside" style="visibility: visible;">
                            <a href="https://www.tripadvisor.com/Hotel_Review-g298085-d302750-Reviews-Furama_Resort_Danang-Da_Nang_Quang_Nam_Province.html"
                               target="_blank">
                                <div class="widget-tripadvisor">
                                    <div class="inside">
                                        <div class="widget-tripadvisor-logo"><img width="200"
                                                                                  src="https://smartdata.tonytemplates.com/bestel/wp-content/uploads/2018/05/widget-tripadvisor-logo.png"
                                                                                  alt=""></div>
                                        <div class="widget-tripadvisor-rating"><img width="100"
                                                                                    src="https://furamavietnam.com/wp-content/uploads/2018/08/widget-tripadvisor-rating.png"
                                                                                    alt=""></div>
                                        <div class="widget-tripadvisor-text">3,529 Reviews</div>
                                    </div>
                                </div>
                            </a>
                            <span class="catalog-widget-toggle js-catalog-widget-toggle"></span></div>
                    </div>
                    <div class="catalog-widget-mobile d-flex d-sm-none align-items-center mx-auto">
                    </div>
                </div>

                <div class="col-sm-3 d-none d-lg-block">
                    <div class="header-contact d-flex">
                        <div class="header-contact-icon" style="padding-top: 1.1rem; padding-right: 0.5rem">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                            </svg>
                        </div>
                        <div class="header-contact-txt">
                            <p style="font-size: 0.85rem;padding-top: 1rem;margin: 0">
                                103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ Hành Sơn, Tp. Đà Nẵng, Việt
                                Nam </p>
                            <p style="font-size: 0.9rem">
                                <span>7.0 km</span> từ Sân bay Quốc tế Đà Nẵng </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3 d-none d-lg-block">
                    <div class="header-contact d-flex">
                        <div class="header-contact-icon" style="padding-top: 1.1rem; padding-right: 0.5rem">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-telephone-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                            </svg>
                        </div>
                        <div class="header-contact-txt">
                            <p class="txt-lg" style="font-size: 0.85rem;padding-top: 1rem;margin: 0">
                                84-236-3847 333/888 </p>
                        </div>
                    </div>
                    <div class="header-contact d-flex">
                        <div class="header-contact-icon" style="padding-top: 1.2rem; padding-right: 0.5rem">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"/>
                            </svg>
                        </div>
                        <div class="header-contact-txt">
                            <p class="txt-lg" style="font-size: 0.9rem;padding-top: 1rem">
                                reservation@furamavietnam.com </p>
                        </div>
                    </div>
                </div>
                <div class="col-auto ml-auto d-flex d-lg-none">
                    <button class="navbar-btn" data-target="#modalNavigation" data-toggle="modal">
                        <i class="icon-menu"></i>
                    </button>
                    <div class="modal fade modal-fullscreen-menu" id="modalNavigation">
                        <button aria-label="Close" class="close" data-dismiss="modal">
                            <i class="icon-close"></i>CLOSE
                        </button>
                        <div class="modal-dialog">
                            <ul id="menu-furama-vi" class="menu navbar-nav w-100 js-main-menu">
                                <li id="nav-menu-item-5006"
                                    class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page">
                                    <a href="https://furamavietnam.com/vi/the-resort/" class="nav-link main-menu-link">GIỚI
                                        THIỆU</a></li>
                                <li id="nav-menu-item-5007"
                                    class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page">
                                    <a href="https://furamavietnam.com/vi/our-rooms/" class="nav-link main-menu-link">LOẠI
                                        PHÒNG</a></li>
                                <li id="nav-menu-item-5008"
                                    class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page">
                                    <a href="https://furamavietnam.com/vi/culinary/" class="nav-link main-menu-link">ẨM
                                        THỰC</a></li>
                                <li id="nav-menu-item-5009"
                                    class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page">
                                    <a href="https://furamavietnam.com/vi/meeting-and-events/"
                                       class="nav-link main-menu-link">HỘI NGHỊ VÀ SỰ KIỆN</a></li>
                                <li id="nav-menu-item-5010"
                                    class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page">
                                    <a href="https://furamavietnam.com/vi/spa-and-fitness/"
                                       class="nav-link main-menu-link">SPA</a></li>
                                <li id="nav-menu-item-5011"
                                    class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page">
                                    <a href="https://furamavietnam.com/vi/recreation/" class="nav-link main-menu-link">GIẢI
                                        TRÍ</a></li>
                                <li id="nav-menu-item-5012"
                                    class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page">
                                    <a href="https://furamavietnam.com/vi/destination/" class="nav-link main-menu-link">ĐIỂM
                                        ĐẾN</a></li>
                                <li id="nav-menu-item-5013"
                                    class="nav-item  menu-item-even menu-item-depth-0 menu-item menu-item-type-post_type menu-item-object-page">
                                    <a href="https://furamavietnam.com/vi/furama-special-offers/"
                                       class="nav-link main-menu-link">ƯU ĐÃI</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: 10px 40px">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link " href="/index.jsp"> Home<span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link " href="/employee"> Employee<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link " href="#" style="color: #EAEF57;"> Customer<span
                            class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link " href="/service"> Service<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link " href="/contract"> Contract<span class="sr-only">(current)</span></a>
                </li>
            </ul>

            <ul class="navbar-nav  ">
                <li class="nav-item" >
                    <form method="get">
                        <div class="input-group d-flex justify-content-center h-100 align-items-center">
                            <input type="text" name="keyword" class="form-control rounded" placeholder="Search"
                                   aria-label="Search"
                                   aria-describedby="search-addon"/>
                            <input type="hidden" name="action" value="search">
                            <span class="input-group-text border-0" id="search-addon">
                            <button class="rounded" type="submit" style="border: none;height: 26px">
                                <svg class="bi bi-search" fill="currentColor" height="16" viewBox="0 0 16 16" width="16"
                                     xmlns="http://www.w3.org/2000/svg">
                                 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </button>

                        </span>


                        </div>
                    </form>

                </li>
            </ul>

        </div>
    </nav>

</header>

<div class="container-fluid p-4 m-0">
    <h1 class="text-center">Customer List</h1>
    <div class="mb-3 ms-0">
        <a class="btn btn-info " href="/customer?action=create">Add New Customer</a>
    </div>
    <div class="container-fluid pl-0">
        <table id="example" class="table table-striped" style="width:100%">
            <thead>
            <tr style="background-color: #069A8E;color: white">
                <th>ID</th>
                <th>Code</th>
                <th>Name</th>
                <th>Birthday</th>
                <th>Gender</th>
                <th>ID Card</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Type</th>
                <th>Function</th>
            </tr>
            </thead>

            <tbody>


            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td><c:out value="${customer.customerId}"/></td>
                    <td><c:out value="${customer.customerCode}"/></td>
                    <td><c:out value="${customer.customerName}"/></td>
                    <td><c:out value="${customer.customerBirthday}"/></td>
                    <td>
                        <c:if test="${customer.customerGender eq 0}">
                            Female
                        </c:if>
                        <c:if test="${customer.customerGender eq 1}">
                            Male
                        </c:if>
                    </td>
                    <td><c:out value="${customer.customerIdCard}"/></td>
                    <td><c:out value="${customer.customerPhone}"/></td>
                    <td><c:out value="${customer.customerEmail}"/></td>
                    <td><c:out value="${customer.customerAddress}"/></td>
                    <td>
                        <c:forEach var="type" items="${customer_type}">
                            <c:if test="${customer.customerTypeId eq type.customerTypeId}">
                                ${type.customerTypeName}
                                <%--                        <c:out value="${type.customerTypeName}"></c:out>--%>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>
                        <a class="btn btn-warning" href="/customer?action=edit&id=${customer.customerId}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd"
                                      d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            </svg>
                        </a>

                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#staticBackdrop"
                                onclick="confirmDelete(${customer.customerId},${customer.customerTypeId},'${customer.customerName}','${customer.customerBirthday}',
                                    ${customer.customerGender},'${customer.customerIdCard}','${customer.customerPhone}',
                                        '${customer.customerEmail}','${customer.customerAddress}' )">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                            </svg>
                            </a>
                        </button>
                    </td>

                </tr>

            </c:forEach>
            </tbody>
        </table>

    </div>

</div>


<footer class="footer">
    <div class="col-sm mt-2 mt-sm-0 text-center">
        <hr>
        <h5>
            Contact US </h5>
        <ul class="icn-list">
            <li>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                    <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                </svg>
                103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam
            </li>
            <li>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-telephone-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                          d="M1.885.511a1.745 1.745 0 0 1 2.61.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                </svg>
                Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666
            </li>
            <li>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-envelope-fill" viewBox="0 0 16 16">
                    <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"/>
                </svg>
                Email: reservation@furamavietnam.com * www.furamavietnam.com
            </li>
        </ul>
        <hr>

    </div>
</footer>


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
                    <h3>Do you want to delete customers with information: </h3>
                    <div id="customer_id"></div>
                    <div id="customer_typeId"></div>
                    <div id="customer_name"></div>
                    <div id="customer_birthday"></div>
                    <div id="customer_gender"></div>
                    <div id="customer_idCard"></div>
                    <div id="customer_phone"></div>
                    <div id="customer_email"></div>
                    <div id="customer_address"></div>

                    <%--gửi id cần xoá lên servlet--%>
                    <input type="hidden" name="id" id="id_delete">
                    <%--gửi action lên servlet--%>
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
<script>
    function confirmDelete(id, typeId, name, birthday, gender, idCard, phone, email, address) {
        document.getElementById("id_delete").value = id;
        document.getElementById("customer_id").innerText = "id: " + id;
        document.getElementById("customer_typeId").innerText = "type Id: " + typeId;
        document.getElementById("customer_name").innerText = "name: " + name;
        document.getElementById("customer_birthday").innerText = "birthday: " + birthday;
        document.getElementById("customer_gender").innerText = "gender: " + gender;
        document.getElementById("customer_idCard").innerText = "id card: " + idCard;
        document.getElementById("customer_phone").innerText = "phone: " + phone;
        document.getElementById("customer_email").innerText = "email: " + email;
        document.getElementById("customer_address").innerText = "address: " + address;

    }
</script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>

<%--Phân trang--%>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $('#example').DataTable({
            "dom": 'lrtip',
        });
    });

</script>