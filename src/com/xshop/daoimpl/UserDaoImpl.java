package com.xshop.daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xshop.bean.User;
import com.xshop.dao.UserDao;
import com.xshop.db.DBConnection;

public class UserDaoImpl implements UserDao {
	/*
	 * 会员功能实现类
	 * (non-Javadoc)
	 * @see com.xshop.dao.UserDao#addUser(com.xshop.bean.User)
	 */

	public int addUser(User user) {
		DBConnection db=new DBConnection();
		String sql="insert into customer values (?,?,now(),?,?,?,?)";
		Object obj[]={user.getUname(),user.getUpwd(),user.getEmail(),user.getTel(),user.getAddress(),"正常"};
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

	public User findByUname(String uname) {
		DBConnection db=new DBConnection();
		String sql="select * from customer where uname=?";
		Object obj[]={uname};
		db.dopstmt(sql, obj);
		User user=null;
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				user=new User();
				user.setUname(rs.getString("uname"));
				user.setUpwd(rs.getString("upwd"));
				user.setRegdate(rs.getDate("regdate"));
				user.setEmail(rs.getString("email"));
				user.setTel(rs.getString("tel"));
				user.setAddress(rs.getString("address"));
				user.setState(rs.getString("state"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return user;
	}

	public int update(User user) {
		DBConnection db=new DBConnection();
		String sql="update customer set upwd=?,email=?,tel=?,address=?";
		Object obj[]={user.getUpwd(),user.getEmail(),user.getTel(),user.getAddress()};
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

	public List<User> showall() {
		DBConnection db=new DBConnection();
		String sql="select * from customer ";
		db.dopstmt(sql, null);
		List<User> list=new ArrayList<User>();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				User user=new User();
				user.setUname(rs.getString("uname"));
				user.setUpwd(rs.getString("upwd"));
				user.setRegdate(rs.getDate("regdate"));
				user.setEmail(rs.getString("email"));
				user.setTel(rs.getString("tel"));
				user.setAddress(rs.getString("address"));
				user.setState(rs.getString("state"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return list;
	}

	public int updatestate(String name,String state) {
		DBConnection db=new DBConnection();
		String sql="update customer set state =? where uname=?";
		System.out.println(sql);
		Object obj[]={state,name};
		db.dopstmt(sql, obj);
		int flag=0;
		try {
			flag=db.getUpdateCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

}
