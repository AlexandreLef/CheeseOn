package com.example.cheeseon;

import java.util.ArrayList;
import java.util.List;

public class BaseRecipe {

    private List<Recipe> recipes = new ArrayList<>();

    public List<Recipe> getRecipes() {
        return recipes;
    }
    public void setRecipes(List<Recipe> recipes) {
        this.recipes = recipes;
    }
}
