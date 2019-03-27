/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import bean.Invoice;
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
 * @author Funmilola
 */
public class InvoiceDataAccess {
    
    
    public int addInvoice(Invoice i){
        
        try {
                String sql = "insert into invoice (invoice_detail, user_id) values (?, ?)";
                PreparedStatement pst ;
                pst = DBConnect.getPreparedStatement(sql);
                pst.setString(1, i.getInvoice_detail());
                pst.setInt(2, i.getUser_id());
                
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
        return 0;
    }
    
    public static List<Invoice> getAll(){
        List<Invoice> ls = new LinkedList<>() ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement("select * from invoice").executeQuery() ;
            int i = 0 ;
            while(rs.next()){
                Invoice inv = new Invoice(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4)) ;
                ls.add(inv) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    } 
    
    public static List<Invoice> getInvoiceById(int id){
        List<Invoice> ls = new LinkedList<>() ;
        String sql = "select * from invoice where id = " + id ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement(sql).executeQuery() ;
            while(rs.next()){
                Invoice inv = new Invoice(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4)) ;
                ls.add(inv) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }
    
//    public void edit(int id, String invoice_detail, int user_id, Date date_created){
//       
//        try {
//            String sql = "update invoice set invoice_detail = ? , user_id = ? , date_created = ? where id = ? " ;
//            PreparedStatement  ps ;
//            ps = DBConnect.getPreparedStatement(sql);
//            ps.setString(1, suppliername);
//            ps.setString(2, supplierphone);
//            ps.setString(3, supplieraddress); 
//            ps.setInt(4, id);
//            int d = ps.executeUpdate() ;
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    
    public void delete(int id){
        String sql = "delete from invoice where id = ? " ;
        try {
            PreparedStatement ps = DBConnect.getPreparedStatement(sql) ;
            ps.setInt(1, id);
            ps.executeUpdate() ;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
