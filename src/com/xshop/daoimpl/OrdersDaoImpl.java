package com.xshop.daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.xshop.bean.Orderitems;
import com.xshop.bean.Orders;
import com.xshop.bean.PageBean;
import com.xshop.dao.OrdersDao;
import com.xshop.db.DBConnection;

public class OrdersDaoImpl implements OrdersDao {
	/*
	 * 订单功能实现类
	 * (non-Javadoc)
	 * @see com.xshop.dao.OrdersDao#addOrder(com.xshop.bean.Orders)
	 */

	public int addOrder(Orders orders) {
		DBConnection db=new DBConnection();
		String sql="insert into orders values(?,?,now(),?,?,?,?)";
		Object obj[]={orders.getOid(),orders.getTotalprice(),orders.getPname(),orders.getState(),orders.getUsername(),orders.getAddressid()};
		db.dopstmt(sql, obj);
		int flag=0;
		try {
			flag=db.getUpdateCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return flag;
	}

	public int delOrder(int oid) {
		DBConnection db=new DBConnection();
		String sql="delete from orders where oid=?";
		Object obj[]={oid};
		db.dopstmt(sql, obj);
		int flag=0;
		try {
			flag=db.getUpdateCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return flag;
	}

	public Orders findById(String oid) {
		DBConnection db=new DBConnection();
		String sql="select * from orders where oid=?";
		Object obj[]={oid};
		db.dopstmt(sql, obj);
		Orders orders=new Orders();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				orders.setOid(rs.getString("oid"));
				orders.setTotalprice(rs.getDouble("totalprice"));
				orders.setPosttime(rs.getDate("posttime"));
				orders.setPname(rs.getString("pname"));
				orders.setState(rs.getString("state"));
				orders.setUsername(rs.getString("usernmae"));
				orders.setAddressid(rs.getInt("addressid"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return orders;
	}

	public List<Orders> showAll() {
		DBConnection db=new DBConnection();
		String sql="select * from orders ";
		db.dopstmt(sql, null);
		List<Orders> list=new ArrayList<Orders>();
		
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Orders orders=new Orders();
				orders.setOid(rs.getString("oid"));
				orders.setTotalprice(rs.getDouble("totalprice"));
				orders.setPosttime(rs.getDate("posttime"));
				orders.setPname(rs.getString("pname"));
				orders.setState(rs.getString("state"));
				orders.setUsername(rs.getString("username"));
				orders.setAddressid(rs.getInt("addressid"));
				list.add(orders);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return list;
	}

	public int updateOrder(String oid) {
		DBConnection db=new DBConnection();
		String sql="update orders set state=? where oid=?";
		Object obj[]={"已发货",oid};
		System.out.println(sql);
		db.dopstmt(sql, obj);
		int flag=0;
		try {
			flag=db.getUpdateCount();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return flag;
	}

	public List<Orders> findByName(String uname) {
		DBConnection db=new DBConnection();
		String sql="select * from orders where usernmae like ?";
		Object obj[]={"%"+uname+"%"};
		db.dopstmt(sql, obj);
		List<Orders> list=new ArrayList<Orders>();
		
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Orders orders=new Orders();
				orders.setOid(rs.getString("oid"));
				orders.setTotalprice(rs.getDouble("totalprice"));
				orders.setPosttime(rs.getDate("posttime"));
				orders.setPname(rs.getString("pname"));
				orders.setState(rs.getString("state"));
				orders.setUsername(rs.getString("username"));
				orders.setAddressid(rs.getInt("addressid"));
				list.add(orders);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return list;
	}

	public List<Orders> showAll(PageBean pageBean) {
		
		int pagesize=pageBean.getPagesize();
		int startrow=(pageBean.getCurrentpage()-1)*pageBean.getPagesize();
		int rowcount=ordersCount();
		pageBean.setRowcount(rowcount);
		
		DBConnection db=new DBConnection();
		String sql="select * from orders limit ? ,?";
		Object obj[]={startrow,pagesize};
		db.dopstmt(sql, obj);
		List<Orders> list=new ArrayList<Orders>();
		System.out.println("orderlist"+startrow+sql+pagesize);
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Orders orders=new Orders();
				orders.setOid(rs.getString("oid"));
				orders.setTotalprice(rs.getDouble("totalprice"));
				orders.setPosttime(rs.getDate("posttime"));
				orders.setPname(rs.getString("pname"));
				orders.setState(rs.getString("state"));
				orders.setUsername(rs.getString("usernmae"));
				orders.setAddressid(rs.getInt("addressid"));
				list.add(orders);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return list;
	}
	
	public int ordersCount() {
		DBConnection db=new DBConnection();
		String sqlString = "select count(*) as rowcount from orders";
		db.dopstmt(sqlString, null);
		int count = 0;
		ResultSet rs = null;
		try {
			rs = db.getResultSet();
			while (rs.next()) {
				count = rs.getInt("rowcount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeAll(rs);
		}
		return count;
	}

	public List<Orders> findProductById(String oid) {
		DBConnection db=new DBConnection();
		String sql="select * from orderitems,orders where orderid=? and orderid=oid";
		Object obj[]={oid};
		db.dopstmt(sql, obj);
		ResultSet rs=null;
		List<Orders> list=new ArrayList<Orders>();
		
		try {
			rs=db.getResultSet();
			while(rs.next()){	
	
				Orders orders=new Orders();
				orders.setOid(rs.getString("oid"));
				orders.setTotalprice(rs.getDouble("totalprice"));
				orders.setPosttime(rs.getDate("posttime"));
				orders.setPname(rs.getString("pname"));
				orders.setState(rs.getString("state"));
				orders.setUsername(rs.getString("usernmae"));
				orders.setAddressid(rs.getInt("addressid"));
				
				Orderitems orderitems =new Orderitems();
				orderitems.setCount(rs.getInt("count"));
				orderitems.setId(rs.getInt("id"));
				orderitems.setImagepath(rs.getString("imagepath"));
				orderitems.setPid(rs.getInt("pid"));
				orderitems.setPname(rs.getString("pname"));
				orderitems.setOrderid(rs.getString("orderid"));
				orderitems.setPrice(rs.getDouble("price"));
				orders.setOrderitems(orderitems);
				
				list.add(orders);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	

}
