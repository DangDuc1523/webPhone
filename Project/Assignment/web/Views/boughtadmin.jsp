<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
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

            h2{
                text-align: center;
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

            .add{
                align-items: center;
            }

            .add a{
                margin-left: 47%;
            }

            .product{
                background-color: #2d2dd9;
                display: flex;
                justify-content: space-between;
                padding: 0px 30%;
            }

            .list {

                display: flex; /* Sử dụng flexbox để hiển thị các phần tử theo hàng ngang */
                flex-wrap: wrap; /* Nếu không đủ không gian, các phần tử sẽ tự động bọc xuống hàng mới */

                margin: 0px 10%;
            }

            .phone {
                flex: 0 1 24%; /* Định kích thước cho mỗi phần tử, 24% chiếm 1/4 chiều rộng của container */
                border: 5px solid #2d2dd9;
                border-radius: 10px;
                padding: 10px;
                margin: 20px 35px; /* Căn margin ở trên và dưới để tạo khoảng cách giữa các phần tử */
                text-align: center;
            }
            .phone h3 {
                margin-top: 10px;
            }

            .phone p {
                margin-bottom: 10px;
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
        <!-- Thanh hiển thị thông tin Admin và Logout -->
        <div class="task1">
            <img src="img/admin.jpg" alt="Admin">
            <h1 style="color: #2d2dd9"> Orders </h1>
            <a href="LogoutServlet" class="button" >Logout</a>        
        </div>

        <!-- Thanh chức năng -->
        <div class="product">
            <a href="ManagerServlet" class="button" >Home</a> 
            <a href="StaticServlet" class="button" >Statistical</a> 
            <a href="AdminProductServlet" class="button" >Product</a>

        </div>

        <!-- Danh sách đơn hàng cần xử lý -->
        <div class="add">
            <h2> List Order </h2>
        </div>
        <div class="list">

            <!-- lis : nhận giá trị từ list được gửi từ AdminBoughtServlet -->
            <c:forEach var ="lis" items="${list}">
                <div class="phone">
                    <h3>${lis.model}</h3>
                    <p>${lis.price}$</p>
                    <p>${lis.name}</p>
                    <p>${lis.phonenumber}</p>
                    <p>${lis.address}</p>

                    <!-- Gửi các giá trị tới AdminBoughtServlet với method doPost -->
                    <form action="AdminBoughtServlet" method="post">
                        <input type="hidden" name="id" value="${lis.boughtid}">
                        <input type="hidden" name="process" value="${lis.processed}">

                        <!-- Thay đỏio tình trạng đơn hàng -->
                        <c:if test="${lis.processed == 1}">
                            <button class="button">Processing</button>
                        </c:if>

                        <c:if test="${lis.processed == 2}">
                            <p style="color: red">Order Success</p>
                            <button class="button">Transport</button>
                        </c:if>
                        </form>   
                            
                        <c:if test="${lis.processed == 3}">
                            <p style="color: red">Order Success</p>
                            <button class="button">Shipping</button>
                        </c:if>   
                         <c:if test="${lis.processed == 4}">
                            <p style="color: red">Order Success</p>
                            <button class="button">Successful delivery</button>
                        </c:if>
                            
                   
                </div>    

            </c:forEach>
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
