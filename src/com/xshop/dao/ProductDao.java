package com.xshop.dao;

import java.util.List;

import com.xshop.bean.PageBean;
import com.xshop.bean.Product;

public interface ProductDao {
	
	public int productCount();
	
	public int addProduct(Product product);
	
	public int updateProduct(Product product);
	
	public int delById(int pid);
	
	public int delPiLiang(String pid[]);
	
	public Product findById(int pid);
	
	public List<Product> findByName(String pname);
	///////////////////
	public List<Product> showAll();
	
	public List<Product> showAllpage(PageBean pb);
	
	public List<Product> showAll(PageBean pb,int cid);
////////////////////////
	public List<Product> orderBySell(PageBean pb);
	
	public List<Product> orderBySell(PageBean pb,int cid);
	
	public List<Product> orderByClick(PageBean pb,int cid);
	
	public List<Product> orderByPrice(PageBean pb,int cid);
//////////////////////////////	
	public int updatesellcount(Product product,int buycount);
	
	public int updateclickcount(Product product);

}
