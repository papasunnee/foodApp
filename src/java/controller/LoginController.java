/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.User;
import dao.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Funmilola
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        if(request.getParameter("login") != null){
            User user = new User();
            user.setUsername(request.getParameter("username"));
            user.setPassword(request.getParameter("password"));
            System.out.println(request.getParameter("password")) ;
            String username = request.getParameter("username").toLowerCase();
            String password= request.getParameter("password");
            
            try {
                Connection con = DBConnect.getConnection();
                String sql = "select * from users where username=? and password=?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, password);
                
                ResultSet rs = pst.executeQuery();
                
                if(rs.next()){
                    //request.getRequestDispatcher("/home.jsp").forward(request, response);
                      user.setId(rs.getInt("id"));
                      HttpSession session = request.getSession();	    
                      session.setAttribute("currentSessionUser",user); 
                      session.setAttribute("user_id",user.getId()); 
                      session.setAttribute("username",username.toUpperCase()); 
                      session.setAttribute("fname",user.getFname()); 
                      String role[] = {"","Admin", "Manager","Staff"} ;
                      session.setAttribute("user_role_id",rs.getInt("role_id"));
                      session.setAttribute("user_type",role[rs.getInt("role_id")]); 
                      response.sendRedirect(request.getContextPath()+ "/fooditem");
                }else{
                    request.getSession().setAttribute("em", "Sorry, User not found.");
                    response.sendRedirect("index.jsp");
                }
                
               

            } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
            
            
        }
        else
        {
            response.sendRedirect("index.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
