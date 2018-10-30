/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import bean.Supplier;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sunday
 */
public class SupplierDataAccess {
    
    public void addSupplier(Supplier s){
        
        try {
                String sql = "insert into supplier (suppliername, supplierphone, supplieraddress) values (?, ?, ?)";
                PreparedStatement pst ;
                pst = DBConnect.getPreparedStatement(sql);
                pst.setString(1, s.getSuppliername());
                pst.setString(2, s.getSupplierphone());
                pst.setString(3, s.getSupplieraddress());
                
                pst.executeUpdate();
//                if (value > 0) {
//                    request.getSession().setAttribute("sm", "Food Item Saved Successfully");
//                } else {
//                    request.getSession().setAttribute("em", "Food Item not saved");
//                }
//
//                request.getRequestDispatcher("/createFoodItem.jsp").forward(request, response);
             } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static List<Supplier> getAll(){
        List<Supplier> ls = new LinkedList<>() ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement("select * from supplier").executeQuery() ;
            int i = 0 ;
            while(rs.next()){
                Supplier s = new Supplier(rs.getInt(1), rs.getString(2).toUpperCase(), rs.getString(3), rs.getString(4)) ;
                ls.add(s) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    } 
    
    public static List<Supplier> getSupplierById(int id){
        List<Supplier> ls = new LinkedList<>() ;
        String sql = "select * from supplier where id = " + id ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement(sql).executeQuery() ;
            while(rs.next()){
                Supplier s = new Supplier(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)) ;
                ls.add(s) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }
    
    public void edit(int id, String suppliername, String supplierphone, String supplieraddress){
       
        try {
            String sql = "update supplier set suppliername = ? , supplierphone = ? , supplieraddress = ? where id = ? " ;
            PreparedStatement  ps ;
            ps = DBConnect.getPreparedStatement(sql);
            ps.setString(1, suppliername);
            ps.setString(2, supplierphone);
            ps.setString(3, supplieraddress); 
            ps.setInt(4, id);
            int d = ps.executeUpdate() ;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void delete(int id){
        String sql = "delete from supplier where id = ? " ;
        try {
            PreparedStatement ps = DBConnect.getPreparedStatement(sql) ;
            ps.setInt(1, id);
            ps.executeUpdate() ;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
