package com.example.cheeseon;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.proximities.myapplication.databinding.RecipeLayoutBinding;

import java.util.ArrayList;
import java.util.List;

public class RecipeAdapter {
    private List<String> arrayToShow = new ArrayList<>();
    private OnitemClick mCallback;

    public void FillArray() {
        this.arrayToShow.add("nom 1");
        this.arrayToShow.add("nom 2");
        this.arrayToShow.add("nom 3");
        this.arrayToShow.add("nom 4");
        notifyDataSetChanged();
    }

    public RecipeAdapter(OnitemClick mCallback) {
        this.mCallback = mCallback;
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        RecipeLayoutBinding binding = RecipeLayoutBinding.inflate(LayoutInflater.from(parent.getContext()), parent, false);
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
        public RecipeLayoutBinding mBinding;

        ItemViewHolder(RecipeLayoutBinding binding) {
            super(binding.getRoot());
            mBinding = binding;
        }
        void bindTo(final String item, int position) {

            if (item != null) {
                mBinding.tvItem.setText(item);
                mBinding.tvItem.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        mCallback.onItemClick(item);
                    }
                });
            }
        }
    }
}