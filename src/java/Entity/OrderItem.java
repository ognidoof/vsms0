package Entity;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author David
 */
public class OrderItem {
    public String name;
    //public double price;
    public double quantity;
    public String units;
    
    public OrderItem(){
        this.name="";
        //this.price=0;
        this.quantity=0;
        this.units="";
    }
    
    public OrderItem(String name,double quantity,String units){
        this.name=name;
        //this.price=price;
        this.quantity=quantity;
        this.units=units;
    }
    
    public String getName(){
        return this.name;
    }
    //public Double getPrice(){
        //return this.price;
    //}
    public double getQuantity(){
        return this.quantity;
    }
    public String getUnits(){
        return this.units;
    }
    
    public void setName(String name){
        this.name=name;
    }
    //public void setPrice(double price){
        //this.price=price;
    //}
    public void setQuantity(double quantity){
        this.quantity=quantity;
    }
    public void setUnits(String units){
        this.units=units;
    }
}
