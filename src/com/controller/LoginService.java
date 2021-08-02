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


@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		
		String Id = request.getParameter("Id");
		String Password = request.getParameter("Password");

		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(Id, Password);
		MemberDTO user =null;
		user=dao.login(dto);
		
		
			
		if (user != null) {
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			session.setAttribute("info",user);

			out.println("<script>alert('로그인 성공'); location.href='main.jsp'; </script>");
			out.flush();
			
		} else {
			System.out.println("로그인 실패");
			
			out.println("<script>alert('로그인 실패'); location.href='main.jsp'; </script>");
			out.flush();
		}
		//response.sendRedirect("main.jsp");


	}
		
	

}
