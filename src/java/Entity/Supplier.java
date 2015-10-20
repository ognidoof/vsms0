/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.List;

/**
 *
 * @author Joel
 */
public class Supplier {
    private String supName;
    private List items;
    private String category;
    private String desc;
    
    public Supplier(String supName, List items, String category, String desc){
        this.supName=supName;
        this.items=items;
        this.category=category;
        this.desc=desc;
    }
    
    public String getSupName(){
        return supName;
    }
    
    public List getItems(){
        return items;
    }
    
    public String getCategory(){
        return category;
    }
    
    public String getDesc(){
        return desc;
    }
    
    public void setName(String supName){
        this.supName=supName;
    }
    
    public void setItems(List items){
        this.items=items;
    }
    
    public void setCategory(String category){
        this.category=category;
    }
    
    public void setDesc(String desc){
        this.desc=desc;
    }
}

