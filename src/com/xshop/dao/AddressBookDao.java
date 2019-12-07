package com.xshop.dao;

import java.util.List;

import com.xshop.bean.AddressBook;

public interface AddressBookDao {
	public int addAddress(AddressBook addressBook);
	
	public int delAddress(int addressid);
	
	public int updateAddress(AddressBook addressBook);
	
	public List<AddressBook> showAll();
	
	public AddressBook findById(int addressid);
	
}
