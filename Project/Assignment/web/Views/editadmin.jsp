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

            .product{
                background-color: #2d2dd9;
                display: flex;
                justify-content: space-between;
                padding: 0px 30%;
            }

            .info{
                margin: 30px 25%;
                text-align: left;
                border: 5px solid #2d2dd9;
                border-radius: 10px;
                padding: 20px ;
                display: flex;
            }
            
            .info img{
                margin-left: 10%;
                width: 300px;
                height: 330px
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

            <!-- Thanh thông tin Admin và logout -->
            <img src="img/admin.jpg" alt="Admin">
            <h1 style="color: #2d2dd9"> Edit Information of product </h1>
            <a href="LogoutServlet" class="button" >Logout</a>        
        </div>
        
        <!-- Thanh chức năng -->
        <div class="product">
            <a href="ManagerServlet" class="button" >Home</a>
            <a href="StaticServlet" class="button" >Statistical</a> 
            <a href="AdminProductServlet" class="button" >Product</a>
            <a href="AdminBoughtServlet" class="button" >Orders</a>
            
        </div>
        
        <!-- info : kiểu trả về Phone, lấy thông tin từ database thông qua EditAdminServlet -->
        <div class="info">
            <form  method="post" action="EditAdminServlet">
                Model:<br>
                <input type="text" value="${info.model}" name="model" size="40" required /><br>
                Ram:<br>
                <input type="text"  value="${info.ram}" name="ram" size="40" required /><br>
                Rom:<br>
                <input type="text"  value="${info.rom}" name="rom" size="40" required/><br>
                Chip:<br>
                <input type="text"  value="${info.chip}"name="chip" size="40" required /><br>
                Battery:<br>
                <input type="text" value="${info.battery} " name="battery" size="40" min="0" required /><br>
                Camera:<br>
                <input type="text" value="${info.camera} " name="camera" size="40" required /><br>
                Price:<br>
                <input type="number" step="any" value="${info.price}" name="price" size="40" min="0" required /><br>
                URL Image:<br>
                <input type="text"  value="${info.imgProd}" name="imgProd" size="40" required /><br>
                <input type="hidden" name="id" value="${info.phoneid}">
                
                <!-- Thông báo chỉnh sửa thành công -->
                <c:if test="${not empty ms}">
                    <p>${ms}</p>
                </c:if>
                    
                    <!-- Trả kết quả về EditAdminServlet -->
                <input type="submit" value="Done" class="button"/>
            </form>  
                <img src="${info.imgProd}" alt="${info.model}"/>
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
