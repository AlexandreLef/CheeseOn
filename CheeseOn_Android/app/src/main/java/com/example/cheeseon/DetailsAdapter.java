package com.example.cheeseon;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.cheeseon.databinding.ActivityRecipeDetailsLayoutBinding;

import java.util.ArrayList;
import java.util.List;

public class DetailsAdapter extends RecyclerView.Adapter{

    private List<String> arrayDetails = new ArrayList<>();

    public void FillAray(List<String> arrayDetails){
        this.arrayDetails.clear();
        this.arrayDetails.addAll(arrayDetails);
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        ActivityRecipeDetailsLayoutBinding binding = ActivityRecipeDetailsLayoutBinding.inflate(LayoutInflater.from(parent.getContext()), parent, false);
        return new DetailsAdapter.ItemViewHolder(binding);
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        ((ItemViewHolder)holder).bindTo(arrayDetails.get(position),position);
    }

    @Override
    public int getItemCount() {
        return arrayDetails.size();
    }

    class ItemViewHolder extends RecyclerView.ViewHolder {
        public ActivityRecipeDetailsLayoutBinding mBinding;

        ItemViewHolder(ActivityRecipeDetailsLayoutBinding binding) {
            super(binding.getRoot());
            mBinding = binding;
        }
        void bindTo(String item, int position) {

            if (item != null) {
                mBinding.recipeContentCell.setText(item);
            }
        }
    }
}
