package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {
private static Connection con;
public static Connection getConnection(){
    try{
       if(con == null){
            // driver class load
        Class.forName("com.mysql.jdbc.Driver");
        // create a connection
        con = DriverManager.
                getConnection("jdbc:mysql://containers-us-west-102.railway.app:6025/railway", "root", "W7Rfp6k0eaOXeo1Rgjjs");
//                getConnection("jdbc:mysql://localhost:3306/techblog", "root", "harshit@345");
        
        
       }
    }catch(Exception e){
        e.printStackTrace();
    }
    
    return con;
}
}
