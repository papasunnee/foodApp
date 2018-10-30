/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Food;
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
public class FoodDataAccess {
    
    public void addFood(Food f){
        
        try {
                String sql = "insert into fooditem (finame, price, quantity, description) values (?, ?, ?, ?)";
                PreparedStatement pst ;
                pst = DBConnect.getPreparedStatement(sql);
                pst.setString(1, f.getFiname());
                pst.setDouble(2, f.getPrice());
                pst.setInt(3, f.getQty());
                pst.setString(4, f.getDescription());
                int value = pst.executeUpdate();
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
    
    public static List<Food> getAll(){
        List<Food> ls = new LinkedList<>() ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement("select * from fooditem order by finame").executeQuery() ;
            int i = 0 ;
            while(rs.next()){
                Food f = new Food(rs.getInt(1), rs.getString(2).toUpperCase(), rs.getDouble(3), rs.getInt(4), rs.getString(5)) ;
                ls.add(f) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    } 
    
    public static List<Food> getFoodById(int id){
        List<Food> ls = new LinkedList<>() ;
        String sql = "select * from fooditem where id = " + id ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement(sql).executeQuery() ;
            while(rs.next()){
                Food f = new Food(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), rs.getString(5)) ;
                ls.add(f) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }
    
    
    public void updateFoodQuantity(int id, int newQty, double newPrice){
        String sql = "select * from fooditem where id = " + id ;
        int quantity = 0 ;
        double price = 0 ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement(sql).executeQuery() ;
            while(rs.next()){
                Food f = new Food(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getInt(4), rs.getString(5)) ;
                quantity = f.getQty() + newQty ;
                price = f.getPrice() ;
            }
        //sql = "update fooditem set quantity = ? , price = ? where id = " + id ; 
        sql = "update fooditem set quantity = ?  where id = " + id ; 
        PreparedStatement  ps ;
        ps = DBConnect.getPreparedStatement(sql) ;
        ps.setInt(1, quantity);
        //newPrice = (newPrice == 0 ) ? price : newPrice ;
        //ps.setDouble(2, newPrice);
        ps.executeUpdate() ;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void edit(int id, String finame, double price, int qty, String description){
       
        try {
            String sql = "update fooditem set finame = ? , price = ? , quantity = ? , description = ?  where id = ? " ;
            PreparedStatement  ps ;
            ps = DBConnect.getPreparedStatement(sql);
            ps.setString(1, finame);
            ps.setDouble(2, price);
            ps.setInt(3, qty);
            ps.setString(4, description); 
            ps.setInt(5, id);
            int d = ps.executeUpdate() ;
            System.out.println(d + "") ;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void delete(int id){
        String sql = "delete from fooditem where id = ? " ;
        try {
            PreparedStatement ps = DBConnect.getPreparedStatement(sql) ;
            ps.setInt(1, id);
            ps.executeUpdate() ;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
