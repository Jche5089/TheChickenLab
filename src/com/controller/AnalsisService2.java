package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Analsis2DAO;
import com.model.Analysis2DTO;


@WebServlet("/AnalsisService2")
public class AnalsisService2 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("EUC-KR"); 
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		System.out.println("anal2service : " + name);
		String[] array = name.split(",");
		//array[0] : 행정구
		//array[1] : 행정동
		//array[2]  : 구분번호
		
		
		if(array[2].equals("2")) {
			System.out.println("2들어왔다!");
			Analsis2DAO a2Dao = new Analsis2DAO();
			Analysis2DTO a2Dto = a2Dao.a2Select(array[1]);	//행정동 구하기
			ArrayList<Analysis2DTO> qua_dto = new ArrayList<Analysis2DTO>();
			qua_dto = a2Dao.a2guSelect(array[0]);	//행정구 구하기
		
			if (a2Dto != null && qua_dto != null) {
				System.out.println("확인2 :" + qua_dto.get(0).getHaengjeongdong() );
				System.out.println("전송성공2");
				
				HttpSession session = request.getSession(); 
				session.setAttribute("a2Dto", a2Dto); //매출현황
				session.setAttribute("qua_dto2", qua_dto); //분기별매출현황
				response.sendRedirect("analysis2.jsp");
			} else {
				System.out.println("전송실패2!");
			}
		}
		
		
		if(array[2].equals("3")) {
			System.out.println("3들어왔다!");
			Analsis2DAO a2Dao = new Analsis2DAO();
			
			Analysis2DTO a3Dto = a2Dao.a3Select(array[1]);	//행정동 구하기
			
			ArrayList<Analysis2DTO> qua_dto3 = new ArrayList<Analysis2DTO>();
			qua_dto3 = a2Dao.a3guSelect(array[0]);	//행정구 구하기
		
			
			
			
			if (a3Dto != null && qua_dto3 != null) {
				System.out.println("확인3 :" + qua_dto3.get(0).getBungi() );
				System.out.println("전송성공3");
				
				HttpSession session = request.getSession(); 
				session.setAttribute("a3Dto", a3Dto); //매출현황
				session.setAttribute("qua_dto3", qua_dto3); //분기별매출현황
				response.sendRedirect("analysis3.jsp");
			} else {
				System.out.println("전송실패3!");
			}
			
			
		}
		
		
		
		
	}

}
