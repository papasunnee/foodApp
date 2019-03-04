/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.User;
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
public class UserDataAccess {
    public int addUser(User u){
        
        try {	


                String sql = "insert into users (fname,lname,mname,phone,email,address,username,password,gender,role_id) values (?, ?, ?, ?,?, ?, ?, ?,?, ?)";
                PreparedStatement pst ;
                pst = DBConnect.getPreparedStatement(sql);
                pst.setString(1, u.getFname());
                pst.setString(2, u.getLname());
                pst.setString(3, u.getMname());
                pst.setString(4, u.getPhone());
                pst.setString(5, u.getEmail());
                pst.setString(6, u.getAddress());
                pst.setString(7, u.getUsername());
                pst.setString(8, u.getPassword());
                pst.setString(9, u.getGender());
                pst.setInt(10, u.getRoleId());
                
                String loweremail = u.getEmail().toLowerCase() ;
                String loweruname = u.getUsername().toLowerCase() ;
                String phone = u.getPhone() ;
                
                Boolean emailExists = DBConnect.getPreparedStatement("select * from users where email = '" + loweremail + "'").executeQuery().next() ;
                if(emailExists)
                    return -5 ;
                
                Boolean unameExists = DBConnect.getPreparedStatement("select * from users where username = '" + loweruname + "'").executeQuery().next() ;
                if(unameExists)
                    return -6 ;
                
                Boolean phoneExists = DBConnect.getPreparedStatement("select * from users where phone = '" + phone + "'").executeQuery().next() ;
                if(phoneExists)
                    return -7 ;
                
                return pst.executeUpdate();
                
             } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public void edit(String fname, String lname, String mname, String address, String password, String gender, int role_id, int id){
       
        try {
            String sql = "update users set fname = ? , lname = ? , mname = ? , address = ? , password = ? , gender = ? , role_id = ?  where id = ? " ;
            PreparedStatement  ps ;
            ps = DBConnect.getPreparedStatement(sql);
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, mname);
            ps.setString(4, address);
            ps.setString(5, password);
            ps.setString(6, gender);
            ps.setInt(7, role_id);
            ps.setInt(8, id);
           
            int d = ps.executeUpdate() ;
            System.out.println(d + "") ;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void delete(int id){
        String sql = "delete from users where id = ? " ;
        try {
            PreparedStatement ps = DBConnect.getPreparedStatement(sql) ;
            ps.setInt(1, id);
            ps.executeUpdate() ;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static List<User> getUserById(int id){
        List<User> ls = new LinkedList<>() ;
        String sql = "select id, fname, lname, mname, phone, email, address, username, password, gender, role_id from users where id = " + id ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement(sql).executeQuery() ;
            while(rs.next()){
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11)) ;
                ls.add(u) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }
    
    public static List<User> getAll(){
        List<User> ls = new LinkedList<>() ;
        try {
            ResultSet rs = DBConnect.getPreparedStatement("SELECT users.id,fname,lname,mname,phone,email,address,username,password,gender,role_id,name from users join roles on users.role_id = roles.id").executeQuery() ;
            while(rs.next()){
                User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11),rs.getString(12)) ;
                ls.add(u) ;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FoodDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ls;
    }
}
