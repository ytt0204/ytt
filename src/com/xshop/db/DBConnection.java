package com.xshop.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	/*
	 * 数据库操作基础类
	 * 
	 */
	private static final String DRIVER_CLASS="com.mysql.jdbc.Driver";
	private final String URL="jdbc:mysql://localhost:3306/xshop";
	private final String USER="root";
	private final String PASSWORD="root";
	private Connection conn =null;
	private PreparedStatement pstmt=null;
	
	static{
		try {
			Class.forName(DRIVER_CLASS);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConn(){
		try {
			conn=DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public void dopstmt(String sql,Object obj[]){
		if(sql!=null&&!sql.equals("")){
			getConn();
			try {
				pstmt=conn.prepareStatement(sql);
				if(obj!=null){
					for(int i=0;i<obj.length;i++){
						pstmt.setObject(i+1, obj[i]);
					}
				}
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public int getUpdateCount() throws SQLException{
		return this.pstmt.getUpdateCount();
	}
	
	public ResultSet getResultSet() throws SQLException{
		return this.pstmt.getResultSet();
	}
	
	public void closeAll(ResultSet rs){
		try {
			if(rs!=null){
				rs.close();
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null){
					pstmt.close();
				}
			} catch (SQLException e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}finally{
				try {
					if(conn!=null){
						conn.close();
					}
				} catch (SQLException e3) {
					// TODO: handle exception
					conn=null;
					e3.printStackTrace();
				}
			}
		}
	}
	
}

