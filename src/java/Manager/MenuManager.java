package Manager;

import Entity.Supplier;
import Entity.Menu;
import Entity.Dish;
import Entity.Ingredient;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Benjamin
 */
public class MenuManager {
    
    Menu menu;
    public static Connection publicConn;
    
//    public Menu defaultMenu(){
//        
//        Ingredient coffeeBean = new Ingredient("Coffee Beans", 20, "g");
//        Ingredient duckLeg = new Ingredient("Leg of Duck", 1, "leg");
//        Ingredient potato = new Ingredient("Potato", 500, "g");
//        Ingredient parsley = new Ingredient("Parsley", 10, "g");
//        Ingredient sage = new Ingredient("Sage", 10, "g");
//        Ingredient ribEye = new Ingredient("Rib Eye", 250, "g");
//        Ingredient groundBeef = new Ingredient("Ground Beef", 200, "g");
//        Ingredient lettuce = new Ingredient("Lettuce", 50, "g");
//        Ingredient tomato = new Ingredient("Tomato", 50, "g");
//        Ingredient wholeChicken = new Ingredient("Whole Chicken", 1, "whole");
//        Ingredient rosemary = new Ingredient("Rosemary", 10, "g");
//        Ingredient thyme = new Ingredient("Thyme", 10, "g");
//        
//         ArrayList<String> i1 = new ArrayList<String>();
//        i1.add("Rainbow pineapples");
//        i1.add("Purple apples");
//        i1.add("Pink oranges");
//        i1.add("Lettuce");
//        i1.add("Potatoes");
//        i1.add("Tomatoes");
//        i1.add("Coffee Beans");
//        i1.add("Whole Chickens");
//        ArrayList<String> i2 = new ArrayList<String>();
//        i2.add("Rib Eye");
//        i2.add("Leg of Duck");
//        i2.add("Ground Beef ");
//        ArrayList<String> i3 = new ArrayList<String>();
//        i3.add("Parsley");
//        i3.add("Sage");
//        i3.add("Rosemary");
//        i3.add("Thyme");
//        
//        String d1 = "Description: Providing the freshest and cheapest fruits since 1987. Offering a wide range, from tropical to imported exotic fruits. \n"
//                + "Items Sold: Rainbow pinapples, Purple apples, Pink oranges etc \n"
//                + "Location: Punggol Street 10, Industrial Block #B1-10";
//        String d2 = "Animal Farm! Animal Animal Animals! \n Description: Where the pigs farm. Offering discounts on horse meat and beef. \n Items Sold: We have poultry ranging from kampong chicken to flying pigs!!";
//        String d3 = "Only a Matter of Thyme!\n Description: Time waits for no one. Delivery across thyme and space.  \n Items Sold: Time";
//
//    Menu menu;

//    public Menu defaultMenu(){
//        Ingredient coffeeBean = new Ingredient("Coffee Beans", 20, "g");
//        Ingredient duckLeg = new Ingredient("Leg of Duck", 1, "leg");
//        Ingredient potato = new Ingredient("Potato", 500, "g");
//        Ingredient parsley = new Ingredient("Parsley", 10, "g");
//        Ingredient sage = new Ingredient("Sage", 10, "g");
//        Ingredient ribEye = new Ingredient("Rib Eye", 250, "g");
//        Ingredient groundBeef = new Ingredient("Ground Beef", 200, "g");
//        Ingredient lettuce = new Ingredient("Lettuce", 50, "g");
//        Ingredient tomato = new Ingredient("Tomato", 50, "g");
//        Ingredient wholeChicken = new Ingredient("Whole Chicken", 1, "whole");
//        Ingredient rosemary = new Ingredient("Rosemary", 10, "g");
//        Ingredient thyme = new Ingredient("Thyme", 10, "g");
//        
//         ArrayList<String> i1 = new ArrayList<String>();
//        i1.add("Rainbow pineapples");
//        i1.add("Purple apples");
//        i1.add("Pink oranges");
//        i1.add("Lettuce");
//        i1.add("Potatoes");
//        i1.add("Tomatoes");
//        i1.add("Coffee Beans");
//        i1.add("Whole Chickens");
//        ArrayList<String> i2 = new ArrayList<String>();
//        i2.add("Rib Eye");
//        i2.add("Leg of Duck");
//        i2.add("Ground Beef ");
//        ArrayList<String> i3 = new ArrayList<String>();
//        i3.add("Parsley");
//        i3.add("Sage");
//        i3.add("Rosemary");
//        i3.add("Thyme");
//        
//        String d1 = "Description: Providing the freshest and cheapest fruits since 1987. Offering a wide range, from tropical to imported exotic fruits. \n"
//                + "Items Sold: Rainbow pinapples, Purple apples, Pink oranges etc \n"
//                + "Location: Punggol Street 10, Industrial Block #B1-10";
//        String d2 = "Animal Farm! Animal Animal Animals! \n Description: Where the pigs farm. Offering discounts on horse meat and beef. \n Items Sold: We have poultry ranging from kampong chicken to flying pigs!!";
//        String d3 = "Only a Matter of Thyme!\n Description: Time waits for no one. Delivery across thyme and space.  \n Items Sold: Time";
//
//       
//        Supplier freshFruit = new Supplier("FreshFruitz", i1, "western", d1);
//        Supplier animalFarm = new Supplier("Animal Farm", i2, "western", d2);
//        Supplier thymeTime = new Supplier("Only a Matter of Thyme", i3, "spices", d3);
//        
//        HashMap<Ingredient, Supplier> espressoMap = new HashMap<>();
//        HashMap<Ingredient, Supplier> duckMap = new HashMap<>();
//        HashMap<Ingredient, Supplier> ribeyeMap = new HashMap<>();
//        HashMap<Ingredient, Supplier> burgerMap = new HashMap<>();
//        HashMap<Ingredient, Supplier> roastChickenMap = new HashMap<>();
//        
//        espressoMap.put(coffeeBean, freshFruit);
//        duckMap.put(duckLeg, animalFarm);
//        duckMap.put(potato, freshFruit);
//        duckMap.put(parsley, thymeTime);
//        duckMap.put(sage, thymeTime);
//        ribeyeMap.put(ribEye, animalFarm);
//        ribeyeMap.put(potato, freshFruit);
//        burgerMap.put(groundBeef, animalFarm);
//        burgerMap.put(lettuce, freshFruit);
//        burgerMap.put(tomato, freshFruit);
//        roastChickenMap.put(wholeChicken, animalFarm);
//        roastChickenMap.put(rosemary, thymeTime);
//        roastChickenMap.put(thyme, thymeTime);
//        
//        
//        
//        
//        Dish espresso = new Dish("Espresso", espressoMap);
//        Dish duckConfit = new Dish("Duck Confit", duckMap);
//        Dish ribEyeDish = new Dish("Rib Eye Steak", ribeyeMap);
//        Dish burger = new Dish("Burger", burgerMap);
//        Dish roastChicken = new Dish("Roast Chicken", roastChickenMap);
//        
//        
//        ArrayList<Dish> dishList = new ArrayList<>();
//        dishList.add(espresso);
//        dishList.add(duckConfit);
//        dishList.add(ribEyeDish);
//        dishList.add(burger);
//        dishList.add(roastChicken);
//        
//        menu = new Menu(dishList);
//        return menu;
//        
//    }
    
    //FOR WHEN QUERYING FOR EACH INGREDIENT NAME WILL LAG
    
//    public HashMap<String, String> getIngrNameList(){
//        HashMap<String, String> ingreNameList = null;
//        
//        Connection conn = null;
//        PreparedStatement ingStatement = null;
//        ResultSet ingRs = null;
//        String ingQuery = "";
//        try {
//            conn = ConnectionManager.getConnection();
//            ingQuery = "select ingredient_id, ingredient_name from ingredient ORDER BY ingredient_id";
//            //where vendor_id=?
//            ingStatement = conn.prepareStatement(ingQuery);
//            ingRs = ingStatement.executeQuery();
//            while (ingRs.next()) {
//                ingreNameList.put(ingRs.getString("ingredient_id"), ingRs.getString("ingredient_name"));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (ingStatement != null) {
//                try {
//                    ingStatement.close();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//            return ingreNameList;
//        }
//    }
    
    public static void createConnection(){
        try{
            publicConn=ConnectionManager.getConnection();
        }catch(Exception e){
            
        }
        
    }
    
    //this method creates an ingredient object
    public static Ingredient getIngredient(String ingredient_id, String supplierId, String quantity) {
        Ingredient toReturn = null;
        Connection conn = null;
        PreparedStatement ingStatement = null;
        ResultSet ingRs = null;
        String ingQuery = "";
        try {
            conn = publicConn;
            ingQuery = "select * from ingredient where supplier_id=? and ingredient_id=?";
            //where vendor_id=?
            ingStatement = conn.prepareStatement(ingQuery);
            ingStatement.setString(1, supplierId);
            ingStatement.setString(2, ingredient_id);
            ingRs = ingStatement.executeQuery();
            while (ingRs.next()) {
                String unit = ingRs.getString("unit");
                String ingID = ingRs.getString("ingredient_id");
                String ingName = ingRs.getString("ingredient_name");
                toReturn = new Ingredient(ingName, ingID, Integer.parseInt(quantity), unit, supplierId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ingStatement != null) {
                try {
                    ingStatement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            return toReturn;
        }
    }
    
    public static Supplier getSupplierById(String id) {
        Supplier supplier = null;
        ArrayList<String> list = new ArrayList<String>();
        ArrayList<String> idList = new ArrayList<String>();
        Connection conn = null;

        PreparedStatement supStatement = null;
        PreparedStatement itemStatement = null;

        ResultSet supRs = null;
        ResultSet itemRs = null;

        String supQuery = "";
        String itemQuery = "";
        try {
            conn = publicConn;
            supQuery = "select * from supplier where supplier_id=?";
            //where vendor_id=?
            supStatement = conn.prepareStatement(supQuery);
            supStatement.setString(1, id);
            supRs = supStatement.executeQuery();
            while (supRs.next()) {
                String supplierName = supRs.getString("supplier_name");
                String supplierDesc = supRs.getString("supplier_description");
                String supplierType = supRs.getString("supplier_type");

                itemQuery = "select * from ingredient where supplier_id=?";
                itemStatement = conn.prepareStatement(itemQuery);
                itemStatement.setString(1, id);
                itemRs = itemStatement.executeQuery();
                while (itemRs.next()) {
                    String itemName = itemRs.getString("ingredient_name");
                    String itemId=itemRs.getString("ingredient_id");
                    list.add(itemName);
                    idList.add(itemId);
                }
                supplier=new Supplier(id, supplierName, list, supplierType,supplierDesc);
                supplier.addIngredientId(idList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (supStatement != null) {
                try {
                    supStatement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (itemStatement != null) {
                try {
                    itemStatement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            return supplier;
        }
    }

    public static HashMap<Ingredient, Supplier> populateIngredientList(String dishId, String vendorId) {
        HashMap<Ingredient, Supplier> ingredientMap = new HashMap<Ingredient, Supplier>();
        Connection conn = null;
        PreparedStatement recipeStatement = null;
        ResultSet recipeRs = null;
        String recipeQuery = "";
        try {
            //HashMap<String, String> ingList = getIngrNameList();
            conn = publicConn;
            recipeQuery = "select * from recipe where dish_id=? and vendor_id=?";
            //where vendor_id=?
            recipeStatement = conn.prepareStatement(recipeQuery);
            recipeStatement.setString(1, dishId);
            recipeStatement.setString(2, vendorId);
            recipeRs = recipeStatement.executeQuery();
            while (recipeRs.next()) {
                String ingredientID = recipeRs.getString("ingredient_id");
                String quantity = recipeRs.getString("quantity");
                String supplier = recipeRs.getString("supplier_id");
                
                Ingredient ingredient = getIngredient(ingredientID, supplier, quantity);
                Supplier sup = getSupplierById(supplier);
                ingredientMap.put(ingredient, sup);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (recipeStatement != null) {
                try {
                    recipeStatement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            return ingredientMap;
        }
    }

    public static Menu populateMenu(String id) {
        String vendorID = id;//session.getAttribute("vendorID");
        ArrayList<Dish> dishList = new ArrayList<Dish>();
        Connection conn = null;
        PreparedStatement dishStatement = null;
        ResultSet dishRs = null;
        String dishQuery = "";
        try {
            conn = ConnectionManager.getConnection();
            dishQuery = "SELECT * from dish WHERE vendor_id=? ORDER BY dish_id";
            //where vendor_id=?
            dishStatement = conn.prepareStatement(dishQuery);
            dishStatement.setString(1, vendorID);
            dishRs = dishStatement.executeQuery();
            while (dishRs.next()) {
                String dishId = dishRs.getString("dish_id");
                String dishName = dishRs.getString("dish_name");
                Dish dish = new Dish(dishId, dishName, populateIngredientList(dishId, vendorID));
                dishList.add(dish);
            }
            //Menu menu=new Menu(dishList);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (dishStatement != null) {
                try {
                    dishStatement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            return new Menu(dishList);
        }
    }

    public static void insertDish(Dish d, String vID) {
        Connection conn = null;
        PreparedStatement dishStatement = null;
        PreparedStatement ingreStatement = null;

        String dishStmt = "", ingreStmt = "";
        String vendorID = "1";//session.getAttribute("vendorID");
        try {
            conn = ConnectionManager.getConnection();
            dishStmt = "INSERT INTO dish"
                    + "(dish_id, dish_name, vendor_id, dish_description) VALUES"
                    + "(?,?,?,?)";
            //where vendor_id=?
            dishStatement = conn.prepareStatement(dishStmt);
            dishStatement.setString(1, d.getDishID());
            dishStatement.setString(2, d.getName());
            dishStatement.setString(3, vendorID);
            dishStatement.setString(4, "newly added");
            dishStatement.executeUpdate();
            HashMap<Ingredient, Supplier> ingreList = d.getIngredientList();
            if (ingreList != null) {
                Set<Ingredient> ingredientSet = ingreList.keySet();
                Iterator<Ingredient> iter = ingredientSet.iterator();

                while (iter.hasNext()) {
                    Ingredient i = iter.next();
                    ingreStmt = "INSERT INTO recipe"
                            + "(dish_id, ingredient_id,quantity,vendor_id,supplier_id) VALUES"
                            + "(?,?,?,?,?)";
                    ingreStatement = conn.prepareStatement(ingreStmt);
                    ingreStatement.setString(1, d.getDishID());
                    ingreStatement.setString(2, i.getingID());
                    String q = i.getQuantity() + "";
                    ingreStatement.setString(3, q);
                    ingreStatement.setString(4, vID);
                    ingreStatement.setString(5, i.getSupID());
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.close(conn, dishStatement, null);

        }
    }
}
