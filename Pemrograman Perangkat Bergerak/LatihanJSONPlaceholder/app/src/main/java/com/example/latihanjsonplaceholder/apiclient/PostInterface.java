package com.example.latihanjsonplaceholder.apiclient;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface PostInterface {
    @GET("posts/")
    Call<List<Post>> getPost();

    @GET("posts/{id}/")
    Call<List<Post>> getPostDetail(@Path("id") int id);

    @POST("posts/")
    Call<Post> addPost(Post post);
}
