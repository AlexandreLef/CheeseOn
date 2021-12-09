package com.example.cheeseon;

public class Recipe {

    String image ;
    String name;
    Integer preparation;
    Integer cooking;
    String[] ingredients;
    String[] recipe;
    String category;

    Recipe(String name, String image, Integer preparation,Integer cooking, String[] ingredients, String[] recipe, String category) {
        this.name = name;
        this.image = image;
        this.preparation = preparation;
        this.cooking = cooking;
        this.ingredients = ingredients;
        this.recipe = recipe;
        this.category = category;
    }
    
}
