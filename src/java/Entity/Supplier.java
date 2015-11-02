/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.ArrayList;
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
    private String id;
    private ArrayList<String> idList;
    
    //needed for login
    private String username;
    private String password;
    //needed for login
    
    public Supplier(String id, String supName, List items, String category, String desc){
        this.supName=supName;
        this.items=items;
        this.category=category;
        this.desc=desc;
        this.id=id;
        idList=new ArrayList<String>();
    }
    
    public String getId(){
        return this.id;
    }
    
    //needed for login
    public Supplier(String username, String password){
        this.username=username;
        this.password=password;
    }
    //needed for login
    
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
    
    public String getUsername(){
        return username;
    }
    
    public String getPassword(){
        return password;
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
    

    public void setId(String id){
        this.id=id;
    }

    public void setUsername(String username){
        this.username = username;
    }
    
    public void setPassword(String password){
        this.password = password;

    }
    
    public void addIngredientId(ArrayList<String> idList){
        this.idList=idList;
    }
    
    public ArrayList<String> getIDList(){
        return idList;
    }
}

