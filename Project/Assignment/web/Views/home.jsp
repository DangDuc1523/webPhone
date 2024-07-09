<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            .banner{
                margin: 50px 13%;
                display: flex; /* Sử dụng flexbox để hiển thị các phần tử theo hàng ngang */
                flex-wrap: wrap; /* Nếu không đủ không gian, các phần tử sẽ tự động bọc xuống hàng mới */
                justify-content: start-between; /* Căn các phần tử theo hai bên của container */
      
            }
            .banner img{
                 width: 300px;
                height: 300px;
                margin: 30px 20px;
                border-radius: 10px;
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
        <!-- Thanh chức năng -->
        <div class="task1">
            <% boolean checklogin = (boolean) request.getAttribute("check"); %>
            <% if (checklogin) { %>
            <!-- Hiển thị nút Logout -->
            <a href="LogoutServlet" class="task">Logout</a>
            <% } else { %>
            <!-- Hiển thị nút Login -->
            <a href="LoginServlet" class="task">Login</a>
            <% } %>

            <!-- Luôn hiển thị các liên kết này -->
            <a href="OrderServlet" class="task">Order</a>
            <a href="ListServlet" class="task">Mobile</a>

        </div>

        <!-- Tên Web và thanh search -->
        <div class="container">
            <div class="title">
                <a href="HomeServlet" style="text-decoration: none;"> <h1>Mobile For You</h1> </a>

                <!-- Thanh Search -->
                <form class="search" action="SearchServlet" method="get">
                    <input type="text" name="query" placeholder="Search...">
                    <button type="submit" class="task">Search</button>
                </form>
                <a href="OrderServlet"><img src="img/order.jpg" alt="Order"> </a>
            </div>

            <!-- Thanh chức năng -->
            <div class="func">
                <% if (checklogin) { %>
                <!-- Hiển thị nút Logout -->
                <a href="LogoutServlet" class="button">Logout</a>
                
                <% } else { %>
                <!-- Hiển thị nút Login -->
                <a href="LoginServlet" class="button">Login</a>
                <% } %>
                
                <!-- Other buttons -->
                <a href="OrderServlet" class="button">Order</a>
                <a href="BoughtServlet" class="button">Bought</a>
                <a href="ListServlet" class="button">Mobile</a>
            </div>
        </div>
        <!-- Banner tai trang chính-->
        <div class="banner" >
            <c:forEach var="lis" begin="0" end="5" items="${list}">
                <div class="detail">
                <a href="DetailPhone?id=${lis.phoneid}" style="  text-decoration: none; font-weight: bold; font-size: 20px;">
                    <img src="${lis.imgProd}" alt="${lis.model}"><br>
                    <p style="text-align: center">${lis.model}</p> 
                    
                </a>
                </div>
            </c:forEach>
        </div>
        
        <!-- Thông tin liên hệ -->
        <div class="tail">
            <div class="connect">
                <h3>Mobile For You</h3>
                <p> Contact for me:</p>
                <a href="https://www.facebook.com/dangduc.504" >Facebook</a>        
                <p>Email: dangduc504@gmail.com</p>
                <p> Address: Hoa Lac, Ha Noi, Viet Nam</p>
                <p> Contact: 0123456789</p>
                <p> Produced by Dang Duck </p>
            </div>
            </div>
        
    </body>
</html>
