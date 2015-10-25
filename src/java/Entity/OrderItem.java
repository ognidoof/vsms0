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
    public String price;
    public String quantity;
    //public String units;
    
    public OrderItem(){
        this.name="";
        this.price="";
        this.quantity="";
        //this.units="";
    }
    
    public OrderItem(String name,String quantity,String price){
        this.name=name;
        this.price=price;
        this.quantity=quantity;
        //this.units=units;
    }
    
    public String getName(){
        return this.name;
    }
    public String getPrice(){
        return this.price;
    }
    public String getQuantity(){
        return this.quantity;
    }
    //public String getUnits(){
    //    return this.units;
    //}
    
    public void setName(String name){
        this.name=name;
    }
    public void setPrice(String price){
        this.price=price;
    }
    public void setQuantity(String quantity){
        this.quantity=quantity;
    }
    //public void setUnits(String units){
    //   this.units=units;
    //}
}
