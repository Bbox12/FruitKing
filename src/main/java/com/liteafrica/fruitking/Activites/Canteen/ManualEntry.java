package com.liteafrica.fruitking.Activites.Canteen;

import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;

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
import com.google.android.material.snackbar.Snackbar;
import com.liteafrica.fruitking.AppController;
import com.liteafrica.fruitking.Model.Eats;
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

public class ManualEntry extends AppCompatActivity implements View.OnClickListener {
    private static final String TAG = ManualEntry.class.getSimpleName();
    private PrefManager pref;
    private String _phoneNo;
    private CoordinatorLayout coordinatorLayout;
    private RelativeLayout afterAnimationView;
    private Button signup;
    private AutoCompleteTextView input_category,input_item;
    private ProgressDialog mProgressDialog;
    private DecimalFormat df = new DecimalFormat("0.00");
    private ArrayList<Foods> mItems = new ArrayList<Foods>();
    public TextView _name,_price,_slNo,_noItem;
    public ImageButton _minus,_add, _delete;
    private String _category;
    private int ID;
    private String _name1,_price1;
    private Toolbar toolbar;
    private LinearLayout _L1;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.manualentry);
        pref = new PrefManager(getApplicationContext());
        HashMap<String, String> user = pref.getUserDetails();
        _phoneNo = user.get(PrefManager.KEY_MOBILE);
        coordinatorLayout = findViewById(R.id
                .cor_home_main);
        signup=findViewById(R.id.btnAction);
        signup.setOnClickListener(this);
        _name = (TextView) findViewById(R.id._Name);
        _price=findViewById(R.id.price_);
        _slNo =  findViewById(R.id._slNo);
        _noItem = findViewById(R.id.rate_km);
        _minus=findViewById(R.id.button2_minus);
        _add =  findViewById(R.id.button2_add);
        _delete = findViewById(R.id.button2_plus);
        input_category =  findViewById(R.id.input_caregory);
        input_item = findViewById(R.id.input_item);
        _delete.setOnClickListener(this);
        _minus.setOnClickListener(this);
        _add.setOnClickListener(this);
        input_category.setOnClickListener(this);
        input_item.setOnClickListener(this);
        _L1=findViewById(R.id._L1);
        _L1.setVisibility(View.GONE);

        toolbar = findViewById(R.id.toolbardd);
        setSupportActionBar(toolbar);
        getSupportActionBar().setHomeButtonEnabled(true);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        toolbar.setTitle(R.string.app_name);

        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(ManualEntry.this, SellerUpdateWindow.class);
                startActivity(i);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

            }
        });

    }


    @Override
    protected void onResume() {
        super.onResume();

        if (!ManualEntry.this.isFinishing()) {
            if (mProgressDialog == null) {
                mProgressDialog = new ProgressDialog(ManualEntry.this, R.style.Theme_AppCompat_Light_Dialog_MinWidth);
                mProgressDialog.setIcon(R.mipmap.ic_launcher);
                mProgressDialog.setTitle("Populating Category");
                mProgressDialog.setMessage("please wait...");
                mProgressDialog.setIndeterminate(false);
                mProgressDialog.show();
            }
        }

      launchHomeScreen();

    }

    private void launchHomeScreen() {
        final ArrayList<String>mCategory= new ArrayList<>();
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST, "http://139.59.38.160/Fruit/get_menu.php",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        JSONObject jsonObj = null;
                        try {
                            jsonObj = new JSONObject(response);
                            JSONArray login = jsonObj.getJSONArray("menu");
                            for (int i = 0; i < login.length(); i++) {
                                JSONObject c = login.getJSONObject(i);
                                if (!c.isNull("Name")) {
                                  mCategory.add(c.getString("Name"));
                                }
                            }



                            final ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(
                                    getBaseContext(), android.R.layout.simple_list_item_1,mCategory);
                            final String[] selection1 = new String[1];
                            input_category.setAdapter(arrayAdapter);
                            input_category.setCursorVisible(false);
                            input_category.showDropDown();
                            mProgressDialog.cancel();
                            input_category.setOnItemClickListener(new AdapterView.OnItemClickListener() {

                                @Override
                                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                                    selection1[0] = (String) parent.getItemAtPosition(position);
                                    _category= (String) parent.getItemAtPosition(position);

                                }
                            });


                        } catch (JSONException ex) {
                            ex.printStackTrace();
                        }




                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

                 volleyError(error);


            }

        }){
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<String, String>();
                params.put("_mId", "1");
                return params;
            }

        };
        eventoReq.setRetryPolicy(new DefaultRetryPolicy(
                0,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        AppController.getInstance().addToRequestQueue(eventoReq);




    }

    private void volleyError(VolleyError error) {
        if (error instanceof TimeoutError || error instanceof NoConnectionError) {
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Network is unreachable. Please try another time", Snackbar.LENGTH_INDEFINITE)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            recreate();
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        } else if (error instanceof AuthFailureError) {
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Network is unreachable. Please try another time", Snackbar.LENGTH_INDEFINITE)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            recreate();
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        } else if (error instanceof ServerError) {
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Server Error.Please try another time", Snackbar.LENGTH_INDEFINITE)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            recreate();
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        } else if (error instanceof NetworkError) {
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Network Error. Please try another time", Snackbar.LENGTH_INDEFINITE)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            recreate();
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        } else if (error instanceof ParseError) {
            Snackbar snackbar = Snackbar
                    .make(coordinatorLayout, "Data Error. Please try another time", Snackbar.LENGTH_INDEFINITE)
                    .setAction("Refresh", new View.OnClickListener() {
                        @Override
                        public void onClick(View view) {
                            recreate();
                        }
                    });
            snackbar.setActionTextColor(Color.RED);
            snackbar.show();
        }
    }


    @Override
    public void onClick(View view) {
        switch (view.getId()){
            case R.id.input_caregory:
                launchHomeScreen();

                break;
            case R.id.input_item:
                if(_category!=null){
                    if (!ManualEntry.this.isFinishing()) {
                        if (!mProgressDialog.isShowing()) {
                            mProgressDialog = new ProgressDialog(ManualEntry.this, R.style.Theme_AppCompat_Light_Dialog_MinWidth);
                            mProgressDialog.setIcon(R.mipmap.ic_launcher);
                            mProgressDialog.setTitle("Populating items");
                            mProgressDialog.setMessage("please wait...");
                            mProgressDialog.setIndeterminate(false);
                            mProgressDialog.show();
                        }
                    }
                    next(_category);
                }
                break;

            case R.id.btnAction:

                Intent monitor = new Intent(ManualEntry.this, SellerUpdateWindow.class);
                startActivity(monitor);
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

                break;


            case R.id.button2_minus:
                if(_name!=null) {
                    ArrayList<String>_foods=new ArrayList<String>();
                    Set<String> set = pref.get_packagesharedPreferences();
                    _foods.addAll(set);
                    int Rate_ = Integer.parseInt(_noItem.getText().toString());

                    if (Rate_ > 1) {
                        Rate_ = Rate_ - 1;
                        double single = Double.parseDouble(_price1);
                        _noItem.setText(String.valueOf(Rate_));
                        double _orderValue = pref.get_food_money() - single;
                        pref.set_food_money((float) _orderValue);
                        pref.setTotal(String.valueOf(_orderValue));
                        _price.setText("R" + String.valueOf(Rate_ * single));
                        for (int i = 0; i < _foods.size(); i++) {
                            String[] pars = _foods.get(i).split("\\_");
                            if (ID == Integer.parseInt(pars[0])) {
                                String s = pars[0];
                                _foods.remove(i);

                                _foods.add(s + "_" + String.valueOf(Rate_) + "_" + String.valueOf(Rate_ * single) + "_" + _name1 + "_" + String.valueOf(1));

                            }

                        }
                        pref.packagesharedPreferences(_foods);

                    }
                }
                break;
            case R.id.button2_add:

                if(_name!=null) {
                    ArrayList<String>_foods=new ArrayList<String>();
                    int Rate_ = Integer.parseInt(_noItem.getText().toString());
                    Rate_ = 1 + Rate_;
                    double single = Double.parseDouble(_price1);
                    double _orderValue = pref.get_food_money() + Double.parseDouble(_price1);
                    pref.set_food_money((float) _orderValue);
                    pref.setTotal(String.valueOf(_orderValue));
                    _noItem.setText(String.valueOf(Rate_));
                    _price.setText(String.valueOf(Rate_ * single));
                    if (pref.get_packagesharedPreferences() != null) {
                        Set<String> set = pref.get_packagesharedPreferences();
                        _foods.clear();
                        _foods.addAll(set);
                    }
                    boolean _again = false;
                    for (int i = 0; i < _foods.size(); i++) {
                        String[] pars = _foods.get(i).split("\\_");
                        if (ID == Integer.parseInt(pars[0])) {
                            String s = pars[0];
                            _foods.remove(i);
                            _again = true;
                            _foods.add(s + "_" + String.valueOf(Rate_) + "_" + String.valueOf(Rate_ * single) + "_" + _name1 + "_" + String.valueOf(1));
                        }

                    }
                    if (!_again) {
                        int itemSelected = pref.get_food_items();
                        itemSelected = itemSelected + 1;
                        pref.set_food_items(itemSelected);
                        _foods.add(String.valueOf(ID) + "_" + 1 + "_" +String.valueOf(Rate_ * single) + "_" + _name1 + "_" + String.valueOf(1));
                    }
                    pref.packagesharedPreferences(_foods);
                }
                break;

            case R.id.button2_plus:
                if(_name!=null) {
                    ArrayList<String> _foods = new ArrayList<String>();
                    Set<String> set = pref.get_packagesharedPreferences();
                    _foods.addAll(set);
                    for (int i = 0; i < _foods.size(); i++) {
                        String[] pars = _foods.get(i).split("\\_");
                        if (ID == Integer.parseInt(pars[0])) {
                            _foods.remove(i);
                            pref.set_food_items(pref.get_food_items() - 1);
                            double _orderValue = pref.get_food_money() - Double.parseDouble(pars[1]) * Double.parseDouble(_price1);
                            pref.set_food_money((float) _orderValue);

                            break;
                        }

                    }
                    pref.packagesharedPreferences(_foods);



                }
                break;


            default:
                break;
        }
    }

    private void next(final String category) {
        final ArrayList<Eats>CanteenArray= new ArrayList<Eats>();
        final ArrayList<String>Manuarray= new ArrayList<String>();
        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST, "http://139.59.38.160/Fruit/get_foodss.php",
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        JSONObject jsonObj = null;
                        try {
                            jsonObj = new JSONObject(response);
                            JSONArray login = jsonObj.getJSONArray("third");


                            for (int i = 0; i < login.length(); i++) {
                                JSONObject c = login.getJSONObject(i);
                                if (!c.isNull("Photo")) {
                                    Eats item = new Eats();
                                    item.setID(c.getInt("ID"));
                                    item.setName(c.getString("Name"));
                                    Manuarray.add(c.getString("Name"));
                                    item.setDescription(c.getString("Description"));
                                    item.setMRP(c.getDouble("MRP"));
                                    item.setDiscount(c.getDouble("Discount"));
                                    item.setPhoto(c.getString("Photo"));
                                    item.setStock(c.getInt("Unit"));
                                    item.setIsOutOfStock(c.getInt("isOutOfStock"));
                                    item.setPrice(c.getDouble("FruitExpressPrice")-c.getDouble("Discount"));
                                    CanteenArray.add(item);
                                }

                            }


                        } catch (JSONException ex) {
                            ex.printStackTrace();
                        }


                        final ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(
                                getBaseContext(), android.R.layout.simple_list_item_1,Manuarray);
                        final String[] selection1 = new String[1];
                        input_item.setAdapter(arrayAdapter);
                        input_item.setCursorVisible(false);
                        input_item.showDropDown();
                        mProgressDialog.dismiss();
                        input_item.setOnItemClickListener(new AdapterView.OnItemClickListener() {

                            @Override
                            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                                String item = (String) parent.getItemAtPosition(position);
                                input_item.setText(item);
                                _L1.setVisibility(View.VISIBLE);
                                for(int i=0;i<CanteenArray.size();i++){
                                    if(CanteenArray.get(i).getName(i).contains(item)){
                                        _name.setText(CanteenArray.get(i).getName(i));
                                        _name1=CanteenArray.get(i).getName(i);
                                        ID=CanteenArray.get(i).getID(i);
                                        _price.setText(String.valueOf(CanteenArray.get(i).getPrice(i)));
                                        _price1=String.valueOf(CanteenArray.get(i).getPrice(i));
                                        _noItem.setText("0");
                                        int Rate = 0;
                                        if (pref.get_packagesharedPreferences() != null) {
                                            mItems.clear();
                                            Set<String> set = pref.get_packagesharedPreferences();

                                            for (String s : set) {
                                                String[] pars = s.split("\\_");
                                                if(Integer.parseInt(pars[0])==CanteenArray.get(i).getID(i)){
                                                    _noItem.setText(pars[1]);
                                                    Rate = (int) (Double.parseDouble(pars[2]) + Rate);
                                                    _price.setText(String.valueOf(Rate));
                                                    _price1=String.valueOf(Rate);
                                                }

                                            }
                                        }

                                    }
                                }


                            }
                        });




                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {

                volleyError(error);


            }

        }){
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<String, String>();
                params.put("_mId", "1");
                params.put("menu", "1");
                params.put("submenu", category);
                return params;
            }

        };
        eventoReq.setRetryPolicy(new DefaultRetryPolicy(
                0,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        AppController.getInstance().addToRequestQueue(eventoReq);

    }


    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        //replaces the default 'Back' button action
        if(keyCode== KeyEvent.KEYCODE_BACK)   {

            Intent o = new Intent(ManualEntry.this, SellerUpdateWindow.class);
            o.putExtra("from",1);
            startActivity(o);
            finish();
            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);


        }
        return true;
    }


    @Override
    protected void onStop() {
        super.onStop();
        if (mProgressDialog != null) {
            mProgressDialog.dismiss();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (mProgressDialog != null) {
            mProgressDialog.dismiss();
        }
    }
}
