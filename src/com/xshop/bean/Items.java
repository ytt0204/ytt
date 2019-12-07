package com.xshop.bean;

import java.io.Serializable;


public class Items implements Serializable{
	
	private int buycount;
	
	private double totalprice;
	
	private Product product;
	

	public int getBuycount() {
		return buycount;
	}

	public void setBuycount(int buycount) {
		this.buycount = buycount;
	}

	public double getTotalprice() {
		totalprice=product.getPrice()*buycount;
		return totalprice;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}
