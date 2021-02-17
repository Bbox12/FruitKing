package com.liteafrica.fruitking.Activites.Canteen;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkError;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import com.android.volley.toolbox.StringRequest;
import com.google.android.material.snackbar.Snackbar;
import com.liteafrica.fruitking.Adapters._CommodityAdapter;
import com.liteafrica.fruitking.AppController;
import com.liteafrica.fruitking.Config_URL;
import com.liteafrica.fruitking.Model.platter;
import com.liteafrica.fruitking.PrefManager;
import com.liteafrica.fruitking.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PlatterPage extends AppCompatActivity {

    private static final String TAG = PlatterPage.class.getSimpleName();
    private static final int RESULT_PICK_CONTACT = 101;
    private Toolbar toolbar;
    private double My_lat = 0, My_long = 0;
    private PrefManager pref;
    private String _PhoneNo;
    private String phoneNo;
    private String name;
    private RecyclerView Sosrv;
    private String mobileIp;
    private ProgressBar progressBar;
    public boolean success;
    private CoordinatorLayout coordinatorLayout;
    private EditText _t1;
    private String _Name;
    private TextView textView101,textView102;

    public static String getMobileIPAddress() {
        try {
            List<NetworkInterface> interfaces = Collections.list(NetworkInterface.getNetworkInterfaces());
            for (NetworkInterface intf : interfaces) {
                List<InetAddress> addrs = Collections.list(intf.getInetAddresses());
                for (InetAddress addr : addrs) {
                    if (!addr.isLoopbackAddress()) {
                        return addr.getHostAddress();
                    }
                }
            }
        } catch (Exception ex) {
        } // for now eat exceptions
        return null;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.notificationlayout);
        coordinatorLayout=findViewById(R.id.em);
        toolbar = findViewById(R.id.toolbar_later_sos);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowTitleEnabled(false);

        pref=new PrefManager(getApplicationContext());
        HashMap<String, String> user=pref.getUserDetails();
        phoneNo=user.get(PrefManager.KEY_MOBILE);

        Sosrv = findViewById(R.id.sosrv);
        _t1=findViewById(R.id._t1);

        progressBar=findViewById(R.id.progressBaremergency);
        progressBar.setVisibility(View.VISIBLE);



        textView101=findViewById(R.id.textView101);
        textView102=findViewById(R.id.textView102);

        textView101.setText("Platter");
        textView102.setText(" Request");

        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(PlatterPage.this, Canteen_Mainactivity.class);
                startActivity(i);
                finish();
                overridePendingTransition(R.anim.slide_out2, R.anim.slide_in2);
            }
        });

    }



    @Override
    protected void onResume() {
        super.onResume();
        go();
    }

    private void go() {
        progressBar.setVisibility(View.VISIBLE);
        ArrayList<platter> CanteenArray = new ArrayList<platter>();
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST, Config_URL.URL_GET_PLATTERS,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.w("ccc", response.toString());
                        progressBar.setVisibility(View.GONE);
                        try{
                            JSONObject jsonObj = new JSONObject(response);

                            // Getting JSON Array node

                            JSONArray tezads = jsonObj.getJSONArray("platters");
                            if (tezads.length() != 0) {
                                for (int i = 0; i < tezads.length(); i++) {
                                    JSONObject c = tezads.getJSONObject(i);
                                    if (!c.isNull("PlatterID")) {
                                        platter item = new platter();
                                        item.setPlatterID(c.getString("PlatterID"));
                                        item.setBooking_date(c.getString("Booking_date"));
                                        item.setBooking_time(c.getString("Booking_time"));
                                        item.setDescription(c.getString("Description"));
                                        item.setMessage(c.getString("Message"));
                                        item.setFinalMessage(c.getString("FinalMessage"));
                                        item.setStatus(c.getInt("Status"));
                                        item.setPrice(c.getString("Price"));
                                        item.setOccasion(c.getString("Occasion"));
                                        CanteenArray.add(item);
                                    }

                                }
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        if (CanteenArray.size() != 0) {
                            Sosrv.setVisibility(View.VISIBLE);
                            _t1.setVisibility(View.GONE);
                            _CommodityAdapter sAdapter = new _CommodityAdapter(PlatterPage.this, CanteenArray);
                            sAdapter.notifyDataSetChanged();
                            Sosrv.setAdapter(sAdapter);
                            LinearLayoutManager mLayoutManager = new LinearLayoutManager(PlatterPage.this);
                            mLayoutManager.setOrientation(LinearLayoutManager.VERTICAL);
                            Sosrv.setLayoutManager(mLayoutManager);

                        } else {
                            Sosrv.setVisibility(View.GONE);
                            _t1.setVisibility(View.VISIBLE);
                        }

                    }



                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                VolleyLog.d(TAG, "Error: " + error.getMessage());
                if (error instanceof TimeoutError || error instanceof NoConnectionError) {
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Network is unreachable. Please try another time", Snackbar.LENGTH_LONG)
                            .setAction("Refresh", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    go();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                } else if (error instanceof AuthFailureError) {
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Network is unreachable. Please try another time", Snackbar.LENGTH_LONG)
                            .setAction("Refresh", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    go();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                } else if (error instanceof ServerError) {
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Server Error.Please try another time", Snackbar.LENGTH_LONG)
                            .setAction("Refresh", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    go();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                } else if (error instanceof NetworkError) {
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Network Error. Please try another time", Snackbar.LENGTH_LONG)
                            .setAction("Refresh", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    go();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                } else if (error instanceof ParseError) {
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Data Error. Please try another time", Snackbar.LENGTH_LONG)
                            .setAction("Refresh", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    go();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                }


            }

        }){
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<String, String>();
                params.put("id", phoneNo);
                return params;
            }
        };

        // Añade la peticion a la cola
        AppController.getInstance().addToRequestQueue(eventoReq);
    }



    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        //replaces the default 'Back' button action
        if(keyCode== KeyEvent.KEYCODE_BACK)   {

            Intent o = new Intent(PlatterPage.this, Canteen_Mainactivity.class);
            o.putExtra("from",1);
            startActivity(o);
            finish();
            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

        }
        return true;
    }



}

