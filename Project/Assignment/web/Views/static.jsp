<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

            .task{
                background-color: #2d2dd9;
                display: flex;
                justify-content: space-between;
                padding: 0px 30%;
            }

            .info{
                  margin: 20px 30%;
                  border: 3px solid gray;
                  border-radius: 10px; 
                  padding: 20px;
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
            <img src="img/admin.jpg" alt="Admin">
            <h1 style="color: #2d2dd9"> Statistical </h1>
            <a href="LogoutServlet" class="button" >Logout</a>        
        </div>
        <div class="task">

            <a href="ManagerServlet" class="button" >Home</a>        
            <a href="AdminProductServlet" class="button" >Product</a>
            <a href="AdminBoughtServlet" class="button" >Orders</a>
                    </div>
            <h2 style="text-align: center; color: #2d2dd9">Product and user statistics</h2>
            
            <!-- list: kiểu trả về int, lấy giá trị từ database thông qua StaticServlet-->
        <div class="info">
            
            <c:if test="${not empty list}">
                <h2>Number of product models available: ${list}</h2>
            </c:if>
            <c:if test="${ empty list}">
                <h2>Number of product models is not available</h2>
            </c:if>    
                
            <!-- numberacc: kiểu trả về int, lấy giá trị từ database thông qua StaticServlet-->
            <c:if test="${ not empty numberacc}">
            <h2>Number of customer accounts on the website: ${numberacc}</h2>
            </c:if>          
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
