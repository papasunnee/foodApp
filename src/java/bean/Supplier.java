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
public class Supplier {
    private int id;
    private String suppliername;
    private String supplierphone;
    private String supplieraddress;

    public Supplier(int id, String suppliername, String supplierphone, String supplieraddress) {
        this.id = id;
        this.suppliername = suppliername;
        this.supplierphone = supplierphone;
        this.supplieraddress = supplieraddress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername;
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

}
