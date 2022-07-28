<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#C5D8D6"
    tools:context=".MainActivity">

    <TextView
        android:id="@+id/tvWallpaper"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/changing_wallpaper_application"
        android:textColor="#496726"
        android:textSize="28sp"
        android:textStyle="bold"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.242"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintVertical_bias="0.126" />

    <Button
        android:id="@+id/btnChangeWallpaper"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/click_here_to_change_wallpaer"
        android:textColor="#092523"
        android:textColorHighlight="#689535"
        android:textSize="18sp"
        app:backgroundTint="@color/teal_200"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintHorizontal_bias="0.467"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toBottomOf="@+id/tvWallpaper"
        app:layout_constraintVertical_bias="0.282" />
</androidx.constraintlayout.widget.ConstraintLayout>

java code:

package com.example.lab4;

import androidx.appcompat.app.AppCompatActivity;

import android.app.WallpaperManager;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

public class MainActivity extends AppCompatActivity {

    Button btn;
    WallpaperManager wpm;
    Timer mytimer;
    Drawable drawable;
    int prev=1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btn = findViewById(R.id.btnChangeWallpaper);

        mytimer = new Timer();
        wpm = WallpaperManager.getInstance(this);

        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v)
            {
                setWallPaper();
            }
        });
    }

    private void setWallPaper() {
        mytimer.schedule(new TimerTask() {
            @Override
            public void run() {
                if(prev==1) {
                    drawable = getResources().getDrawable(R.drawable.one);
                    prev = 2;
                }
                else if(prev==2) {
                    drawable = getResources().getDrawable(R.drawable.two);
                    prev=3;
                }
                else if(prev==3) {
                    drawable = getResources().getDrawable(R.drawable.three);
                    prev=4;
                }
                else if(prev==4) {
                    drawable = getResources().getDrawable(R.drawable.four);
                    prev=5;
                }
                else if(prev==5) {
                    drawable = getResources().getDrawable(R.drawable.five);
                    prev=1;
                }
                Bitmap wallpaper = ((BitmapDrawable)drawable).getBitmap();
                try {
                    wpm.setBitmap(wallpaper);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        },0,30000); }

}
