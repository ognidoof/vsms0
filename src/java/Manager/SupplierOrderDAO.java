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
public class SupplierOrderDAO {
    public static int OrderNum=0;
    public static String totalPrice = "";
    
    /*
    public String getTotalPrice(String price){
        Double tempD = Double.parseDouble(price);
        Double totalPriceTemp = Double.parseDouble(totalPrice);
        Double total = tempD + totalPriceTemp;
        String toReturn = String.valueOf(total);
        return toReturn;
    }
    */
    
    public static ArrayList<Order> getRelevantOrders(String supplier_id){
        //String vendorID="1";//session.getAttribute("vendorID");
        String sup_id = supplier_id;
        Connection conn = null;
        PreparedStatement statementSupId = null;
        PreparedStatement statementIngredient = null;
        
        String querySup = "";
        String queryIng = "";
        
        ResultSet rsSup = null;
        ResultSet rsIng = null;
        
        ArrayList<Order> orderList = new ArrayList<Order>();
        ArrayList<OrderItem> orderItems = new ArrayList<OrderItem>();
        
        
        try{
            //Retrieves from database all orders relevant to the current person logged in(know this via vendor id)
            conn = ConnectionManager.getConnection();
            querySup = "SELECT * FROM `orderline` WHERE supplier_id=?";
            statementSupId = conn.prepareStatement(querySup);
            statementSupId.setString(1, sup_id);
            rsSup = statementSupId.executeQuery();
            
            while(rsSup.next()){
                String orderId = rsSup.getString("order_id");
                String ingredientName = rsSup.getString("ingredient_name");
                String price = rsSup.getString("price");
                String quantity = rsSup.getString("quantity");
                
                //query ingredients db to get units
                queryIng = "SELECT * FROM `ingredient` WHERE ingredient_name=?";
                statementIngredient = conn.prepareStatement(queryIng);
                statementIngredient.setString(1, ingredientName);
                rsIng = statementIngredient.executeQuery();
                
                String ingredientUnit = "";
                while(rsIng.next()){
                    ingredientUnit = rsIng.getString("unit");
                }
                
                //create orderitem
                OrderItem orderitem = new OrderItem(ingredientName, quantity, price, ingredientUnit, sup_id);
                orderItems.add(orderitem);
                
                //getting total price
                String totalPrice = "0.0";
                for(OrderItem o : orderItems){
                    String tempPrice = o.getPrice();
                    Double indPrice = (Double)Double.parseDouble(price);
                    Double tallyPrice = (Double)Double.parseDouble(totalPrice);
                    Double total = indPrice + tallyPrice;
                    totalPrice = String.valueOf(total);
                }
                
                Order tempOrder = new Order(orderId, totalPrice, orderItems);
                orderList.add(tempOrder);
            }

        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if(statementSupId != null){
                try{
                    statementSupId.close();
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            }
            if(statementIngredient != null){
                try{
                    statementIngredient.close(); 
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            }
            
            if(conn != null){
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
    /*
    public static ArrayList<Order> getActualOrderLists (ArrayList<Order> unorderedOrders){
        ArrayList<Order> toReturn = new ArrayList<Order>();
        for(Order o : unorderedOrders){
            String orderid = o.getOrderId();
            for(Order order2 : unorderedOrders){
                String orderid2 = order2.getOrderId();
                if(orderid.equals(orderid2)){
                    toReturn.add(order2);
                    unorderedOrders.remove(order2);
                }
            }
        }
        
        return toReturn;
    }
    */   