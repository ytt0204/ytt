package com.xshop.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xshop.bean.Admin;
import com.xshop.bean.PageBean;
import com.xshop.dao.AdminDao;
import com.xshop.daoimpl.AdminDaoImpl;

public class AdminManagerServlet extends HttpServlet {
	/*
	 * 管理员功能控制Servlet
	 * 
	 */
	AdminDao ad=new AdminDaoImpl();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oper=req.getParameter("oper");
		
		if(oper!=null&&oper.equals("add")){
			addAdmin(req,resp);
		}else if(oper!=null&&oper.equals("showall")){
			showall(req,resp);
		}else if(oper!=null&&oper.equals("login")){
			login(req,resp);
		}else if(oper!=null&&oper.equals("findbyname")){
			findByName(req,resp);
		}else if(oper!=null&&oper.equals("update")){
			updateAdmin(req,resp);
		}
	}
		//更新管理员状态
	private void updateAdmin(HttpServletRequest req, HttpServletResponse resp) {
		String adminname=req.getParameter("adminname");
		String adminpwd=req.getParameter("adminpwd");
		String state=req.getParameter("state");
		System.out.println(adminname+adminpwd+state);
		Admin admin=new Admin(adminname,adminpwd,state);
		int flag=ad.updateAdmin(admin);
		try {
			if(flag>0){
				req.getSession().setAttribute("mess", "修改成功！");
				resp.sendRedirect("admin/addAdmin.jsp");
			}else{
				req.getSession().setAttribute("mess", "修改成功！");
				resp.sendRedirect("admin/addAdmin.jsp");
			}
		} catch (IOException e) {
			// TODO: handle exception
		}
		
	}
	//根据名字查找管理员
	private void findByName(HttpServletRequest req, HttpServletResponse resp) {
		String name=req.getParameter("name");
		Admin admin =ad.findByName(name);
		req.getSession().setAttribute("admin", admin);
		try {
			resp.sendRedirect("admin/editAdmin.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//管理员登陆
	private void login(HttpServletRequest req, HttpServletResponse resp) {
		String name=req.getParameter("username");
		String password=req.getParameter("password");
		System.out.println(name+password);
		Admin admin=ad.findByName(name);
		try {
			if(admin!=null){
				if(admin.getAdminpwd().equals(password)){
					req.getSession().setAttribute("aname", name);
					resp.sendRedirect("admin/main.jsp");
				}else{
					req.getSession().setAttribute("mess", "密码错误！");
					resp.sendRedirect("adminlogin.jsp");
				}
			}else{
				req.getSession().setAttribute("mess", "用户名不存在！");
				resp.sendRedirect("adminlogin.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	}
		//显示所有管理员
	private void showall(HttpServletRequest req, HttpServletResponse resp) {
		PageBean pb=new PageBean();
		pb.setPagesize(5);
		int currentpage=req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page"));
		pb.setCurrentpage(currentpage);
		
		List<Admin> list=ad.findAllPage(pb);
		req.getSession().setAttribute("adminlist", list);
		req.getSession().setAttribute("pageBean", pb);
		try {
			resp.sendRedirect("admin/manageAdmin.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//添加管理员
	private void addAdmin(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String adminname=req.getParameter("adminname");
		String adminpwd=req.getParameter("adminpwd");
		String state=req.getParameter("state");
		System.out.println(adminname+adminpwd+state);
		Admin admin=new Admin(adminname,adminpwd,state);
		int flag=ad.addAdmin(admin);
		try {
			if(flag>0){
				req.getSession().setAttribute("mess", "添加成功！");
				resp.sendRedirect("admin/addAdmin.jsp");
			}else{
				req.getSession().setAttribute("mess", "添加成功！");
				resp.sendRedirect("admin/addAdmin.jsp");
			}
		} catch (IOException e) {
			// TODO: handle exception
		}
	}
	
	
	
}
