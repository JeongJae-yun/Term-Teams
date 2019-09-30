package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Buy;
import my.util.JdbcUtil;

public class BuyDao {
	
	public void insert(Connection conn, Buy buy) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into buy (id,clothesId,amount,allprice,buyDate)"
					+ " values(?,?,?,?,?)");
			pstmt.setString(1, buy.getId());
			pstmt.setInt(2, buy.getClothesId());
			pstmt.setInt(3, buy.getAmount());
			pstmt.setInt(4, buy.getAllprice());
			pstmt.setTimestamp(5,new Timestamp(buy.getBuyDate().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Buy selectById(Connection conn, String id) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Buy buy = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from buy where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()){
				buy = new Buy(); 
				buy.setBuyId(rs.getInt(1));
				buy.setId(rs.getString(2));
				buy.setClothesId(rs.getInt(3));
				buy.setAmount(rs.getInt(4));
				buy.setAllprice(rs.getInt(5));
				buy.setBuyDate(rs.getTimestamp(6));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return buy;
	}
	
	public List<Buy> selectListById(Connection conn, String id) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Buy> buyList = null;
		try {
			pstmt = conn.prepareStatement
			("select * from buy where id = ?");
			pstmt.setString(1, id);
			rs  = pstmt.executeQuery(); 
			buyList = new ArrayList<Buy>();
			while (rs.next()){
				Buy buy = new Buy();
				buy.setBuyId(rs.getInt(1));
				buy.setId(rs.getString(2));
				buy.setClothesId(rs.getInt(3));
				buy.setAmount(rs.getInt(4));
				buy.setAllprice(rs.getInt(5));
				buy.setBuyDate(rs.getTimestamp(6));
				buyList.add(buy);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return buyList;
	}
	/*
	public void update(Connection conn, Buy buy) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update buy set guestname=?,password=?,buy=?, "
					+ "   registertime=? where buyId=?");
			pstmt.setString(1, buy.getGuestName());
			pstmt.setString(2, buy.getPassword());
			pstmt.setString(3, buy.getBuy());
			pstmt.setTimestamp(4, new Timestamp(buy.getRegisterTime().getTime()));
			pstmt.setInt(5, buy.getBuyId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	/*
	public void deleteById(Connection conn, int buyId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from buy where buyId = ?");
			pstmt.setInt(1, buyId);
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
			rs = stmt.executeQuery("select count(*) from buy");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}   
	*/
	public List<Buy> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Buy> buyList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from buy");
			rs  = pstmt.executeQuery(); 
			buyList = new ArrayList<Buy>();
			while (rs.next()){
				Buy buy = new Buy();
				buy.setBuyId(rs.getInt(1));
				buy.setId(rs.getString(2));
				buy.setClothesId(rs.getInt(3));
				buy.setAmount(rs.getInt(4));
				buy.setAllprice(rs.getInt(5));
				buy.setBuyDate(rs.getTimestamp(6));
				buyList.add(buy);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return buyList;
	}


}



















