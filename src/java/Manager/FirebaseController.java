/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.Order;
import Entity.OrderItem;
import com.firebase.client.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class FirebaseController {

    public static void main(String[] args) {
        ArrayList<OrderItem> itemList = new ArrayList<OrderItem>();
        itemList.add(new OrderItem("peanut","5", "23", "pieces", "FreshFoodz"));
        itemList.add(new OrderItem("chips","1", "10", "bags", "FreshFoodz"));
        Order order1 = new Order("43","Christina", "0", "FreshFoodz", itemList);

        Order order2 = new Order("50","Christina", "", "Only a Matter of Thyme", itemList);
        ArrayList<Order> orderList = new ArrayList<Order>();
        orderList.add(order1);
        orderList.add(order2);
        sendOrderListToChat(orderList);
    }

    public static void testConnection() throws Exception {

        Firebase ref = new Firebase("https://vsms.firebaseio.com");

        ref.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot snapshot) {
                System.out.println("data");
            }

            public void onCancelled() {
                System.err.println("Listener was cancelled");
            }

            public void onCancelled(FirebaseError fe) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }
        });

        //Create HashMap for inputs to the firebase
        Map<String, String> post1 = new HashMap<String, String>();
        post1.put("receiver", "Christina");
        post1.put("sender", "FreshFoodz");
        post1.put("text", "Hello FirebaseTest is here");
        post1.put("ordercondition", "unapproved");

        //setValue and push it as a post
        ref.push().setValue(post1);

    }

    //Send the list of suppliers and orders to chat
    public static void sendOrderListToChat(ArrayList<Order> orderList) {
        Firebase ref = new Firebase("https://vsms.firebaseio.com");
        //test connections. Will print data if the data is found to be changed

        ref.addChildEventListener(new ChildEventListener() {
            public void onChildChanged(DataSnapshot snapshot, String previousChildKey) {
                String key = (String) snapshot.child("key").getValue();
                String orderId = (String) snapshot.child("orderid").getValue();
                String ordercondition = (String) snapshot.child("ordercondition").getValue();
                //Changes to be made to put into mysql!
                System.out.println("The order that was changed is orderID" + orderId);
                System.out.println("The ordercondition changed " + ordercondition);
            }

            @Override
            public void onChildAdded(DataSnapshot ds, String string) {
                System.out.println("The child is added");
            }

            @Override
            public void onChildRemoved(DataSnapshot ds) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }

            @Override
            public void onChildMoved(DataSnapshot ds, String string) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }


            @Override
            public void onCancelled() {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }
        });

        //For every order prin it in html row (add <li> for a breakspace
        for (Order order : orderList) {

            //Start sending order
            String message = "<li>Order sent!!!";
            message += "<li>Order ID: "+order.getOrderId();
            message += "<li> ----------------------------------";
            ArrayList<OrderItem> orderItemList = order.getOrderItem();
            int i = 0;
            for (OrderItem orderItem : orderItemList) {
                i++;
                String itemName = orderItem.getName();
                String itemQuantity = orderItem.getQuantity();
                String itemUnit = orderItem.getUnit();
                message += "<li>item " + i + ": " + itemName + " " + itemUnit + " " + itemQuantity;
            }
            message += "<li>Please answer -reply {order key} {\"yes\" to approve or \"no\" to reject>}";

            Map<String, String> post1 = new HashMap<String, String>();
            post1.put("orderid",order.getOrderId());
            post1.put("receiver", order.getSupplier());
            post1.put("sender", order.getVendor());
            post1.put("text", message);
            post1.put("ordercondition", "pending");
            Firebase postRef = ref.push();
            //Get the key and store it as a last key per order.
            post1.put("key", postRef.getName());
            postRef.setValue(post1);
        }
    }
}
