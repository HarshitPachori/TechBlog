/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import java.sql.*;

/**
 *
 * @author dell
 */
public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {

            String query = "insert into liked(pid,uid) values(?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            // values set...
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            pstmt.executeUpdate(); // if we didnt want to get something but to store something then use execute update otherwise use execute query
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        try {
            String query = "select count(*) from liked where pid = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, pid);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement pstmt = this.con.prepareStatement("select * from liked where pid = ? and uid = ?");
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteLike(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement pstmt = this.con.prepareStatement("delete from liked where pid = ? and uid = ?");
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            pstmt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
