package com.example.cheeseon;

import android.view.LayoutInflater;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.cheeseon.databinding.ActivityRecipeIngredientLayoutBinding;

import java.util.ArrayList;
import java.util.List;

public class IngredientsAdapter extends RecyclerView.Adapter{

    private List<String> arrayIngredients = new ArrayList<>();

    public void FillAray(List<String> arrayIngredients){
        this.arrayIngredients.clear();
        this.arrayIngredients.addAll(arrayIngredients);
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        ActivityRecipeIngredientLayoutBinding binding = ActivityRecipeIngredientLayoutBinding.inflate(LayoutInflater.from(parent.getContext()), parent, false);
        return new IngredientsAdapter.ItemViewHolder(binding);
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        ((ItemViewHolder)holder).bindTo(arrayIngredients.get(position),position);
    }

    @Override
    public int getItemCount() {
        return arrayIngredients.size();
    }

    class ItemViewHolder extends RecyclerView.ViewHolder {
        public ActivityRecipeIngredientLayoutBinding mBinding;

        ItemViewHolder(ActivityRecipeIngredientLayoutBinding binding) {
            super(binding.getRoot());
            mBinding = binding;
        }
        void bindTo(String item, int position) {

            if (item != null) {
                mBinding.recipeIngredientCell.setText(item);
            }
        }
    }
}
