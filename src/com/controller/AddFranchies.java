package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.FranchiesDAO;
import com.model.QuestionDAO;
import com.model.QuestionDTO;


@WebServlet("/AddFranchies")
public class AddFranchies extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=UTF-8");
		int num =Integer.parseInt(request.getParameter("num"));
		QuestionDAO qdao= new QuestionDAO();
		QuestionDTO qdto=null;
		qdto=qdao.pass_question(num);
		
		String id=qdto.getUser_id();
		String add=qdto.getLocation();
		String tell=qdto.getUser_tell();
		
		FranchiesDAO fdao=new FranchiesDAO();
		int addFran=fdao.addFranchies(id, add, tell);
		int cnt=qdao.deleteQuestion(num);
		
		PrintWriter out = response.getWriter();
		
		
		if(cnt>0 && addFran>0) {
			out.println("<script>alert('가맹점 추가 완료!'); location.href='main.jsp'; </script>");
			out.flush();
		}
		else {
			out.println("<script>alert('가맹점 추가 완료!'); location.href='main.jsp'; </script>");
			out.flush();
		}
		
	}

}
