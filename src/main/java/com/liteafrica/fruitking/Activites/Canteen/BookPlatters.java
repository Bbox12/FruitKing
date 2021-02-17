package com.liteafrica.fruitking.Activites.Canteen;

import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.TimePicker;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.core.widget.NestedScrollView;
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
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.NetworkImageView;
import com.android.volley.toolbox.StringRequest;
import com.google.android.material.appbar.AppBarLayout;
import com.google.android.material.snackbar.Snackbar;
import com.liteafrica.fruitking.Activites.Main_Page.GooglemapApp;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

public class BookPlatters extends AppCompatActivity implements View.OnClickListener {
    private NetworkImageView service_pic;
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
    private TextView _name1,booking;
    private LinearLayout L2;
    private EditText _dateSubmit, _timeSubmit,input_booking_description;
    private Button sendquery;
    private AutoCompleteTextView _platters;
    private String _PlatterID;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.platterproduct);
        pref=new PrefManager(getApplicationContext());
        HashMap<String, String> user=pref.getUserDetails();
        _phoneNo=user.get(PrefManager.KEY_MOBILE);


        toolbar = findViewById(R.id.toolbardd);
        setSupportActionBar(toolbar);
        getSupportActionBar().setHomeButtonEnabled(true);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        toolbar.setTitle(R.string.app_name);
        service_pic=findViewById(R.id.service_pic);
        _i4=findViewById(R.id._i4);
        _i4.setOnClickListener(this);
        orders=findViewById(R.id.orders);

        _name1=findViewById(R.id._name1);

        L1=findViewById(R.id._l1);
        L2=findViewById(R.id.L1);
        L2.setVisibility(View.VISIBLE);

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
        _platters=findViewById(R.id._platters);
        _platters.setOnClickListener(this);
        _timeSubmit = findViewById(R.id._time_submit);
        _timeSubmit.setOnClickListener(this);
        _dateSubmit = findViewById(R.id._date_submit);
        _dateSubmit.setOnClickListener(this);
        input_booking_description=findViewById(R.id.input_booking_description);
        sendquery=findViewById(R.id.sendquery);
        sendquery.setOnClickListener(this::onClick);
        booking=findViewById(R.id.booking);

        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(BookPlatters.this, Canteen_Mainactivity.class);
                startActivity(i);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });

        Intent j =getIntent();
         _from=j.getIntExtra("from",0);
    }


    @Override
    public void onClick(View v) {

        switch (v.getId()){

            case R.id.sendquery:
                if (!TextUtils.isEmpty(_dateSubmit.getText().toString())) {
                    if (!TextUtils.isEmpty(_timeSubmit.getText().toString())) {
                        if (!TextUtils.isEmpty(input_booking_description.getText().toString())) {
                            if (_PlatterID!=null) {
                                MeatAccept(_dateSubmit.getText().toString(), _timeSubmit.getText().toString());
                            }else{
                                _platters.showDropDown();
                            }

                        } else {
                            input_booking_description.requestFocus();
                        }
                    } else {
                        _timeSubmit.requestFocus();
                    }
                } else {
                    _dateSubmit.requestFocus();
                }
                break;

            case  R.id._platters:
                _platters.showDropDown();
                break;
            case R.id._date_submit:
                try {
                    open_date(_dateSubmit);
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                break;

            case R.id._time_submit:
                if (!TextUtils.isEmpty(_dateSubmit.getText().toString())) {
                    open_time(_timeSubmit);
                } else {
                    _dateSubmit.setError("Select date");
                }
                break;


            case R.id._i4:
                if(_phoneNo!=null) {
                    if (pref.get_food_items() != 0) {
                        pref.set_cID1(2);
                        Intent o = new Intent(BookPlatters.this, GooglemapApp.class);
                        startActivity(o);
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                    }else{
                        if (!BookPlatters.this.isFinishing()) {
                            new AlertDialog.Builder(BookPlatters.this, R.style.AlertDialogTheme)
                                    .setTitle("Your cart is empty")
                                    .setMessage("Please add items to your cart.")
                                    .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            dialog.cancel();
                                            Intent o = new Intent(BookPlatters.this, Canteen_Mainactivity.class);
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
                    if (!BookPlatters.this.isFinishing()) {
                        new AlertDialog.Builder(BookPlatters.this, R.style.AlertDialogTheme)
                                .setTitle("Please login.")
                                .setMessage("You need to login to complete your order.")
                                .setPositiveButton("Login", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                        Intent o = new Intent(BookPlatters.this, ServiceOffer.class);

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

                Intent i = new Intent(BookPlatters.this, Canteen_Mainactivity.class);
                startActivity(i);
                finish();
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);

                break;

        }

    }


    private void MeatAccept(String date, String time) {


        StringRequest eventoReq = new StringRequest(com.android.volley.Request.Method.POST,Config_URL.URL_BOOK_PLATTERS,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.w("kk", response);


                        String[] par = response.split("error");
                        if (par[1].contains("false")) {
                            ViewDialogFailedSuccess alert = new ViewDialogFailedSuccess();
                            alert.showDialog(BookPlatters.this, "Success! Our representative will be in touch with you.", false);

                        } else {
                            ViewDialogFailed alert = new ViewDialogFailed();
                            alert.showDialog(BookPlatters.this, "Failed to store information!", true);
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
                params.put("date", _dateSubmit.getText().toString());
                params.put("time", _timeSubmit.getText().toString());
                params.put("details", input_booking_description.getText().toString());
                params.put("from", String.valueOf(_from));
                params.put("mobile", _phoneNo);
                params.put("address", _address.getText().toString());
                params.put("ID", _PlatterID);
                return params;
            }

        };

        // Añade la peticion a la cola
        AppController.getInstance().addToRequestQueue(eventoReq);
    }


    public class ViewDialogFailedSuccess {
        public void showDialog(Activity activity, String msg, Boolean noDate) {
            if (!activity.isFinishing()) {
                final Dialog dialog1 = new Dialog(activity);
                dialog1.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialog1.setCancelable(false);
                dialog1.setContentView(R.layout.custom_dialog_success);
                dialog1.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
                dialog1.getWindow().getAttributes().windowAnimations = R.style.DialogAnimation;
                TextView text = dialog1.findViewById(R.id.text_dialog);
                text.setText(msg);


                Button dialogButton = dialog1.findViewById(R.id.btn_dialog);
                dialogButton.setText("Ok");

                dialogButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Intent i = new Intent(BookPlatters.this, Canteen_Mainactivity.class);
                        startActivity(i);
                        overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                        finish();
                        dialog1.dismiss();
                    }
                });

                dialog1.show();


            }
        }
    }

    public class ViewDialogFailed {

        public void showDialog(Activity activity, String msg, Boolean noDate) {
            if (!activity.isFinishing()) {
                final Dialog dialog1 = new Dialog(activity);
                dialog1.requestWindowFeature(Window.FEATURE_NO_TITLE);
                dialog1.setCancelable(true);

                dialog1.setContentView(R.layout.custom_dialog_failed);
                dialog1.getWindow().setBackgroundDrawableResource(android.R.color.transparent);
                dialog1.getWindow().getAttributes().windowAnimations = R.style.DialogAnimation;
                TextView text = dialog1.findViewById(R.id.text_dialog);
                text.setText(msg);

                Button dialogButton = dialog1.findViewById(R.id.btn_dialog);

                dialogButton.setText("Ok");
                dialogButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        dialog1.dismiss();
                    }
                });

                dialog1.show();
            }
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
        final ArrayList<platter> mVehicle = new ArrayList<platter>();
        final ArrayList<String> mVehicle1 = new ArrayList<String>();
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
                                    if (!c.isNull("ID") && _from==c.getInt("ID") ) {
                                        String url =c.getString("Photo").replaceAll(" ", "%20");
                                        ImageLoader imageLoader = LruBitmapCache.getInstance(BookPlatters.this)
                                                .getImageLoader();
                                        imageLoader.get(url, ImageLoader.getImageListener(service_pic,
                                                R.mipmap.ic_launcher, R.mipmap
                                                        .ic_launcher));
                                        service_pic.setImageUrl(url, imageLoader);

                                        _name1.setText(c.getString("Name"));
                                        booking.setText("Book platters for "+c.getString("Name"));
                                    }

                                }
                            }



                            JSONArray vehicle = jsonObj.getJSONArray("plattersname");
                            if (vehicle.length() != 0) {
                                for (int i = 0; i < vehicle.length(); i++) {
                                    JSONObject c = vehicle.getJSONObject(i);
                                    if (!c.isNull("ID")) {
                                        platter items = new platter();
                                        items.setID(c.getInt("ID"));
                                        items.setName(c.getString("Name"));
                                        mVehicle.add(items);
                                        mVehicle1.add(c.getString("Name"));
                                    }
                                }

                            }

                            final ArrayAdapter<String> arrayAdapter1 = new ArrayAdapter<String>(
                                    getBaseContext(), android.R.layout.simple_list_item_1, mVehicle1);
                            final String[] selection2 = new String[1];
                            _platters.setAdapter(arrayAdapter1);
                            _platters.setCursorVisible(false);
                            _platters.setOnItemClickListener(new AdapterView.OnItemClickListener() {

                                @Override
                                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                                    selection2[0] = (String) parent.getItemAtPosition(position);
                                    for (int i = 0; i < mVehicle.size(); i++) {
                                        if (mVehicle.get(i).getName(i).contains(selection2[0])) {
                                            _PlatterID = mVehicle.get(i).getName(i);
                                        }
                                    }

                                }
                            });

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

    private void open_date(final EditText _date) throws ParseException {
        SimpleDateFormat simpleDateFormat =
                new SimpleDateFormat("yyyy-MM-dd");
        int year;
        int months;
        int day;

        final Dialog dialog1 = new Dialog(BookPlatters.this, R.style.ThemeTransparent);
        dialog1.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog1.setCancelable(true);
        dialog1.setContentView(R.layout.dailog_date);

        DatePicker date_ = dialog1.findViewById(R.id.datePickerExample);
        Button ok = dialog1.findViewById(R.id.button2);
        Calendar currCalendar = Calendar.getInstance();

        // Set the timezone which you want to display time.
        currCalendar.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));

        year = currCalendar.get(Calendar.YEAR);
        months = currCalendar.get(Calendar.MONTH) + 1;
        day = currCalendar.get(Calendar.DAY_OF_MONTH);


        currCalendar.add(Calendar.HOUR, 3);
        Date date = simpleDateFormat.parse(simpleDateFormat.format(currCalendar.getTime()));
        date_.setMinDate(date.getTime());
        currCalendar.setTime(date);
        currCalendar.add(Calendar.HOUR, 240);
        Date date1 = simpleDateFormat.parse(simpleDateFormat.format(currCalendar.getTime()));

        date_.setMaxDate(date1.getTime());
        date_.init(year, months, day, new DatePicker.OnDateChangedListener() {
            @Override
            public void onDateChanged(DatePicker datePicker, int year, int month, int day) {
                _timeSubmit.setText("");
           
                if (month < 9) {
                    if (day < 10) {
                        _date.setText( year+ "-" +"0" + (month + 1) + "-" + "0" + day);
                    } else {
                        _date.setText( year+ "-" +"0" + (month + 1) + "-" + day );
                    }
                } else {
                    if (day < 10) {
                        _date.setText( year+ "-" +(month + 1) + "-" + "0" + day );
                    } else {
                        _date.setText( year+ "-" +(month + 1) + "-" + day);
                    }
                }

            }
        });

        ok.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog1.cancel();
            }
        });

        dialog1.show();

    }

    private void open_time(final EditText _time) {
        SimpleDateFormat simpleDateFormat =
                new SimpleDateFormat("yyy-MM-dd");
        final Dialog dialog1 = new Dialog(BookPlatters.this, R.style.ThemeTransparent);
        dialog1.requestWindowFeature(Window.FEATURE_NO_TITLE);
        dialog1.setCancelable(true);
        dialog1.setContentView(R.layout.dialog_time);

        TimePicker timePicker = dialog1.findViewById(R.id.timePickerExample);
        Button ok = dialog1.findViewById(R.id.button3);
        Calendar currCalendar = Calendar.getInstance();

        try {
            Date dte = simpleDateFormat.parse(_dateSubmit.getText().toString());
            Calendar c = Calendar.getInstance();
            String dte1 = simpleDateFormat.format(c.getTime());
            Date dte2 = simpleDateFormat.parse(dte1);
            if (!dte.equals(dte2)) {
                timePicker.setOnTimeChangedListener(new TimePicker.OnTimeChangedListener() {
                    @Override
                    public void onTimeChanged(TimePicker timePicker, int hour1, int minute) {
                        String am_pm = (hour1 < 12) ? "AM" : "PM";
                        int hhh = (hour1 < 12) ? hour1 : (hour1 - 12);
                        if (minute < 10) {

                            _time.setText(hhh + ":0" + minute + "" + am_pm);
                        } else {
                            _time.setText(hhh + ":" + minute + "" + am_pm);
                        }


                    }
                });
            } else {
                final int hour = c.get(Calendar.HOUR_OF_DAY) + 1;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    timePicker.setHour(hour);
                } else {

                    timePicker.setCurrentHour(hour);
                }
                timePicker.setOnTimeChangedListener(new TimePicker.OnTimeChangedListener() {
                    @Override
                    public void onTimeChanged(TimePicker timePicker, int hour1, int minute) {
                        if (hour1 >= hour) {
                            String am_pm = (hour1 < 12) ? "AM" : "PM";
                            int hhh = (hour1 < 12) ? hour1 : (hour1 - 12);
                            if (minute < 10) {

                                _time.setText(hhh + ":0" + minute + "" + am_pm);
                            } else {
                                _time.setText(hhh + ":" + minute + "" + am_pm);
                            }

                        }
                    }
                });

            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        ok.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog1.cancel();
            }
        });
        dialog1.show();

    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            Intent i = new Intent(BookPlatters.this, Canteen_Mainactivity.class);
            startActivity(i);
            finish();
            overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
        }
        return true;
    }

}
