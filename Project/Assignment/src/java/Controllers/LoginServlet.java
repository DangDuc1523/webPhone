/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DAO;
import Models.Account;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author dangd
 */
public class LoginServlet extends HttpServlet {

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
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
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
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Views/login.jsp");
        requestDispatcher.forward(request, response);
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

        // Nhận giá trị từ Views/login.jsp
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //Khai báo một biến c kiểu DAO , và gán mẫu Singleton
        DAO c = DAO.INSTANCE;

        //Gọi phương thức getCustomAccount trong lớp DAO
        Account account = c.getCustomAccount(username, password);

        //Lấy phiên session  
        HttpSession session = request.getSession();

        //Kiểm tra tài khoản
        if (account != null) {

            // Chuyển tiếp sang ManagerServlet nếu là admin
            if (account.getRole() == 1) {
                request.setAttribute("username", account.getUsername());
                session.setAttribute("account", account);

                // Chuyển về ManagerServlet
                response.sendRedirect("ManagerServlet");

                //Chuyển tiếp sang ListServlet nếu là client   
            } else if (account.getRole() == 2) {

                request.setAttribute("username", account.getUsername());
                session.setAttribute("account", account);

                //Chuyển tiếp sang ListServlet
                response.sendRedirect("ListServlet");
            }
            
            // Đăng nhập bị lỗi và trả về Views/login.jsp
        } else {
            String ms = "Username or password is wrong, please login again!";
            request.setAttribute("error", ms);
            request.getRequestDispatcher("Views/login.jsp").forward(request, response);
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
