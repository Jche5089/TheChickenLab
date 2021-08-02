package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

	public class StocksDAO {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int cnt = 0;
		ResultSet rs = null;
		StocksDTO info = null;
		ArrayList<StocksDTO> list = null;

		
		
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
		
		


	public ArrayList<StocksDTO> select() {// db에 있는 모든 회원의 정보를 가져옴

	    // Arraylist를 while문에 넣어주면 계속 초기화되기 때문에 밖에서 선언해야 함
	    list = new ArrayList<StocksDTO>();// ArrayList객체 선언

	    conn();

	    try {
	       String sql = "select * from article";
	       psmt = conn.prepareStatement(sql);

	       rs = psmt.executeQuery();

	       while (rs.next()) {
	         
			   int frc_num = 1; 
	    	   int art_id = rs.getInt(2);
	    	   String art_name = rs.getString(3);
	    	   int art_price = rs.getInt(4);
	    	   int art_stock = rs.getInt(5);
	          

	          info = new StocksDTO(frc_num,art_id, art_name, art_price, art_stock);

	          list.add(info);// list에 info를 차곡차곡 넣어줌

	       }

	    } catch (SQLException e) {
	       e.printStackTrace();
	    } finally {
	       close();
	    }
	    return list;

	 }
	
	
	
	public int save(ArrayList<StocksDTO> sto, int i) {

		conn();
		
			try {
	
				String sql = "insert into article values(?,?,?,?,?)"; //매장 번호 추가
	
				System.out.println("sto[i].getArt_id() : " + sto.get(0).getArt_name());
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, 1);
				psmt.setInt(2, sto.get(i).getArt_id());
				psmt.setString(3, sto.get(i).getArt_name());
				psmt.setInt(4, sto.get(i).getArt_price());
				psmt.setInt(5, sto.get(i).getArt_stock());
				
				cnt = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
		
		
		return cnt;

	}
	}
	 

