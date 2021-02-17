package com.liteafrica.fruitking.Activites.Canteen;

import android.annotation.SuppressLint;
import android.app.UiModeManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.widget.NestedScrollView;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.StaggeredGridLayoutManager;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NetworkError;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.NetworkImageView;
import com.android.volley.toolbox.StringRequest;
import com.google.android.material.appbar.AppBarLayout;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.snackbar.Snackbar;
import com.liteafrica.fruitking.Activites.Main_Page.GooglemapApp;
import com.liteafrica.fruitking.Adapters.PlatterBookingRv;
import com.liteafrica.fruitking.Adapters.RecyclerTouchListener;
import com.liteafrica.fruitking.AppController;
import com.liteafrica.fruitking.Config_URL;
import com.liteafrica.fruitking.Login.ServiceOffer;
import com.liteafrica.fruitking.LruBitmapCache;
import com.liteafrica.fruitking.Model.platter;
import com.liteafrica.fruitking.PrefManager;
import com.liteafrica.fruitking.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class PlatterRequestPage extends AppCompatActivity implements View.OnClickListener {
    private NetworkImageView service_pic,bottompic;
    private CoordinatorLayout cor_home_eats;
    private ImageView _i4,_arrow;
    private TextView orders,_address;
    private int _from=0;
    private RecyclerView moreRv;
    private LinearLayout _L1;
    private PrefManager pref;
    private String _phoneNo;
    private CoordinatorLayout coordinatorLayout;
    private int itemSelected=0;
    private double _orderValue=0;
    private DecimalFormat df = new DecimalFormat("0.00");
    private ArrayList<String> _foods=new ArrayList<String>();
    private ArrayList<String> MenuArray=new ArrayList<String>();
    private int _cost=0;
    private NestedScrollView Nscroll;
    private Toolbar toolbar;
    private AppBarLayout appBarLayout;
    private LinearLayout L1;
    private TextView _name1,_name2,_details1;
    private LinearLayout layoutBottomSheetnear;
    private BottomSheetBehavior sheetBehaviornear;
    private Button enquiry;
    private int _platter=0;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.platterproduct);
        pref=new PrefManager(getApplicationContext());
        HashMap<String, String> user=pref.getUserDetails();
        _phoneNo=user.get(PrefManager.KEY_MOBILE);
        layoutBottomSheetnear = findViewById(R.id.platter);
        sheetBehaviornear = BottomSheetBehavior.from(layoutBottomSheetnear);
        sheetBehaviornear.setHideable(true);

        toolbar = findViewById(R.id.toolbardd);
        setSupportActionBar(toolbar);
        getSupportActionBar().setHomeButtonEnabled(true);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        toolbar.setTitle(R.string.app_name);
        service_pic=findViewById(R.id.service_pic);
        bottompic=findViewById(R.id.service_pic1);
        _i4=findViewById(R.id._i4);
        _i4.setOnClickListener(this);
        orders=findViewById(R.id.orders);

        _name1=findViewById(R.id._name1);
        _name2=findViewById(R.id._name2);
        _details1=findViewById(R.id._details1);

        moreRv=findViewById(R.id.moreRv);
        moreRv.setNestedScrollingEnabled(false);
        enquiry=findViewById(R.id.enquiry);
        enquiry.setOnClickListener(this);


        L1=findViewById(R.id._l1);

        _address=findViewById(R.id.address);
        if(pref.getDropAt()!=null){
            _address.setText(pref.getDropAt());
        }
        if (pref.get_food_items() != 0) {
            orders.setText(String.valueOf(pref.get_food_items()));

        }


        coordinatorLayout=findViewById(R.id.cor_home_eats);
        _L1=findViewById(R.id._L1);


        Nscroll=findViewById(R.id.Nscroll);

        sheetBehaviornear.setBottomSheetCallback(new BottomSheetBehavior.BottomSheetCallback() {
            @SuppressLint("RestrictedApi")
            @Override
            public void onStateChanged(@NonNull View bottomSheet, int newState) {
                switch (newState) {
                    case BottomSheetBehavior.STATE_COLLAPSED:
                        Nscroll.setBackgroundColor(getResources().getColor(R.color.white));
                        break;
                    case BottomSheetBehavior.STATE_HIDDEN:
                        Nscroll.setBackgroundColor(getResources().getColor(R.color.white));
                        break;
                    case BottomSheetBehavior.STATE_EXPANDED:
                        Nscroll.setBackgroundColor(getResources().getColor(R.color.placeholder_bg));
                        break;
                    case BottomSheetBehavior.STATE_HALF_EXPANDED:
                        Nscroll.setBackgroundColor(getResources().getColor(R.color.placeholder_bg));
                        break;
                }
            }

            @SuppressLint("RestrictedApi")
            @Override
            public void onSlide(@NonNull View bottomSheet, float slideOffset) {
            }
        });



        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent o = new Intent(PlatterRequestPage.this, Canteen_Mainactivity.class);
                startActivity(o);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });
    }





    @Override
    public void onClick(View v) {

        switch (v.getId()){


            case R.id._i4:
                if(_phoneNo!=null) {
                    if (pref.get_food_items() != 0) {
                        pref.set_cID1(2);
                        Intent o = new Intent(PlatterRequestPage.this, GooglemapApp.class);
                        startActivity(o);
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                    }else{
                        if (!PlatterRequestPage.this.isFinishing()) {
                            new AlertDialog.Builder(PlatterRequestPage.this, R.style.AlertDialogTheme)
                                    .setTitle("Your cart is empty")
                                    .setMessage("Please add items to your cart.")
                                    .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            dialog.cancel();
                                            Intent o = new Intent(PlatterRequestPage.this, Canteen_Mainactivity.class);
                                            startActivity(o);
                                            finish();
                                            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                                        }
                                    })
                                    .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            dialog.cancel();
                                        }
                                    })
                                    .show();
                        }
                    }
                }else{
                    if (!PlatterRequestPage.this.isFinishing()) {
                        new AlertDialog.Builder(PlatterRequestPage.this, R.style.AlertDialogTheme)
                                .setTitle("Please login.")
                                .setMessage("You need to login to complete your order.")
                                .setPositiveButton("Login", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                        Intent o = new Intent(PlatterRequestPage.this, ServiceOffer.class);

                                        startActivity(o);
                                        finish();
                                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                                    }
                                })
                                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                    }
                                })
                                .show();
                    }
                }
                break;
            case R.id.arrow:

                Intent i = new Intent(PlatterRequestPage.this, Canteen_Mainactivity.class);
                startActivity(i);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

                break;

            case R.id.enquiry:
                if(_platter!=0) {
                    Intent o = new Intent(PlatterRequestPage.this, BookPlatters.class);
                    o.putExtra("from", _platter);
                    startActivity(o);
                    finish();
                    overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                }
                break;

        }

    }

    @Override
    protected void onResume() {
        super.onResume();


          checkSingleProduct();

    }


    @Override
    public void onPause(){

        super.onPause();

    }

    @Override
    protected void onStop(){
        super.onStop();


    }

    @Override
    protected void onDestroy(){
        super.onDestroy();
    }

    private void checkSingleProduct() {
         ArrayList<platter> CanteenArray = new ArrayList<platter>();
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST, Config_URL.URL_GET_PLATTER,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.w("deatails", response.toString());

                        JSONObject jsonObj = null;
                        try {
                            jsonObj = new JSONObject(response);

                            JSONArray tezads = jsonObj.getJSONArray("platters");
                            if (tezads.length() != 0) {
                                for (int i = 0; i < tezads.length(); i++) {
                                    JSONObject c = tezads.getJSONObject(i);
                                    if (!c.isNull("Photo")) {
                                        platter item = new platter();
                                        item.setID(c.getInt("ID"));
                                        item.setName(c.getString("Name"));
                                        item.setDescription(c.getString("Description"));
                                        item.setPhoto(c.getString("Photo"));
                                        CanteenArray.add(item);
                                    }

                                }
                            }else{
                                moreRv.setVisibility(View.GONE);
                            }



                            Intent i =getIntent();
                            String _from=i.getStringExtra("from");
                            String name=i.getStringExtra("name");
                            if(_from!=null){
                                String url =_from.replaceAll(" ", "%20");
                                ImageLoader imageLoader = LruBitmapCache.getInstance(PlatterRequestPage.this)
                                        .getImageLoader();
                                imageLoader.get(url, ImageLoader.getImageListener(service_pic,
                                        R.mipmap.ic_launcher, R.mipmap
                                                .ic_launcher));
                                service_pic.setImageUrl(url, imageLoader);

                                _name1.setText(name);
                            }

                            if (CanteenArray.size() > 0) {
                                moreRv.setVisibility(View.VISIBLE);
                                PlatterBookingRv sAdapter1 = new PlatterBookingRv(PlatterRequestPage.this, CanteenArray);
                                sAdapter1.notifyDataSetChanged();
                                moreRv.setAdapter(sAdapter1);
                                StaggeredGridLayoutManager mLayoutManager = new StaggeredGridLayoutManager(getSpan(), StaggeredGridLayoutManager.VERTICAL);
                                moreRv.setLayoutManager(mLayoutManager);
                                moreRv.setHasFixedSize(true);



                                    moreRv.setItemAnimator(new DefaultItemAnimator());
                                    moreRv.addOnItemTouchListener(
                                            new RecyclerTouchListener(PlatterRequestPage.this, moreRv,
                                                    new RecyclerTouchListener.OnTouchActionListener() {


                                                        @Override
                                                        public void onClick(View view, final int position) {
                                                            Log.w("gallery", String.valueOf(position));
                                                            if(position>=0) {
                                                                if (CanteenArray.size() != 0 && CanteenArray.get(position).getName(position) != null) {
                                                                    int height = getResources().getDisplayMetrics().heightPixels;
                                                                        sheetBehaviornear.setState(BottomSheetBehavior.STATE_EXPANDED);
                                                                        layoutBottomSheetnear.setVisibility(View.VISIBLE);
                                                                        sheetBehaviornear.setFitToContents(true);
                                                                    Nscroll.setBackgroundColor(getResources().getColor(R.color.placeholder_bg));
                                                                    String url =CanteenArray.get(position).getPhoto(position).replaceAll(" ", "%20");
                                                                    ImageLoader imageLoader = LruBitmapCache.getInstance(PlatterRequestPage.this)
                                                                            .getImageLoader();
                                                                    imageLoader.get(url, ImageLoader.getImageListener(bottompic,
                                                                            R.mipmap.ic_launcher, R.mipmap
                                                                                    .ic_launcher));
                                                                    bottompic.setImageUrl(url, imageLoader);
                                                                    _platter= CanteenArray.get(position).getID(position);
                                                                    _name2.setText(CanteenArray.get(position).getName(position));
                                                                    _details1.setText(CanteenArray.get(position).getDescription(position));
                                                                }
                                                            }
                                                        }

                                                        @Override
                                                        public void onRightSwipe(View view, int position) {

                                                        }

                                                        @Override
                                                        public void onLeftSwipe(View view, int position) {

                                                        }
                                                    }));
                                }



                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                    }


                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                vollyError(error);
            }

        }) {
            @Override
            protected Map<String, String> getParams() {
                // Posting parameters to login url
                Map<String, String> params = new HashMap<String, String>();
                params.put("ID", String.valueOf(pref.getID5()));
                return params;
            }

        };

        eventoReq.setRetryPolicy(new DefaultRetryPolicy(
                0,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        AppController.getInstance().addToRequestQueue(eventoReq);

    }


    public int getSpan() {
        int orientation = getScreenOrientation(getApplicationContext());
        if (isTV(getApplicationContext())) return 2;
        if (isTablet(getApplicationContext()))
            return orientation == Configuration.ORIENTATION_PORTRAIT ? 2 : 2;
        return orientation == Configuration.ORIENTATION_PORTRAIT ? 2: 2;
    }

    public static boolean isTV(Context context) {
        return ((UiModeManager) context
                .getSystemService(Context.UI_MODE_SERVICE))
                .getCurrentModeType() == Configuration.UI_MODE_TYPE_TELEVISION;
    }

    public static int getScreenOrientation(Context context) {
        return context.getResources().getDisplayMetrics().widthPixels <
                context.getResources().getDisplayMetrics().heightPixels ?
                Configuration.ORIENTATION_PORTRAIT : Configuration.ORIENTATION_LANDSCAPE;
    }

    public static boolean isTablet(Context context) {
        return (context.getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK) >= Configuration.SCREENLAYOUT_SIZE_LARGE;
    }

    private void vollyError(VolleyError error) {

        if (error instanceof TimeoutError || error instanceof NoConnectionError) {

            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Network is unreachable. Please try another time", Snackbar.LENGTH_LONG)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());
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
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());
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
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());
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
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());
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
                            finish();
                            overridePendingTransition(0, 0);
                            startActivity(getIntent());
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        }


    }


    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            Intent o = new Intent(PlatterRequestPage.this, Canteen_Mainactivity.class);
            startActivity(o);
            finish();
            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
        }
        return true;
    }

}
