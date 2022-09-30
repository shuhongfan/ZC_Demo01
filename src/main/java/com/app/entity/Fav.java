package com.app.entity;
public class Fav {
 public int id;
 public String uid;
 public Products p;
 
 public Products getP() {
	return p;
}
public void setP(Products p) {
	this.p = p;
}
public void setUid(String uid){ 
 this.uid=uid;
 } 
 public String getUid(){
 return uid;
 } 
 public String pid;
 public void setPid(String pid){ 
 this.pid=pid;
 } 
 public String getPid(){
 return pid;
 } 
public void setId(int id) {
this.id = id;
}

public int getId() {
return id;
}

}