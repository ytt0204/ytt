package com.xshop.control;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.xshop.bean.Items;
import com.xshop.bean.Product;

import com.xshop.dao.ProductDao;

import com.xshop.daoimpl.ProductDaoImpl;


public class ShopCartServlet extends HttpServlet {
	/*
	 * 购物车信息控制Servlet
	 * 
	 */
	
	ProductDao pd=new ProductDaoImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oper=req.getParameter("oper");
		System.out.println(oper);
		
		if(oper!=null&&oper.equals("add")){
			addCart(req,resp);
		}else if(oper!=null&&oper.equals("delbypid")){
			delbypid(req,resp);
		}else if(oper!=null&&oper.equals("updatebuycount")){
			updatebuycount(req,resp);
		}
		
	}
	//添加商品到购物车
	private void addCart(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session=req.getSession();
		Map<Integer, Items> cartmap=null;
		if(session.getAttribute("cartmap")==null){
			cartmap=new HashMap<Integer, Items>();
		}else{
			cartmap=(Map<Integer, Items>)session.getAttribute("cartmap");
			
		}
		
		
		int pid=Integer.parseInt(req.getParameter("pid"));
		int buycount=req.getParameter("buycount")==null?1:Integer.parseInt(req.getParameter("buycount"));
		System.out.println(buycount);
		if(cartmap.containsKey(pid)){
			Items items=cartmap.get(pid);
			int currentcount=items.getBuycount()+buycount;
			items.setBuycount(currentcount);
			
			cartmap.put(pid, items);
			
			session.setAttribute("cartmap", cartmap);
			try {
				resp.sendRedirect("shopcart.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
	
		Product product=pd.findById(pid);
		Items items=new Items();
		items.setBuycount(buycount);
		items.setProduct(product);
		
		cartmap.put(pid, items);
		
		session.setAttribute("cartmap", cartmap);
		try {
			resp.sendRedirect("shopcart.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//更新购物车信息
	private void updatebuycount(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session=req.getSession();
		
		Map<Integer, Items> cartmap=null;
		if(session.getAttribute("cartmap")==null){
			cartmap=new HashMap<Integer, Items>();
		}else{
			cartmap=(Map<Integer, Items>)session.getAttribute("cartmap");
			
		}
		
		int pid=Integer.parseInt(req.getParameter("pid"));
		int buycount=Integer.parseInt(req.getParameter("buycount"));
		Items items=cartmap.get(pid);
		
		items.setBuycount(buycount);
		
		cartmap.put(pid, items);
		
		session.setAttribute("cartmap", cartmap);
		try {
			resp.sendRedirect("shopcart.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	//根据ID删除商品
	private void delbypid(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session=req.getSession();

		Map<Integer, Items> cartmap=null;
		if(session.getAttribute("cartmap")==null){
			cartmap=new HashMap<Integer, Items>();
		}else{
			cartmap=(Map<Integer, Items>)session.getAttribute("cartmap");
			
		}
		int pid=Integer.parseInt(req.getParameter("pid"));
		if(cartmap.containsKey(pid)){
			cartmap.remove(pid);
		}
		session.setAttribute("cartmap", cartmap);
		try {
			resp.sendRedirect("shopcart.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
