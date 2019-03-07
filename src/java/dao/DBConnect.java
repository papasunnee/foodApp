/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Funmilola
 */
public class DBConnect {
    
    private static Connection con;
    
    static{
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (InstantiationException | IllegalAccessException ex) {
                Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static Connection getConnection() throws SQLException{
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_app", "root", "");
        return con;
    }
    
    public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException{
    
        PreparedStatement ps = null ;
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_app", "root", "");
        ps = conn.prepareStatement(sql) ;
        return ps;
        
    }
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException{
        System.out.println(getPreparedStatement("select * from fooditem")) ;
    }
    
}
