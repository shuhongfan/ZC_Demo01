package com.app.entity;

import java.util.List;

public class Comment {
 public int id;
 public String uid;
 public List<Comment> subs;
 
 public List<Comment> getSubs() {
	return subs;
}
public void setSubs(List<Comment> subs) {
	this.subs = subs;
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