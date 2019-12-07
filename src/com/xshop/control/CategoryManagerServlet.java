package com.xshop.control;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.model.core.ID;
import com.xshop.bean.Category;
import com.xshop.bean.PageBean;
import com.xshop.dao.CategoryDao;
import com.xshop.daoimpl.CategoryDaoImpl;

public class CategoryManagerServlet extends HttpServlet {
	/*
	 * 商品分类功能控制Servlet
	 * 
	 */
	CategoryDao cd=new CategoryDaoImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oper=req.getParameter("oper");
		
		if(oper!=null&&oper.equals("add")){
			addCategory(req,resp);
		}else if(oper!=null&&oper.equals("showall")){
			showAll(req,resp);
		}else if(oper!=null&&oper.equals("findbyid")){
			findById(req,resp);
		}else if(oper!=null&&oper.equals("update")){
			update(req,resp);
		}else if(oper!=null&&oper.equals("delbyid")){
			delById(req,resp);
		}else if(oper!=null&&oper.equals("delpl")){
			delPL(req,resp);
		}else if(oper!=null&&oper.equals("list")){
			getList(req,resp);
		}

		else{
			System.out.println("oper没有值！");
		}	
	}
	//返回商品分类列表
	private void getList(HttpServletRequest req, HttpServletResponse resp) {
		List<Category> list=cd.findAll();
		req.getSession().setAttribute("categorylist", list);
		try {
			resp.sendRedirect("addProduct.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//批量删除分类
	private void delPL(HttpServletRequest req, HttpServletResponse resp) {
		String cid[]=req.getParameterValues("cid");
		int flag=cd.delPL(cid);
		if(flag>0){
			req.getSession().setAttribute("mess", "删除成功!");
			showAll(req,resp);
		}else{
			req.getSession().setAttribute("mess", "删除失败，可能是作为外键被引用，无法删除！");
			showAll(req,resp);
		}
		
	}
	//根据ID删除分类
	private void delById(HttpServletRequest req, HttpServletResponse resp) {
		int cid=Integer.parseInt(req.getParameter("id"));
		int flag=cd.delById(cid);
		if(flag>0){
			req.getSession().setAttribute("mess", "删除成功!");
			showAll(req,resp);
		}else{
			req.getSession().setAttribute("mess", "删除失败，可能是作为外键被引用，无法删除！");
			showAll(req,resp);
		}	
	}
	//修改分类
	private void update(HttpServletRequest req, HttpServletResponse resp) {
		int cid=Integer.parseInt(req.getParameter("cid"));
		String cname=req.getParameter("cname");
		Category category=new Category(cid,cname);
		int flag=cd.updateCategory(category);
		if(flag>0){
			req.getSession().setAttribute("mess", "修改成功!");
			showAll(req,resp);
		}else{
			req.getSession().setAttribute("mess", "修改失败！");
			showAll(req,resp);
		}	
	}
	//根据ID查找分类
	private void findById(HttpServletRequest req, HttpServletResponse resp) {
		int cid=Integer.parseInt(req.getParameter("id"));
		Category category=cd.findById(cid);
		
		req.getSession().setAttribute("category", category);
		try {
			resp.sendRedirect("editCategory.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//显示所有分类
	private void showAll(HttpServletRequest req, HttpServletResponse resp) {
		PageBean pb=new PageBean();
		pb.setPagesize(5);
		int currentpage=req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page"));
		pb.setCurrentpage(currentpage);
		
		List<Category> list=cd.findAll(pb);
		req.getSession().setAttribute("categorylist", list);
		req.getSession().setAttribute("pageBean", pb);
		try {
			resp.sendRedirect("manageCategory.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//添加分类
	private void addCategory(HttpServletRequest req, HttpServletResponse resp) {
		String cname=req.getParameter("cname");
		int flag=cd.addCategory(cname);
		try {
			if(flag>0){
				req.getSession().setAttribute("addmess", "添加成功！");
				resp.sendRedirect("addCategory.jsp");
			}else{
				req.getSession().setAttribute("addmess", "添加失败！");
				resp.sendRedirect("addCategory.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
}
