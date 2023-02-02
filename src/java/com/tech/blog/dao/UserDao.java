package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
// method to insert user to database

    public boolean saveUser(User user) {
        boolean f = false;

        try {
            // user => database
            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            // id auto inc hai isliye put nahi ki , timestamp wo curr wali lega , values hame abhi pata nahi hai isliye ? lagaya hai
            PreparedStatement pstmt = this.con.prepareStatement(query); // iski help se ham value dalenge
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            // jab query comp ho jaye to use execute krna hai 
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
