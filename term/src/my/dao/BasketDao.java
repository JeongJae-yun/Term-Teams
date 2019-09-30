package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Basket;
import my.util.JdbcUtil;

public class BasketDao {
	
	
	public void insert(Connection conn, Basket basket) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into basket (userId,clothesId,amount,allprice,basketDate)"
					+ " values(?,?,?,?,?)");
			pstmt.setString(1, basket.getUserId());
			pstmt.setInt(2, basket.getClotheId());
			pstmt.setInt(3, basket.getAmount());
			pstmt.setInt(4, basket.getAllprice());
			pstmt.setTimestamp(5,new Timestamp(basket.getBasketDate().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	/*
	public Basket selectById(Connection conn, int basketId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Basket basket = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from basket where basketId = ?");
			pstmt.setInt(1, basketId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				basket = new Basket(); 
				basket.setBasketId(rs.getInt(1));
				basket.setGuestName(rs.getString(2));
				basket.setPassword(rs.getString(3));
				basket.setBasket(rs.getString(4));
				basket.setRegisterTime(rs.getTimestamp(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return basket;
	}
	
	public void update(Connection conn, Basket basket) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update basket set guestname=?,password=?,basket=?, "
					+ "   registertime=? where basketId=?");
			pstmt.setString(1, basket.getGuestName());
			pstmt.setString(2, basket.getPassword());
			pstmt.setString(3, basket.getBasket());
			pstmt.setTimestamp(4, new Timestamp(basket.getRegisterTime().getTime()));
			pstmt.setInt(5, basket.getBasketId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int basketId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from basket where basketId = ?");
			pstmt.setInt(1, basketId);
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
			rs = stmt.executeQuery("select count(*) from basket");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}   
	
	public List<Basket> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Basket> basketList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from basket");
			rs  = pstmt.executeQuery(); 
			basketList = new ArrayList<Basket>();
			while (rs.next()){
				Basket basket = new Basket();
				basket.setBasketId(rs.getInt(1));
				basket.setUserId(rs.getString(2));
				basket.setMovieId(rs.getInt(3));
				basket.setAmount(rs.getInt(4));
				basket.setPayment(rs.getInt(5));
				basket.setBasketDate(rs.getTimestamp(6));
				basketList.add(basket);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return basketList;
	}
*/

}



















