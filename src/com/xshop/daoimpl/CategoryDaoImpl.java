package com.xshop.daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xshop.bean.Category;
import com.xshop.bean.PageBean;
import com.xshop.dao.CategoryDao;
import com.xshop.db.DBConnection;

public class CategoryDaoImpl implements CategoryDao {
	/*
	 * 商品分类功能实现类
	 * (non-Javadoc)
	 * @see com.xshop.dao.CategoryDao#addCategory(java.lang.String)
	 */

	public int addCategory(String cname) {
		DBConnection db=new DBConnection();
		String sql="insert into category(cname) values(?) ";
		Object obj[]={cname};
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

	public int delById(int id) {
		DBConnection db=new DBConnection();
		String sql="delete from category where cid = ?";
		Object obj[]={id};
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
	
	public int updateCategory(Category category) {
		DBConnection db=new DBConnection();
		String sql="update category set cname = ? where cid = ?";
		Object obj[]={category.getCname(),category.getCid()};
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

	public List<Category> findAll(PageBean pb) {
		DBConnection db=new DBConnection();
		int startrow=(pb.getCurrentpage()-1)*pb.getPagesize();
		int rowcount=categoryCount();
		pb.setRowcount(rowcount);
		String sql="select * from category limit ?,?";
		Object obj[]={startrow,pb.getPagesize()};
		db.dopstmt(sql, obj);
		ResultSet rs=null;
		List<Category> list=new ArrayList<Category>();
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Category category=new Category();
				category.setCid(rs.getInt("cid"));
				category.setCname(rs.getString("cname"));
				list.add(category);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return list;
	}

	public Category findById(int id) {
		DBConnection db=new DBConnection();
		
		String sql="select * from category where cid=?";
		Object obj[]={id};
		db.dopstmt(sql, obj);
		ResultSet rs=null;
		Category category=new Category();
		try {
			rs=db.getResultSet();
			while(rs.next()){
				
				category.setCid(rs.getInt("cid"));
				category.setCname(rs.getString("cname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return category;
	}

	public int delPL(String[] id) {
		DBConnection db=new DBConnection();
		String sql="delete from category where cid in (0";
		for(String cid:id){
			sql+=","+cid;
		}
		sql+=")";
		System.out.println(sql);
		db.dopstmt(sql, null);
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

	public List<Category> findAll() {
		DBConnection db=new DBConnection();
		String sql="select * from category ";
		db.dopstmt(sql, null);
		ResultSet rs=null;
		List<Category> list=new ArrayList<Category>();
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Category category=new Category();
				category.setCid(rs.getInt("cid"));
				category.setCname(rs.getString("cname"));
				list.add(category);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return list;
	}
	
	public int categoryCount() {
		DBConnection db=new DBConnection();
		String sqlString = "select count(*) as rowcount from category";
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
}
