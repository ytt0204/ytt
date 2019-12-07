package com.xshop.bean;

import java.io.Serializable;
import java.sql.Date;

public class Orders implements Serializable{
	private String  oid;
	private double totalprice;
	private Date posttime;
	private String pname;
	private String state;
	private String username;
	private int addressid;
	
	private Product product;
	
	private Orderitems orderitems;
	
	public Orderitems getOrderitems() {
		return orderitems;
	}
	public void setOrderitems(Orderitems orderitems) {
		this.orderitems = orderitems;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	public Date getPosttime() {
		return posttime;
	}
	public void setPosttime(Date posttime) {
		this.posttime = posttime;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getAddressid() {
		return addressid;
	}
	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}
	

}
