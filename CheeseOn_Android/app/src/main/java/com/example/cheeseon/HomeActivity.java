package com.example.cheeseon;

import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.GridLayoutManager;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.Switch;
import android.widget.TextView;

import com.example.cheeseon.databinding.ActivityHomeBinding;

public class HomeActivity extends AppCompatActivity implements OnrecipeClick {

    private ActivityHomeBinding mBinding;
    private RecipeAdapter mAdapter ;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mBinding = ActivityHomeBinding.inflate(getLayoutInflater());
        View v = mBinding.getRoot();

//        final Switch cSwitch = v.findViewById(R.id.typeSwitch);
//        final TextView cSwitchText = v.findViewById(R.id.typeSwitch_textView);
//
//        cSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
//            @Override
//            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
//                ConstraintLayout constraintLayout = v.findViewById(R.id.signInLayout);
//                ConstraintSet constraintSet = new ConstraintSet();
//                constraintSet.clone(constraintLayout);
//                constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.TOP, R.id.typeSwitch, ConstraintSet.TOP, 0);
//                constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.BOTTOM, R.id.typeSwitch, ConstraintSet.BOTTOM, 0);
//                cSwitch.setThumbDrawable(v.getResources().getDrawable(R.drawable.thumb));
//
//                if (isChecked) {
//                    cSwitchText.setText("ON");
//                    constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.LEFT, R.id.typeSwitch, ConstraintSet.LEFT, 0);
//                    constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.RIGHT, ConstraintSet.UNSET, ConstraintSet.RIGHT, 0);
//                    cSwitch.setTrackDrawable(ContextCompat.getDrawable(v.getContext(), R.drawable.track));
//                } else {
//                    cSwitchText.setText("OFF");
//                    constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.RIGHT, R.id.typeSwitch, ConstraintSet.RIGHT, 0);
//                    constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.LEFT, ConstraintSet.UNSET, ConstraintSet.LEFT, 0);
//                    cSwitch.setTrackDrawable(ContextCompat.getDrawable(v.getContext(), R.drawable.track));
//                    cSwitch.setThumbDrawable(v.getResources().getDrawable(R.drawable.thumb));
//                }
//                constraintSet.applyTo(constraintLayout);
//
//            }
//        });

        mBinding.profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent profile = new Intent(getApplicationContext(), ProfileActivity.class);
                profile.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
                startActivity(profile);
            }
        });

        mAdapter = new RecipeAdapter(this);
        mBinding.recipeGrid.setLayoutManager(new GridLayoutManager(getApplicationContext(), 2));
        mBinding.recipeGrid.setAdapter(mAdapter);
        mAdapter.FillArray();

        setContentView(v);
    }
}