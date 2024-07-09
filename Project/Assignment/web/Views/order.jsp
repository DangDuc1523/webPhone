<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Phone For You</title>
        <style>
            .task1{
                text-align: right;
                background-color: #2d2dd9;
            }
            .title{
                display: flex;
                justify-content: space-between;
                padding: 0px 10%;
            }

            .title img{
                height: 50px;
                width: 50px;
            }

            h1{
                margin-left: 10px ;
                color: black;
            }
            body {
                background-color: whitesmoke;
                background-size: cover; /* Đảm bảo hình ảnh sẽ được hiển thị kích thước phù hợp */
                background-repeat: no-repeat; /* Không lặp lại hình ảnh */

                color: black; /* Màu chữ đen */
                font-family: Arial, sans-serif; /* Font chữ */
                margin: 0; /* Loại bỏ margin */
                padding: 0; /* Loại bỏ padding */
            }
            .container {
                width: 80%;
                margin: 0px auto;
                padding: 0px;

            }

            .task{
                background-color: #2d2dd9;
                color: white; /* Màu chữ trắng */
                padding: 10px 20px;
                border: 10px;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none; /* Loại bỏ gạch chân */
                display: inline-block;
                margin-right: 10px;
                font-weight: bold;
            }

            .button {
                background-color: #2d2dd9;
                color: white;
                padding: 10px 20px;
                border: 10px;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
                display: flex;
                justify-content: center; /* Căn giữa theo chiều ngang */
                align-items: center; /* Căn giữa theo chiều dọc */
                margin-right: 10px;
                font-weight: bold;
            }
            .button:hover {
                background-color: #333333; /* Màu đen nhạt khi hover */
            }
            .search{
                text-align: center;
                padding: 10px;
                border-radius: 5px;

            }
            .func{
                text-align: center;
                background-color:#2d2dd9 ;
                display: flex;
                justify-content: space-between;
                border-radius: 10px;
                padding: 0px 20%;

            }

            h2{
                text-align: center;
            }

            .list {
                display: flex;
                flex-direction: column; /* Hiển thị theo hàng dọc */
                align-items: center; /* Căn giữa theo chiều ngang */
                margin: 0px 10%;
            }



            .phone{
                border: 5px solid #2d2dd9;
                border-radius: 10px;
                padding: 10px;
                margin:10px 0px; /* Căn margin ở trên và dưới để tạo khoảng cách giữa các phần tử */
                width: 80%;
                justify-content: space-between;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                color: black;
            }

            .success{
                text-align: center;
                color: red;
            }


            .tail{
                padding: 10px 0px;
                text-align: center;
                background-color: black;
                color: whitesmoke;
            }


        </style>
    </head>
    <body>
        <!-- Kiểm tra account có tồn tại trong session -->
        <div class="task1">
            <c:if test="${not empty sessionScope.account}">
                <!-- Display username from the account -->
                <a href="LogoutServlet" class="task">Logout</a>
            </c:if>
            <!-- If no account in session, display login button -->
            <c:if test="${empty sessionScope.account}">
                <a href="LoginServlet" class="task">Login</a>
            </c:if>
            <a href="OrderServlet" class="task">Order</a>
            <a href="ListServlet" class="task">Mobile</a>
        </div>


        <div class="container">
            <div class="title">
                <a href="HomeServlet" style="text-decoration: none;"> <h1>Mobile For You</h1> </a>
                <form class="search" action="SearchServlet" method="get">
                    <input type="text" name="query" placeholder="Search...">
                    <button type="submit" class="task">Search</button>
                </form>
                <a href="OrderServlet"><img src="img/order.jpg" alt="Order"> </a>
            </div>

            <!-- Thanh chức năng -->
            <div class="func">
                <c:if test="${not empty sessionScope.account}">
                    <!-- Display username from th e account -->
                    <a href="editAccount" class="button">Hello, ${sessionScope.account.name}!</a>
                </c:if>
                <!-- If no account in session, display login button -->
                <c:if test="${empty sessionScope.account}">
                    <a href="LoginServlet" class="button">Login</a>
                </c:if>
                <!-- Other buttons -->
                <a href="HomeServlet" class="button">Home</a>
                <a href="OrderServlet" class="button">Order</a>
                <a href="BoughtServlet" class="button">Bought</a>
                <a href="ListServlet" class="button">Mobile</a>

            </div>

        </div>

        <h2> List Of Order </h2>

        <!-- list: Kiểu trả về Phone, nhận giá trị từ database thông qua OrderServlet -->
        <div class="list">
            <c:if test="${empty list}">
                <h2 style="color: red">You don't have any orders yet</h2>
            </c:if>

            <div class="phone">


                <table>
                    <thead>
                        <tr>
                            <th>Model</th>
                            <th>Price</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var ="lis" items="${list}">
                            <tr>
                                <td><h3>${lis.model}</h3></td>
                                <td><p>${lis.price}$</p></td>
                                <td><form action="DeleteOrder" method="post">
                                        <input type="hidden" name="idorder" value="${lis.orderid}">
                                        <button type="submit" class="button">Delete</button> 
                                    </form></td>
                                <td><form action="OrderServlet" method="post">
                                        <input type="hidden" name="idorder" value="${lis.orderid}">
                                        <input type="hidden" name="userid" value="${lis.userid}">
                                        <input type="hidden" name="phoneid" value="${lis.phoneid}">
                                        <input type="hidden" name="price" value="${lis.price}">
                                        <button type="submit" class="button">Buy</button> 
                                    </form></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="tail">
            <h3>Mobile For You</h3>
            <a href="ListServlet" >Mobile</a>
            <p> Contact for me:</p>
            <a href="https://www.facebook.com/dangduc.504" >Facebook</a>        
            <p>Email: dangduc504@gmail.com</p>
            <p> Produced by Dang Duck </p>
        </div>



    </body>
</html>
