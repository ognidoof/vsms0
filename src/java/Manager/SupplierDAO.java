/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

import Entity.Dish;
import Entity.Menu;
import Entity.Supplier;
import Manager.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Joel
 */
public class SupplierDAO {
    
    //public static List<Supplier>supArray = new ArrayList<Supplier>();
    /*
    public List<Supplier> retrieveAll(){
        List<Supplier> supArray = new ArrayList<Supplier>();
    
        ArrayList<String> i1 = new ArrayList<String>();
        i1.add("Rainbow pineapples");
        i1.add("Purple apples");
        i1.add("Pink oranges");
        i1.add("Strawberry");
        i1.add("Lettuce");
        i1.add("Potatoes");
        i1.add("Tomatoes");
        i1.add("Coffee Beans");
        i1.add("Whole Chickens");
        ArrayList<String> i2 = new ArrayList<String>();
        i2.add("Chicken feet");
        i2.add("Foreign chicken");
        i2.add("Local chicken");
        ArrayList<String> i3 = new ArrayList<String>();
        i3.add("Rainbow cabbage");
        i3.add("Blue spinach");
        i3.add("Organic olives");
        ArrayList<String> i4 = new ArrayList<String>();
        i4.add("Rib Eye");
        i4.add("Leg of Duck");
        i4.add("Ground Beef ");
        ArrayList<String> i5 = new ArrayList<String>();
        i5.add("Parsley");
        i5.add("Sage");
        i5.add("Rosemary");
        i5.add("Thyme");
        
        String d1 = "Description: Providing the freshest and cheapest fruits since 1987. Offering a wide range, from tropical to imported exotic fruits. \n"
                + "Items Sold: Rainbow pinapples, Purple apples, Pink oranges etc \n"
                + "Location: Punggol Street 10, Industrial Block #B1-10";
        String d2 = "Description: Providing the freshest and cheapest chicken since 1887. Offering a wide range of fresh chicken parts \n"
                + "Items Sold: Chicken feet, foreign and local chicken \n"
                + "Location: Lakeside Street 20, Block 401, #11-10";
        String d3 = "Description: Established in 2014, we provide the best technology in growing organic vegetables. We conduct research in additive free, genetically modified vegetables infused with a variety of vitamins and minerals. \n"
                + "Items Sold: Rainbow cabbage, Blue spinach, Organic olives \n"
                + "Location: Jurong Avenue 2, Opposite Jurong Bird Park";
        String d4 = "Animal Farm! Animal Animal Animals! \n Description: Where the pigs farm. Offering discounts on horse meat and beef. \n Items Sold: We have poultry ranging from kampong chicken to flying pigs!!";
        String d5 = "Only a Matter of Thyme!\n Description: Time waits for no one. Delivery across thyme and space.  \n Items Sold: Time";
        
                
        Supplier s1 = new Supplier("FreshFruitz", i1, "western", d1);
        Supplier s2 = new Supplier("FreshFoodz", i2, "asian", d2);
        Supplier s3 = new Supplier("FreshSaladz", i3, "fusion", d3);
        Supplier s4 = new Supplier("Animal Farm", i4, "western", d4);
        Supplier s5 = new Supplier("Only a Matter of Thyme", i5, "spices", d5);
        
        supArray.add(s1);
        supArray.add(s2);
        supArray.add(s3);
        supArray.add(s4);
        supArray.add(s5);
        
        return supArray;
    
    }
    */
    
    public Supplier getSupplier(String supName, List<Supplier> supArray){
            Supplier sup = null;
            
            for(Supplier toSearch : supArray){
                if(toSearch.getSupName().equals(supName)){
                    sup = toSearch;
                }
            }
        return sup;
    }
    
    public static ArrayList<Supplier> favouriteSuppliers(String id){
        String vendorID=id;
        ArrayList<Supplier> favouriteList=new ArrayList<Supplier>();
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String query = "";
        try{
            conn = ConnectionManager.getConnection();
            query = "select * from favourite_supplier where vendor_id=?";
             //where vendor_id=?
            statement = conn.prepareStatement(query);
            statement.setString(1,vendorID);
            rs = statement.executeQuery();
            while(rs.next()){
                String supplier_id=rs.getString("supplier_id");
                favouriteList.add(MenuManager.getSupplierById(supplier_id));
            }
            //Menu menu=new Menu(dishList);
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
            return favouriteList;
        } 
    }
}

