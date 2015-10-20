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
import java.util.*;
public class Order {
    public String orderNum;
    public String deadline;
    public String supplier;
    public ArrayList<OrderItem> itemList;
    
    public Order(){
        this.orderNum="";
        this.deadline=null;
        this.supplier="";
        this.itemList=new ArrayList<OrderItem>();
    }
    
    public Order(String orderNum, String deadline,String supplier,ArrayList<OrderItem> itemList){
        this.orderNum=orderNum;
        this.deadline=deadline;
        this.supplier=supplier;
        this.itemList=itemList;
    }
    
    public void addOrderItem(OrderItem oi){
        itemList.add(oi);
    }
    
    public ArrayList<OrderItem> getOrderItem(){
        return this.itemList;
    }
    public String getOrderNum(){
        return this.orderNum;
    }
    public String getDeadline(){
        return this.deadline;
    }
    public String getSupplier(){
        return this.supplier;
    }        
}
