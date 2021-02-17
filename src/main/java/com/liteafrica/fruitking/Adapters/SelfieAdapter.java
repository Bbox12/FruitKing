package com.liteafrica.fruitking.Adapters;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.NetworkImageView;
import com.github.andreilisun.swipedismissdialog.OnSwipeDismissListener;
import com.github.andreilisun.swipedismissdialog.SwipeDismissDialog;
import com.github.andreilisun.swipedismissdialog.SwipeDismissDirection;
import com.liteafrica.fruitking.LruBitmapCache;
import com.liteafrica.fruitking.Model.Eats;
import com.liteafrica.fruitking.R;

import java.util.ArrayList;
import java.util.List;


public class SelfieAdapter extends RecyclerView.Adapter<SelfieAdapter.ViewHolder>  {

    // The items to display in your RecyclerView
    private ArrayList<Eats> mItems;
    protected List<Eats> list;
    private LayoutInflater mshit;

    private Context mContext;
    private String Name_p;
    private String User;
    private String rView;
    private ArrayList<Eats> mModel;


    public SelfieAdapter(Context acontext, ArrayList<Eats> mItems) {
        //mshit = LayoutInflater.from(acontext);
        this.mItems = mItems;
        this.mContext = acontext;



    }



    public ArrayList<Eats> getmItems() {
        return mItems;
    }

    @Override
    public long getItemId(int position) {

        return super.getItemId(position);
    }

    @Override
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }

    public void setName(String name) {

        Name_p=name;

    }

    public void User(String user) {
        User=user;
    }

    public void Service_name(String s) {

        rView=s;
    }



    public class ViewHolder extends RecyclerView.ViewHolder {

        private NetworkImageView images_p;
        private TextView _name,_address,_text1;



        public ViewHolder(View itemView) {
            super(itemView);

            images_p = itemView.findViewById(R.id.service_pic);

        }


    }

    @Override
    public SelfieAdapter.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        //More to come
        View v = LayoutInflater.from(viewGroup.getContext())
                .inflate(R.layout.selfierv, viewGroup, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(final SelfieAdapter.ViewHolder viewHolder, final int position) {
        final Eats movie = mItems.get(position);

        if (movie.getPhoto(position) != null) {

            String url =movie.getPhoto(position).replaceAll(" ", "%20");
            ImageLoader imageLoader = LruBitmapCache.getInstance(mContext)
                    .getImageLoader();
            imageLoader.get(url, ImageLoader.getImageListener(viewHolder.images_p,
                    R.mipmap.ic_launcher, R.mipmap
                            .ic_launcher));
            viewHolder.images_p.setImageUrl(url, imageLoader);

        }


          viewHolder.images_p.setOnClickListener(new View.OnClickListener() {
              @Override
              public void onClick(View v) {
                  open_logout(movie.getPhoto(position));
              }
          });
    }



    private void open_logout(String _filePath) {

        if(!((Activity)mContext).isFinishing()  ) {

            SwipeDismissDialog.Builder builder = new SwipeDismissDialog.Builder(mContext);

            LayoutInflater inflater = LayoutInflater.from(mContext);
            View dialogView = inflater.inflate(R.layout.full_image, null);

            // Set the custom layout as alert dialog view
            builder.setView(dialogView);


            NetworkImageView _Profile = dialogView.findViewById(R.id.full_image_view);
            ImageLoader imageLoader = LruBitmapCache.getInstance(mContext)
                    .getImageLoader();
            imageLoader.get(_filePath, ImageLoader.getImageListener(_Profile,
                    R.mipmap.ic_launcher, R.mipmap
                            .ic_launcher));
            _Profile.setImageUrl(_filePath, imageLoader);
            // Create the alert dialog
            final SwipeDismissDialog dialog = builder.setOnSwipeDismissListener(new OnSwipeDismissListener() {
                @Override
                public void onSwipeDismiss(View view, SwipeDismissDirection direction) {

                }
            })
                    .build();


            dialog.show();
        }

    }


    @Override
    public int getItemCount() {
        return mItems.size();
    }


}

