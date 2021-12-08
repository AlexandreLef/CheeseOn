package com.example.cheeseon;

import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;
import androidx.core.content.ContextCompat;

import android.os.Bundle;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.Switch;
import android.widget.TextView;

import com.example.cheeseon.databinding.ActivityHomeBinding;

public class HomeActivity extends AppCompatActivity {

    private ActivityHomeBinding mBinding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mBinding = ActivityHomeBinding.inflate(getLayoutInflater());
        View v = mBinding.getRoot();

        mBinding.typeSwitch.setTextOff("Salées");
        mBinding.typeSwitch.setTextOn("Sucrées");

        final Switch cSwitch = v.findViewById(R.id.typeSwitch);
        final TextView cSwitchText = v.findViewById(R.id.typeSwitch_textView);

        cSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                ConstraintLayout constraintLayout = v.findViewById(R.id.signInLayout);
                ConstraintSet constraintSet = new ConstraintSet();
                constraintSet.clone(constraintLayout);
                constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.TOP, R.id.typeSwitch, ConstraintSet.TOP, 0);
                constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.BOTTOM, R.id.typeSwitch, ConstraintSet.BOTTOM, 0);
                cSwitch.setThumbDrawable(v.getResources().getDrawable(R.drawable.thumb));

                if (isChecked) {
                    cSwitchText.setText("ON");
                    constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.LEFT, R.id.typeSwitch, ConstraintSet.LEFT, 0);
                    constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.RIGHT, ConstraintSet.UNSET, ConstraintSet.RIGHT, 0);
                    cSwitch.setTrackDrawable(ContextCompat.getDrawable(v.getContext(), R.drawable.track));
                } else {
                    cSwitchText.setText("OFF");
                    constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.RIGHT, R.id.typeSwitch, ConstraintSet.RIGHT, 0);
                    constraintSet.connect(R.id.typeSwitch_textView, ConstraintSet.LEFT, ConstraintSet.UNSET, ConstraintSet.LEFT, 0);
                    cSwitch.setTrackDrawable(ContextCompat.getDrawable(v.getContext(), R.drawable.track));
                    cSwitch.setThumbDrawable(v.getResources().getDrawable(R.drawable.thumb));
                }
                constraintSet.applyTo(constraintLayout);

            }
        });

        setContentView(v);
    }
}