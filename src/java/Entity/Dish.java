package Entity;


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
public class Dish {
    private String name;
    private HashMap<Ingredient, Supplier> ingredientList;

    public Dish(String name, HashMap<Ingredient, Supplier> ingredientList) {
        this.name = name;
        this.ingredientList = ingredientList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public HashMap<Ingredient, Supplier> getIngredientList() {
        return ingredientList;
    }

    public void setIngredientList(HashMap<Ingredient, Supplier> ingredientList) {
        this.ingredientList = ingredientList;
    }
    public boolean hasIngredient(String ingredient){
        for(Ingredient selected : ingredientList.keySet()){
            if (selected.getName().contains(ingredient))
                return true;
        }
        return false;
    }
    
    
}
