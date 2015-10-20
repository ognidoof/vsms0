package Entity;


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
public class Menu {
    private ArrayList<Dish> dishList; 

    public Menu(ArrayList<Dish> dishList) {
        this.dishList = dishList;
    }

    public ArrayList<Dish> getDishList() {
        return dishList;
    }

    public void setDishList(ArrayList<Dish> dishList) {
        this.dishList = dishList;
    }
    
    public ArrayList<Dish> getDishListWithIngredient (String ingredient){
        ArrayList<Dish> dishArray= new ArrayList<Dish>();
        for(Dish dish : dishList){
            if(dish.hasIngredient(ingredient)){
                dishArray.add(dish);
            }
        }
        return dishArray;
    }
    
            
}
