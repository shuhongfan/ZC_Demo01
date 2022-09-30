package com.app.entity;

import java.util.List;

public class Category {
 public int id;
 public String pid;
 public List<Products> ls;
 
 
 public List<Products> getLs() {
	return ls;
}
public void setLs(List<Products> ls) {
	this.ls = ls;
}
public void setPid(String pid){ 
 this.pid=pid;
 } 
 public String getPid(){
 return pid;
 } 
 public String title;
 public void setTitle(String title){ 
 this.title=title;
 } 
 public String getTitle(){
 return title;
 } 
 public String thumb;
 public void setThumb(String thumb){ 
 this.thumb=thumb;
 } 
 public String getThumb(){
 return thumb;
 } 
 public String description;
 public void setDescription(String description){ 
 this.description=description;
 } 
 public String getDescription(){
 return description;
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
public void setId(int id) {
this.id = id;
}

public int getId() {
return id;
}

}