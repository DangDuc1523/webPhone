<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="Models.Account" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Phone For You</title>
        <style>

            .task1{
                display: flex;
                justify-content: space-between;
                margin: 10px 0px;
                padding: 20px 0px;
            }

            .task1 img{
                height: 100px;
                width: 100px;
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
                margin: 0px 20px; /* Loại bỏ margin */
                padding: 0; /* Loại bỏ padding */
            }
            .container {
                width: 80%;
                margin: 0px auto;
                padding: 0px;


            }
            .button {
                background-color: #2d2dd9;
                color: white; /* Màu chữ trắng */
                padding: 10px 20px;
                border: 10px;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none; /* Loại bỏ gạch chân */
                margin-right: 10px;
                font-weight: bold;
            }
            .button:hover {
                background-color: #333333; /* Màu đen nhạt khi hover */
            }

            .product{
                background-color: #2d2dd9;
                display: flex;
                justify-content: space-between;
                padding: 0px 30%;
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
        <div class="task1">
            
            <!-- acc : nhận giá trị của account trong session
                   username : nhận giá trị getName của account thông qua acc.getName()
            -->
            <%
               Account acc = (Account) session.getAttribute("account");
               String username = acc != null ? acc.getName() : "";
            %>
            
            <!-- Hiển thị tên của người dùng -->
            <img src="img/admin.jpg" alt="Admin">
            <h1>Hello, <%= username %>!</h1>
            <a href="LogoutServlet" class="button" >Logout</a>        
        </div>
            
            <!-- Chức năng khác -->
        <div class="product">
            <a href="HomeServlet" class="button" >Back to store</a> 
            <a href="StaticServlet" class="button" >Statistical</a> 
            <a href="AdminProductServlet" class="button" >Product</a>
            <a href="AdminBoughtServlet" class="button" >Orders</a>

        </div>
            <!-- Thông báo đấy là trang chính của Admin và các quyền -->
        <div class="info">
            <h2 style="text-align: center; color: #2d2dd9">Welcome</h2><br>
            <h2 style="text-align: center; color: #2d2dd9; margin-top: 0px">Function for Admin: Statistical, Add Product, Edit Product, Delete Product</h2><br>        
            
        </div>
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

    </body>
</html>
