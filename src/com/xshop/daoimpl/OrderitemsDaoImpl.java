package com.xshop.daoimpl;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.xshop.bean.Items;
import com.xshop.dao.OrderitemsDao;
import com.xshop.dao.ProductDao;
import com.xshop.db.DBConnection;

public class OrderitemsDaoImpl implements OrderitemsDao {
	/*
	 * 订单详情功能实现类
	 * (non-Javadoc)
	 * @see com.xshop.dao.OrderitemsDao#addOrderitems(java.lang.String, java.util.Map)
	 */

	public int addOrderitems(String orderid, Map<Integer, Items> cart) {
		DBConnection db=new DBConnection();
		ProductDao pd=new ProductDaoImpl();
		String sql="insert into orderitems(orderid,pid,count,price,pname,imagepath) values(?,?,?,?,?,?)";
		
	
		Set<Integer> keyset=cart.keySet();
		Iterator<Integer> itkey=keyset.iterator();
		int flag=0;
		try {
			while(itkey.hasNext()){
				Integer key=itkey.next();
				Items items=cart.get(key);
				
				pd.updatesellcount(items.getProduct(),items.getBuycount());
				
				Object obj[]={orderid,items.getProduct().getPid(),items.getBuycount(),items.getProduct().getPrice(),items.getProduct().getPname(),items.getProduct().getImagepath()};
				db.dopstmt(sql, obj);
				flag=db.getUpdateCount();
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return flag;
	}

}
