package com.xshop.control;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xshop.bean.AddressBook;
import com.xshop.dao.AddressBookDao;
import com.xshop.daoimpl.AddressBookDaoImpl;

public class AddressBookServlet extends HttpServlet {
	/*
	 * 地址薄功能Servlet 
	 */
	AddressBookDao abd=new AddressBookDaoImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oper=req.getParameter("oper");
		if(oper!=null&&oper.equals("add")){
			addaddress(req,resp);
		}else if(oper!=null&&oper.equals("showall")){
			showall(req,resp);
		}else if(oper!=null&&oper.equals("delbyid")){
			delById(req,resp);
		}else if(oper!=null&&oper.equals("showjiesuan")){
			showjiesuan(req,resp);
		}
	}
	//查询地址薄，显示在结算页面
	private void showjiesuan(HttpServletRequest req, HttpServletResponse resp) {
		List<AddressBook> list=abd.showAll();
		req.getSession().setAttribute("addresslist", list);
		try {
			resp.sendRedirect("people/jiesuan.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//删除地址信息
	private void delById(HttpServletRequest req, HttpServletResponse resp) {
		int addressid=Integer.parseInt(req.getParameter("id"));
		int flag=abd.delAddress(addressid);
		if(flag>0){
			req.getSession().setAttribute("mess", "删除成功！");
			showall(req,resp);
		}else{
			req.getSession().setAttribute("mess", "删除失败！");
			showall(req,resp);
		}
		
	}
	//显示所有地址薄信息
	private void showall(HttpServletRequest req, HttpServletResponse resp) {
		List<AddressBook> list=abd.showAll();
		req.getSession().setAttribute("addresslist", list);
		try {
			resp.sendRedirect("people/manageAddress.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//添加地址薄
	private void addaddress(HttpServletRequest req, HttpServletResponse resp) {
		String receiver=req.getParameter("receiver");
		String phone=req.getParameter("phone");
		String address=req.getParameter("address");
		String username=(String) req.getSession().getAttribute("uname");
		AddressBook addressBook =new AddressBook();
		addressBook.setReceiver(receiver);
		addressBook.setPhone(phone);
		addressBook.setAddress(address);
		addressBook.setUsername(username);
		
		int flag=abd.addAddress(addressBook);
		try {
			if(flag>0){
				req.getSession().setAttribute("mess", "添加成功！");
				resp.sendRedirect("people/addAddressbook.jsp");
			}else{
				req.getSession().setAttribute("mess", "添加失败！");
				resp.sendRedirect("people/addAddressbook.jsp");
			}
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}
}
