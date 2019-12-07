package com.xshop.daoimpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xshop.bean.Category;
import com.xshop.bean.PageBean;
import com.xshop.bean.Product;
import com.xshop.dao.ProductDao;
import com.xshop.db.DBConnection;

public class ProductDaoImpl implements ProductDao {
	/*
	 * 商品管理展示功能实现类
	 * (non-Javadoc)
	 * @see com.xshop.dao.ProductDao#addProduct(com.xshop.bean.Product)
	 */

	public int addProduct(Product product) {
		DBConnection db=new DBConnection();
		String sql="insert into product (pname,price,discount,pcount,imagepath,description,posttime,author,cid,hot,state) values (?,?,?,?,?,?,now(),?,?,?,?)";
		Object obj[]={product.getPname(),product.getPrice(),product.getDiscount(),product.getPcount(),product.getImagepath(),product.getDescription(),product.getAuthor(),product.getCid(),product.getHot(),product.getState()};
		db.dopstmt(sql, obj);
		int flag=0;
		try {
			flag=db.getUpdateCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return flag;
	}

	public int delById(int pid) {
		DBConnection db=new DBConnection();
		String sql="delete from product where pid=?";
		Object obj[]={pid};
		db.dopstmt(sql, obj);
		int flag=0;
		try {
			flag=db.getUpdateCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return flag;
	}

	public int delPiLiang(String[] pid) {
		DBConnection db=new DBConnection();
		String sql="delete from product where pid in (0";
		for(String id:pid){
			sql+=","+id;
		}
		sql+=")";
		db.dopstmt(sql, null);
		int flag=0;
		try {
			flag=db.getUpdateCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return flag;
	}

	public Product findById(int pid) {
		DBConnection db=new DBConnection();
		String sql="select p.*,c.cname from product as p,category as c where p.cid=c.cid and pid=?";
		Object obj[]={pid};
		db.dopstmt(sql, obj);
		System.out.println(sql);
		Product product=new Product();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){

				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getDouble("discount"));
				product.setPcount(rs.getInt("pcount"));
				product.setImagepath(rs.getString("imagepath"));
				product.setDescription(rs.getString("description"));
				product.setPosttime(rs.getDate("posttime"));
				product.setCid(rs.getInt("cid"));
				product.setHot(rs.getString("hot"));
				product.setState(rs.getString("state"));
				product.setClickcount(rs.getInt("clickcount"));
				product.setSellcount(rs.getInt("sellcount"));
				
				Category c=new Category();
				c.setCid(rs.getInt("cid"));
				c.setCname(rs.getString("cname"));
				product.setCategory(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return product;
	}

	public List<Product> findByName(String pname) {
		DBConnection db=new DBConnection();
		String sql="select * from product where pname like ?";
		Object obj[]={"%"+pname+"%"};
		db.dopstmt(sql, obj);
		List<Product> list=new ArrayList<Product>();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getDouble("discount"));
				product.setPcount(rs.getInt("pcount"));
				product.setImagepath(rs.getString("imagepath"));
				product.setDescription(rs.getString("description"));
				product.setPosttime(rs.getDate("posttime"));
				product.setCid(rs.getInt("cid"));
				product.setHot(rs.getString("hot"));
				product.setState(rs.getString("state"));
				product.setClickcount(rs.getInt("clickcount"));
				product.setSellcount(rs.getInt("sellcount"));
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return list;
	}

	public int updateProduct(Product product) {
		DBConnection db=new DBConnection();
		String sql="update product set pname=?,price=?,discount=?,pcount=?,imagepath=?,description=?,posttime=now(),author=?,cid=?,hot=?,state=? where pid=?";
		Object obj[]={product.getPname(),product.getPrice(),product.getDiscount(),product.getPcount(),product.getImagepath(),product.getDescription(),product.getAuthor(),product.getCid(),product.getHot(),product.getState(),product.getPid()};
		db.dopstmt(sql, obj);
		System.out.println(sql);
		int flag=0;
		try {
			flag=db.getUpdateCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return flag;
	}

	public List<Product> showAll() {
		DBConnection db=new DBConnection();
		String sql="select * from product ";
		db.dopstmt(sql, null);
		List<Product> list=new ArrayList<Product>();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getDouble("discount"));
				product.setPcount(rs.getInt("pcount"));
				product.setImagepath(rs.getString("imagepath"));
				product.setDescription(rs.getString("description"));
				product.setPosttime(rs.getDate("posttime"));
				product.setCid(rs.getInt("cid"));
				product.setHot(rs.getString("hot"));
				product.setState(rs.getString("state"));
				product.setClickcount(rs.getInt("clickcount"));
				product.setSellcount(rs.getInt("sellcount"));
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return list;
	}

	public List<Product> showAllpage(PageBean pb) {
		
		DBConnection db=new DBConnection();
		int rowcount=productCount();
		int startrow=(pb.getCurrentpage()-1)*pb.getPagesize();
		pb.setRowcount(rowcount);
		System.out.println(pb.getCurrentpage()+"--"+pb.getPagesize()+"--"+startrow);
		String sql="select p.*,c.cname from product as p,category as c where p.cid=c.cid limit "+ startrow+","+pb.getPagesize();
		System.out.println("showAllPage=="+sql);
		db.dopstmt(sql, null);
		List<Product> list=new ArrayList<Product>();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getDouble("discount"));
				product.setPcount(rs.getInt("pcount"));
				product.setImagepath(rs.getString("imagepath"));
				product.setDescription(rs.getString("description"));
				product.setPosttime(rs.getDate("posttime"));
				product.setCid(rs.getInt("cid"));
				product.setHot(rs.getString("hot"));
				product.setState(rs.getString("state"));
				product.setClickcount(rs.getInt("clickcount"));
				product.setSellcount(rs.getInt("sellcount"));
				
				Category c=new Category();
				c.setCid(rs.getInt("cid"));
				c.setCname(rs.getString("cname"));
				product.setCategory(c);
				
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return list;
	}

	public int productCount() {
		DBConnection db=new DBConnection();
		String sqlString = "select count(*) as rowcount from product";
		db.dopstmt(sqlString, null);
		int count = 0;
		ResultSet rs = null;
		try {
			rs = db.getResultSet();
			while (rs.next()) {
				count = rs.getInt("rowcount");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeAll(rs);
		}
		return count;
	}

	public List<Product> orderBySell(PageBean pb) {
		DBConnection db=new DBConnection();
		int rowcount=productCount();
		int startrow=(pb.getCurrentpage()-1)*pb.getPagesize();
		pb.setRowcount(rowcount);
		System.out.println(pb.getCurrentpage()+"--"+pb.getPagesize()+"--"+startrow);
		String sql="select p.*,c.cname from product as p,category as c where p.cid=c.cid order by sellcount limit "+ startrow+","+pb.getPagesize();
		System.out.println("showAllPage=="+sql);
		db.dopstmt(sql, null);
		List<Product> list=new ArrayList<Product>();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getDouble("discount"));
				product.setPcount(rs.getInt("pcount"));
				product.setImagepath(rs.getString("imagepath"));
				product.setDescription(rs.getString("description"));
				product.setPosttime(rs.getDate("posttime"));
				product.setCid(rs.getInt("cid"));
				product.setHot(rs.getString("hot"));
				product.setState(rs.getString("state"));
				product.setClickcount(rs.getInt("clickcount"));
				product.setSellcount(rs.getInt("sellcount"));
				
				Category c=new Category();
				c.setCid(rs.getInt("cid"));
				c.setCname(rs.getString("cname"));
				product.setCategory(c);
				
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return list;
	}

	public List<Product> showAll(PageBean pb, int cid) {
		// TODO Auto-generated method stub
		DBConnection db=new DBConnection();
		int rowcount=productCount();
		int startrow=(pb.getCurrentpage()-1)*pb.getPagesize();
		pb.setRowcount(rowcount);
		System.out.println(pb.getCurrentpage()+"--"+pb.getPagesize()+"--"+startrow);
		String sql="select p.*,c.cname from product as p,category as c where p.cid=c.cid and c.cid=? limit "+ startrow+","+pb.getPagesize() ;
		System.out.println("showAllPage=="+sql);
		Object obj[]={cid};
		db.dopstmt(sql, obj);
		List<Product> list=new ArrayList<Product>();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getDouble("discount"));
				product.setPcount(rs.getInt("pcount"));
				product.setImagepath(rs.getString("imagepath"));
				product.setDescription(rs.getString("description"));
				product.setPosttime(rs.getDate("posttime"));
				product.setCid(rs.getInt("cid"));
				product.setHot(rs.getString("hot"));
				product.setState(rs.getString("state"));
				product.setClickcount(rs.getInt("clickcount"));
				product.setSellcount(rs.getInt("sellcount"));
				
				Category c=new Category();
				c.setCid(rs.getInt("cid"));
				c.setCname(rs.getString("cname"));
				product.setCategory(c);
				
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return list;
	}

	public int updateclickcount(Product product) {
		DBConnection db=new DBConnection();
		
		int click=product.getClickcount()+1;
		String sql="update product set clickcount=? where pid=?";
		System.out.println(sql);
		Object obj[]={click,product.getPid()};
		db.dopstmt(sql, obj);
		int flag=0;
		try {
			flag=db.getUpdateCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return flag;
	}

	public int updatesellcount(Product product,int buycount) {
		DBConnection db=new DBConnection();
		
		int sell=product.getSellcount()+buycount;
		String sql="update product set sellcount=? where pid=?";
		System.out.println(sql);
		Object obj[]={sell,product.getPid()};
		db.dopstmt(sql, obj);
		int flag=0;
		try {
			flag=db.getUpdateCount();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return flag;
	}

	public List<Product> orderBySell(PageBean pb, int cid) {
		DBConnection db=new DBConnection();
		int rowcount=productCount();
		int startrow=(pb.getCurrentpage()-1)*pb.getPagesize();
		pb.setRowcount(rowcount);
		System.out.println(pb.getCurrentpage()+"--"+pb.getPagesize()+"--"+startrow);
		String sql="select p.*,c.cname from product as p,category as c where p.cid=c.cid and c.cid=? order by sellcount desc limit "+ startrow+","+pb.getPagesize() ;
		System.out.println("showAllPage=="+sql);
		Object obj[]={cid};
		db.dopstmt(sql, obj);
		List<Product> list=new ArrayList<Product>();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getDouble("discount"));
				product.setPcount(rs.getInt("pcount"));
				product.setImagepath(rs.getString("imagepath"));
				product.setDescription(rs.getString("description"));
				product.setPosttime(rs.getDate("posttime"));
				product.setCid(rs.getInt("cid"));
				product.setHot(rs.getString("hot"));
				product.setState(rs.getString("state"));
				product.setClickcount(rs.getInt("clickcount"));
				product.setSellcount(rs.getInt("sellcount"));
				
				Category c=new Category();
				c.setCid(rs.getInt("cid"));
				c.setCname(rs.getString("cname"));
				product.setCategory(c);
				
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return list;
	}

	public List<Product> orderByClick(PageBean pb, int cid) {
		DBConnection db=new DBConnection();
		int rowcount=productCount();
		int startrow=(pb.getCurrentpage()-1)*pb.getPagesize();
		pb.setRowcount(rowcount);
		System.out.println(pb.getCurrentpage()+"--"+pb.getPagesize()+"--"+startrow);
		String sql="select p.*,c.cname from product as p,category as c where p.cid=c.cid and c.cid=? order by clickcount desc limit "+ startrow+","+pb.getPagesize() ;
		System.out.println("showAllPage=="+sql);
		Object obj[]={cid};
		db.dopstmt(sql, obj);
		List<Product> list=new ArrayList<Product>();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getDouble("discount"));
				product.setPcount(rs.getInt("pcount"));
				product.setImagepath(rs.getString("imagepath"));
				product.setDescription(rs.getString("description"));
				product.setPosttime(rs.getDate("posttime"));
				product.setCid(rs.getInt("cid"));
				product.setHot(rs.getString("hot"));
				product.setState(rs.getString("state"));
				product.setClickcount(rs.getInt("clickcount"));
				product.setSellcount(rs.getInt("sellcount"));
				
				Category c=new Category();
				c.setCid(rs.getInt("cid"));
				c.setCname(rs.getString("cname"));
				product.setCategory(c);
				
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return list;
	}

	public List<Product> orderByPrice(PageBean pb, int cid) {
		DBConnection db=new DBConnection();
		int rowcount=productCount();
		int startrow=(pb.getCurrentpage()-1)*pb.getPagesize();
		pb.setRowcount(rowcount);
		System.out.println(pb.getCurrentpage()+"--"+pb.getPagesize()+"--"+startrow);
		String sql="select p.*,c.cname from product as p,category as c where p.cid=c.cid and c.cid=? order by price desc limit "+ startrow+","+pb.getPagesize() ;
		System.out.println("showAllPage=="+sql);
		Object obj[]={cid};
		db.dopstmt(sql, obj);
		List<Product> list=new ArrayList<Product>();
		ResultSet rs=null;
		try {
			rs=db.getResultSet();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getInt("pid"));
				product.setPname(rs.getString("pname"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getDouble("discount"));
				product.setPcount(rs.getInt("pcount"));
				product.setImagepath(rs.getString("imagepath"));
				product.setDescription(rs.getString("description"));
				product.setPosttime(rs.getDate("posttime"));
				product.setCid(rs.getInt("cid"));
				product.setHot(rs.getString("hot"));
				product.setState(rs.getString("state"));
				product.setClickcount(rs.getInt("clickcount"));
				product.setSellcount(rs.getInt("sellcount"));
				
				Category c=new Category();
				c.setCid(rs.getInt("cid"));
				c.setCname(rs.getString("cname"));
				product.setCategory(c);
				
				list.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.closeAll(null);
		}
		return list;
	}


}
