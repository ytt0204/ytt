package com.xshop.control;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.xshop.bean.AddressBook;
import com.xshop.bean.Items;
import com.xshop.bean.Orders;
import com.xshop.bean.PageBean;
import com.xshop.bean.Product;
import com.xshop.dao.AddressBookDao;
import com.xshop.dao.OrderitemsDao;
import com.xshop.dao.OrdersDao;
import com.xshop.daoimpl.AddressBookDaoImpl;
import com.xshop.daoimpl.OrderitemsDaoImpl;
import com.xshop.daoimpl.OrdersDaoImpl;

public class OrderServlet extends HttpServlet {
	/*
	 * 订单管理功能控制Servlet
	 * 
	 */
	OrdersDao od=new OrdersDaoImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oper=req.getParameter("oper");
		System.out.println(oper);
		if(oper!=null&&oper.equals("jiesuan")){
			jiesuan(req,resp);
		}else if(oper!=null&&oper.equals("showmanage")){
			showManage(req,resp);
		}else if(oper!=null&&oper.equals("findOrderItems")){
			findById(req,resp);
		}else if(oper!=null&&oper.equals("update")){
			update(req,resp);
		}else if(oper!=null&&oper.equals("showmyorder")){
			showMyOrder(req,resp);
		}else if(oper!=null&&oper.equals("showOrderItems")){
			findByid(req,resp);
		}
	}
	//根据ID查找订单
	private void findByid(HttpServletRequest req, HttpServletResponse resp) {
		String oid=req.getParameter("id");
		int addressid=Integer.parseInt(req.getParameter("adid"));
		AddressBookDao abd=new AddressBookDaoImpl();
		AddressBook addressBook=abd.findById(addressid);
		
		List<Orders> oproduct=od.findProductById(oid);
		req.getSession().setAttribute("address", addressBook);
		req.getSession().setAttribute("orders", oproduct);
		try {
			resp.sendRedirect("people/orderitems.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	//显示用户的所有订单
	private void showMyOrder(HttpServletRequest req, HttpServletResponse resp) {
		int currentpage=req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page"));
		
		PageBean pb=new PageBean();
		pb.setPagesize(5);
		pb.setCurrentpage(currentpage);
		List<Orders> list=od.showAll(pb);
		System.out.println(list);
		req.getSession().setAttribute("orderlist", list);
		try {
			resp.sendRedirect("people/myOrders.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//修改订单状态
	private void update(HttpServletRequest req, HttpServletResponse resp) {
		String oid=req.getParameter("oid");
		int flag=od.updateOrder(oid);
		if(flag>0){
			req.getSession().setAttribute("mess", "修改成功！");
			showManage(req,resp);
		}else{
			req.getSession().setAttribute("mess", "修改失败！");
			showManage(req,resp);
		}	
	}
	//查找订单并显示
	private void findById(HttpServletRequest req, HttpServletResponse resp) {
		String oid=req.getParameter("id");
		int addressid=Integer.parseInt(req.getParameter("adid"));
		AddressBookDao abd=new AddressBookDaoImpl();
		AddressBook addressBook=abd.findById(addressid);
		
		List<Orders> oproduct=od.findProductById(oid);
		req.getSession().setAttribute("address", addressBook);
		req.getSession().setAttribute("orders", oproduct);
		try {
			resp.sendRedirect("admin/editOrder.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	//显示订单列表在管理员界面
	private void showManage(HttpServletRequest req, HttpServletResponse resp) {
		int currentpage=req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page"));
		
		PageBean pb=new PageBean();
		pb.setPagesize(5);
		pb.setCurrentpage(currentpage);
		List<Orders> list=od.showAll(pb);
		System.out.println(list);
		req.getSession().setAttribute("orderlist", list);
		try {
			resp.sendRedirect("admin/manageOrders.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private void jiesuan(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session=req.getSession();
		int addressid=Integer.parseInt(req.getParameter("addressid"));
		String username=(String) session.getAttribute("uname");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-ms");
		String nowstring=sdf.format(new Date());
		String oid=nowstring+username;
		String pname="";
		double totalprice=0;
		
		Map<Integer, Items> cartmap=(Map<Integer, Items>) session.getAttribute("cartmap");
			
		Set<Integer> keyset=cartmap.keySet();
		Iterator<Integer> itkey=keyset.iterator();
		while(itkey.hasNext()){
			Integer key=itkey.next();
			Items items=cartmap.get(key);
			
			pname+=(items.getProduct().getPname()+",");
			totalprice+=items.getTotalprice();
	
		}
		
		Orders orders=new Orders();
		orders.setOid(oid);
		orders.setAddressid(addressid);
		orders.setState("已下单");
		orders.setUsername(username);
		orders.setPname(pname);
		orders.setTotalprice(totalprice);
		int flag=od.addOrder(orders);
		if(flag>0){
			
			OrderitemsDao oit=new OrderitemsDaoImpl();
			flag=oit.addOrderitems(oid, cartmap);
			if(flag>0){
				System.out.println("订单提交成功!");
				session.removeAttribute("cartmap");
				try {
					resp.sendRedirect("people/myOrders.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				System.out.println("订单条目提交失败!");
			}
	
		}else {
			System.out.println("订单提交失败!");
		}
		
		
		
	}
	
	
	
}
