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


@WebServlet("/SecessionService")
public class SecessionService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("EUC-KR");
	      String secession = request.getParameter("secession");
	      HttpSession session = request.getSession();
	      
	      MemberDTO dto = (MemberDTO)session.getAttribute("info");
	      response.setContentType("text/html; charset=UTF-8");
	      
	      
	      PrintWriter out = response.getWriter();
	      if(secession.equals("Y")) {
	         MemberDAO dao = new MemberDAO();
	         int cnt = dao.secession(dto);
	         if(cnt > 0) { 
	            session.removeAttribute("info");
	            out.println("<script>alert('È¸¿øÅ»Åð ¼º°ø'); location.href='main.jsp'; </script>");
	            out.flush();
	         }else {
	            out.println("<script>alert('È¸¿øÅ»Åð ½ÇÆÐ'); location.href='main.jsp'; </script>");
	            out.flush();
	         }
	      }else if(secession.equals("N")) {
	         out.println("<script>location.href='main.jsp'; </script>");
	         out.flush();
	      }
	      

	}

}
