package com.example.cheeseon;

public class Recipe {

    private String name;
    private String image ;
    private Integer preparation;
    private Integer cooking;
    private String[] ingredients;
    private String[] recipe;
    private String category;

    Recipe(String name, String image, Integer preparation,Integer cooking, String[] ingredients, String[] recipe, String category) {
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
    public String[] getIngredients() {
        return ingredients;
    }
    public void setIngredients(String[] ingredients) {
        this.ingredients = ingredients;
    }
    public String[] getRecipe() {
        return recipe;
    }
    public void setRecipe(String[] recipe) {
        this.recipe = recipe;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
}
