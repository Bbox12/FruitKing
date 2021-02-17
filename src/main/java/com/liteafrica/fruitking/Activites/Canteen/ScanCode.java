package com.liteafrica.fruitking.Activites.Canteen;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NetworkError;
import com.android.volley.NoConnectionError;
import com.android.volley.ParseError;
import com.android.volley.Response;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.budiyev.android.codescanner.CodeScanner;
import com.budiyev.android.codescanner.CodeScannerView;
import com.budiyev.android.codescanner.DecodeCallback;
import com.google.android.gms.vision.CameraSource;
import com.google.android.gms.vision.barcode.Barcode;
import com.google.android.gms.vision.barcode.BarcodeDetector;
import com.google.android.material.snackbar.Snackbar;
import com.google.zxing.Result;
import com.liteafrica.fruitking.Adapters.BookingAdapter;
import com.liteafrica.fruitking.AppController;
import com.liteafrica.fruitking.Config_URL;
import com.liteafrica.fruitking.Model.Foods;
import com.liteafrica.fruitking.PrefManager;
import com.liteafrica.fruitking.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class ScanCode extends AppCompatActivity {
    private static final String LOG_TAG = "Barcode Scanner API";
    private static final int PHOTO_REQUEST = 10;
    TextView txtBarcodeValue;
    private BarcodeDetector barcodeDetector;
    private CameraSource cameraSource;
    private static final int REQUEST_CAMERA_PERMISSION = 201;
    String intentData = "";
    Button btnAction;
    private TextView scanResults;
    private Uri imageUri;
    private DecimalFormat df = new DecimalFormat("0.00");
    private static final int REQUEST_WRITE_PERMISSION = 20;
    private static final String SAVED_INSTANCE_URI = "uri";
    private static final String SAVED_INSTANCE_RESULT = "result";
    private CodeScanner mCodeScanner;
    private double _orderValue=0;
    private ArrayList<String> _foods=new ArrayList<String>();
    private int _cost=0;
    private PrefManager pref;
    private String _phoneNo;
    private   String _name1,_details1,_description,discount_1,price_1,discountprice_1,rate_km1;
    private CoordinatorLayout coordinatorLayout;
    private RecyclerView _moreRv;
    private ImageView image;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        pref=new PrefManager(getApplicationContext());
        HashMap<String, String> user=pref.getUserDetails();
        _phoneNo=user.get(PrefManager.KEY_MOBILE);
        setContentView(R.layout.activity_scanned_barcode);
        btnAction = findViewById(R.id.btnAction);
        scanResults = (TextView) findViewById(R.id.scan_results);
        coordinatorLayout=findViewById(R.id.success_);
        _moreRv=findViewById(R.id.moreRv);

        image=findViewById(R.id.image);
        image.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ActivityCompat.requestPermissions(ScanCode.this, new
                        String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, REQUEST_WRITE_PERMISSION);
            }
        });


        if (ContextCompat.checkSelfPermission(ScanCode.this, Manifest.permission.CAMERA)
                == PackageManager.PERMISSION_DENIED){
            ActivityCompat.requestPermissions(ScanCode.this, new String[] {Manifest.permission.CAMERA}, 123);
        } else {
            startScanning();
        }

        barcodeDetector = new BarcodeDetector.Builder(getApplicationContext())
                .setBarcodeFormats(Barcode.DATA_MATRIX | Barcode.QR_CODE)
                .build();
        if (!barcodeDetector.isOperational()) {
            scanResults.setText("Could not set up the detector!");
            return;
        }

        btnAction.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                Intent i = new Intent(ScanCode.this, SellerUpdateWindow.class);
                startActivity(i);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });


    }



    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == 123) {
            if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                Toast.makeText(this, "Camera permission granted", Toast.LENGTH_LONG).show();
                startScanning();
            } else {
                Toast.makeText(this, "Camera permission denied", Toast.LENGTH_LONG).show();
            }
            
        }
    }

    private void startScanning() {
        CodeScannerView scannerView = findViewById(R.id.surfaceView);
        mCodeScanner = new CodeScanner(this, scannerView);
        mCodeScanner.setDecodeCallback(new DecodeCallback() {
            @Override
            public void onDecoded(@NonNull final Result result) {
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(ScanCode.this, result.getText(), Toast.LENGTH_SHORT).show();
                        checkSingleProduct(result.getText());

                    }
                });
            }
        });
        scannerView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                mCodeScanner.startPreview();
            }
        });
    }

    private void populate() {
        int Rate = 0;
         ArrayList<Foods> mItems = new ArrayList<Foods>();
        if (pref.get_packagesharedPreferences() != null) {
            Set<String> set = pref.get_packagesharedPreferences();

            for (String s : set) {
                String[] pars = s.split("\\_");
                Foods items = new Foods();
                items.setID(Integer.parseInt(pars[0]));
                items.setNoofItems((int) Double.parseDouble(pars[1]));
                items.seteTEZ_Price((int) Double.parseDouble(pars[2]));
                Rate = (int) (Double.parseDouble(pars[2]) + Rate);
                items.setMenu_Name((pars[3]));
                mItems.add(items);
                pref.set_food_money(Rate);
            }
            if(mItems.size()>0) {
                _moreRv.setVisibility(View.VISIBLE);
                BookingAdapter sAdapter1 = new BookingAdapter(ScanCode.this, mItems);
                sAdapter1.notifyDataSetChanged();
                sAdapter1.setPref(pref);
                sAdapter1.setFrom(0);
                LinearLayoutManager mLayoutManager = new LinearLayoutManager(ScanCode.this, LinearLayoutManager.VERTICAL, false);
                _moreRv.setLayoutManager(mLayoutManager);
                _moreRv.setItemAnimator(new DefaultItemAnimator());
                _moreRv.setAdapter(sAdapter1);
                _moreRv.setHasFixedSize(true);
            }

        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        populate();
        if(mCodeScanner != null) {
            mCodeScanner.startPreview();
        }
    }

    @Override
    protected void onPause() {
        if(mCodeScanner != null) {
            mCodeScanner.releaseResources();
        }
        super.onPause();
    }

    private void checkSingleProduct(final String text) {

        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST, Config_URL.URL_GET_ID,
                new Response.Listener<String>() {
                    private boolean _again;

                    @Override
                    public void onResponse(String response) {
                        Log.w("deatails", response.toString());

                        JSONObject jsonObj = null;
                        try {
                            jsonObj = new JSONObject(response);
                            JSONArray login = jsonObj.getJSONArray("bookingservices");
                            for (int i = 0; i < login.length(); i++) {
                                JSONObject c = login.getJSONObject(i);
                                if (!c.isNull("ID")) {
                                    _name1=(c.getString("Name"));
                                    _details1=(c.getString("IDMenu")+" ( "+c.getString("IDSubsubmenu")+" )");
                                    _description=(c.getString("Description"));
                                    price_1=("R"+df.format(c.getDouble("JalpanPrice")-c.getDouble("Discount")));
                                    discountprice_1=("R"+df.format(c.getDouble("JalpanPrice")));

                                    _cost= (int) (c.getDouble("JalpanPrice")-c.getDouble("Discount"));


                                    int Rate_ = 0;
                                    Rate_ = 1 + Rate_;
                                    int dk = _cost;
                                    _orderValue = pref.get_food_money() + dk;
                                    pref.set_food_money((float) _orderValue);
                                    if (pref.get_packagesharedPreferences() != null) {
                                        Set<String> set = pref.get_packagesharedPreferences();
                                        _foods.clear();
                                        _foods.addAll(set);
                                    }
                                    for (int j = 0; j < _foods.size(); j++) {
                                        String[] pars = _foods.get(i).split("\\_");
                                        if (Integer.parseInt(text) == Integer.parseInt(pars[0])) {
                                            String s = pars[0];
                                            _foods.remove(i);
                                            _again = true;
                                            _foods.add(s + "_" + String.valueOf(Rate_) + "_" + String.valueOf(Rate_ * dk) + "_" + _name1 + "_" + 1);
                                        }

                                    }
                                    if (!_again) {
                                        int itemSelected = pref.get_food_items();
                                        itemSelected = itemSelected + 1;
                                        pref.set_food_items(itemSelected);
                                        _foods.add(String.valueOf(text + "_" + 1 + "_" + String.valueOf(dk) + "_" + _name1 + "_" + 1));
                                    }
                                    pref.packagesharedPreferences(_foods);
                                    populate();
                                }
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
                params.put("ID", text);
                return params;
            }

        };

        eventoReq.setRetryPolicy(new DefaultRetryPolicy(
                0,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        AppController.getInstance().addToRequestQueue(eventoReq);

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
    public void onBackPressed() {
        super.onBackPressed();
        Intent i = new Intent(ScanCode.this, SellerUpdateWindow.class);
        startActivity(i);
        finish();
        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
    }
}
