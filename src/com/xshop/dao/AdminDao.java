package com.xshop.dao;

import java.util.List;

import com.xshop.bean.Admin;
import com.xshop.bean.PageBean;

public interface AdminDao {
	
	public int addAdmin(Admin admin);
	
	public int updateAdmin(Admin admin);
	
	public List<Admin> findAllPage();
	
	public List<Admin> findAllPage(PageBean pb);
	
	public Admin findByName(String name);
	
}
