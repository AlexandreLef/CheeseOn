package com.example.cheeseon;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.example.cheeseon.databinding.ActivityRecipeBinding;

public class RecipeActivity extends AppCompatActivity {

    private ActivityRecipeBinding mBinding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mBinding = ActivityRecipeBinding.inflate(getLayoutInflater());
        View v = mBinding.getRoot();

        mBinding.goBackButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent home = new Intent(getApplicationContext(), HomeActivity.class);
                home.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
                startActivity(home);
            }
        });

        setContentView(v);
    }
}