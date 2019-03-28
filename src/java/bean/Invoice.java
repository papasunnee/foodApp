/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Date;

/**
 *
 * @author Funmilola
 */
public class Invoice {
    
    private int id;
    private String invoice_detail;
    private String fname;
    private String lname;
    private String mname;
    private String customerName ;
    String foodItemArray;
    Double totalPrice ;

    public String getCustomerName() {
        return customerName;
    }

    public String getFoodItemArray() {
        return foodItemArray;
    }

    public void setFoodItemArray(String foodItemArray) {
        this.foodItemArray = foodItemArray;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }
    private int user_id ;
    private Date date_created ;

    public Invoice() {
        
    }

    public Invoice(int id, String invoice_detail, int user_id,  String customerName) {
        this.id = id;
        this.invoice_detail = invoice_detail;
        this.user_id = user_id;
        this.customerName = customerName;
    }
    
    public Invoice(int id, String invoice_detail, int user_id, Date date_created) {
        this.id = id;
        this.invoice_detail = invoice_detail;
        this.user_id = user_id;
        this.date_created = date_created ;
    }

    public Invoice(int id, String invoice_detail, int user_id, Date date_created, String fname, String lname, String mname) {
        this.id = id;
        this.invoice_detail = invoice_detail;
        this.fname = fname;
        this.lname = lname;
        this.mname = mname;
        this.user_id = user_id;
        this.date_created = date_created;
    }
    
    public Invoice(int id, String invoice_detail, int user_id, Date date_created, String fname, String lname, String mname, String customerName, Double totalPrice, String foodItemArray) {
        this.id = id;
        this.invoice_detail = invoice_detail;
        this.fname = fname;
        this.lname = lname;
        this.mname = mname;
        this.user_id = user_id;
        this.date_created = date_created;
        this.customerName = customerName;
        this.foodItemArray = foodItemArray;
        this.totalPrice = totalPrice;
    }


    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInvoice_detail() {
        return invoice_detail;
    }

    public void setInvoice_detail(String invoice_detail) {
        this.invoice_detail = invoice_detail;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    
    
    
}
