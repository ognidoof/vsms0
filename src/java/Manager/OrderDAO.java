/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;
import Entity.Order;
import Entity.Order;
import Entity.OrderItem;
import Entity.OrderItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author David
 */
public class OrderDAO {
    public static int OrderNum=0;
    
    public static int getOrderNum(){
        OrderNum++;
        return OrderNum;
    }
    /*
    public static ArrayList<Order> populateOrder(){
                    ArrayList<Order> orderList=new ArrayList<Order>();
                    
                    //order 1
                    OrderItem item1=new OrderItem("Seedless Lime",15,"kg");
                    OrderItem item2=new OrderItem("Pineapple",1,"whole");
                    ArrayList<OrderItem> itemList1=new ArrayList<OrderItem>();
                    itemList1.add(item1);
                    itemList1.add(item2);
                    Order order1=new Order("123","14th April 2015","Fine Food",itemList1);
                    
                     //order 2
                    OrderItem item3=new OrderItem("Chicken",23,"pieces");
                    OrderItem item4=new OrderItem("Fish",16,"whole");
                    ArrayList<OrderItem> itemList2=new ArrayList<OrderItem>();
                    itemList2.add(item3);
                    itemList2.add(item4);
                    Order order2=new Order("114","10th April 2015","Waily Kenneth",itemList2);
                    
                     //order 3
                    OrderItem item5=new OrderItem("Bean",0.2,"kg");
                    OrderItem item6=new OrderItem("Milk",15,"carton");
                    ArrayList<OrderItem> itemList3=new ArrayList<OrderItem>();
                    itemList3.add(item5);
                    itemList3.add(item6);
                    Order order3=new Order("101","23rd March 2015","Hong Seng Trading",itemList3);
                    
                     //order 4
                    OrderItem item7=new OrderItem("Chicken",10,"pieces");
                    OrderItem item8=new OrderItem("Fish",5,"whole");
                    ArrayList<OrderItem> itemList4=new ArrayList<OrderItem>();
                    itemList4.add(item7);
                    itemList4.add(item8);
                    Order order4=new Order("894","11th March 2015","Fine Food",itemList4);
                    
                    //orderList.add(order4);
                    //orderList.add(order3);
                    //orderList.add(order2);
                    orderList.add(order1);
                    return orderList;
    }
    */
    public static void saveOrderItemToDatabase(OrderItem orderItem, String order_id,String vendor_id){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        
        String ingredient_name=orderItem.getName();
        String price=orderItem.getPrice();
        String quantity=orderItem.getQuantity();
        //get supplier ID? or retrieve from arraylist?
        String supplier_id=orderItem.getSupplier();
        
        try
        {
            conn = ConnectionManager.getConnection();
            query = "INSERT INTO orderline " +"(vendor_id,order_id,supplier_id,ingredient_name,price,quantity) VALUES(?,?,?,?,?,?)";
             //where vendor_id=?
            statement = conn.prepareStatement(query);
            statement.setString(1,vendor_id);
            statement.setString(2,order_id);
            statement.setString(3,supplier_id);
            statement.setString(4,ingredient_name);
            statement.setString(5,price);
            statement.setString(6,quantity);
            statement.executeUpdate();
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
    }
    
    
    public static void saveOrderToDatabase(Order order){
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        
        String order_id=order.getOrderId();
        String vendor_id="1";//session.getAttribute("vendorID");
        String total_price=order.getTotalPrice();
        ArrayList<OrderItem> itemList=order.getOrderItem();
        
        try
        {
            conn = ConnectionManager.getConnection();
            query = "INSERT INTO `order` " +"(order_id,vendor_id,total_price) VALUES(?,?,?)";
             //where vendor_id=?
            statement = conn.prepareStatement(query);
            statement.setString(1,order_id);
            statement.setString(2,vendor_id);
            statement.setString(3,total_price);
            statement.executeUpdate();
            for(OrderItem item:itemList){
                saveOrderItemToDatabase(item, order_id,vendor_id);
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }
        }
        
        
    }
    
    public static ArrayList<Order> populateEmergencyOrder(){
        
                    ArrayList<Order> orderList=new ArrayList<Order>();
                    /*
                    //order 1
                    OrderItem item1=new OrderItem("Seedless Lime",15,"kg");
                    OrderItem item2=new OrderItem("Pineapple",1,"whole");
                    ArrayList<OrderItem> itemList1=new ArrayList<OrderItem>();
                    itemList1.add(item1);
                    itemList1.add(item2);
                    Order order1=new Order("123","14th April 2015","Fine Food",itemList1);
                    
                     //order 2
                    OrderItem item3=new OrderItem("Chicken",23,"pieces");
                    OrderItem item4=new OrderItem("Fish",16,"whole");
                    ArrayList<OrderItem> itemList2=new ArrayList<OrderItem>();
                    itemList2.add(item3);
                    itemList2.add(item4);
                    Order order2=new Order("114","10th April 2015","Waily Kenneth",itemList2);
                    
                     //order 3
                    OrderItem item5=new OrderItem("Bean",0.2,"kg");
                    OrderItem item6=new OrderItem("Milk",15,"carton");
                    ArrayList<OrderItem> itemList3=new ArrayList<OrderItem>();
                    itemList3.add(item5);
                    itemList3.add(item6);
                    Order order3=new Order("101","23rd March 2015","Hong Seng Trading",itemList3);
                    
                     //order 4
                    OrderItem item7=new OrderItem("Chicken",10,"pieces");
                    OrderItem item8=new OrderItem("Fish",5,"whole");
                    ArrayList<OrderItem> itemList4=new ArrayList<OrderItem>();
                    itemList4.add(item7);
                    itemList4.add(item8);
                    Order order4=new Order("894","11th March 2015","Fine Food",itemList4);
                    
                    orderList.add(order4);
                    orderList.add(order3);
                    orderList.add(order2);
                    orderList.add(order1);
                    */
                    return orderList;
                
    }
  
    
    public static ArrayList<Order> populateOrder()
    {
        String vendorID="1";//session.getAttribute("vendorID");
        Connection conn = null;
        PreparedStatement statement = null;
        PreparedStatement statementOrderItem = null;
        PreparedStatement statementSupplier = null;
        PreparedStatement statementIngredient = null;
        
        ResultSet rs = null;
        ResultSet rsOrderItem = null;
        ResultSet rsSupplier = null;
        ResultSet rsIngredient = null;
        
        String query = "";
        String queryOrderItem = "";
        String querySupplier = "";
        String queryIngredient = "";
        //String count = "";
        ArrayList<Order> orderList=new ArrayList<Order>();
        
        try
        {
            //Retrieves from database all orders relevant to the current person logged in(know this via vendor id)
            conn = ConnectionManager.getConnection();
            query = "select * from `order`where vendor_id=?";
             //where vendor_id=?
            statement = conn.prepareStatement(query);
            statement.setString(1,vendorID);
            rs = statement.executeQuery();
          
            while(rs.next()){
                
                //count = rs.getString("count");
                String orderId=rs.getString("order_id");
                int orderNumber=Integer.parseInt(orderId);
                if(orderNumber>OrderNum){
                    OrderNum=orderNumber;
                }
                String totalPrice=rs.getString("total_price");
                Order tempOrder=new Order(orderId,totalPrice,new ArrayList<OrderItem>());
                queryOrderItem = "select * from orderline where order_id=?";
                statementOrderItem=conn.prepareStatement(queryOrderItem);
                statementOrderItem.setString(1,orderId);
                rsOrderItem = statementOrderItem.executeQuery();
                //Retrieves from database all order items relevant to current order
                while(rsOrderItem.next()){
                    String supplierId=rsOrderItem.getString("supplier_id");
                    String ingredientName=rsOrderItem.getString("ingredient_name");
                    String price=rsOrderItem.getString("price");
                    String quantity=rsOrderItem.getString("quantity");
                    //OrderItem tempItem=new OrderItem(ingredientName,quantity,price);
                    //tempOrder.addOrderItem(tempItem);
                    
                    //retrieve units for an igredient
                    queryIngredient = "select * from ingredient where ingredient_name= ?";
                    statementIngredient=conn.prepareStatement(queryIngredient);
                    statementIngredient.setString(1,ingredientName);
                    rsIngredient=statementIngredient.executeQuery();
                    String unit="";
                    while(rsIngredient.next()){
                        unit=rsIngredient.getString("unit");
                    }
                    
                    //retrieve a supplier for an ingredient
                    querySupplier = "select * from supplier where supplier_id=?";
                    statementSupplier=conn.prepareStatement(querySupplier);
                    statementSupplier.setString(1,supplierId);
                    rsSupplier=statementSupplier.executeQuery();
                    String supplier="";//rsSupplier.getString("supplier_name");
                    while(rsSupplier.next()){
                        supplier=rsSupplier.getString("supplier_name");
                    }
                    
                    OrderItem tempItem=new OrderItem(ingredientName,quantity,price,unit,supplier);
                    tempOrder.addOrderItem(tempItem);
                    tempOrder.setSupplier(supplier);
                }
                orderList.add(tempOrder);
      
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            if(statement != null)
            {
                try
                {
                    statement.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(statementOrderItem != null)
            {
                try
                {
                    statementOrderItem.close(); 
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(statementSupplier != null)
            {
                try
                {
                    statementSupplier.close();    
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            if(statementIngredient != null)
            {
                try
                {
                    statementIngredient.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            
            if(conn != null)
            {
                try
                {
                    conn.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }                
            }            
        }        
        //return count;
        return orderList;
    }    
    
}
