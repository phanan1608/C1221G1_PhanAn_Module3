<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/18/2022
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Create Customer</title>
    <link rel="shortcut icon" href="https://furamavietnam.com/wp-content/uploads/2018/07/favicon.png"
          type="image/x-icon">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css">

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
                    <a class="nav-link " href="#"> Employee<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link " href="#" style="color: #EAEF57;"> Customer<span
                            class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link " href="#"> Service<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link " href="#"> Contract<span class="sr-only">(current)</span></a>
                </li>
            </ul>

            <ul class="navbar-nav ml-auto">
                <li class="nav-item d-flex">
                    <div class="input-group rounded">
                        <form method="get"></form>
                        <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"
                               aria-describedby="search-addon"/>
                        <span class="input-group-text border-0" id="search-addon">
                            <button type="submit" style="border: none">
                                <svg class="bi bi-search" fill="currentColor" height="16" viewBox="0 0 16 16" width="16"
                                     xmlns="http://www.w3.org/2000/svg">
                                 <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </button>

                        </span>
                    </div>

                </li>
            </ul>

        </div>
    </nav>

</header>


<div class="container">
    <h1 class="text-center">Create Customer</h1>
    <h2>
        <a class="btn btn-primary" href="/customer">Back to Customer List</a>
    </h2>
    <div align="center">
        <form method="post">
            <table class="table table-striped">
                <tr>
                    <th class="col-3">Name</th>
                    <td class="col-9">
                        <input class="form-control" type="text" name="name"/>
                    </td>
                </tr>
                <tr>
                    <th>Birthday</th>
                    <td>
                        <input class="form-control" type="date" name="birthday"/>
                    </td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>
                        <select class="form-control" name="gender" id="">
                            <option value="0" >Female</option>
                            <option value="1" >Male</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>ID Card</th>
                    <td>
                        <input class="form-control" type="text" name="id_card"/>
                    </td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td>
                        <input class="form-control" type="text" name="phone"/>
                    </td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>
                        <input class="form-control" type="text" name="email"/>
                    </td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>
                        <input class="form-control" type="text" name="address"/>
                    </td>
                </tr>
                <tr>
                    <th>Type Customer ID</th>
                    <td>
                        <select class="form-control" name="customer_type_id">
                        <c:forEach var="type" items="${customer_type}">
                                <option value="${type.customerTypeId}">${type.customerTypeName}</option>
                        </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button class="btn btn-primary" type="submit">Save</button>
                    </td>
                </tr>
            </table>
        </form>
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

</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
>
</html>
