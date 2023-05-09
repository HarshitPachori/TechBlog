/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author dell
 */
public class Comment {

    private int cmtid;
    private int pid;
    private int uid;
    private String cmnt;
    private Timestamp cmtdate;

    public Comment(int cmtid, int pid, int uid, String cmnt, Timestamp cmtdate) {
        this.cmtid = cmtid;
        this.pid = pid;
        this.uid = uid;
        this.cmnt = cmnt;
        this.cmtdate = cmtdate;
    }

    public Comment(int pid, int uid, String cmnt) {
        this.pid = pid;
        this.uid = uid;
        this.cmnt = cmnt;
    }

    public Comment() {
    }

    public int getCmtid() {
        return cmtid;
    }

    public void setCmtid(int cmtid) {
        this.cmtid = cmtid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getCmnt() {
        return cmnt;
    }

    public void setCmnt(String cmnt) {
        this.cmnt = cmnt;
    }

    public Timestamp getCmtdate() {
        return cmtdate;
    }

    public void setCmtdate(Timestamp cmtdate) {
        this.cmtdate = cmtdate;
    }
    

}
