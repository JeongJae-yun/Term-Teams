package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Clothes;
import my.model.Opinion;

import my.util.JdbcUtil;

public class OpinionDao {
	
	public void insert(Connection conn, Opinion opinion) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into opinion (title1,userName1,userId1,cate1,story1,registerTime)"
					+ " values(?,?,?,?,?,?)");
			pstmt.setString(1, opinion.getTitle1());
			pstmt.setString(2, opinion.getUserName1());
			pstmt.setString(3, opinion.getUserId1());
			pstmt.setString(4, opinion.getCate1());
			pstmt.setString(5, opinion.getStory1());
			pstmt.setTimestamp(6, new Timestamp(opinion.getRegisterTime().getTime()));
			
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}

	
	
	public Opinion selectById(Connection conn, int opinionId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Opinion opinion = null;
		try {
			pstmt = conn.prepareStatement
			("select * from opinion where opinionId = ?");
			pstmt.setInt(1, opinionId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				opinion = new Opinion(); 
				opinion.setOpinionId(rs.getInt(1));
				opinion.setTitle1(rs.getString(2));
				opinion.setUserName1(rs.getString(3));
				opinion.setUserId1(rs.getString(4));
				opinion.setCate1(rs.getString(5));
				opinion.setStory1(rs.getString(6));
				opinion.setRegisterTime(rs.getTimestamp(7));
				
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return opinion;
	}
	

	public void updateAccessCount(Connection conn, int opinionId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update opinion set accessCount=accessCount+1 where opinionId=?");
			pstmt.setInt(1, opinionId);
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	/*
	
	public String selectPasswordById(Connection conn, String id) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		String password = null;
		try {
			pstmt = conn.prepareStatement
			("select password from opinion where id = ?");
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
	
	
	/*
	public void update(Connection conn, Opinion opinion) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update opinion set guestname=?,password=?,opinion=?, "
					+ "   registertime=? where opinionId=?");
			pstmt.setString(1, opinion.getGuestName());
			pstmt.setString(2, opinion.getPassword());
			pstmt.setString(3, opinion.getOpinion());
			pstmt.setTimestamp(4, new Timestamp(opinion.getRegisterTime().getTime()));
			pstmt.setInt(5, opinion.getOpinionId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int opinionId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from opinion where opinionId = ?");
			pstmt.setInt(1, opinionId);
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
			rs = stmt.executeQuery("select count(*) from opinion");
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}

*/	
	public List<Opinion> selectList(Connection conn, String keyField, String keyword) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Opinion> opinionList = null;
		String sql= "select * from opinion";
		if(keyword != null && !keyword.equals("")) {
			sql += " where "+keyField.trim()+" like '%"+keyword.trim()+"%'";
		}
		try {
			pstmt = conn.prepareStatement
					(sql);
			rs  = pstmt.executeQuery(); 
			opinionList = new ArrayList<Opinion>();
			while (rs.next()){
				Opinion opinion = new Opinion();
				opinion.setOpinionId(rs.getInt(1));
				opinion.setTitle1(rs.getString(2));
				opinion.setUserName1(rs.getString(3));
				opinion.setUserId1(rs.getString(4));
				opinion.setCate1(rs.getString(5));
				opinion.setStory1(rs.getString(6));
				opinion.setRegisterTime(rs.getTimestamp(7));
				opinion.setAccesscount(rs.getInt(8));
				opinionList.add(opinion);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return opinionList;
	}
	/*
	public List<Opinion> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Opinion> opinionList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from opinion");
			rs  = pstmt.executeQuery(); 
			opinionList = new ArrayList<Opinion>();
			while (rs.next()){
				Opinion opinion = new Opinion();
				opinion.setOpinionId(rs.getInt(1));
				opinion.setTitle1(rs.getString(2));
				opinion.setUserName1(rs.getString(3));
				opinion.setUserId1(rs.getString(4));
				opinion.setCate1(rs.getString(5));
				opinion.setStory1(rs.getString(6));
				opinion.setRegisterTime(rs.getTimestamp(7));
				opinionList.add(opinion);
			}
		} finally {
			JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return opinionList;
	}
*/
}




















