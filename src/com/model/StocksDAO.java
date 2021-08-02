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
		
		


	public ArrayList<StocksDTO> select() {// db�� �ִ� ��� ȸ���� ������ ������

	    // Arraylist�� while���� �־��ָ� ��� �ʱ�ȭ�Ǳ� ������ �ۿ��� �����ؾ� ��
	    list = new ArrayList<StocksDTO>();// ArrayList��ü ����

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

	          list.add(info);// list�� info�� �������� �־���

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
	
				String sql = "insert into article values(?,?,?,?,?)"; //���� ��ȣ �߰�
	
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
	 

