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

    public String orderId;
    public String totalPrice;
    public String vendor;
    public String supplier;
    public ArrayList<OrderItem> itemList;

    public Order() {
        this.orderId = "";
        this.vendor = "";
        this.totalPrice = null;
        //this.supplier="";
        this.itemList = new ArrayList<OrderItem>();
    }

    public Order(String orderId, String totalPrice, ArrayList<OrderItem> itemList) {
        this.orderId = orderId;
        this.vendor = "";
        this.totalPrice = totalPrice;
        //this.supplier=supplier;
        this.itemList = itemList;
    }

    public Order(String orderId, String totalPrice, String supplier, ArrayList<OrderItem> itemList) {
        this.orderId = orderId;
        this.vendor = "";
        this.totalPrice = totalPrice;
        this.supplier = supplier;
        this.itemList = itemList;
    }

    public Order(String orderId, String vendor, String totalPrice, String supplier, ArrayList<OrderItem> itemList) {
        this.orderId = orderId;
        this.vendor = vendor;
        this.totalPrice = totalPrice;
        this.supplier = supplier;
        this.itemList = itemList;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public void addOrderItem(OrderItem oi) {
        itemList.add(oi);
    }

    public ArrayList<OrderItem> getOrderItem() {
        return this.itemList;
    }

    public String getOrderId() {
        return this.orderId;
    }

    public String getTotalPrice() {
        return this.totalPrice;
    }

    public String getSupplier() {
        return this.supplier;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }
}
