package com.liteafrica.fruitking.Activites.Canteen;

import android.app.Activity;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.snackbar.Snackbar;
import com.google.android.material.textfield.TextInputLayout;
import com.google.firebase.auth.ActionCodeSettings;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.PhoneAuthProvider;
import com.liteafrica.fruitking.Adapters.BookingAdapter;
import com.liteafrica.fruitking.Login.SignUp;
import com.liteafrica.fruitking.Model.Foods;
import com.liteafrica.fruitking.PrefManager;
import com.liteafrica.fruitking.R;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;

public class SellerUpdateWindow extends AppCompatActivity implements View.OnClickListener {
    private static final String TAG = SignUp.class.getSimpleName();
    private static final int MY_PERMISSIONS_REQUEST_USE_CAMERA = 1001;
    private static final int REQUEST_EXTERNAL_STORAGE = 1002;
    private static final int IMAGE_ = 1003;
    private PrefManager pref;
    private String _phoneNo;
    private CoordinatorLayout coordinatorLayout;
    private RelativeLayout afterAnimationView;
    private Button signup,forgot_pwd;
    private EditText input_user_name,input_user_address,input_user_mobile,input_user_zip,input_total;
    private boolean Again;
    private Bitmap bitmap;
    private boolean permissionsAllowd;
    private int REQUEST_CAMERA = 0, SELECT_FILE = 1;
    private String filePath;
    private ProgressBar progressBar;
    private int _role=0;
    private Bitmap bm;
    private String salonmobileno;
    private boolean valid;
    private Dialog dialogWait;
    private FirebaseAuth mAuth;
    private PhoneAuthProvider.OnVerificationStateChangedCallbacks mCallbacks;
    private TextInputLayout _m0;
    private ActionCodeSettings actionCodeSettings;
    private ProgressDialog mProgressDialog;
    private boolean _clicked;
    private RecyclerView _moreRv;
    private DecimalFormat df = new DecimalFormat("0.00");
    private ArrayList<Foods> mItems = new ArrayList<Foods>();
    private String _total;
    private LinearLayout Scan,history;
    private AutoCompleteTextView paid;
    private EditText change,amountpaid;
    private int _paid=0;
    private int Rate=0;
    private int _change=0;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.selleraddcart);
        pref = new PrefManager(getApplicationContext());
        HashMap<String, String> user = pref.getUserDetails();
        _phoneNo = user.get(PrefManager.KEY_MOBILE);
        coordinatorLayout = findViewById(R.id
                .cor_home_main);
        progressBar=findViewById(R.id.progress_signup);
        signup=findViewById(R.id.btnAction);
        signup.setOnClickListener(this);
        input_user_name=findViewById(R.id.input_name);
        input_user_address=findViewById(R.id.input_address);
        input_user_mobile=findViewById(R.id.input_mobile);
        input_user_zip=findViewById(R.id.input_zip);
        input_total=findViewById(R.id.input_total);
        _moreRv=findViewById(R.id.moreRv);
        _moreRv.setNestedScrollingEnabled(false);
        Scan=findViewById(R.id.mystatus);
        Scan.setOnClickListener(this);

        paid=findViewById(R.id.paid);
        paid.setOnClickListener(this);
        change=findViewById(R.id.change);
        amountpaid=findViewById(R.id.amountpaid);

        history=findViewById(R.id.submitarequest);
        history.setOnClickListener(this);

    }


    @Override
    protected void onResume() {
        super.onResume();



        if (pref.get_packagesharedPreferences() != null) {
            mItems.clear();
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
                BookingAdapter sAdapter1 = new BookingAdapter(SellerUpdateWindow.this, mItems);
                sAdapter1.notifyDataSetChanged();
                sAdapter1.setPref(pref);
                sAdapter1.setFrom(0);
                LinearLayoutManager mLayoutManager = new LinearLayoutManager(SellerUpdateWindow.this, LinearLayoutManager.VERTICAL, false);
                _moreRv.setLayoutManager(mLayoutManager);
                _moreRv.setItemAnimator(new DefaultItemAnimator());
                _moreRv.setAdapter(sAdapter1);
                _moreRv.setHasFixedSize(true);

            }

        }


        _total = df.format(Rate);
        input_total.setText("R"+_total);
        Log.w("Dis", String.valueOf(_total));


        input_user_mobile.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {


            }

            @Override
            public void onTextChanged(CharSequence s, int start,
                                      int before, int count) {
                if(s.toString().length()==10){
                    salonmobileno = "+27" + input_user_mobile.getText().toString();
                    //input_user_mobile.setCompoundDrawablesWithIntrinsicBounds(R.drawable.ic_phone, 0, R.mipmap.ic_cor, 0);
                    input_user_address.requestFocus();


                }
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

        amountpaid.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {


            }

            @Override
            public void onTextChanged(CharSequence s, int start,
                                      int before, int count) {
                if(s.toString().length()>1){
                    int _p = Integer.parseInt(s.toString());
                    if(_p>Rate){
                        _change=_p - Rate;
                        change.setText("-"+df.format(_change));
                    }else{
                        _change=Rate - _p;
                        change.setText(df.format(_change));
                    }


                }
            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });


    }

    @Override
    public void onClick(View view) {
        switch (view.getId()){

            case R.id.paid:
                final ArrayAdapter<String> arrayAdapter5 = new ArrayAdapter<String>(
                        getBaseContext(), android.R.layout.simple_list_item_1, getResources()
                        .getStringArray(R.array.paid));
                final String[] selection5 = new String[1];
                paid.setAdapter(arrayAdapter5);
                paid.showDropDown();
                paid.setOnItemClickListener(new AdapterView.OnItemClickListener() {

                    @Override
                    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                        String _p = (String) parent.getItemAtPosition(position);
                        if(_p.equals("YES")){
                           _paid=1;
                        }else {
                            _paid=0;
                        }

                    }
                });

                break;

            case R.id.mystatus:
                Intent monitor = new Intent(SellerUpdateWindow.this, ScanCode.class);
                startActivity(monitor);
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                break;
            case R.id.submitarequest:
                Intent history = new Intent(SellerUpdateWindow.this, ManualEntry.class);
                startActivity(history);
                overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
                break;

            case R.id.btnAction:


                if( !TextUtils.isEmpty(input_user_mobile.getText().toString())){
                    if(!TextUtils.isEmpty(input_user_name.getText().toString())){
                        if(!TextUtils.isEmpty(input_user_address.getText().toString())){
                            if(!TextUtils.isEmpty(input_user_zip.getText().toString())){
                                valid=true;
                                new PostDataTOServer().execute();
                            }else{
                                Toast.makeText(getApplicationContext(),"Please input zip code ",Toast.LENGTH_SHORT).show();
                                input_user_zip.requestFocus();
                            }
                        }else{
                            Toast.makeText(getApplicationContext(),"Please input address",Toast.LENGTH_SHORT).show();
                            input_user_address.requestFocus();
                        }
                    }else{
                        Toast.makeText(getApplicationContext(),"Please input name",Toast.LENGTH_SHORT).show();
                        input_user_name.requestFocus();
                    }
                }else{
                    Toast.makeText(getApplicationContext(),"Please input  mobile no",Toast.LENGTH_SHORT).show();
                    input_user_mobile.requestFocus();
                }


                break;

            default:
                break;
        }
    }


    private class PostDataTOServer  extends AsyncTask<Void, Integer, String> {


        private boolean success;
        private File destination;
        private String fileImage;
        private MultipartBody requestBody;
        private String commaSeparatedValues;


        @Override
        protected void onPreExecute() {

            super.onPreExecute();
            if (!SellerUpdateWindow.this.isFinishing() ) {
                if(dialogWait!=null){
                    dialogWait.dismiss();
                }
                if (mProgressDialog == null) {
                    mProgressDialog = new ProgressDialog(SellerUpdateWindow.this, R.style.AlertDialogTheme);
                    mProgressDialog.setIcon(R.mipmap.ic_launcher);
                    mProgressDialog.setCancelable(false);
                    mProgressDialog.setTitle("Storing information.");
                    mProgressDialog.setMessage("please wait...");
                    mProgressDialog.setIndeterminate(false);
                    mProgressDialog.show();
                }


            }

            List<String> TotalDays = new ArrayList<String>();
            if (pref.get_packagesharedPreferences() != null) {
                Set<String> set = pref.get_packagesharedPreferences();
                TotalDays.addAll(set);
            }
            commaSeparatedValues = TextUtils.join(",", TotalDays);

        }

        protected String doInBackground(Void... args) {
            return uploadFile();
        }

        private String uploadFile() {
            // TODO Auto-generated method stub
            String res = null;

            try {

                    requestBody = new MultipartBody.Builder()
                            .setType(MultipartBody.FORM)
                            .addFormDataPart("mobile", _phoneNo)
                            .addFormDataPart("data", commaSeparatedValues)
                            .addFormDataPart("total", String.valueOf(_total))
                            .addFormDataPart("name", input_user_name.getText().toString().toUpperCase())
                            .addFormDataPart("address", input_user_address.getText().toString().toUpperCase())
                            .addFormDataPart("phone", input_user_mobile.getText().toString().toUpperCase())
                            .addFormDataPart("pin", input_user_zip.getText().toString().toUpperCase())
                            .addFormDataPart("pay", "3")
                            .addFormDataPart("IP", "1")
                            .addFormDataPart("amount", amountpaid.getText().toString())
                            .addFormDataPart("paid", String.valueOf(_paid))
                            .build();



                Request request = new Request.Builder()
                        .url("http://139.59.38.160/Fruit/store_book_order_manual_android.php")
                        .post(requestBody)
                        .build();
                OkHttpClient client = new OkHttpClient.Builder()
                        .connectTimeout(120, TimeUnit.SECONDS)
                        .writeTimeout(120, TimeUnit.SECONDS)
                        .readTimeout(120, TimeUnit.SECONDS)
                        .build();
                okhttp3.Response response = client.newCall(request).execute();
                res = response.body().string();
                String[] par = res.split("error");
                if (par[1].contains("false")) {
                 success=true;

                }

                Log.e("TAG", "Response : " + res);

                return res;

            } catch (UnknownHostException | UnsupportedEncodingException e) {
                Log.e("TAG", "Error: " + e.getLocalizedMessage());
            } catch (Exception e) {
                Log.e("TAG", "Other Error: " + e.getLocalizedMessage());
                if(e.getLocalizedMessage()!=null && e.getLocalizedMessage().contains("timeout")){
                    Snackbar snackbar = Snackbar
                            .make(coordinatorLayout, "Slow connection.", Snackbar.LENGTH_LONG)
                            .setAction("Retry", new View.OnClickListener() {
                                @Override
                                public void onClick(View view) {
                                    new PostDataTOServer().execute();
                                }
                            });
                    snackbar.setActionTextColor(Color.RED);
                    snackbar.show();
                }
            }


            return res;

        }

        protected void onPostExecute(String file_url) {

            if (mProgressDialog != null) {
                mProgressDialog.dismiss();
            }

            if (success) {
                pref.set_ride(0);
                pref.set_cID(0);
                pref.packagesharedPreferences(null);
                pref.setPickAt1(null);
                pref.setDropAt1(null);
                pref.set_food_money(0);
                pref.set_food_items(0);
                pref.setPickLat1(null);
                pref.setPickLong1(null);
                pref.setCanteen(null);
                pref.setcName(null);
                pref.setcPhoto(null);
                pref.setcAddress(null);
                pref.setcDiscount(0);
                pref.setcPackaging(0);
                pref.setcLess(null);
                pref.setcMore(null);
                pref.setDelivery(0);
                pref.setGoTRide(0);
                pref.setTotal(null);
                pref.setTotal2(null);
                pref.setadTetxt(null);
                pref.setPayment(0);

                ViewDialogFailedSuccess alert = new ViewDialogFailedSuccess();
                alert.showDialog(SellerUpdateWindow.this, "Succesfully stored information.",false);

            }else{
                ViewDialogFailed alert = new ViewDialogFailed();
                alert.showDialog(SellerUpdateWindow.this, "Failed to store information! Please try another time.",true);
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
                        recreate();
                        dialog1.dismiss();
                    }
                });

                dialog1.show();


            }
        }
    }


    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        //replaces the default 'Back' button action
        if(keyCode== KeyEvent.KEYCODE_BACK)   {

            Intent o = new Intent(SellerUpdateWindow.this, QR_Main.class);
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
