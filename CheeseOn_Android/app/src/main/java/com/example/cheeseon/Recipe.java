package com.example.cheeseon;

import java.util.List;

public class Recipe {

    private String name;
    private String image ;
    private Integer preparation;
    private Integer cooking;
    private List<String> ingredients;
    private List<String> recipe;
    private String category;

    Recipe(String name, String image, Integer preparation,Integer cooking, List<String> ingredients, List<String> recipe, String category) {
        this.name = name;
        this.image = image;
        this.preparation = preparation;
        this.cooking = cooking;
        this.ingredients = ingredients;
        this.recipe = recipe;
        this.category = category;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public Integer getPreparation() {
        return preparation;
    }
    public void setPreparation(Integer preparation) {
        this.preparation = preparation;
    }
    public Integer getCooking() {
        return cooking;
    }
    public void setCooking(Integer cooking) {
        this.cooking = cooking;
    }

    public List<String> getIngredients() {
        return ingredients;
    }

    public void setIngredients(List<String> ingredients) {
        this.ingredients = ingredients;
    }

    public List<String> getRecipe() {
        return recipe;
    }

    public void setRecipe(List<String> recipe) {
        this.recipe = recipe;
    }

    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
}
