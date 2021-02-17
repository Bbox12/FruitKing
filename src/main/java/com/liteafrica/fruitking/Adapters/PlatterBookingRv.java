package com.liteafrica.fruitking.Adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;

import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.NetworkImageView;
import com.liteafrica.fruitking.LruBitmapCache;
import com.liteafrica.fruitking.Model.platter;
import com.liteafrica.fruitking.PrefManager;
import com.liteafrica.fruitking.R;

import java.util.ArrayList;

public class PlatterBookingRv extends RecyclerView.Adapter<PlatterBookingRv.ViewHolder> {

    private ArrayList<platter> mItems;
    private Context mContext;
    private ImageLoader imageLoader;
    private int _from = 0;
    private CoordinatorLayout coordinatorLayout;
    private String _phoneNo;
    private PrefManager pref;


    public PlatterBookingRv(Context aContext, ArrayList<platter> mItems) {
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
    public PlatterBookingRv.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        //More to come
        View v = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.platterrv, viewGroup, false);

        return new PlatterBookingRv.ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(final PlatterBookingRv.ViewHolder viewHolder, final int position) {
        final platter album_pos = mItems.get(position);





        String url =album_pos.getPhoto(position).replaceAll(" ", "%20");
        ImageLoader imageLoader = LruBitmapCache.getInstance(mContext)
                .getImageLoader();
        imageLoader.get(url, ImageLoader.getImageListener(viewHolder.Thumbnail,
                R.mipmap.ic_launcher, R.mipmap
                        .ic_launcher));
        viewHolder.Thumbnail.setImageUrl(url, imageLoader);

/*        viewHolder.enquiry.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent o = new Intent(mContext, BookPlatters.class);
                o.putExtra("from",album_pos.getID(position));
                mContext.startActivity(o);
                ((Activity) mContext).overridePendingTransition(R.anim.slide_up1, R.anim.rbounce);
            }
        });*/
    }


    @Override
    public int getItemCount() {
        return mItems.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {


        private TextView Name,_details1;
        private NetworkImageView Thumbnail;
        private Button enquiry;


        public ViewHolder(View itemView) {
            super(itemView);

            Thumbnail = itemView.findViewById(R.id.service_pic);

        }

    }


}






