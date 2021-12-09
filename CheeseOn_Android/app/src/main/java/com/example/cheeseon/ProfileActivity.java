package com.example.cheeseon;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.Manifest;
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;

import com.example.cheeseon.databinding.ActivityProfileBinding;

import java.io.IOException;

public class ProfileActivity extends AppCompatActivity {

    private ActivityProfileBinding mBinding;
    private static final int MY_PERMISSIONS_REQUEST_STORAGE = 20;
    private static final int GO_GALLERY = 100;
    private Bitmap bitmap ;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mBinding = ActivityProfileBinding.inflate(getLayoutInflater());
        View v = mBinding.getRoot();

        mBinding.goBackButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent home = new Intent(getApplicationContext(), HomeActivity.class);
                home.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
                startActivity(home);
            }
        });

        mBinding.profilePictureView.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.M)
            @Override
            public void onClick(View v) {
                requestPermissions(new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                        MY_PERMISSIONS_REQUEST_STORAGE);
            }
        });

        mBinding.editUsername.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                findViewById(R.id.username).setFocusableInTouchMode(true);
                findViewById(R.id.username).setEnabled(true);
                findViewById(R.id.username).requestFocus();
                //Enregistrer le nouveau username
            }
        });

        mBinding.themeChange.setOnClickListener((new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SharedPreferences.Editor editor = getSharedPreferences("com.example.srushtee.dummy", MODE_PRIVATE).edit();
                editor.putBoolean("service_status", this.isChecked());
                editor.commit();
            }
        }));

        mBinding.logOutButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent login = new Intent(getApplicationContext(), MainActivity.class);
                login.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
                startActivity(login);
            }
        });

        setContentView(v);
    }

    private void getImageFromAlbum(){
        try{
            Intent i = new Intent(Intent.ACTION_PICK,
                    android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
            startActivityForResult(i, GO_GALLERY);
        }catch(Exception exp){}
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == Activity.RESULT_OK)
            switch (requestCode) {
                case GO_GALLERY:
                    Uri selectedImage = data.getData();
                    try {
                        Bitmap bitmap = MediaStore.Images.Media.getBitmap(this.getContentResolver(), selectedImage);
                        ((ImageView)findViewById(R.id.profilePictureView)).setImageBitmap(bitmap);
                    } catch (IOException e) {
                        Log.i("TAG", "Some exception " + e);
                    }
                    break;
            }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String permissions[], int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
            getImageFromAlbum();

        }
    }
}