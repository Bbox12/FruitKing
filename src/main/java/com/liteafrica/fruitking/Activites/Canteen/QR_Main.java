package com.liteafrica.fruitking.Activites.Canteen;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.liteafrica.fruitking.Activites.Ride_Later.Ride_later_tabs;
import com.liteafrica.fruitking.Activites.Splash_screen;
import com.liteafrica.fruitking.PrefManager;
import com.liteafrica.fruitking.R;

public class QR_Main extends AppCompatActivity implements View.OnClickListener{


    private LinearLayout Scan,history;
    private Button signup;
    private PrefManager pref;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        pref = new PrefManager(getApplicationContext());
        setContentView(R.layout.qrcode_mainpage);
        Scan=findViewById(R.id.cart);
        Scan.setOnClickListener(this);

        history=findViewById(R.id.history);
        history.setOnClickListener(this);

        signup=findViewById(R.id.btnAction);
        signup.setOnClickListener(this);

    }

    @Override
    public void onClick(View v) {

        switch (v.getId()){
            case R.id.cart:
                Intent monitor = new Intent(QR_Main.this, SellerUpdateWindow.class);
                startActivity(monitor);
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                break;
            case R.id.history:
                Intent history = new Intent(QR_Main.this, Ride_later_tabs.class);
                startActivity(history);
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                break;

            case R.id.btnAction:

                pref.clearSession();
                pref.createLogin(null, null);
                pref.setResponsibility(0);
                pref.packagesharedPreferences(null);
                pref.set_food_money(0);
                pref.setTotal(null);
                pref.setTotal2(null);
                Intent i3 = new Intent(QR_Main.this, Splash_screen.class);
                startActivity(i3);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

                break;
            default:
                break;
        }

    }
}
