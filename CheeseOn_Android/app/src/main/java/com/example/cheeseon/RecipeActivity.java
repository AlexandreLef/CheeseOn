package com.example.cheeseon;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.view.View;

import com.example.cheeseon.databinding.ActivityRecipeBinding;
import com.google.gson.Gson;

public class RecipeActivity extends AppCompatActivity {

    private ActivityRecipeBinding mBinding;
    private IngredientsAdapter mAdapter;
    private DetailsAdapter nAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mBinding = ActivityRecipeBinding.inflate(getLayoutInflater());
        View v = mBinding.getRoot();
        Recipe recipe = new Gson().fromJson(getIntent().getStringExtra("recipe_clicked"), Recipe.class);

        mBinding.goBackButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent home = new Intent(getApplicationContext(), HomeActivity.class);
                home.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
                startActivity(home);
            }
        });
        mBinding.recipeIngredientList.setLayoutManager(new LinearLayoutManager(this,LinearLayoutManager.VERTICAL, false));
        mAdapter = new IngredientsAdapter();
        mBinding.recipeIngredientList.setAdapter(mAdapter);
        mBinding.recipeIngredientList.setNestedScrollingEnabled(false);

        mBinding.recipeContentList.setLayoutManager(new LinearLayoutManager(this,LinearLayoutManager.VERTICAL, false));
        nAdapter = new DetailsAdapter();
        mBinding.recipeContentList.setAdapter(nAdapter);
//        mBinding.recipeContentList.setNestedScrollingEnabled(false);

        mBinding.recipeNameCell.setText(recipe.getName());
        mBinding.cookingTime.setText(recipe.getCooking().toString() + "min");
        mBinding.preparationTime.setText(recipe.getPreparation().toString() + "min");


        mAdapter.FillAray(recipe.getIngredients());
        nAdapter.FillAray(recipe.getRecipe());


        Resources resources = getResources();
        final int resourceId = resources.getIdentifier(recipe.getImage(),
                "drawable", getPackageName());

        mBinding.recipeImageCell.setImageResource(resourceId);


        setContentView(v);
    }
}