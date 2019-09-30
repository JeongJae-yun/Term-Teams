package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Clothes;

import my.util.JdbcUtil;

public class ClothesDao {
	
	public void insert(Connection conn, Clothes clothes) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into clothes (clothesName,color,size,amount,price,clothesImage,clothesImage1,clothesImage2,clothesImage3,clothesImage4,clothesImage5,clothesImage6,clothesImage7,clothesType)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, clothes.getClothesName());
			pstmt.setString(2, clothes.getColor());
			pstmt.setString(3, clothes.getSize());
			pstmt.setInt(4, clothes.getAmount());
			pstmt.setInt(5, clothes.getPrice());
			pstmt.setString(6, clothes.getClothesImage());
			pstmt.setString(7, clothes.getClothesImage1());
			pstmt.setString(8, clothes.getClothesImage2());
			pstmt.setString(9, clothes.getClothesImage3());
			pstmt.setString(10, clothes.getClothesImage4());
			pstmt.setString(11, clothes.getClothesImage5());
			pstmt.setString(12, clothes.getClothesImage6());
			pstmt.setString(13, clothes.getClothesImage7());
			pstmt.setString(14, clothes.getClothesType());		
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	public List<Clothes> selectList(Connection conn, String keyField, String keyword) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Clothes> clothesList = null;
		String sql= "select * from clothes";
		if(keyword != null && !keyword.equals("")) {
			sql += " where "+keyField.trim()+" like '%"+keyword.trim()+"%'";
		}
		try {
			pstmt = conn.prepareStatement
					(sql);
			rs  = pstmt.executeQuery(); 
			clothesList= new ArrayList<Clothes>();
			while (rs.next()){
				Clothes clothes = new Clothes();
				clothes.setClothesId(rs.getInt(1));
				clothes.setClothesName(rs.getString(2));
				clothes.setColor(rs.getString(3));
				clothes.setSize(rs.getString(4));
				clothes.setAmount(rs.getInt(5));
				clothes.setPrice(rs.getInt(6));
				clothes.setClothesImage(rs.getString(7));
				
				clothesList.add(clothes);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return clothesList;
	}
	
	public void updateAccessCount(Connection conn, int clothesId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update opinion set accessCount=accessCount+1 where clothesId=?");
			pstmt.setInt(1, clothesId);
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}

	/*public List<Clothes> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Clothes> clothesList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from clothes");
			rs  = pstmt.executeQuery(); 
			clothesList = new ArrayList<Clothes>();
			while (rs.next()){
				Clothes clothes = new Clothes();
				clothes.setClothesId(rs.getInt(1));
				clothes.setClothesName(rs.getString(2));
				clothes.setColor(rs.getString(3));
				clothes.setSize(rs.getString(4));
				clothes.setAmount(rs.getInt(5));
				clothes.setPrice(rs.getInt(6));
				clothes.setClothesImage(rs.getString(7));
				clothesList.add(clothes);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return clothesList;
	}
	
	
	*/
	public Clothes selectById(Connection conn, int clothesId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Clothes clothes = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from clothes where clothesId = ?");
			pstmt.setInt(1, clothesId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				clothes = new Clothes(); 
				clothes.setClothesId(rs.getInt(1));
				clothes.setClothesName(rs.getString(2));
				clothes.setColor(rs.getString(3));
				clothes.setSize(rs.getString(4));
				clothes.setAmount(rs.getInt(5));
				clothes.setPrice(rs.getInt(6));
				clothes.setClothesImage(rs.getString(7));
				clothes.setClothesImage1(rs.getString(8));
				clothes.setClothesImage2(rs.getString(9));
				clothes.setClothesImage3(rs.getString(10));
				clothes.setClothesImage4(rs.getString(11));
				clothes.setClothesImage5(rs.getString(12));
				clothes.setClothesImage6(rs.getString(13));
				clothes.setClothesImage7(rs.getString(14));
				
				clothes.setClothesType(rs.getString(15));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return clothes;
	}
	public List<Clothes> selectListCondition(Connection conn, String cond, String direct) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Clothes> clothesList = null;
		String sql= "select * from clothes";
		if(cond != null && !cond.equals("")) {
			sql += " order by "+cond.trim()+" "+direct.trim();
		}
		try {
			pstmt = conn.prepareStatement(sql);
			rs  = pstmt.executeQuery(); 
			clothesList = new ArrayList<Clothes>();
			while (rs.next()){
				Clothes clothes = new Clothes();
				clothes.setClothesId(rs.getInt(1));
				clothes.setClothesName(rs.getString(2));
				clothes.setColor(rs.getString(3));
				clothes.setSize(rs.getString(4));
				clothes.setAmount(rs.getInt(5));
				clothes.setPrice(rs.getInt(6));
				clothes.setClothesImage(rs.getString(7));
				
				//movie.setAddress(rs.getString(6));
				//movie.setRegisterTime(rs.getTimestamp(7));
				clothesList.add(clothes);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return clothesList;
	}

	
	public List<Clothes> selectListType(Connection conn, String type) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Clothes> clothesList = null;
		String sql= "select * from clothes";
		if(type != null && !type.equals("")) {
			sql += " where clothesType= '"+type.trim()+"'";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			rs  = pstmt.executeQuery(); 
			clothesList = new ArrayList<Clothes>();
			while (rs.next()){
				Clothes clothes = new Clothes();
				clothes.setClothesId(rs.getInt(1));
				clothes.setClothesName(rs.getString(2));
				clothes.setColor(rs.getString(3));
				clothes.setSize(rs.getString(4));
				clothes.setAmount(rs.getInt(5));
				clothes.setPrice(rs.getInt(6));
				clothes.setClothesImage(rs.getString(7));
				clothes.setClothesType(rs.getString(8));
				
				//movie.setAddress(rs.getString(6));
				//movie.setRegisterTime(rs.getTimestamp(7));
				clothesList.add(clothes);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return clothesList;
	}
	/*
	public void update(Connection conn, Clothes clothes) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update clothes set guestname=?,password=?,clothes=?, "
					+ "   registertime=? where clothesId=?");
			pstmt.setString(1, clothes.getGuestName());
			pstmt.setString(2, clothes.getPassword());
			pstmt.setString(3, clothes.getClothes());
			pstmt.setTimestamp(4, new Timestamp(clothes.getRegisterTime().getTime()));
			pstmt.setInt(5, clothes.getClothesId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	

	
	
	*/
}




















