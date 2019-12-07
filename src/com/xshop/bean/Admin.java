package com.xshop.bean;

import java.io.Serializable;

public class Admin implements Serializable{
	private String adminname;
	private String adminpwd;
	private String  state;
	
	
	public Admin() {
		super();
	}
	
	public Admin(String adminname, String adminpwd) {
		super();
		this.adminname = adminname;
		this.adminpwd = adminpwd;
	}

	public Admin(String adminname, String adminpwd, String state) {
		super();
		this.adminname = adminname;
		this.adminpwd = adminpwd;
		this.state = state;
	}
	public String getAdminname() {
		return adminname;
	}
	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}
	public String getAdminpwd() {
		return adminpwd;
	}
	public void setAdminpwd(String adminpwd) {
		this.adminpwd = adminpwd;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
