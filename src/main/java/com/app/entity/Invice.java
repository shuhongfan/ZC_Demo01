package com.app.entity;
public class Invice {
 public int id;
 public String uid;
 public Products p;
 public Members m;
 public Members m1;
 
 public Members getM1() {
	return m1;
}
public void setM1(Members m1) {
	this.m1 = m1;
}
public Products getP() {
	return p;
}
public void setP(Products p) {
	this.p = p;
}
public Members getM() {
	return m;
}
public void setM(Members m) {
	this.m = m;
}
public void setUid(String uid){ 
 this.uid=uid;
 } 
 public String getUid(){
 return uid;
 } 
 public String mid;
 public void setMid(String mid){ 
 this.mid=mid;
 } 
 public String getMid(){
 return mid;
 } 
 public String content;
 public void setContent(String content){ 
 this.content=content;
 } 
 public String getContent(){
 return content;
 } 
 public String type;
 public void setType(String type){ 
 this.type=type;
 } 
 public String getType(){
 return type;
 } 
 public String created;
 public void setCreated(String created){ 
 this.created=created;
 } 
 public String getCreated(){
 return created;
 } 
 public String updated;
 public void setUpdated(String updated){ 
 this.updated=updated;
 } 
 public String getUpdated(){
 return updated;
 } 
 public String status;
 public void setStatus(String status){ 
 this.status=status;
 } 
 public String getStatus(){
 return status;
 } 
 public String reply;
 public void setReply(String reply){ 
 this.reply=reply;
 } 
 public String getReply(){
 return reply;
 } 
public void setId(int id) {
this.id = id;
}

public int getId() {
return id;
}

}