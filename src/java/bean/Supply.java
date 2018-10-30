/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Sunday
 */
public class Supply {
    
    private int id ;
    private String itemname ;
    private int itemid ;
    private int quantity ;
    private double price ;
    private int supplierid ;
    private String suppliername ;
    private String finame ;
    private String description ;
    private String supplierphone ;
    private String supplieraddress ;


    public Supply() {
    }

    public Supply(int id, int itemid, int quantity, double price, int supplierid) {
        this.id = id;
        this.itemid = itemid;
        this.quantity = quantity;
        this.price = price;
        this.supplierid = supplierid;
    }

    public Supply(int id, String itemname, int itemid, int quantity, double price, int supplierid, String suppliername) {
        this.id = id;
        this.itemname = itemname;
        this.itemid = itemid;
        this.quantity = quantity;
        this.price = price;
        this.supplierid = supplierid;
        this.suppliername = suppliername;
    }

    public Supply(int id, int itemid, int quantity, double price, int supplierid, String finame, String description, String suppliername,  String supplierphone, String supplieraddress) {
        this.id = id;
        this.itemid = itemid;
        this.quantity = quantity;
        this.price = price;
        this.supplierid = supplierid;
        this.suppliername = suppliername;
        this.finame = finame;
        this.description = description;
        this.supplierphone = supplierphone;
        this.supplieraddress = supplieraddress;
    }

    public String getFiname() {
        return finame;
    }

    public void setFiname(String finame) {
        this.finame = finame;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSupplierphone() {
        return supplierphone;
    }

    public void setSupplierphone(String supplierphone) {
        this.supplierphone = supplierphone;
    }

    public String getSupplieraddress() {
        return supplieraddress;
    }

    public void setSupplieraddress(String supplieraddress) {
        this.supplieraddress = supplieraddress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public int getItemid() {
        return itemid;
    }

    public void setItemid(int itemid) {
        this.itemid = itemid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(int supplierid) {
        this.supplierid = supplierid;
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername;
    }
    
    
}
