package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Product;
import my.util.JdbcUtil;

public class ProductDao {
	
	public void insert(Connection conn, Product product) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into product (name, maker, price, country)"
					+ " values(?,?,?,?)");
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getMaker());
			pstmt.setInt(3, product.getPrice());
			pstmt.setString(4, product.getCountry());
					
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public List<Product> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product");
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setProductId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setMaker(rs.getString(3));
				product.setPrice(rs.getInt(4));
				product.setCountry(rs.getString(5));
				productList.add(product);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	public List<Product> selectLike(Connection conn, String search) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product where name like ?"); 
			// where 는 검색할때 name에서 검색해감
			pstmt.setString(1, "%"+search+"%");   // 물음표가 하나라서 1
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setProductId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setMaker(rs.getString(3));
				product.setPrice(rs.getInt(4));
				product.setCountry(rs.getString(5));
				productList.add(product);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	public List<Product> selectFinal(Connection conn, String target, String search) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product where ? like ?"); 
			// where 는 검색할때 name에서 검색해감
			pstmt.setString(1, target);   // 물음표가 하나라서 1 , 명확하게 되있는 것이므로 % 필요 ㄴㄴ
			pstmt.setString(2, "%"+search+"%");
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setProductId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setMaker(rs.getString(3));
				product.setPrice(rs.getInt(4));
				product.setCountry(rs.getString(5));
				productList.add(product);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	public List<Product> selectAnd(Connection conn, String key1, String key2) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from product where name like  ? and country like ?");  //and 복합검색
			// where 는 검색할때 name에서 검색해감
			pstmt.setString(1, "%"+key1+"%");   // 물음표가 하나라서 1
			pstmt.setString(2, "%"+key2+"%");
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setProductId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setMaker(rs.getString(3));
				product.setPrice(rs.getInt(4));
				product.setCountry(rs.getString(5));
				productList.add(product);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	public List<Product> selectPrice(Connection conn, String sig, int price) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> productList = null;
		try {
			if (sig.equals(">"))
			pstmt = conn.prepareStatement
					("select * from product where price > ?"); 
			// where 는 검색할때 name에서 검색해감
			else if (sig.equals("<"))
				pstmt = conn.prepareStatement
				("select * from product where price < ?"); 
			else
				pstmt = conn.prepareStatement
				("select * from product where price = ?"); 
			 
			pstmt.setInt(1, price);
			rs  = pstmt.executeQuery(); 
			productList = new ArrayList<Product>();
			while (rs.next()){
				Product product = new Product();
				product.setProductId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setMaker(rs.getString(3));
				product.setPrice(rs.getInt(4));
				product.setCountry(rs.getString(5));
				productList.add(product);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return productList;
	}
	public Product selectById(Connection conn, int productId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Product product = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from product where productId = ?");
			pstmt.setInt(1, productId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				product = new Product(); 
				product.setProductId(rs.getInt(1));
				product.setName(rs.getString(2));
				product.setMaker(rs.getString(3));
				product.setPrice(rs.getInt(4));
				product.setCountry(rs.getString(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return product;
	}
/*	
	
	public void update(Connection conn, Product product) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update product set guestname=?,password=?,product=?, "
					+ "   registertime=? where productId=?");
			pstmt.setString(1, product.getGuestName());
			pstmt.setString(2, product.getPassword());
			pstmt.setString(3, product.getProduct());
			pstmt.setTimestamp(4, new Timestamp(product.getRegisterTime().getTime()));
			pstmt.setInt(5, product.getProductId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int productId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from product where productId = ?");
			pstmt.setInt(1, productId);
			pstmt.executeUpdate();			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null; 
		ResultSet rs = null; 
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from product");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}
	
	
	*/
}




















