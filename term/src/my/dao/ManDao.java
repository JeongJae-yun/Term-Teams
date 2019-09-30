package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Man;

import my.util.JdbcUtil;

public class ManDao {
	
	public void insert(Connection conn, Man man) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into man (id,password,name,phoneNumber,email,email2,agree,address)"
					+ " values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, man.getId());
			pstmt.setString(2, man.getPassword());
			pstmt.setString(3, man.getName());
			pstmt.setString(4, man.getPhoneNumber());
			pstmt.setString(5, man.getEmail());
			pstmt.setString(6, man.getEmail2());
			pstmt.setString(7, man.getAgree());
			pstmt.setString(8, man.getAddress());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	
	
	public String selectPasswordById(Connection conn, String id) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		String password = null;
		try {
			pstmt = conn.prepareStatement
			("select password from man where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()){
				password = rs.getString(1);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return password;
	} 
	
	public Man selectById(Connection conn, String id) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Man man = null;
		try {
			pstmt = conn.prepareStatement
			("select * from man where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()){
				man = new Man();
				man.setManId(rs.getInt(1));
				man.setId(rs.getString(2));
				man.setPassword(rs.getString(3));
				man.setName(rs.getString(4));
				man.setPhoneNumber(rs.getString(5));				
				man.setEmail(rs.getString(6));
				man.setEmail2(rs.getString(7));
				man.setAgree(rs.getString(8));
				man.setAddress(rs.getString(9));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return man;
	}
	/*
	public void update(Connection conn, Man man) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update man set guestname=?,password=?,man=?, "
					+ "   registertime=? where manId=?");
			pstmt.setString(1, man.getGuestName());
			pstmt.setString(2, man.getPassword());
			pstmt.setString(3, man.getMan());
			pstmt.setTimestamp(4, new Timestamp(man.getRegisterTime().getTime()));
			pstmt.setInt(5, man.getManId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int manId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from man where manId = ?");
			pstmt.setInt(1, manId);
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
			rs = stmt.executeQuery("select count(*) from man");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}

*/	
	public List<Man> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Man> manList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from man");
			rs  = pstmt.executeQuery(); 
			manList = new ArrayList<Man>();
			while (rs.next()){
				Man man = new Man();
				man.setManId(rs.getInt(1));
				man.setId(rs.getString(2));
				man.setPassword(rs.getString(3));
				man.setName(rs.getString(4));
				man.setPhoneNumber(rs.getString(5));
				man.setEmail(rs.getString(6));
				man.setEmail2(rs.getString(7));
				man.setAgree(rs.getString(8));
				man.setAddress(rs.getString(9));
				manList.add(man);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return manList;
	}

}




















