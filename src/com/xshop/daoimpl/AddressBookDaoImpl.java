package com.xshop.daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xshop.bean.AddressBook;
import com.xshop.dao.AddressBookDao;
import com.xshop.db.DBConnection;

public class AddressBookDaoImpl implements AddressBookDao {
	/*
	 * 地址薄管理功能实现类
	 * (non-Javadoc)
	 * @see com.xshop.dao.AddressBookDao#addAddress(com.xshop.bean.AddressBook)
	 */

	public int addAddress(AddressBook addressBook) {
		DBConnection db=new DBConnection();
		String sql="insert into addressbook (receiver,phone,address,username) values(?,?,?,?)";
		Object obj[]={addressBook.getReceiver(),addressBook.getPhone(),addressBook.getAddress(),addressBook.getUsername()};
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

	public int delAddress(int addressid) {
		DBConnection db=new DBConnection();
		String sql="delete from addressbook where addressid=?";
		Object obj[]={addressid};
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

	public List<AddressBook> showAll() {
		DBConnection db=new DBConnection();
		String sql="select * from addressbook";
		db.dopstmt(sql, null);
		AddressBook ab=null;
		ResultSet rs=null;
		List<AddressBook> list=new ArrayList<AddressBook>();
		try {
			rs=db.getResultSet();
			while(rs.next()){
				ab=new AddressBook();
				ab.setAddressid(rs.getInt("addressid"));
				ab.setReceiver(rs.getString("receiver"));
				ab.setPhone(rs.getString("phone"));
				ab.setAddress(rs.getString("address"));
				ab.setUsername(rs.getString("username"));
				list.add(ab);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return list;
	}

	public int updateAddress(AddressBook addressBook) {
		DBConnection db=new DBConnection();
		String sql="update addressbook set receiver=?,phone=?,address=? where addressid=?";
		Object obj[]={addressBook.getReceiver(),addressBook.getPhone(),addressBook.getAddress(),addressBook.getAddressid()};
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

	public AddressBook findById(int addressid) {
		DBConnection db=new DBConnection();
		String sql="select * from addressbook where addressid=?";
		Object obj[]={addressid};
		db.dopstmt(sql, obj);
		AddressBook ab=null;
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				ab=new AddressBook();
				ab.setAddressid(rs.getInt("addressid"));
				ab.setReceiver(rs.getString("receiver"));
				ab.setPhone(rs.getString("phone"));
				ab.setAddress(rs.getString("address"));
				ab.setUsername(rs.getString("username"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(rs);
		}
		return ab;
	}

}
