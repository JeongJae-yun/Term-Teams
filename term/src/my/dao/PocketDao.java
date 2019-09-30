package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Pocket;
import my.util.JdbcUtil;

public class PocketDao {
	
	public void insert(Connection conn, Pocket pocket) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into pocket (id,allprice2,cardId,cardCompany,halbu,soldout,pocketDate,name,phoneNumber,address,memo)"
					+ " values(?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, pocket.getId());
			pstmt.setInt(2, pocket.getAllprice2());
			pstmt.setString(3, pocket.getCardId());
			pstmt.setString(4, pocket.getCardCompany());
			pstmt.setString(5, pocket.getHalbu());
			pstmt.setString(6, pocket.getSoldout());
			pstmt.setTimestamp(7,new Timestamp(pocket.getPocketDate().getTime()));
			pstmt.setString(8, pocket.getName());
			pstmt.setInt(9, pocket.getPhoneNumber());
			pstmt.setString(10, pocket.getAddress());
			pstmt.setString(11, pocket.getMemo());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	/*
	public Pocket selectById(Connection conn, String id) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Pocket pocket = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from pocket where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()){
				pocket = new Pocket(); 
				pocket.setPocketId(rs.getInt(1));
				pocket.setId(rs.getString(2));
				pocket.setClothesId(rs.getInt(3));
				pocket.setAmount(rs.getInt(4));
				pocket.setAllprice(rs.getInt(5));
				pocket.setPocketDate(rs.getTimestamp(6));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return pocket;
	}
	
	public void update(Connection conn, Pocket pocket) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update pocket set guestname=?,password=?,pocket=?, "
					+ "   registertime=? where pocketId=?");
			pstmt.setString(1, pocket.getGuestName());
			pstmt.setString(2, pocket.getPassword());
			pstmt.setString(3, pocket.getPocket());
			pstmt.setTimestamp(4, new Timestamp(pocket.getRegisterTime().getTime()));
			pstmt.setInt(5, pocket.getPocketId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	/*
	public void deleteById(Connection conn, int pocketId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from pocket where pocketId = ?");
			pstmt.setInt(1, pocketId);
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
			rs = stmt.executeQuery("select count(*) from pocket");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}   
	*/
	public List<Pocket> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Pocket> pocketList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from pocket");
			rs  = pstmt.executeQuery(); 
			pocketList = new ArrayList<Pocket>();
			while (rs.next()){
				Pocket pocket = new Pocket();
				pocket.setPocketId(rs.getInt(1));
				pocket.setId(rs.getString(2));
				pocket.setAllprice2(rs.getInt(3));
				pocket.setCardId(rs.getString(4));
				pocket.setCardCompany(rs.getString(5));
				pocket.setHalbu(rs.getString(6));
				pocket.setSoldout(rs.getString(7));
				pocket.setPocketDate(rs.getTimestamp(8));
				pocket.setName(rs.getString(9));
				pocket.setPhoneNumber(rs.getInt(10));
				pocket.setAddress(rs.getString(11));
				pocket.setMemo(rs.getString(12));
				pocketList.add(pocket);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return pocketList;
	}


}



















