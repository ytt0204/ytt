package com.xshop.daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xshop.bean.Admin;
import com.xshop.bean.PageBean;
import com.xshop.dao.AdminDao;
import com.xshop.db.DBConnection;

public class AdminDaoImpl implements AdminDao {
	/*
	 * 管理员功能实现类
	 * (non-Javadoc)
	 * @see com.xshop.dao.AdminDao#addAdmin(com.xshop.bean.Admin)
	 */
	
	
	public int addAdmin(Admin admin) {
		DBConnection db=new DBConnection();
		String sql="insert into admin values (?,?,?)";
		Object obj[]={admin.getAdminname(),admin.getAdminpwd(),admin.getState()};
		System.out.println(sql);
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

	public int updateAdmin(Admin admin) {
		DBConnection db=new DBConnection();
		String sql="update admin set adminname=?,adminpwd=?,state=?";
		Object obj[]={admin.getAdminname(),admin.getAdminpwd(),admin.getState()};
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

	public List<Admin> findAllPage() {
		DBConnection db=new DBConnection();
		String sql="select * from admin ";
		db.dopstmt(sql, null);
		ResultSet rs=null;
		List<Admin> list=new ArrayList<Admin>();
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Admin admin=new Admin();
				admin.setAdminname(rs.getString("adminname"));
				admin.setAdminpwd(rs.getString("adminpwd"));
				admin.setState(rs.getString("state"));
				list.add(admin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return list;
	}

	public List<Admin> findAllPage(PageBean pb) {
		DBConnection db=new DBConnection();
		int startrow=(pb.getCurrentpage()-1)*pb.getPagesize();
		int rowcount=adminCount();
		pb.setRowcount(rowcount);
		
		String sql="select * from admin limit ?,?";
		Object obj[]={startrow,pb.getPagesize()};
		db.dopstmt(sql, obj);
		ResultSet rs=null;
		List<Admin> list=new ArrayList<Admin>();
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Admin admin=new Admin();
				admin.setAdminname(rs.getString("adminname"));
				admin.setAdminpwd(rs.getString("adminpwd"));
				admin.setState(rs.getString("state"));
				list.add(admin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return list;
	}

	private int adminCount() {
		// TODO Auto-generated method stub
		DBConnection db=new DBConnection();
		String sqlString = "select count(*) as rowcount from admin";
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

	public Admin findByName(String name) {
		DBConnection db=new DBConnection();
		String sql="select * from admin where adminname=?";
		Object obj[]={name};
		db.dopstmt(sql, obj);
		ResultSet rs=null;
		Admin admin=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				admin=new Admin();
				admin.setAdminname(rs.getString("adminname"));
				admin.setAdminpwd(rs.getString("adminpwd"));
				admin.setState(rs.getString("state"));		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return admin;
	}

}
