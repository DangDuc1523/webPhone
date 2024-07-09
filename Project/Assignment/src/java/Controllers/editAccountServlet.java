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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author dangd
 */
public class editAccountServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet editAccountServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editAccountServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        
        request.getRequestDispatcher("Views/infouser.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Account account = (Account) session.getAttribute("account"); 
        
        String username = request.getParameter("username");
        String pass = request.getParameter("pass");
        String name = request.getParameter("name");
        String phonenumber = request.getParameter("phonenumber");
        String address = request.getParameter("address");
        
         //Khai báo một biến c kiểu DAO , và gán mẫu Singleton
        DAO c = DAO.INSTANCE;
        Account acc = c.getCustomAccount(username, pass);
        
        PrintWriter out = response.getWriter();

        
       
        //Gọi phương thức getPhoneAccount trong lớp DAO
        Account numberacc = c.getPhoneAccount(phonenumber);

        
         if(acc == null){
            String mspass ="Password incorrect";
            request.setAttribute("ms", mspass);
            
            // Chuyển tiếp về Views/register.jsp kèm thông báo
            request.getRequestDispatcher("Views/infouser.jsp").forward(request, response);
         }else{
        
         if (numberacc != null) {
             if(!username.equals(numberacc.getUsername())){     
            String msNumber = "Number Phone is valid";
            request.setAttribute("ms", msNumber);
             request.getRequestDispatcher("Views/infouser.jsp").forward(request, response);    
             }else{
                 if(phonenumber.length() != 10){
              String phone = "Phone number must be a 10-digit number.";
              request.setAttribute("ms", phone);
              
              // Chuyển tiếp về Views/register.jsp kèm thông báo
              request.getRequestDispatcher("Views/infouser.jsp").forward(request, response);
         }else{
              c.editInfoAcc(account.getUserid() , name, phonenumber, address);
              request.setAttribute("ms", "Information Changed");
               // Chuyển tiếp về Views/register.jsp kèm thông báo
              account.setName(name);
              account.setPhonenumber(phonenumber);
              account.setAddress(address);
              }
            }    
          }
             
             }
         if (numberacc == null){
             // Nếu form phonenumber khác 10
         if(phonenumber.length() != 10){
              String phone = "Phone number must be a 10-digit number.";
              request.setAttribute("ms", phone);
              
              // Chuyển tiếp về Views/register.jsp kèm thông báo
              request.getRequestDispatcher("Views/infouser.jsp").forward(request, response);
         }else{
              c.editInfoAcc(account.getUserid() , name, phonenumber, address);
              request.setAttribute("ms", "Information Changed");
               // Chuyển tiếp về Views/register.jsp kèm thông báo
              account.setName(name);
              account.setPhonenumber(phonenumber);
              account.setAddress(address);
         }
        }    
     
           request.getRequestDispatcher("Views/infouser.jsp").forward(request, response);
        
         
         
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
