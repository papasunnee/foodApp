/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author Sunday
 */
public class InvoiceDesc {
    String price ;
    String quantity ;
    String totalprice ;
    String fooditem ;
    
     public InvoiceDesc(String price, String quantity, String totalprice, String fooditem) {
        this.price = price;
        this.quantity = quantity;
        this.totalprice = totalprice;
        this.fooditem = fooditem;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(String totalprice) {
        this.totalprice = totalprice;
    }

    public String getFooditem() {
        return fooditem;
    }

    public void setFooditem(String fooditem) {
        this.fooditem = fooditem;
    }
}
