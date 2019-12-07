package com.xshop.dao;

import java.util.List;

import com.xshop.bean.Orders;
import com.xshop.bean.PageBean;


public interface OrdersDao {
	public int addOrder(Orders orders);
	
	public int delOrder(int oid);
	
	public int updateOrder(String oid);
	
	public List<Orders> showAll();
	
	public List<Orders> showAll(PageBean pageBean);
	
	public Orders findById(String oid);
	
	public List<Orders> findByName(String uname);
	
	public List<Orders> findProductById(String oid);
}
