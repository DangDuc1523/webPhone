<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
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
        .button {
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
        .custom-div {
            background-image: url('img/back.jpg');
            border: 2px solid gray; /* Viền */
            border-radius: 10px; /* Bo tròn góc */
            margin: 80px 30% 200px 30%;
            text-align: center; /* Căn giữa nội dung theo chiều ngang */
            color: black; /* Màu chữ */
            font-family: Arial, sans-serif; /* Font chữ */
            padding: 10px;
        }

        .input{
            margin-left: 10px;
            width: 100px;
        }

        .tail{
            padding: 10px 0px;
            text-align: center;
            background-color: black;
            color: whitesmoke;
        }


    </style>
    <body>

        <div class="task1">
            <a href="ListServlet" class="button">Mobile</a>
        </div> 

        <div class="container">
            <div class="title">
                <a href="HomeServlet" style="text-decoration: none;"> <h1>Mobile For You</h1> </a>
                <form class="search" action="SearchServlet" method="get">
                    <input type="text" name="query" placeholder="Search...">
                    <button type="submit" class="button">Search</button>
                </form>
            </div>

            <div class="func">
                <a href="HomeServlet" class="button">Home</a>
                <a href="ListServlet" class="button">Mobile</a>        
            </div>
        </div>

        <!-- Chức năng đăng nhập -->
        <div class = "custom-div" >    
            <form method="post" action="LoginServlet">

                <h1> <span style="color: red;">Login</span></h1>
                Username: <input type="text" name="username" size="30" required/><br>
                <br>
                Password: <input type="password" name="password" size="30" required/><br>
                <br>
                
                <!-- Trả giá trị về LoginServlet -->
                <input type="submit" value="Login" class="button"/><br>
                
                <!-- Xử lý trong LoginServlet và về lỗi đăng nhập nếu có -->
                <c:if test="${requestScope.error != null}">
                    <h3 style="color: Red;">${requestScope.error}</h3>
                </c:if>      
            </form>
            
            <!-- Chuyển tiếp sang Register (Servlet) để đăng ký tài khoản-->
            <form>
                <p>You don't have an account? </p> <a href="Register">Register</a> 
            </form>
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
