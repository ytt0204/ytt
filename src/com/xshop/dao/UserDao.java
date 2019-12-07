package com.xshop.dao;

import java.util.List;

import com.xshop.bean.User;

public interface UserDao {
		
	
	public int addUser(User user);
	
	public int update(User user);
	
	public int updatestate(String name,String state);
	
	public User findByUname(String uname);
	
	public List<User> showall();
}
