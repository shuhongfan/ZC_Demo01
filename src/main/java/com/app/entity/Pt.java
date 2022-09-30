package com.app.entity;

import java.util.List;

public class Pt {
 public int id;
 public String ids;
 public String product_name;
 public Members us;
 
 public Members getUs() {
	return us;
}
public void setUs(Members us) {
	this.us = us;
}
public List<Products> ls;
 
 public List<Products> getLs() {
	return ls;
}
public void setLs(List<Products> ls) {
	this.ls = ls;
}
public String getProduct_name() {
	return product_name;
}
public void setProduct_name(String product_name) {
	this.product_name = product_name;
}
public void setIds(String ids){ 
 this.ids=ids;
 } 
 public String getIds(){
 return ids;
 } 
 public String price;
 public void setPrice(String price){ 
 this.price=price;
 } 
 public String getPrice(){
 return price;
 } 
 public String description;
 public void setDescription(String description){ 
 this.description=description;
 } 
 public String getDescription(){
 return description;
 } 
 public String thumb;
 public void setThumb(String thumb){ 
 this.thumb=thumb;
 } 
 public String getThumb(){
 return thumb;
 } 
 public String userid;
 public void setUserid(String userid){ 
 this.userid=userid;
 } 
 public String getUserid(){
 return userid;
 } 
public void setId(int id) {
this.id = id;
}

public int getId() {
return id;
}

}