package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FranchiesDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt=0;
	
	
	public void conn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public void close() {

		try {
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public int addFranchies(String id, String add, String tell) {
		
		conn();
		
		try {
			String sql="insert into franchises values(frc_num_sq.nextval,?,?,?)";
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, add);
			psmt.setString(3, tell);
			cnt=psmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			close();
		}
		return cnt;
	
		
	}
	
	public int select_franchies_id(String userId) {
		int franchies_id=0;
		conn();
		
		try {
			String sql="select frc_num from franchises where mem_id=?";
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, userId);
			rs=psmt.executeQuery();
			if(rs.next()) {
				franchies_id=rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			close();
			
		}
		
		return franchies_id;
	}
	
	
	
	

}
