package com.xshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{
	/*
	 * 登陆验证过滤类
	 * 
	 */

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		System.out.println("登陆过滤");
		HttpServletRequest request=(HttpServletRequest) arg0;
		HttpServletResponse response=(HttpServletResponse) arg1;
		HttpSession session=request.getSession();
		System.out.println(session.getAttribute("uname"));
		System.out.println(request.getServletPath());
		
		if(request.getServletPath().startsWith("/people")){
			if(session.getAttribute("uname")==null){
				response.sendRedirect("../login.jsp");
			}else{
				arg2.doFilter(request, response);
			}
		}else if(session.getAttribute("aname")==null){
			response.sendRedirect("../adminlogin.jsp");
		}else{
			arg2.doFilter(request, response);
		}
		
//		if(session.getAttribute("uname")==null){
//
//			if(request.getServletPath().startsWith("/people")){
//				response.sendRedirect("login.jsp");
//			}else{
//				response.sendRedirect("../adminlogin.jsp");
//			}
//		}else{
//			arg2.doFilter(request, response);
//		}
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
