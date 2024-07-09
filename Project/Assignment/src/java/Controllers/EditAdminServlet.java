/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controllers;

import DAL.DAO;
import Models.Phone;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author dangd
 */
public class EditAdminServlet extends HttpServlet {
   
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
            out.println("<title>Servlet EditProductServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditProductServlet at " + request.getContextPath () + "</h1>");
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
        
        // idphone: nhận giá trị "id" từ Views/editadmin.jsp
        int idphone = Integer.parseInt(request.getParameter("id"));
        
        //Khai báo một biến c kiểu DAO , và gán mẫu Singleton
        DAO c = DAO.INSTANCE;
        
        //Gọi phương thức getDetail trong lớp DAO
        Phone infophone = c.getDetail(idphone);
        request.setAttribute("info", infophone);
        request.getRequestDispatcher("Views/editadmin.jsp").forward(request, response);
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
        // Tin nhắn thông báo thành công
        String ms ="Edited successfully";
        
        // Nhận giá trị từ Views/editadmin.jsp
        int idphone = Integer.parseInt(request.getParameter("id"));
        String model = request.getParameter("model");
        String rom = request.getParameter("rom");
        String ram = request.getParameter("ram");
        String chip = request.getParameter("chip");
        String battery = request.getParameter("battery");
        String camera = request.getParameter("camera");
        float price = Float.parseFloat(request.getParameter("price"));
        String img = request.getParameter("imgProd");
        
        request.setAttribute("ms", ms);
        
        //Khai báo một biến c kiểu DAO , và gán mẫu Singleton
        DAO c = DAO.INSTANCE;
        
         //Gọi phương thức EditPhone trong lớp DAO
        c.EditPhone(idphone, model, ram, rom, chip, battery, camera, price,img);

        //Chuyển tiếp sang doGet để lấy dữ liệu từ database
        doGet(request, response);
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
