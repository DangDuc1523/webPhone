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

            .info{
                margin: 15px 30%;
                text-align: left;
                border: 5px solid #2d2dd9;
                padding: 20px ;
                border-radius: 10px;
            }

            .info p {
                margin: 0;
            }

            .product{
                background-color: #2d2dd9;
                display: flex;
                justify-content: space-between;
                padding: 0px 30%;

            }

            .tail{
                margin-top: 10px;
                padding: 10px 0px;
                text-align: center;
                background-color: black;
                color: whitesmoke;
            }
        </style>
    </head>
    <body>
        <!-- Thanh thông báo -->
        <div class="task1">
            <img src="img/admin.jpg" alt="Admin">
            <h1 style="color: #2d2dd9"> Add  </h1>
            <a href="LogoutServlet" class="button" >Logout</a>        
        </div>

        <div class="product">
            <a href="ManagerServlet" class="button" >Home</a>
            <a href="StaticServlet" class="button" >Statistical</a>
            <a href="AdminBoughtServlet" class="button" >Orders</a>           
        </div>

        <h2 style="color: #2d2dd9; text-align: center"> Add New Product</h2>

        <!-- Form thêm sản phẩm mới -->
        <form method="post" action="AddServlet">
            <div class="info">
                <p>Model</p> 
                <input type="text" name="model" size="40" required/>
                <p>Ram</p> 
                <input type="text" name="ram" size="40" required />
                <p>Rom</p> 
                <input type="text" name="rom" size="40" required/>
                <p>Chip</p> 
                <input type="text" name="chip" size="40" required/>
                <p>Battery</p> 
                <input type="number" name="battery" size="40" min="0" required />
                <p>Camera</p> 
                <input type="text" name="camera" size="40" required />
                <p>Price</p> 
                <input type="number" step="any" name="price"  size="40" min="0" required /><br>
                <p>URL Image:</p> 
                <input type="text" name="imgProd"  size="40" required /><br>
            </div>

            <input style="margin-left: 47%" type="submit" name="Add New" class="button"/>
        </form>

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
