package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuestionDAO {
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
	
	public int add_question_list(QuestionDTO qdto) {
		conn();
		
		
		try {
			String sql="insert into questions values(que_num_sq.nextval,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, qdto.getUser_id());
			psmt.setString(2, qdto.getLocation());
			psmt.setString(3, qdto.getQue_arc());
			psmt.setString(4, qdto.getQuestion());
			psmt.setString(5, qdto.getUser_tell());
			cnt=psmt.executeUpdate();
			 
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		finally {
			close();
		}
		return cnt;
		
	}
	public ArrayList<QuestionDTO> get_question_list(){
		ArrayList<QuestionDTO> question_list=new ArrayList<QuestionDTO>();
		conn();
		
		try {
			String sql="select * from questions";
			psmt = conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			while(rs.next() ) {
				int num = rs.getInt(1);
				String user_id = rs.getString(2);
				String location = rs.getString(3);
				String que_arc = rs.getString(4);
				String que_que = rs.getString(5);
				String user_tell = rs.getString(6);
				QuestionDTO qdto= new QuestionDTO(num, user_id, location, que_arc, que_que, user_tell);
				question_list.add(qdto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			close();
		}
		return question_list;
	}
	
	public QuestionDTO pass_question(int num) {
		QuestionDTO qdto=null;
		conn();
		
		try {
			String sql="select mem_id, que_adrress, mem_tell from questions where que_num=?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs=psmt.executeQuery();
			if(rs.next()) {
				String mem_id=rs.getString(1);
				String que_adrress=rs.getString(2);
				String mem_tell=rs.getString(3);
				qdto=new QuestionDTO(mem_id, que_adrress,mem_tell);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			close();
		}
		return qdto;
	}
	
	public int deleteQuestion(int num) {
		
		conn();
		
		try {
			String sql="delete from questions where que_num=?";
			psmt= conn.prepareStatement(sql);
			psmt.setInt(1, num);
			cnt=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
