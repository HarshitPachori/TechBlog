/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Comment;
import java.util.ArrayList;
import java.util.List;

import java.sql.*;


/**
 *
 * @author dell
 */
public class CommentDao {

    Connection con;

    public CommentDao(Connection con) {
        this.con = con;
    }

    public boolean insertComment(Comment c) {
        boolean f = false;
        try {
            String query = "insert into comment(pid,uid,cmnt) values(?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, c.getPid());
            pstmt.setInt(2, c.getUid());
            pstmt.setString(3, c.getCmnt());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Comment> getAllCommentByPid(int pstid) {
        List<Comment> list = new ArrayList<Comment>();
        try {
            String query = "select * from comment where pid = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, pstid);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                int uid = set.getInt("uid");
                int cmtid = set.getInt("cmtid");
                String cmnt = set.getString("cmnt");
                Timestamp cmtdate = set.getTimestamp("cmtdate");
                Comment comment = new Comment(cmtid, pid, uid, cmnt, cmtdate);
                list.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int countCommentOnPost(int pid){
        int count =0;
        try{
            String query = "select count(*) from comment where pid =?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, pid);
            ResultSet set = pstmt.executeQuery();
            while(set.next()){
            count = set.getInt("count(*)");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return count;
    }
}
