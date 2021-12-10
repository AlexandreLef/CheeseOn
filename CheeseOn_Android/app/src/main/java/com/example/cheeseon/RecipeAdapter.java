package com.example.cheeseon;

import android.content.Context;
import android.content.res.Resources;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.cheeseon.databinding.ActivityRecipeLayoutBinding;
import com.google.gson.Gson;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class RecipeAdapter extends RecyclerView.Adapter {
    private List<Recipe> arrayToShow = new ArrayList<>();
    private OnitemClick mCallback;
    private Context context ;


    public void FillArray() {
        StringBuilder builder = new StringBuilder();
        InputStream content =  context.getResources().openRawResource(R.raw.recipes_list) ;
        BufferedReader reader = new BufferedReader(new InputStreamReader(content));
        String line = "";

        while (true) {
            try {
                if (!((line = reader.readLine()) != null)) break;
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
            builder.append(line);
        }
        line = builder.toString();
        BaseRecipe baseRecipe = new Gson().fromJson(line, BaseRecipe.class);
        arrayToShow.addAll(baseRecipe.getRecipes());
        notifyDataSetChanged();
    }

    public RecipeAdapter(OnitemClick mCallback,Context context) {
        this.mCallback = mCallback;
        this.context = context;
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        ActivityRecipeLayoutBinding binding = ActivityRecipeLayoutBinding.inflate(LayoutInflater.from(parent.getContext()), parent, false);
        return new RecipeAdapter.ItemViewHolder(binding);
    }


    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        ((ItemViewHolder)holder).bindTo(arrayToShow.get(position), position);
    }

    @Override
    public int getItemCount() {
        return arrayToShow.size();
    }

    class ItemViewHolder extends RecyclerView.ViewHolder {
        public ActivityRecipeLayoutBinding mBinding;

        ItemViewHolder(ActivityRecipeLayoutBinding binding) {
            super(binding.getRoot());
            mBinding = binding;
        }
        void bindTo(Recipe item, int position) {

            if (item != null) {
                mBinding.recipeTitle.setText(item.getName());
                Resources resources = context.getResources();
                final int resourceId = resources.getIdentifier(item.getImage(),
                        "drawable", context.getPackageName());

                mBinding.recipeImage.setImageResource(resourceId);
                mBinding.recipeImage.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        mCallback.onitemClick(item);
                    }
                });
            }
        }
    }
}