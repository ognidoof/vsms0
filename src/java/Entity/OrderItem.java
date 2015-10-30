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
    public String unit;
    public String supplier;
    //public String units;
    
    public OrderItem(){
        this.name="";
        this.price="";
        this.quantity="";
        this.unit="";
        this.supplier="";
    }
    
    public OrderItem(String name,String quantity,String price,String unit,String supplier){
        this.name=name;
        this.price=price;
        this.quantity=quantity;
        this.unit=unit;
        this.supplier=supplier;
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
    public String getUnit(){
        return this.unit;
    }
    public String getSupplier(){
        return this.supplier;
    }
    
    public void setName(String name){
        this.name=name;
    }
    public void setPrice(String price){
        this.price=price;
    }
    public void setQuantity(String quantity){
        this.quantity=quantity;
    }
    public void setUnit(String unit){
       this.unit=unit;
    }
    public void setSupplier(String supplier){
       this.supplier=supplier;
    }
}
