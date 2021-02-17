package com.liteafrica.fruitking.Adapters;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.TranslateAnimation;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.appcompat.app.AlertDialog;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.liteafrica.fruitking.Activites.Canteen.SingleProduct;
import com.liteafrica.fruitking.Activites.Main_Page.GooglemapApp;
import com.liteafrica.fruitking.Model.Eats;
import com.liteafrica.fruitking.PrefManager;
import com.liteafrica.fruitking.R;
import com.squareup.picasso.Picasso;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Set;


/**
 * Created by parag on 22/09/16.
 */
public class Image_Adapter extends RecyclerView.Adapter<Image_Adapter.ViewHolder> {

    SimpleDateFormat sdf = new SimpleDateFormat("hh:mm aa", Locale.US);
    SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
    // The items to display in your RecyclerView
    private ArrayList<Eats> mItems;
    private Context mContext;
    private String Mobile;
    private double My_lat = 0, My_long = 0;
    private CoordinatorLayout coordinatorLayout;
    private PrefManager pref;
    private TextView _iValue;
    private int itemSelected=0;
    private double _orderValue=0;
    private DecimalFormat df = new DecimalFormat("0.00");
    private ArrayList<String>_foods=new ArrayList<String>();
    private TextView orders;
    private ImageView rightarrow;
    private int from;

    public Image_Adapter(Context aContext, ArrayList<Eats> mItems) {
        this.mItems = mItems;
        this.mContext = aContext;

    }


    @Override
    public long getItemId(int position) {
        return super.getItemId(position);
    }

    @Override
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }

    public void setMobile(String mobile) {
        Mobile = mobile;
    }



    public void setPref(PrefManager pref1) {
        pref = pref1;
    }


    @Override
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        //More to come
        View v = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.welcome_slide1, viewGroup, false);
        ViewHolder viewHolder = new ViewHolder(v);

        return viewHolder;
    }

    public void setCoordinatorlayout(CoordinatorLayout coordinatorLayout1) {
        coordinatorLayout=coordinatorLayout1;
    }


    @Override
    public void onBindViewHolder(final ViewHolder viewHolder, final int position) {
        final Eats album_pos = mItems.get(position);
        DecimalFormat df = new DecimalFormat("0.00");

           if(from==1) {
               if( mItems.size() > 3) {
                   if (position == (mItems.size() - 1)) {
                       rightarrow.setVisibility(View.GONE);
                   }else{
                       rightarrow.setVisibility(View.VISIBLE);
                   }
               }
           }

            Picasso.Builder builder = new Picasso.Builder(mContext);
            builder.listener(new Picasso.Listener() {
                @Override
                public void onImageLoadFailed(Picasso picasso, Uri uri, Exception exception) {
                    exception.printStackTrace();
                }
            });
            builder.build().load(album_pos.getPhoto(position)).into( viewHolder._image1);
        viewHolder.Description.setText(album_pos.getDescription(position));
        viewHolder.primary_name.setText(album_pos.getName(position));


        viewHolder.price_1.setText("R" + df.format(album_pos.getPrice(position)));

            if (pref.get_packagesharedPreferences() != null) {
                Set<String> set = pref.get_packagesharedPreferences();
                _foods.clear();
                _foods.addAll(set);
                for (String s : set) {
                    String[] pars = s.split("\\_");
                    if (Integer.parseInt(pars[0]) == album_pos.getID(position)) {
                        viewHolder.button2_add1.setVisibility(View.GONE);
                        viewHolder.rrr.setVisibility(View.VISIBLE);
                        viewHolder._noItem.setText(pars[1]);
                        break;
                    }
                }
            }

            if (pref.get_food_items() != 0) {
                _orderValue = pref.get_food_money();
                pref.set_food_money((float) _orderValue);

            } else {
                pref.set_food_money(0);
            }


        viewHolder._image1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent o = new Intent(mContext, SingleProduct.class);
                pref.setPref2(1);
                pref.setID1(1);
                pref.setID5(album_pos.getID(position));
                ((Activity)mContext).startActivity(o);
                ((Activity)mContext).overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });

        viewHolder.button2_add1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (pref.getUniqueRide() == null) {
                    boolean _again = false;
                    int Rate_ = 0;

                    int dk = (int) album_pos.getPrice(position);
                    _orderValue = pref.get_food_money() + dk;
                    pref.set_food_money((float) _orderValue);
                    if (pref.get_packagesharedPreferences() != null) {
                        Set<String> set = pref.get_packagesharedPreferences();
                        _foods.clear();
                        _foods.addAll(set);
                    }
                    for (int i = 0; i < _foods.size(); i++) {
                        String[] pars = _foods.get(i).split("\\_");
                        if (album_pos.getID(position)== Integer.parseInt(pars[0])) {
                            String s = pars[0];
                            _foods.remove(i);
                            _again = true;
                            Rate_ = 1 + Integer.parseInt(pars[1]);
                            _foods.add(s + "_" + String.valueOf(Rate_) + "_" + String.valueOf(Rate_ * dk) + "_" + album_pos.getName(position) + "_" + 1);
                        }

                    }
                    if (!_again) {
                        itemSelected = pref.get_food_items();
                        itemSelected = itemSelected + 1;
                        pref.set_food_items(itemSelected);
                        _foods.add(String.valueOf(album_pos.getID(position) + "_1" + "_" + String.valueOf(dk) + "_" + album_pos.getName(position) + "_" + 1));
                    }
                    viewHolder.button2_add1.setAnimation(AnimationUtils.loadAnimation(mContext,R.anim.fade_out));
                    viewHolder.button2_add1.setVisibility(View.GONE);

                    viewHolder.rrr.setAnimation(AnimationUtils.loadAnimation(mContext,R.anim.fade_in));
                    viewHolder.rrr.setVisibility(View.VISIBLE);
                    viewHolder._noItem.setText("1");
                    pref.packagesharedPreferences(_foods);
                    orders.setText(String.valueOf(pref.get_food_items()));

                }else {
                    if (! ((Activity)mContext).isFinishing()) {
                        new AlertDialog.Builder(mContext, R.style.AlertDialogTheme)
                                .setTitle("Your order is already in process")
                                .setMessage("Please check the status of your order")
                                .setPositiveButton("Check", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();

                                        Intent o = new Intent(mContext, GooglemapApp.class);
                                        pref.set_ride(3);
                                        ((Activity)mContext).startActivity(o);
                                        ((Activity)mContext).overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
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
            }
        });



        viewHolder._add.setOnClickListener(new View.OnClickListener() {



            @Override
            public void onClick(View v) {
                if (pref.getUniqueRide() == null) {
                    boolean _again = false;
                    int Rate_ = Integer.parseInt(viewHolder._noItem.getText().toString());
                    Rate_ = 1 + Rate_;
                    _orderValue = pref.get_food_money() + mItems.get(position).getPrice(position);
                    pref.set_food_money((float) _orderValue);
                    pref.setTotal(String.valueOf(_orderValue));
                    viewHolder._noItem.setText(String.valueOf(Rate_));
                    if (pref.get_packagesharedPreferences() != null) {
                        Set<String> set = pref.get_packagesharedPreferences();
                        _foods.clear();
                        _foods.addAll(set);
                    }
                    for (int i = 0; i < _foods.size(); i++) {
                        String[] pars = _foods.get(i).split("\\_");
                        if (mItems.get(position).getID(position) == Integer.parseInt(pars[0])) {
                            String s = pars[0];
                            _foods.remove(i);
                            _again = true;
                            _foods.add(s + "_" + String.valueOf(Rate_) + "_" + String.valueOf(Rate_ * mItems.get(position).getPrice(position)) + "_" + mItems.get(position).getName(position) + "_1" );
                        }

                    }
                    if (!_again) {
                        itemSelected = pref.get_food_items();
                        itemSelected = itemSelected + 1;
                        pref.set_food_items(itemSelected);
                        _foods.add(String.valueOf(mItems.get(position).getID(position) + "_" + 1 + "_" + String.valueOf(mItems.get(position).getPrice(position)) + "_" + mItems.get(position).getName(position)) + "_1" );
                    }
                    pref.packagesharedPreferences(_foods);
                    orders.setText(String.valueOf(pref.get_food_items()));



                }else {
                    if (!((Activity) mContext).isFinishing()) {
                        new AlertDialog.Builder(mContext, R.style.AlertDialogTheme)
                                .setTitle("Your order is already in process")
                                .setMessage("Please check the status of your order")
                                .setPositiveButton("Check", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                        Intent o = new Intent(mContext, GooglemapApp.class);

                                        ((Activity) mContext).startActivity(o);
                                        ((Activity) mContext).overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
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

            }
        });
        viewHolder._minus.setOnClickListener(new View.OnClickListener() {


            @Override
            public void onClick(View v) {
                if (pref.getUniqueRide() == null) {
                    int Rate_ = Integer.parseInt(viewHolder._noItem.getText().toString());
                    if (Rate_ > 0) {
                        Rate_ = Rate_ - 1;
                        viewHolder._noItem.setText(String.valueOf(Rate_));
                        _orderValue = pref.get_food_money() - mItems.get(position).getPrice(position);
                        pref.set_food_money((float) _orderValue);
                        pref.setTotal(String.valueOf(_orderValue));
                        if (pref.get_packagesharedPreferences() != null) {
                            Set<String> set = pref.get_packagesharedPreferences();
                            _foods.clear();
                            _foods.addAll(set);
                        }
                        for (int i = 0; i < _foods.size(); i++) {
                            String[] pars = _foods.get(i).split("\\_");
                            if (mItems.get(position).getID(position) == Integer.parseInt(pars[0])) {
                                String s = pars[0];
                                _foods.remove(i);
                                _foods.add(s + "_" + String.valueOf(Rate_) + "_" + String.valueOf(Rate_ * mItems.get(position).getPrice(position)) + "_" + mItems.get(position).getName(position) + "_1" );

                            }

                        }
                        pref.packagesharedPreferences(_foods);
                    }

                    if (Rate_ == 0) {
                        viewHolder._noItem.setText("0");
                        viewHolder.button2_add1.setVisibility(View.VISIBLE);
                        viewHolder.rrr.setAnimation(AnimationUtils.loadAnimation(mContext,R.anim.fade_out));
                        viewHolder.rrr.setVisibility(View.GONE);
                        viewHolder.button2_add1.setAnimation(AnimationUtils.loadAnimation(mContext,R.anim.fade_in));
                        for (int i = 0; i < _foods.size(); i++) {
                            String[] pars = _foods.get(i).split("\\_");
                            if (mItems.get(position).getID(position) == Integer.parseInt(pars[0])) {
                                _foods.remove(i);
                                itemSelected = pref.get_food_items();
                                itemSelected = itemSelected - 1;
                                pref.set_food_items(itemSelected);
                                orders.setText(String.valueOf(itemSelected));
                            }

                        }
                        pref.packagesharedPreferences(_foods);
                        if (itemSelected == 0) {
                            pref.packagesharedPreferences(null);
                            pref.set_food_money(0);
                            pref.set_food_items(0);
                            pref.setTotal(null);
                            pref.setTotal2(null);
                        }
                    }

                }else {
                    if (!((Activity) mContext).isFinishing()) {
                        new AlertDialog.Builder(mContext, R.style.AlertDialogTheme)
                                .setTitle("Your order is already in process")
                                .setMessage("Please check the status of your order")
                                .setPositiveButton("Check", new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                        Intent o = new Intent(mContext, GooglemapApp.class);
                                        ((Activity) mContext).startActivity(o);
                                        ((Activity) mContext).overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
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

            }
        });

        viewHolder._noItem.addTextChangedListener(new TextWatcher() {

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {

            }

            @Override
            public void beforeTextChanged(CharSequence s, int start, int count,
                                          int after) {
                TranslateAnimation animObj = new TranslateAnimation(0, 0, 0, viewHolder._noItem.getHeight());
                animObj.setDuration(1000);
                viewHolder._noItem.startAnimation(animObj);

            }
        });

    }

    @Override
    public int getItemCount() {
        return mItems.size();
    }

    public String parseDateToddMMyyyy(String time) {
        String inputPattern = "yyyy-MM-dd";
        String outputPattern = "dd MMM yy";
        SimpleDateFormat inputFormat = new SimpleDateFormat(inputPattern);
        SimpleDateFormat outputFormat = new SimpleDateFormat(outputPattern);

        Date date = null;
        String str = null;

        try {
            date = inputFormat.parse(time);
            str = outputFormat.format(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return str;
    }

    public void setNos(TextView orders1) {
        orders=orders1;
    }

    public void setImage(ImageView rightarrow1) {
        rightarrow=rightarrow1;
    }

    public void setFrom(int i) {
        from=i;
    }

    public class ViewHolder extends RecyclerView.ViewHolder {


        private TextView Description,price_1,primary_name;
        private ImageView _image1;
        private ImageButton button2_add1;
        private ImageButton _minus,_add;
        private LinearLayout rrr;
        private EditText _noItem;

        public ViewHolder(View itemView) {
            super(itemView);


          Description =itemView.findViewById(R.id.primary_text);
            price_1 =itemView.findViewById(R.id.price_1);
             _image1 =itemView.findViewById(R.id.wlcm1);
           button2_add1=itemView.findViewById(R.id.button2_add1);
            primary_name =itemView.findViewById(R.id.primary_name);
            rrr = itemView.findViewById(R.id._rrr1);
            _minus = itemView.findViewById(R.id.button2_minus1);
            _add = itemView.findViewById(R.id.button2_add2);
            _noItem = itemView.findViewById(R.id.rate_km1);
        }

    }


}





