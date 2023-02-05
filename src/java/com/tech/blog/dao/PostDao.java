package com.tech.blog.dao;

import com.tech.blog.entities.Categories;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class PostDao {
  private Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public  ArrayList<Categories> getAllCategories(){
    ArrayList<Categories>list = new ArrayList<>();
    try{
    String query = "Select *  from categories";
        Statement statement = this.con.createStatement();
        ResultSet set = statement.executeQuery(query);
        
    }catch(Exception e){
    e.printStackTrace();
    }
    
    return list;
    }
  
}
