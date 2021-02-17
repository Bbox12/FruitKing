package com.liteafrica.fruitking.Adapters;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;

import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.toolbox.ImageLoader;
import com.liteafrica.fruitking.Model.platter;
import com.liteafrica.fruitking.PrefManager;
import com.liteafrica.fruitking.R;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class _CommodityAdapter extends RecyclerView.Adapter<_CommodityAdapter.ViewHolder> {

    private ArrayList<platter> mItems;
    private Context mContext;
    private ImageLoader imageLoader;
    private int _from = 0;
    private CoordinatorLayout coordinatorLayout;
    private String _phoneNo;
    private PrefManager pref;


    public _CommodityAdapter(Context aContext, ArrayList<platter> mItems) {
        this.mItems = mItems;
        this.mContext = aContext;

    }

    public void setPref(PrefManager pref1) {
        pref=pref1;
    }
    @Override
    public long getItemId(int position) {
        return super.getItemId(position);
    }

    @Override
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }


    @Override
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        //More to come
        View v = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.calenderrv, viewGroup, false);

        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(final ViewHolder viewHolder, final int position) {
        final platter album_pos = mItems.get(position);

        if (album_pos.getOccasion(position) != null && !TextUtils.isEmpty(album_pos.getOccasion(position))) {
            viewHolder.occasion.setText(album_pos.getOccasion(position));

        }

        if (album_pos.getPlatterID(position) != null && !TextUtils.isEmpty(album_pos.getPlatterID(position))) {
            viewHolder.Name.setText(album_pos.getPlatterID(position));

        }

        if (album_pos.getDescription(position) != null && !TextUtils.isEmpty(album_pos.getDescription(position))) {
            viewHolder.description.setText(album_pos.getDescription(position));

        }

        if (album_pos.getBooking_date(position) != null && !TextUtils.isEmpty(album_pos.getBooking_date(position))) {
            viewHolder.datetime.setText(parseDateToETR(album_pos.getBooking_date(position)+album_pos.getBooking_time(position)));

        }

        if (album_pos.getPrice(position) != null && !TextUtils.isEmpty(album_pos.getPrice(position))) {
            viewHolder.price.setText(album_pos.getPrice(position));

        }




        if(album_pos.getStatus(position)==0){
            viewHolder.status.setText("Pending");
        }else if(album_pos.getStatus(position)==1){
            if (album_pos.getMessage(position) != null && !TextUtils.isEmpty(album_pos.getMessage(position))) {
                viewHolder.message.setText(album_pos.getMessage(position));

            }
            viewHolder.status.setText("Accepted");
        }else if(album_pos.getStatus(position)==2){
            if (album_pos.getFinalMessage(position) != null && !TextUtils.isEmpty(album_pos.getFinalMessage(position))) {
                viewHolder.message.setText(album_pos.getFinalMessage(position));

            }
            viewHolder.status.setText("Completed");
        }else if(album_pos.getStatus(position)==3){
            if (album_pos.getFinalMessage(position) != null && !TextUtils.isEmpty(album_pos.getFinalMessage(position))) {
                viewHolder.message.setText(album_pos.getFinalMessage(position));

            }
            viewHolder.status.setText("Rejected");
        }

    }


    @Override
    public int getItemCount() {
        return mItems.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {


        private EditText Name,datetime,description,status,message,price,occasion;



        public ViewHolder(View itemView) {
            super(itemView);
            Name = itemView.findViewById(R.id.name);
            datetime=itemView.findViewById(R.id.datetime);
            description=itemView.findViewById(R.id.description);
            status = itemView.findViewById(R.id.status);
            message=itemView.findViewById(R.id.message);
            price=itemView.findViewById(R.id.price);
            occasion=itemView.findViewById(R.id.occasion);
        }

    }

    public String parseDateToETR(String time) {
        String inputPattern = "yyyy-MM-ddHH:mm:ss";
        String outputPattern = "dd MMM yy hh:mm aa";
        SimpleDateFormat inputFormat = new SimpleDateFormat(inputPattern);
        SimpleDateFormat outputFormat = new SimpleDateFormat(outputPattern);

        Date date = null;
        String str = null;

        try {
            date = inputFormat.parse(time);
            str = outputFormat.format(date);
        } catch (ParseException e) {
            //e.printStackTrace();
            String inputPattern1 = "yyyy-MM-dd";
            String outputPattern1 = "dd MMM yy";
            SimpleDateFormat inputFormat1 = new SimpleDateFormat(inputPattern1);
            SimpleDateFormat outputFormat1 = new SimpleDateFormat(outputPattern1);

            Date date1 = null;

            try {
                date1 = inputFormat1.parse(time);
                str = outputFormat1.format(date1);
            } catch (ParseException e1) {
                e1.printStackTrace();
            }
        }
        return str;
    }
}






