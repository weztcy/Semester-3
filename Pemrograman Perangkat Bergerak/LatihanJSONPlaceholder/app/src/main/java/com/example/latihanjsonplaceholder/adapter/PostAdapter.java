package com.example.latihanjsonplaceholder.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.RecyclerView;

import com.example.latihanjsonplaceholder.R;
import com.example.latihanjsonplaceholder.apiclient.Post;

import java.util.ArrayList;

public class PostAdapter extends RecyclerView.Adapter<PostAdapter.ViewHolder> {

    ArrayList<Post> listPost;

    public PostAdapter(ArrayList<Post> listPost) {
        this.listPost = listPost;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        Context context = parent.getContext();
        LayoutInflater inflater = LayoutInflater.from(context);
        ViewHolder holder = new ViewHolder(inflater.inflate(R.layout.post_item, parent, false));
        return holder;
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        Post post = listPost.get(position);
        holder.txtTitle.setText(post.getTitle());
        holder.txtBody.setText(post.getBody());
    }

    @Override
    public int getItemCount() {
        return listPost.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        public TextView txtBody, txtTitle;
        public ConstraintLayout itemLayout;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            txtTitle = itemView.findViewById(R.id.txtItemTitle);
            txtBody = itemView.findViewById(R.id.txtItemBody);
            itemLayout = itemView.findViewById(R.id.item_layout);
        }
    }
}
