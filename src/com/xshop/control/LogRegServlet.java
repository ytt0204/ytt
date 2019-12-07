package com.xshop.control;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.xshop.bean.User;
import com.xshop.dao.UserDao;
import com.xshop.daoimpl.UserDaoImpl;

public class LogRegServlet extends HttpServlet {
	/*
	 * 用户登录注册管理功能控制Servlet
	 * 
	 */
	UserDao ud=new UserDaoImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oper=req.getParameter("oper");
		
		if(oper!=null&&oper.equals("login")){
			login(req,resp);
		}else if(oper!=null&&oper.equals("reg")){
			register(req,resp);
		}else if(oper!=null&&oper.equals("edit")){
			edit(req,resp);
		}else if(oper!=null&&oper.equals("showall")){
			showall(req,resp);
		}else if(oper!=null&&oper.equals("state")){
			state(req,resp);
		}
	}
	//修改用户状态判断账户是否可用
	private void state(HttpServletRequest req, HttpServletResponse resp) {
		String name=req.getParameter("name");
		String state=req.getParameter("state");
		if(state.equals("0")){
			state="正常";
		}else{
			state="禁用";
		}
		System.out.println(state+"state"+name);
	
		
		int flag=ud.updatestate(name,state);
		if(flag>0){
			req.getSession().setAttribute("mess", "修改成功");
			showall(req,resp);
		}else{
			req.getSession().setAttribute("mess", "修改失败");
			showall(req,resp);
		}
		
	}
	//显示所有用户
	private void showall(HttpServletRequest req, HttpServletResponse resp) {
		List<User> list=ud.showall();
		req.getSession().setAttribute("userlist", list);
		try {
			resp.sendRedirect("admin/manageUser.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//根据用户名查找用户
	private void edit(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session=req.getSession();
		String name=(String) session.getAttribute("uname");
		User user=ud.findByUname(name);
		session.setAttribute("user", user);
		try {
			resp.sendRedirect("people/myinfo.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//用户注册
	private void register(HttpServletRequest req, HttpServletResponse resp) {
		String name=req.getParameter("author");
		try {
			if(ud.findByUname(name)!=null){
				req.getSession().setAttribute("mess", "用户名已存在！");
				resp.sendRedirect("register.jsp");
				return;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
			
		String password=req.getParameter("password");
		String email=req.getParameter("email");
		String tel=req.getParameter("phone");
		String address=req.getParameter("address");
		User user=new User();
		user.setUname(name);
		user.setUpwd(password);
		user.setEmail(email);
		user.setTel(tel);
		user.setAddress(address);
		int flag=ud.addUser(user);
		try {
			if(flag>0){
				req.getSession().setAttribute("mess", "注册成功！");
				resp.sendRedirect("login.jsp");
			}else{
				req.getSession().setAttribute("mess", "注册失败！");
				resp.sendRedirect("register.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
			
	}
	//用户登陆
	private void login(HttpServletRequest req, HttpServletResponse resp) {
		String name=req.getParameter("author");
		String password=req.getParameter("password");
		
		User user=ud.findByUname(name);
		try {
			if(user!=null){
				if(user.getUpwd().equals(password)){
					req.getSession().setAttribute("uname", name);
					resp.sendRedirect("index.jsp");
				}else{
					req.getSession().setAttribute("mess", "密码错误！");
					resp.sendRedirect("login.jsp");
				}
			}else{
				req.getSession().setAttribute("mess", "用户名不存在！");
				resp.sendRedirect("login.jsp");
			}
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
