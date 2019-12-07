package com.xshop.dao;

import java.util.Map;

import com.xshop.bean.Items;

public interface OrderitemsDao {
	
	public int addOrderitems(String orderid,Map<Integer, Items> cart);
	
	
	
}
