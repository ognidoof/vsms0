package Manager;


import Entity.Supplier;
import Entity.Menu;
import Entity.Dish;
import Entity.Ingredient;
import java.util.ArrayList;
import java.util.HashMap;

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
    
    public Menu defaultMenu(){
        Ingredient coffeeBean = new Ingredient("Coffee Beans", 20, "g");
        Ingredient duckLeg = new Ingredient("Leg of Duck", 1, "leg");
        Ingredient potato = new Ingredient("Potato", 500, "g");
        Ingredient parsley = new Ingredient("Parsley", 10, "g");
        Ingredient sage = new Ingredient("Sage", 10, "g");
        Ingredient ribEye = new Ingredient("Rib Eye", 250, "g");
        Ingredient groundBeef = new Ingredient("Ground Beef", 200, "g");
        Ingredient lettuce = new Ingredient("Lettuce", 50, "g");
        Ingredient tomato = new Ingredient("Tomato", 50, "g");
        Ingredient wholeChicken = new Ingredient("Whole Chicken", 1, "whole");
        Ingredient rosemary = new Ingredient("Rosemary", 10, "g");
        Ingredient thyme = new Ingredient("Thyme", 10, "g");
        
         ArrayList<String> i1 = new ArrayList<String>();
        i1.add("Rainbow pineapples");
        i1.add("Purple apples");
        i1.add("Pink oranges");
        i1.add("Lettuce");
        i1.add("Potatoes");
        i1.add("Tomatoes");
        i1.add("Coffee Beans");
        i1.add("Whole Chickens");
        ArrayList<String> i2 = new ArrayList<String>();
        i2.add("Rib Eye");
        i2.add("Leg of Duck");
        i2.add("Ground Beef ");
        ArrayList<String> i3 = new ArrayList<String>();
        i3.add("Parsley");
        i3.add("Sage");
        i3.add("Rosemary");
        i3.add("Thyme");
        
        String d1 = "Description: Providing the freshest and cheapest fruits since 1987. Offering a wide range, from tropical to imported exotic fruits. \n"
                + "Items Sold: Rainbow pinapples, Purple apples, Pink oranges etc \n"
                + "Location: Punggol Street 10, Industrial Block #B1-10";
        String d2 = "Animal Farm! Animal Animal Animals! \n Description: Where the pigs farm. Offering discounts on horse meat and beef. \n Items Sold: We have poultry ranging from kampong chicken to flying pigs!!";
        String d3 = "Only a Matter of Thyme!\n Description: Time waits for no one. Delivery across thyme and space.  \n Items Sold: Time";

       
        Supplier freshFruit = new Supplier("FreshFruitz", i1, "western", d1);
        Supplier animalFarm = new Supplier("Animal Farm", i2, "western", d2);
        Supplier thymeTime = new Supplier("Only a Matter of Thyme", i3, "spices", d3);
        
        HashMap<Ingredient, Supplier> espressoMap = new HashMap<>();
        HashMap<Ingredient, Supplier> duckMap = new HashMap<>();
        HashMap<Ingredient, Supplier> ribeyeMap = new HashMap<>();
        HashMap<Ingredient, Supplier> burgerMap = new HashMap<>();
        HashMap<Ingredient, Supplier> roastChickenMap = new HashMap<>();
        
        espressoMap.put(coffeeBean, freshFruit);
        duckMap.put(duckLeg, animalFarm);
        duckMap.put(potato, freshFruit);
        duckMap.put(parsley, thymeTime);
        duckMap.put(sage, thymeTime);
        ribeyeMap.put(ribEye, animalFarm);
        ribeyeMap.put(potato, freshFruit);
        burgerMap.put(groundBeef, animalFarm);
        burgerMap.put(lettuce, freshFruit);
        burgerMap.put(tomato, freshFruit);
        roastChickenMap.put(wholeChicken, animalFarm);
        roastChickenMap.put(rosemary, thymeTime);
        roastChickenMap.put(thyme, thymeTime);
        
        
        
        
        Dish espresso = new Dish("Espresso", espressoMap);
        Dish duckConfit = new Dish("Duck Confit", duckMap);
        Dish ribEyeDish = new Dish("Rib Eye Steak", ribeyeMap);
        Dish burger = new Dish("Burger", burgerMap);
        Dish roastChicken = new Dish("Roast Chicken", roastChickenMap);
        
        
        ArrayList<Dish> dishList = new ArrayList<>();
        dishList.add(espresso);
        dishList.add(duckConfit);
        dishList.add(ribEyeDish);
        dishList.add(burger);
        dishList.add(roastChicken);
        
        menu = new Menu(dishList);
        return menu;
        
    }
}
