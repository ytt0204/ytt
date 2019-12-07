package com.xshop.dao;

import java.util.List;

import com.xshop.bean.Category;
import com.xshop.bean.PageBean;

public interface CategoryDao {
	
	public int addCategory(String cname);
	
	public int updateCategory(Category category);
	
	public int delById(int id);
	
	public int delPL(String id[]);
	
	public List<Category> findAll(PageBean pb);
	
	public List<Category> findAll();
	
	public Category findById(int id);
	
}
