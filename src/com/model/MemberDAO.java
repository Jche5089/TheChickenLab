package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	ResultSet rs = null;
	MemberDTO dto = null;
	ArrayList<MemberDTO> list = null;// db에 있는 모든 회원의 정보를 담기 위해 arraylist가 필요해

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

	public int join(MemberDTO dto) {

		conn();

		try {
			String sql = "insert into members values(?,?,?,?,?,?,?,'C')";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMem_id());
			psmt.setString(2, dto.getMem_pw());
			psmt.setString(3, dto.getMem_name());
			psmt.setInt(4, dto.getMem_dob());
			psmt.setString(5, dto.getMem_add());
			psmt.setString(6, dto.getMem_tell());
			psmt.setString(7, dto.getMem_gender());
			

			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}
	
	public MemberDTO login(MemberDTO dto) {
		MemberDTO loginDto=null;
		
		conn();

		try {
			String sql = "select * from members where mem_id=? and mem_pw=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMem_id());
			psmt.setString(2, dto.getMem_pw());

			rs = psmt.executeQuery();
			
				if (rs.next()) {
					String Id =  rs.getString(1);
					String Password =  rs.getString(2);
					String Username =  rs.getString(3);
					int Birth_Day =  rs.getInt(4);
					String Address = rs.getString(5);
					String Phone_Number =  rs.getString(6);
					String Gender = rs.getString(7);
					String Grade = rs.getString(8);
					
					/* 반환해야 하는 정보가 여러개이기 때문에 캡슐화를 씀-- 나중에 쓸 수도 있으니 우선 넘겨주기로..,, */
					loginDto = new MemberDTO(Id, Password, Username, Birth_Day, Address,Phone_Number ,Gender ,Grade);
				}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return loginDto;

	}
	
	public ArrayList<MemberDTO> select() {
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
		
		conn();
		
		
		try {
			String sql = "select * from members ";
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				String id= rs.getString(1);
				String pw= rs.getString(2);
				String name= rs.getString(3);
				int dob= Integer.parseInt(rs.getString(4)) ;
				String add= rs.getString(5);
				String tell= rs.getString(6);
				String gender= rs.getString(7);
				String grade= rs.getString(8);
				
				dto=new MemberDTO(id,pw,name,dob,add,tell,gender,grade);
				
				memberList.add(dto);
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			close();
		}
		
		return memberList;
		
		
		
	}
	
	public int update(String pw, String tell, String add, String id) {
		conn();
		   try {
		         String sql = "update members set mem_pw=?, mem_tell =?, mem_add =? where mem_id= ?";
		         
		         
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, pw);
		         psmt.setString(2, tell);
		         psmt.setString(3, add);
		         psmt.setString(4, id);
		         cnt = psmt.executeUpdate();
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }finally {
		         close();
		      }
		      
		      return cnt;
		   }
	
	public int secession(MemberDTO dto) {
	      conn();
	      
	      
	      try {
	    	 String sql = "delete from members where Mem_id=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, dto.getMem_id());
	         cnt = psmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close();
	      }
	      
	      return cnt;
	}
	
	public int UpdateGrade(MemberDTO dto) {

	      conn();

	      try {
	         String sql = "update members set mem_grade=? where mem_id=?";

	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, dto.getMem_grade());
	         psmt.setString(2, dto.getMem_id());

	         cnt = psmt.executeUpdate();

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return cnt;

	   }



	

	
}
