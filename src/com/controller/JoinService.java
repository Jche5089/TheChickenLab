package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		request.setCharacterEncoding("EUC-KR");
		String Id = request.getParameter("Id");
		String Password = request.getParameter("Password");
		String Username = request.getParameter("Username");
		int Birth_Day = Integer.parseInt(request.getParameter("Birth_Day"));
		String Address = request.getParameter("Address");
		String Phone_Number = request.getParameter("Phone_Number");
		String Gender = request.getParameter("Gender");
		
		
		//response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(Id, Password, Username, Birth_Day, Address, Phone_Number, Gender );
		int cnt = dao.join(dto);

		if (cnt > 0) {
			System.out.println("회원가입 성공"); 			
			out.println("<script>alert('♡ 회원가입을 축하합니다 ♡'); location.href='main.jsp'; </script>");
			out.flush();
			
		} else {
			System.out.println("회원가입 실패");
			
			out.println("<script>alert('회원가입 실패'); location.href='main.jsp'; </script>");
			out.flush();
		}
		
	
	}

}
