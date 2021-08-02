package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrdersDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	ArrayList<OrdersDTO> list = null;
	OrdersDTO info = null;
	
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
	
	public int addOrder(OrdersDTO odto) {
		conn();
		
		try {
			String sql="insert into order_article values(1,?,?,?)";
			psmt=conn.prepareStatement(sql);
			
			System.out.println("»Æ¿Œ2"+odto.getFrc_num());
			//psmt.setInt(1,odto.getFrc_num());
			psmt.setInt(1,odto.getArt_id());
			psmt.setInt(2,odto.getOrder_count());
			psmt.setInt(3,odto.getTotal_price());
			cnt=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return cnt;
	}
	
	
	public ArrayList<OrdersDTO> select() {
	      
	      conn();
	      list = new ArrayList<OrdersDTO>();
	      
	      try {
	         
	         String sql = "select * from order_article";
	         psmt = conn.prepareStatement(sql);
	         rs = psmt.executeQuery();
	         
	         while(rs.next()) {
	            int frc_num = rs.getInt(1);
	            int art_id = rs.getInt(2);
	            int order_count = rs.getInt(3);
	            int total_price = rs.getInt(4);
	            
	            info = new OrdersDTO(frc_num, art_id, order_count, total_price);
	            list.add(info);
	         }
	         
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	   return list;   
	   }

	
	
public ArrayList<OrdersDTO> ListSelect() {
		
		conn();
		list = new ArrayList<OrdersDTO>();
		
		try {
			
			String sql = "select * from order_article";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				int frc_num = rs.getInt(1);
				int art_id = rs.getInt(2);
				int order_count = rs.getInt(3);
				int total_price = rs.getInt(4);
				
				info = new OrdersDTO(frc_num, art_id, order_count, total_price);
				list.add(info);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
	return list;	
	}

}
