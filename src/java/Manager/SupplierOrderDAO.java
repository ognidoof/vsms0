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
                //
                //OrderItem orderitem = new OrderItem(ingredientName, quantity, price, "1", sup_id);
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
            for(Order or : orderList){
                System.out.println(or.getOrderId());
            }
            for(OrderItem item :orderItems){
            System.out.println(item.getName());
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
        //orderList = getActualOrderLists(orderList);
//        System.out.println("The orderList is " +orderList);
        return orderList;
    }
    public static HashMap<String, ArrayList<OrderItem>> getActualOrders(ArrayList<Order> unordered){
        System.out.println("Unordered is "+unordered);
        HashMap<String, ArrayList<OrderItem>> map = new HashMap<String, ArrayList<OrderItem>>();
        
//        ArrayList<OrderItem> conCat = new ArrayList<OrderItem>();
//        ArrayList<OrderItem> orderitems = new ArrayList<OrderItem>();
//       
//         for(Order currentOrder : unordered){
//            String currentId = currentOrder.getOrderId();
//            orderitems = currentOrder.getOrderItem();
//            
//            if(toReturn.size() == 0){
//                toReturn.put(currentId, orderitems);
//            }
//            
//            conCat = toReturn.get(currentId);
//            
//            if(!(toReturn.containsKey(currentId))){
//                toReturn.put(currentId, orderitems);
//            }else{
//                for(OrderItem orderitem : orderitems){
//                    conCat.add(orderitem);
//                    System.out.println(orderitem.getName()+orderitem.getName());
//                }
//            }
            ArrayList<OrderItem> orderItemList = new ArrayList<OrderItem>();
           
            Collections.sort(unordered,new Comparator<Order>(){
                public int compare(Order o1, Order o2){
                    return Integer.compare(Integer.parseInt(o1.getOrderId()),Integer.parseInt(o2.getOrderId()));
                }
            });
            System.out.println("The unordered is "+unordered);
            String tempId ="1";
            for (Order currentOrder:unordered){
                String currentId = currentOrder.getOrderId();
                System.out.println(currentId);
                ArrayList<OrderItem> currentItemList = currentOrder.getOrderItem();
                System.out.println("The currentItemList "+currentItemList);
                for(OrderItem orderItem : currentItemList){
                    orderItemList.add(orderItem);
                }
                if(!tempId.equals(currentId)){
                    map.put(tempId,orderItemList);
                    System.out.println("The current id is "+currentId);
                    System.out.println("The temp id is "+tempId);
                    System.out.println("The orderList is "+orderItemList);
                    orderItemList.clear();
                    System.out.println("The orderlist after cleared is "+orderItemList);
                }
                tempId = currentId;
            }
            
            map.put(tempId, orderItemList);
           
            
        
        return map;
    }
}   
    /*
    public static ArrayList<Order> getActualOrderLists(ArrayList<Order> unordered){
        ArrayList<Order> toReturn = new ArrayList<Order>();
        for(Order currentOrder : unordered){
            String currentId = currentOrder.getOrderId();
            ArrayList<OrderItem> orderitems = currentOrder.getOrderItem();
            unordered.remove(currentOrder);
            for(Order current2 : unordered){
               String currentId2 = current2.getOrderId();
               if(currentId.equals(currentId2)){
                   ArrayList<OrderItem> orderitems2 = currentOrder.getOrderItem();
                   for(OrderItem )
                   orderitems.add();
               }
            }
        }
    */  
        //return toReturn;
