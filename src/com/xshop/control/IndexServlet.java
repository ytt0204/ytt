package com.xshop.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xshop.bean.Category;
import com.xshop.bean.PageBean;
import com.xshop.bean.Product;
import com.xshop.dao.CategoryDao;
import com.xshop.dao.ProductDao;
import com.xshop.daoimpl.CategoryDaoImpl;
import com.xshop.daoimpl.ProductDaoImpl;

public class IndexServlet extends HttpServlet{
	/*
	 * 首页显示及商品信息控制Servlet
	 * 
	 */
	ProductDao pd=new ProductDaoImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String oper=req.getParameter("oper");
		System.out.println(oper);
		if(oper!=null&&oper.equals("index")){
			index(req,resp);
		}else if(oper!=null&&oper.equals("detail")){
			productDetail(req,resp);
		}else if(oper!=null&&oper.equals("categoryproduct")){
			categoryProduct(req,resp);
		}else if(oper!=null&&oper.equals("products")){
			products(req,resp);
		}else if(oper!=null&&oper.equals("orderby")){
			orderby(req,resp);
		}	
	}
	//商品按照销量，价格，热度 排序
	private void orderby(HttpServletRequest req, HttpServletResponse resp) {
		String orderby=req.getParameter("orderby");
		int cid=Integer.parseInt(req.getParameter("cid")); 
		System.out.println(orderby+"orderby"+cid);
		if(orderby.equals("sellcount")){
			PageBean pb=new PageBean();
			pb.setPagesize(9);
			pb.setCurrentpage(req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page")));
			List<Product> cpList=pd.orderBySell(pb, cid);
			req.getSession().setAttribute("pagebean", pb);
			req.getSession().setAttribute("cproducts", cpList);
			try {
				resp.sendRedirect("products.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(orderby.equals("clickcount")){
			PageBean pb=new PageBean();
			pb.setPagesize(9);
			pb.setCurrentpage(req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page")));
			List<Product> cpList=pd.orderByClick(pb, cid);
			req.getSession().setAttribute("pagebean", pb);
			req.getSession().setAttribute("cproducts", cpList);
			try {
				resp.sendRedirect("products.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(orderby.equals("price")){
			PageBean pb=new PageBean();
			pb.setPagesize(9);
			pb.setCurrentpage(req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page")));
			List<Product> cpList=pd.orderByPrice(pb, cid);
			req.getSession().setAttribute("pagebean", pb);
			req.getSession().setAttribute("cproducts", cpList);
			try {
				resp.sendRedirect("products.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	//显示所有商品
	private void products(HttpServletRequest req, HttpServletResponse resp) {
		PageBean pb=new PageBean();
		pb.setPagesize(9);
		pb.setCurrentpage(req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page")));
		List<Product> cpList=pd.showAllpage(pb);
		req.getSession().setAttribute("pagebean", pb);
		req.getSession().setAttribute("cproducts", cpList);
		try {
			resp.sendRedirect("products.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	//同类商品
	private void sameProduct(HttpServletRequest req, HttpServletResponse resp) {
		int cid=Integer.parseInt(req.getParameter("cid"));
		PageBean pb=new PageBean();
		pb.setPagesize(3);
		pb.setCurrentpage(req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page")));
		List<Product> cpList=pd.showAll(pb, cid);
		req.getSession().setAttribute("sameproducts", cpList);
		try {
			resp.sendRedirect("productDetail.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//根据类别查找商品
	private void categoryProduct(HttpServletRequest req,
			HttpServletResponse resp) {
		int cid=Integer.parseInt(req.getParameter("cid"));
		PageBean pb=new PageBean();
		pb.setPagesize(9);
		pb.setCurrentpage(req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page")));
		List<Product> cpList=pd.showAll(pb, cid);
		req.getSession().setAttribute("pagebean", pb);
		req.getSession().setAttribute("cid", cid);
		req.getSession().setAttribute("cproducts", cpList);
		try {
			resp.sendRedirect("products.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	//查看商品详情
	private void productDetail(HttpServletRequest req, HttpServletResponse resp) {
		int pid = Integer.parseInt(req.getParameter("id"));
		
		Product product=pd.findById(pid);
		pd.updateclickcount(product);
		req.getSession().setAttribute("product", product);
		
		sameProduct(req,resp);
	}
	//进入首页显示商品列表和分类以及热销榜
	private void index(HttpServletRequest req, HttpServletResponse resp) {
	
	
		PageBean pb=new PageBean();
		pb.setPagesize(6);
		pb.setCurrentpage(req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page")));
		List<Product> plist=pd.showAllpage(pb);
		System.out.println(pb.getCurrentpage()+"currentpage");
		
		req.getSession().setAttribute("products", plist);	
				
		PageBean pb1=new PageBean();
		pb1.setPagesize(6);
		pb1.setCurrentpage(req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page")));
		List<Product> slist=pd.orderBySell(pb1);
		req.getSession().setAttribute("splist", slist);
		
		CategoryDao cd=new CategoryDaoImpl();
		List<Category> clist=cd.findAll();
		req.getSession().setAttribute("categorylist", clist);
				
		try {
			resp.sendRedirect("index.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
