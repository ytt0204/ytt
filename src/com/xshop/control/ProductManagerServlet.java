package com.xshop.control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import com.xshop.bean.Category;
import com.xshop.bean.PageBean;
import com.xshop.bean.Product;
import com.xshop.dao.CategoryDao;
import com.xshop.dao.ProductDao;
import com.xshop.daoimpl.CategoryDaoImpl;
import com.xshop.daoimpl.ProductDaoImpl;


public class ProductManagerServlet extends HttpServlet {
	/*
	 * 商品管理控制Servlet
	 * 
	 */
	ProductDao pd=new ProductDaoImpl();
	CategoryDao cd=new CategoryDaoImpl();	
	
		private SmartUpload su;
		private String filename;
		private String rootpath;
	
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {

			String oper=req.getParameter("oper");
			System.out.println(oper);
			if(oper==null){
				/*
				 * oper为空的两种状态，添加商品和修改商品
				 * 先进行图片的上传
				 */
				filename="";
				su=new SmartUpload();
				su.initialize(this.getServletConfig(), req, resp);
				su.setEncoding("UTF-8");
				su.setAllowedFilesList("jpg,png,gif,jpeg,bmp");
				su.setMaxFileSize(5*1024*1024);
				
				rootpath=getServletContext().getRealPath("/");
				String uploadpath="uploadfile/";
				System.out.println(rootpath);
				
				Calendar cd=Calendar.getInstance();
				uploadpath+=(cd.get(Calendar.YEAR))+"/";
				uploadpath+=(cd.get(Calendar.MONTH)+1)+"/";
				uploadpath+=(cd.get(Calendar.DATE))+"/";
				System.out.println(uploadpath);
				
				java.io.File dirfile=new java.io.File(rootpath+uploadpath);
				if(!dirfile.exists()){
					dirfile.mkdirs();
				}
				try {
					su.upload();
					com.jspsmart.upload.Files files=su.getFiles();
					for(int i=0;i<files.getCount();i++){
						com.jspsmart.upload.File uploadfile=files.getFile(i);
						if(!uploadfile.isMissing()){
							SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-ms");
							String nowstring=sdf.format(new Date());
							filename=uploadpath+nowstring+"-"+i+"."+uploadfile.getFileExt();
							System.out.println(filename);
							uploadfile.saveAs(filename, su.SAVE_VIRTUAL);
						}
					}
				} catch(SecurityException se){
					
					if(se.getMessage().startsWith("The extension of the file is not allowed to be uploaded")){
							
						req.getSession().setAttribute("mess", "文件格式不正确");
							
						resp.sendRedirect("addproduct.jsp");
					}
					if(se.getMessage().startsWith("Size exceeded for this file")){
						req.getSession().setAttribute("mess", "文件太大");
							
						resp.sendRedirect("addproduct.jsp");
					}
				} catch (SmartUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				String oper1=su.getRequest().getParameter("oper");
				
				if(oper1.equals("add")){
					addProduct(req,resp);
				}else if(oper1.equals("update")){
					update(req,resp);
				}	
			}else if(oper!=null&&oper.equals("showall")){
				showall(req,resp);
			}else if(oper!=null&&oper.equals("findbyid")){
				findById(req,resp);
			}else if(oper!=null&&oper.equals("delbyid")){
				delById(req,resp);
			}else if(oper!=null&&oper.equals("delpl")){
				delpl(req,resp);
			}	
		}
		//商品的批量删除
		private void delpl(HttpServletRequest req, HttpServletResponse resp) {
			String pid[]=req.getParameterValues("pid");
			int flag=pd.delPiLiang(pid);
			if(flag>0){
				req.getSession().setAttribute("mess", "删除成功！");
				showall(req,resp);
			}else{
				req.getSession().setAttribute("mess", "删除失败！");
				showall(req,resp);
			}		
		}
		//根据ID删除商品
		private void delById(HttpServletRequest req, HttpServletResponse resp) {
			int pid=Integer.parseInt(req.getParameter("id"));
			int flag=pd.delById(pid);
			if(flag>0){
				req.getSession().setAttribute("mess", "删除成功！");
				showall(req,resp);
			}else{
				req.getSession().setAttribute("mess", "删除失败！");
				showall(req,resp);
			}		
		}
		//更新商品信息
		private void update(HttpServletRequest req, HttpServletResponse resp) {
			Request request=su.getRequest();
			int pid=Integer.parseInt(request.getParameter("pid"));
			String pname=request.getParameter("pname");
			double price=Double.parseDouble(request.getParameter("price"));
			double discount=Double.parseDouble(request.getParameter("discount"));
			int pcount=Integer.parseInt(request.getParameter("pcount"));
			int cid=Integer.parseInt(request.getParameter("cid"));
			String hot=request.getParameterValues("hot")==null?"正常":request.getParameterValues("hot")[0];
			String state=request.getParameterValues("state")==null?"下架":request.getParameterValues("state")[0];
			String description=request.getParameter("description");
			
			String author=(String) req.getSession().getAttribute("name");
			
			Product product=new Product();
			product.setPid(pid);
			product.setPname(pname);
			product.setPrice(price);
			product.setDiscount(discount);
			product.setPcount(pcount);
			product.setCid(cid);
			product.setHot(hot);
			product.setState(state);
			product.setDescription(description);
			product.setAuthor(author);
			String imagepath=request.getParameter("imagepath");
			if(filename==null&&filename.equals("")){
				filename=imagepath;
			}else{
				System.out.println(imagepath+"***"+"imagepath");
				java.io.File file=new java.io.File(rootpath+imagepath);
				if (file.isFile() && file.exists()) {   
			        file.delete();     
			    }  
			}
			
			product.setImagepath(filename);
			
			int flag=pd.updateProduct(product);
			if(flag>0){
				req.getSession().setAttribute("mess", "修改成功！");
				showall(req,resp);
			}else{
				req.getSession().setAttribute("mess", "修改失败！");
				showall(req,resp);
			}	
		}
		//根据ID查找商品
		private void findById(HttpServletRequest req, HttpServletResponse resp) {
			int pid=Integer.parseInt(req.getParameter("id"));
			Product product=pd.findById(pid);
			req.getSession().setAttribute("pbyid", product);
			List<Category> list=cd.findAll();
			req.getSession().setAttribute("categorylist", list);
			try {
				resp.sendRedirect("editProduct.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//显示所有商品
		private void showall(HttpServletRequest req, HttpServletResponse resp) {
			PageBean pb=new PageBean();
			int currentpage=req.getParameter("page")==null?1:Integer.parseInt(req.getParameter("page"));
			pb.setPagesize(5);
			pb.setCurrentpage(currentpage);
			System.out.println(currentpage);
			List<Product> list=pd.showAllpage(pb);
			req.getSession().setAttribute("plist", list);
			req.getSession().setAttribute("pageBean", pb);
			try {
				resp.sendRedirect("manageProduct.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		//添加商品
		private void addProduct(HttpServletRequest req, HttpServletResponse resp) {
			Request request=su.getRequest();
			String pname=request.getParameter("pname");
			double price=Double.parseDouble(request.getParameter("price"));
			double discount=Double.parseDouble(request.getParameter("discount"));
			int pcount=Integer.parseInt(request.getParameter("pcount"));
			int cid=Integer.parseInt(request.getParameter("cid"));
			String hot=request.getParameterValues("hot")==null?"正常":request.getParameterValues("hot")[0];
			String state=request.getParameterValues("state")==null?"下架":request.getParameterValues("state")[0];
			String description=request.getParameter("description");
			
			String author=(String) req.getSession().getAttribute("aname");
			
			Product product=new Product();
			product.setPname(pname);
			product.setPrice(price);
			product.setDiscount(discount);
			product.setPcount(pcount);
			product.setCid(cid);
			product.setHot(hot);
			product.setState(state);
			product.setDescription(description);
			product.setAuthor(author);
			product.setImagepath(filename);
			
			int flag=pd.addProduct(product);
			try {
				if(flag>0){
					req.getSession().setAttribute("mess", "添加成功！");
					resp.sendRedirect("addProduct.jsp");
				}else{
					req.getSession().setAttribute("mess", "添加失败！");
					resp.sendRedirect("addProduct.jsp");
				}
			} catch (IOException e) {
				// TODO: handle exception
			}	
		}
		
	
}
