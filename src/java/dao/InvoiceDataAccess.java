/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import bean.Invoice;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/**
 *
 * @author Funmilola
 */
public class InvoiceDataAccess {
    
    
    public int addInvoice(Invoice i){
        
        try {
                String sql = "insert into invoice (invoice_detail, user_id, customerName, totalPrice, foodItemArray) values (?, ?, ?, ?, ?)";
                PreparedStatement pst ;
                JSONArray jsonArray = new JSONArray(i.getInvoice_detail());
                String fooditemList = "" ;
                Double totalPrice = 0.0 ;
                      
                    for(int j=0;j<jsonArray.length();j++)
                    {
                        JSONObject jsonObject = jsonArray.getJSONObject(j);
                        fooditemList += jsonObject.optString("fooditem") + "," ;
                        totalPrice += Double.parseDouble(jsonObject.optString("totalprice")) ;
                        
                    }
                pst = DBConnect.getPreparedStatement(sql);
                pst.setString(1, i.getInvoice_detail());
                pst.setInt(2, i.getUser_id());
                pst.setString(3, i.getCustomerName());
                pst.setDouble(4,totalPrice);
                pst.setString(5, fooditemList);
                pst.executeUpdate();
                for(int j=0;j<jsonArray.length();j++)
                {
                    JSONObject jsonObject = jsonArray.getJSONObject(j);
                    FoodDataAccess fd = new FoodDataAccess() ;
                    int id = Integer.parseInt(jsonObject.optString("id")) ;
                    int quantity = Integer.parseInt(jsonObject.optString("quantity")) ;
                    fd.updateFoodItemRecord(id, quantity);
                }
             } catch (SQLException | ClassNotFoundException | JSONException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public static List<Invoice> getAllByUserId(int id){
        List<Invoice> ls = new LinkedList<>() ;
        try {
            String sql = "select invoice.id, invoice.invoice_detail, invoice.user_id, invoice.date_created, users.id, users.fname, users.lname, users.mname, invoice.customerName, invoice.totalPrice, invoice.foodItemArray from invoice join users on invoice.user_id = users.id " ;
            if (id > 0){
                sql+= " where invoice.user_id = " + id ;
            }
            ResultSet rs = DBConnect.getPreparedStatement(sql).executeQuery() ;
            int i = 0 ;
            while(rs.next()){
                Invoice inv = new Invoice(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getDouble(10), rs.getString(11)) ;
                ls.add(inv) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(InvoiceDataAccess.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(InvoiceDataAccess.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(InvoiceDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
