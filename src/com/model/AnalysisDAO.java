package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AnalysisDAO {

	Connection conn = null;
	PreparedStatement psmt = null;		
	ResultSet rs = null;
	int cnt = 0;
	AnalysisDTO a_dto = null;
	AnalysisDTO qua_dto = null;
	ArrayList<AnalysisDTO> list = null;
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
	
	
	
	public AnalysisDTO AnalSales(String name) {
		conn();
		
		try {
			String sql = "select * from AnalSales where HAENGJEONGDONG = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("rs1 : " + rs.getString(1));
				String haengjeongdong  = rs.getString(1);
				String haengjeonggu = rs.getString(2);
				int SalesAmount = rs.getInt(3);
				int MonSales = rs.getInt(4);          
				int TueSales = rs.getInt(5);          
				int WenSales = rs.getInt(6);          
				int ThrSales = rs.getInt(7);          
				int FriSalse = rs.getInt(8);          
				int SatSales = rs.getInt(9);          
				int SunSales = rs.getInt(10);          
				int MaleSales = rs.getInt(11);          
				int FeSalesSales = rs.getInt(12);          
				int age20Sales = rs.getInt(13);          
				int age40Sales = rs.getInt(14);          
				int age60Sales = rs.getInt(15);          
      
				a_dto = new AnalysisDTO(haengjeongdong,haengjeonggu,SalesAmount,MonSales,TueSales,WenSales,ThrSales,FriSalse
						,SatSales,SunSales,MaleSales,FeSalesSales,age20Sales,age40Sales,age60Sales);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return a_dto;
	}

	
	
	
	public ArrayList<AnalysisDTO> QuarterSales(String name) {
		list = new ArrayList<AnalysisDTO>();
		conn();
		System.out.println("리스트 확인 : " + name);
		try {
			String sql = "select * from QuarterSales where HAENGJEONGDONG = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			
			rs = psmt.executeQuery();
			System.out.println("리스트 확인2 : " + rs);
			
			while(rs.next()) {
				System.out.println("행정동 : " + rs.getString(2));
				int id = rs.getInt(1);
				String haengjeongdong  = rs.getString(2);
				int quarter = rs.getInt(3);
				int salesAmount = rs.getInt(4);          
				   
				qua_dto = new AnalysisDTO(id,haengjeongdong,quarter,salesAmount);
				
				list.add(qua_dto);
				
			}
			System.out.println("whilex");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}
	
	
	
}