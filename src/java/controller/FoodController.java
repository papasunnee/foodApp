/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Food;
import dao.DBConnect;
import dao.FoodDataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sunday
 */
@WebServlet(name = "FoodController", urlPatterns = {"/FoodController"})
public class FoodController extends HttpServlet {

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
        
        PrintWriter out = response.getWriter() ;
        if (request.getParameter("insert") != null) {

            String finame = request.getParameter("finame");
            double price = Double.parseDouble(request.getParameter("price"));
            int qty = Integer.parseInt(request.getParameter("qty"));
            String description = request.getParameter("description");

            Food f = new Food();
            f.setFiname(finame);
            f.setPrice(price);
            f.setQty(qty);
            f.setDescription(description) ;

            try {
                Connection con = DBConnect.getConnection();
                String sql = "insert into fooditem (finame, price, quantity, description) values (?, ?, ?, ?)";
                //PreparedStatement pst = con.prepareStatement(sql);
                PreparedStatement pst ;
                pst = DBConnect.getPreparedStatement(sql);
                pst.setString(1, f.getFiname());
                pst.setDouble(2, f.getPrice());
                pst.setInt(3, f.getQty());
                pst.setString(4, f.getDescription());
                int value = pst.executeUpdate();
                if (value > 0) {
                    request.getSession().setAttribute("sm", "Food Item Saved Successfully");
                } else {
                    request.getSession().setAttribute("em", "Food Item not saved");
                }

               //request.getRequestDispatcher("/createFoodItem.jsp").forward(request, response);
               response.sendRedirect("fooditem/index.jsp");

            }
            catch (ClassNotFoundException | SQLException ex) {
                    out.println(ex.getMessage());
                }

        }
        
        
        
        if(request.getParameter("update") != null){
            int pid = Integer.parseInt(request.getParameter("pid"));
            String pname = request.getParameter("pname");
            double price = Double.parseDouble(request.getParameter("price"));
            int qty = Integer.parseInt(request.getParameter("qty"));

            Food f = new Food();
            f.setFiname(pname);
            f.setPrice(price);
            f.setQty(qty);
            f.setId(pid);

//            try {
//                Connection con = DBConnect.getConnection();
//                String sql = "update product set pname=?, price=?, qty=? where pid=?";
//                PreparedStatement pst = con.prepareStatement(sql);
//                pst.setString(1, p.getPname());
//                pst.setDouble(2, p.getPrice());
//                pst.setInt(3, p.getQty());
//                pst.setInt(4, p.getPid());
//                int value = pst.executeUpdate();
//                if (value > 0) {
//                    request.getSession().setAttribute("sm", "Product Update Successfully");
//                } else {
//                    request.getSession().setAttribute("em", "Product not update");
//                }
//
//                request.getRequestDispatcher("/edit.jsp?pid=" + pid).forward(request, response);
//
//            } catch (SQLException ex) {
//                out.println(ex.getMessage());
//            }
        }
        
        if(request.getParameter("pid") != null && request.getParameter("for").equalsIgnoreCase("delete")){
            int pid = Integer.parseInt(request.getParameter("pid"));

            Food p = new Food();
            p.setId(pid);
            try {
                Connection con = DBConnect.getConnection();
                String sql = "delete from product where pid=?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setInt(1, p.getId());
                int value = pst.executeUpdate();
                if (value > 0) {
                    request.getSession().setAttribute("sm", "Product deleted Successfully");
                } else {
                    request.getSession().setAttribute("em", "Product not deleted");
                }

                request.getRequestDispatcher("/index.jsp").forward(request, response);

            } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
        }
        
        
        request.setAttribute("AllFood", FoodDataAccess.getAll());
        RequestDispatcher rd = request.getRequestDispatcher("fooditem/index.jsp") ;
        rd.forward(request, response);
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
