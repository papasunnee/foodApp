/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Supplier;
import bean.Supply;
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
public class SupplyDataAccess {
    public void addSupply(Supply s){
        
        try {
                String sql = "insert into supply (itemid, quantity, price, supplierid) values (?, ?, ?, ?)";
                PreparedStatement pst ;
                pst = DBConnect.getPreparedStatement(sql);
                pst.setInt(1, s.getItemid());
                pst.setInt(2, s.getQuantity());
                pst.setDouble(3, s.getPrice());
                pst.setInt(4, s.getSupplierid());
                
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
    
    public static List<Supply> getAll(){
        List<Supply> ls = new LinkedList<>() ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement("select supply.id,itemid,supply.quantity,supply.price,supplierid,finame,description, suppliername, supplierphone, supplieraddress from supply join fooditem on fooditem.id = supply.itemid join supplier on supplier.id = supply.supplierid order by supply.id DESC").executeQuery() ;
            int i = 0 ;
            while(rs.next()){
                Supply s = new Supply(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
                //Supply s = new Supply(rs.getInt(1), rs.getString(2).toUpperCase(), rs.getString(3), rs.getString(4)) ;
                ls.add(s) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    } 
    
    public static List<Supply> getSupplyById(int id){
        List<Supply> ls = new LinkedList<>() ;
        //int id, int itemid, int quantity, double price, int supplierid, String finame, String description
        String sql = "select supply.id, itemid, supply.quantity, supply.price, supplierid, finame, description, suppliername from supply join fooditem on supply.itemid = fooditem.id join supplier on supply.supplierid = supplier.id where supply.id = " + id ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement(sql).executeQuery() ;
            while(rs.next()){
                Supply s = new Supply(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8)) ;
                ls.add(s) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }
    
    public void edit(int id, double price){
       
        try {
            String sql = "update supply set price = ? where id = ? " ;
            PreparedStatement  ps ;
            ps = DBConnect.getPreparedStatement(sql);
            ps.setDouble(1, price);
            ps.setInt(2, id);
            int d = ps.executeUpdate() ;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void delete(int id){
        String sql = "delete from supply where id = ? " ;
        try {
            PreparedStatement ps = DBConnect.getPreparedStatement(sql) ;
            ps.setInt(1, id);
            ps.executeUpdate() ;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
