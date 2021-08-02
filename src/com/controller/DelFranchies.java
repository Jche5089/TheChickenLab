package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.QuestionDAO;
import com.model.QuestionDTO;


@WebServlet("/DelFranchies")
public class DelFranchies extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int num =Integer.parseInt(request.getParameter("num"));
		QuestionDAO qdao= new QuestionDAO();
		int cnt=qdao.deleteQuestion(num);
		
		PrintWriter out = response.getWriter();
		
		if(cnt>0) {
			out.println("<script>alert('신성삭제 완료!'); location.href='main.jsp'; </script>");
			out.flush();
		}
		else {
			out.println("<script>alert('신청삭제 실패!'); location.href='main.jsp'; </script>");
			out.flush();
			
		}
		
	}

}
