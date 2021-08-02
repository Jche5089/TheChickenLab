package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Analsis2DAO {
	Connection conn = null;
	PreparedStatement psmt = null;		
	ResultSet rs = null;
	int cnt = 0;
	Analysis2DTO a_dto = null;
	Analysis2DTO qua_dto2 = null;
	ArrayList<Analysis2DTO> list = null;
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
				if(rs != null) {
					rs.close();
				} 
				if(psmt != null) {
					psmt.close();
				} 
				if(conn != null) {
					conn.close();
				} 
				
		}catch (Exception e) {
				e.printStackTrace();
		}
			
	}
	
	
	
	public Analysis2DTO a2Select(String name) {
		conn();
		
		try {
			String sql = "select * from Anal2 where HAENGJEONGDONG = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("rs2 : " + rs.getString(2));
				String haengjeongdong  = rs.getString(1);
				String haengjeonggu = rs.getString(2);
			    int chickenNum = rs.getInt(3);
			    int bistroNum  =rs.getInt(4);
			    int facilityNum  =rs.getInt(5);
			    int bistroPm  =rs.getInt(6);
			    int facilityPm   =rs.getInt(7);
      
				a_dto = new Analysis2DTO(haengjeongdong,haengjeonggu,chickenNum,bistroNum,facilityNum,bistroPm,facilityPm);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return a_dto;
	}

	
	
	
	public ArrayList<Analysis2DTO> a2guSelect(String name) {
		list = new ArrayList<Analysis2DTO>();
		conn();
		System.out.println("행정구 확인 : " + name);
		try {
			String sql = "select * from Anal2 where haengjeonggu = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);	
			rs = psmt.executeQuery();
	
			
			while(rs.next()) {
				System.out.println("rs3 : " + rs.getString(2));
				String haengjeongdong  = rs.getString(1);
				String haengjeonggu = rs.getString(2);
			    int chickenNum = rs.getInt(3);
			    int bistroNum  =rs.getInt(4);
			    int facilityNum  =rs.getInt(5);
			    int bistroPm  =rs.getInt(6);
			    int facilityPm   =rs.getInt(7);
      
			    qua_dto2 = new Analysis2DTO(haengjeongdong,haengjeonggu,chickenNum,bistroNum,facilityNum,bistroPm,facilityPm);

				list.add(qua_dto2);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}


	public Analysis2DTO a3Select(String name) {
		conn();
		System.out.println("행정동 확인 : " + name);
		try {
			String sql = "select * from Rent where HAENGJEONGDONG = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("rs3 : " + rs.getString(2));
				String haengjeongdong  = rs.getString(1);
				String haengjeonggu = rs.getString(2);
			    int bungi = rs.getInt(3);
			    int rentPm = rs.getInt(4);
			    int gagusu = rs.getInt(5);
			    int gagusPm = rs.getInt(6);
      
				a_dto = new Analysis2DTO(haengjeongdong,haengjeonggu,bungi,rentPm,gagusu,gagusPm);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return a_dto;
	}


	public ArrayList<Analysis2DTO> a3guSelect(String name) {
		list = new ArrayList<Analysis2DTO>();
		conn();
		System.out.println("행정구 확인3 : " + name);
		try {
			String sql = "select * from Rent where haengjeonggu = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);	
			rs = psmt.executeQuery();
	
			
			while(rs.next()) {
				System.out.println("rs3 : " + rs.getString(2));
				String haengjeongdong  = rs.getString(1);
				String haengjeonggu = rs.getString(2);
			    int bungi = rs.getInt(3);
			    int rentPm = rs.getInt(4);
			    int gagusu = rs.getInt(5);
			    int gagusPm = rs.getInt(6);
      
			    qua_dto2 = new Analysis2DTO(haengjeongdong,haengjeonggu,bungi,rentPm,gagusu,gagusPm);

				list.add(qua_dto2);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	
}
