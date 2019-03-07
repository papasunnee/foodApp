/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Funmilola
 */
public class Food {

    private int id;
    private String finame;
    private double price;
    private int qty;
    private String description ;

    public Food() {
    }

    public Food(int id, String finame, double price, int qty, String description) {
        this.id = id;
        this.finame = finame;
        this.price = price;
        this.qty = qty;
        this.description = description ;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFiname() {
        return finame;
    }

    public void setFiname(String finame) {
        this.finame = finame;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
