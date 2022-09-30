package com.app.entity;



public class Cart {
	public Products p;
	public int num;
	public int total;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Products getP() {
		return p;
	}
	public void setP(Products p) {
		this.p = p;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
