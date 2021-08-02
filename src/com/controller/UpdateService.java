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


@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		String pw=request.getParameter("pw");
		String addr=request.getParameter("addr");
		String tell=request.getParameter("tel");
		
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session=request.getSession();
		MemberDTO user=(MemberDTO)session.getAttribute("info");
		
		String id=user.getMem_id();
		
		MemberDAO dao=new MemberDAO();
		
		int cnt=dao.update(pw, tell, addr, id);
		PrintWriter out = response.getWriter();
		
		MemberDTO dto = new MemberDTO(id, pw);
		MemberDTO changeUser =null;
		changeUser=dao.login(dto);
		
		if (cnt > 0) {
			
			System.out.println("회원정보수정 성공");
			session.setAttribute("info",changeUser);
			out.println("<script>alert('♡ 회원정보 수정 완료 ♡'); location.href='main.jsp'; </script>");
			out.flush();
			
		} else {
			System.out.println("회원가입 실패");
			out.println("<script>alert('회원정보 수정 실패'); location.href='main.jsp'; </script>");
			out.flush();
		}
		
	}

}
