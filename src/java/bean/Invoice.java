/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Date;

/**
 *
 * @author Sunday
 */
public class Invoice {
    
    private int id;
    private String invoice_detail;
    private int user_id ;
    private Date date_created ;

    public Invoice() {
        
    }

    public Invoice(int id, String invoice_detail, int user_id) {
        this.id = id;
        this.invoice_detail = invoice_detail;
        this.user_id = user_id;
    }
    
    public Invoice(int id, String invoice_detail, int user_id, Date date_created) {
        this.id = id;
        this.invoice_detail = invoice_detail;
        this.user_id = user_id;
        this.date_created = date_created ;
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
