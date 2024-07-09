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
            
            h2{
                color: red;
                text-align: center;
            }
            
            .func{
                text-align: center;
                background-color:#2d2dd9 ;
                display: flex;
                justify-content: space-between;
                border-radius: 10px; 
                padding: 0px 20%;

            }
            .acc{
                margin: 30px 30%;
                text-align: left;
                padding: 20px ;
                border: 5px solid #2d2dd9;
                border-radius: 10px;
            }

            
            .tail{
                display: flex;
                padding: 10px 50px;
                background-color: black;
                color: whitesmoke;
            }
            .other{
                padding : 50px; 
            }
            
        </style>
    </head>
    <body>
        <div class="task1">
      <a href="LoginServlet" class="button">Login</a>
            <a href="OrderServlet" class="button">Order</a>
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
            <a href="LoginServlet" class="button">Login</a>
            <a href="OrderServlet" class="button">Order</a>
            <a href="ListServlet" class="button">Mobile</a>
            
            </div>
           </div>
            
        <h2>Register New Account</h2>
        
         <!-- Thông tin đăng ký tài khoản mới -->
        <div class="acc">
           <form class="info" method="post" action="Register" onsubmit="return validateForm()">
           Username:<br>
           <input type="text" name="user" size="30" required/><br>
           Password:<br>
           <input type="password" name="pass" size="30" required/><br>
           Enter password again:<br>
           <input type="password" name="passcheck" size="30" required /><br>
           Your name:<br>
           <input type="text" name="yourname" size="30" required/><br>
           Phone Number:<br>
           <input type="tel" name="phonenumber" size="30" required /><br>
           Address:<br>
           <input type="text" name="address" size="30" required/><br><br>
           <input type="submit" value="Register" class="button"/>
           
           <!-- Thông báo thành công -->
           <c:if test="${not empty ms}">
                    <p>${ms}</p>
                </c:if>
                     <p>${msa}</p>
            </form>
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
                
        </div>
        
    </body>
    <script>
  
</html>
