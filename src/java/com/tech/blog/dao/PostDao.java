package com.tech.blog.dao;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getAllCategories() {
        ArrayList<Categories> list = new ArrayList<>();
        try {
            String query = "Select *  from categories";
            Statement statement = this.con.createStatement();
            ResultSet set = statement.executeQuery(query);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Categories c = new Categories(cid, name, description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {
            String query = "insert into posts (pTitle , pContent, pCode, pPic, catId, userId) values (?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // get all the post
    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();
        // fetch all the post
        try {
            PreparedStatement pstmt = con.prepareStatement("Select * from posts order by pid desc");
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // get all the post by category id
    public List<Post> getAllPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        // fetch all the post by catId

        try {
            PreparedStatement pstmt = con.prepareStatement("Select * from posts where catId = ?");
            pstmt.setInt(1, catId);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // get  the post by post id
    public Post getPostByPostId(int postId) {
        // fetch the post by postId
        String query = "select * from posts where pid =?";
        Post post = null;
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, postId);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                int cid = set.getInt("catId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return post;
    }

}
