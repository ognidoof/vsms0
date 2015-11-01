package Entity;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Benjamin
 */
public class Ingredient {
    private String name;
    private String ingID;
    private int quantity;
    private String unit;
    private String supID;

    public Ingredient(String name, String ingID, int quantity, String unit, String supID) {
        this.name = name;
        this.ingID = ingID;
        this.quantity = quantity;
        this.unit = unit;
        this.supID = supID;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getingID(){
        return this.ingID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }
    
    public String getSupID(){
        
        return supID;
    }
    
}
