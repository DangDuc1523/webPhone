/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dangd
 */
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Chuyển tiếp sang Views/register.jsp
        request.getRequestDispatcher("Views/register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Nhận giá trị từ Views/register.jsp
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String passcheck = request.getParameter("passcheck");
        String yourname = request.getParameter("yourname");
        String phonenumber = request.getParameter("phonenumber");
        String address = request.getParameter("address");
        boolean check = true; 
        
         //Khai báo một biến c kiểu DAO , và gán mẫu Singleton
        DAO c = DAO.INSTANCE;
        Account acc = c.getUserName(user);
        
        //Gọi phương thức getPhoneAccount trong lớp DAO
        Account numberacc = c.getPhoneAccount(phonenumber);

        //Kiểm tra điều kiện username
        if (acc != null) {
            check = false;
            String msUser = "Username is valid"; 
            request.setAttribute("ms", msUser);
             request.getRequestDispatcher("Views/register.jsp").forward(request, response);
        } 
        
        //Kiểm tra điều kiện Number Phone
        if (numberacc != null) {
            check = false;
            String msNumber = "Number Phone is valid";
            request.setAttribute("ms", msNumber);
             request.getRequestDispatcher("Views/register.jsp").forward(request, response);
        } 
        
        //Username và Phone Number đều chưa tồn tại
        if (acc == null && numberacc == null ) {
            
            // Nếu pass dưới 6 kí tự
             if(pass.length() < 6){
                 check = false;
            String mspass ="Password must be at least 6 characters long.";
            request.setAttribute("ms", mspass);
            
            // Chuyển tiếp về Views/register.jsp kèm thông báo
            request.getRequestDispatcher("Views/register.jsp").forward(request, response);
        }
         
             // Nếu form phonenumber khác 10
         if(phonenumber.length() != 10){
             check = false;
              String phone = "Phone number must be a 10-digit number.";
              request.setAttribute("ms", phone);
              
              // Chuyển tiếp về Views/register.jsp kèm thông báo
              request.getRequestDispatcher("Views/register.jsp").forward(request, response);
         }
        if (!pass.equals(passcheck)) {
            check = false;
            String mspass = "Password does not match";
            request.setAttribute("ms", mspass);
            
            // Chuyển tiếp về Views/register.jsp kèm thông báo
            request.getRequestDispatcher("Views/register.jsp").forward(request, response);
        }
            
        }
        if(check == true){
            String add = "Account created successfully"; 
            
            //Gọi phương thức addAcc trong lớp DAO
            c.addAcc(user, pass, yourname, phonenumber, address);
            request.setAttribute("msa", add);
            
            // Chuyển tiếp về Views/register.jsp kèm thông báo
            request.getRequestDispatcher("Views/register.jsp").forward(request, response);
        }
        
        
        
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
