package com.example.latihanjsonplaceholder;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.Bundle;
import android.util.Log;

import com.example.latihanjsonplaceholder.adapter.PostAdapter;
import com.example.latihanjsonplaceholder.apiclient.ApiClient;
import com.example.latihanjsonplaceholder.apiclient.Post;
import com.example.latihanjsonplaceholder.apiclient.PostInterface;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class MainActivity extends AppCompatActivity {

    PostAdapter adapter;
    RecyclerView recPost;
    PostInterface postInterface;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        recPost = findViewById(R.id.rec_post);
        recPost.setLayoutManager(new LinearLayoutManager(this));

        postInterface = ApiClient.getClient().create(PostInterface.class);
        getAllPost();
    }

    private void getAllPost() {
        Call<List<Post>> getPost = postInterface.getPost();
        getPost.enqueue(new Callback<List<Post>>() {
            @Override
            public void onResponse(Call<List<Post>> call, Response<List<Post>> response) {
                ArrayList<Post> listPost = (ArrayList<Post>) response.body();
                adapter = new PostAdapter(listPost);
                recPost.setAdapter(adapter);
            }

            @Override
            public void onFailure(Call<List<Post>> call, Throwable t) {
                Log.e("response_error", t.getMessage());
            }
        });
    }
}