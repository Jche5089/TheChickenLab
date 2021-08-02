package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDTO;
import com.model.QuestionDAO;
import com.model.QuestionDTO;


@WebServlet("/AddQuestionList")
public class AddQuestionList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session=request.getSession();
		
		MemberDTO info = (MemberDTO) session.getAttribute("info");
		System.out.println(info.getMem_id());
		System.out.println(info.getMem_tell());
		
		String user_id=info.getMem_id();
		String location=request.getParameter("location");
		String que_arc=request.getParameter("arc"); //»Ò∏¡ ∆Úºˆ
		String question=request.getParameter("question");
		String user_tell=info.getMem_tell();	
		System.out.println(user_tell);
		
		
		QuestionDTO qdto=new QuestionDTO(user_id, location, que_arc, question, user_tell);
		QuestionDAO qdao=new QuestionDAO();
		int cnt=qdao.add_question_list(qdto);
		
		PrintWriter out=response.getWriter();
		if(cnt > 0) { 
            out.println("<script>alert('∞°∏ÕΩ≈√ª øœ∑·'); location.href='main.jsp'; </script>");
            out.flush();
        }else {
            out.println("<script>alert('∞°∏ÕΩ≈√ª Ω«∆–'); location.href='main.jsp'; </script>");
            out.flush();
        }
	}

}
