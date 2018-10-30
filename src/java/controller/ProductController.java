/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Product;
import dao.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sunday
 */
@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        if(request.getParameter("login") != null){
            String name = request.getParameter("name");
            String password= request.getParameter("password");
            
            try {
                Connection con = DBConnect.getConnection();
                String sql = "select * from users where name=? and password=?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, password);
                
                ResultSet rs = pst.executeQuery();
                
                if(rs.next()){
                    request.getRequestDispatcher("/index.jsp").forward(request, response);
                }else{
                    request.getSession().setAttribute("em", "User not found");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
                
               

            } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
            
            
        }
        
        
        if (request.getParameter("insert") != null) {

            String pname = request.getParameter("pname");
            double price = Double.parseDouble(request.getParameter("price"));
            int qty = Integer.parseInt(request.getParameter("qty"));

            Product p = new Product();
            p.setPname(pname);
            p.setPrice(price);
            p.setQty(qty);

            try {
                Connection con = DBConnect.getConnection();
                String sql = "insert into product (pname, price, qty) values (?, ?, ?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, p.getPname());
                pst.setDouble(2, p.getPrice());
                pst.setInt(3, p.getQty());
                int value = pst.executeUpdate();
                if (value > 0) {
                    request.getSession().setAttribute("sm", "Product Saved Successfully");
                } else {
                    request.getSession().setAttribute("em", "Product not saved");
                }

                request.getRequestDispatcher("/insert.jsp").forward(request, response);

            } catch (SQLException ex) {
                out.println(ex.getMessage());
            }

        }
        
        
        
        if(request.getParameter("update") != null){
            int pid = Integer.parseInt(request.getParameter("pid"));
            String pname = request.getParameter("pname");
            double price = Double.parseDouble(request.getParameter("price"));
            int qty = Integer.parseInt(request.getParameter("qty"));

            Product p = new Product();
            p.setPname(pname);
            p.setPrice(price);
            p.setQty(qty);
            p.setPid(pid);

            try {
                Connection con = DBConnect.getConnection();
                String sql = "update product set pname=?, price=?, qty=? where pid=?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1, p.getPname());
                pst.setDouble(2, p.getPrice());
                pst.setInt(3, p.getQty());
                pst.setInt(4, p.getPid());
                int value = pst.executeUpdate();
                if (value > 0) {
                    request.getSession().setAttribute("sm", "Product Update Successfully");
                } else {
                    request.getSession().setAttribute("em", "Product not update");
                }

                request.getRequestDispatcher("/edit.jsp?pid=" + pid).forward(request, response);

            } catch (SQLException ex) {
                out.println(ex.getMessage());
            }
        }
        
        if(request.getParameter("pid") != null && request.getParameter("for").equalsIgnoreCase("delete")){
            int pid = Integer.parseInt(request.getParameter("pid"));

            Product p = new Product();
            p.setPid(pid);

            try {
                Connection con = DBConnect.getConnection();
                String sql = "delete from product where pid=?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setInt(1, p.getPid());
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
        

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
