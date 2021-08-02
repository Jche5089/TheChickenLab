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
		//array[0] : ������
		//array[1] : ������
		//array[2]  : ���й�ȣ
		
		
		if(array[2].equals("2")) {
			System.out.println("2���Դ�!");
			Analsis2DAO a2Dao = new Analsis2DAO();
			Analysis2DTO a2Dto = a2Dao.a2Select(array[1]);	//������ ���ϱ�
			ArrayList<Analysis2DTO> qua_dto = new ArrayList<Analysis2DTO>();
			qua_dto = a2Dao.a2guSelect(array[0]);	//������ ���ϱ�
		
			if (a2Dto != null && qua_dto != null) {
				System.out.println("Ȯ��2 :" + qua_dto.get(0).getHaengjeongdong() );
				System.out.println("���ۼ���2");
				
				HttpSession session = request.getSession(); 
				session.setAttribute("a2Dto", a2Dto); //������Ȳ
				session.setAttribute("qua_dto2", qua_dto); //�б⺰������Ȳ
				response.sendRedirect("analysis2.jsp");
			} else {
				System.out.println("���۽���2!");
			}
		}
		
		
		if(array[2].equals("3")) {
			System.out.println("3���Դ�!");
			Analsis2DAO a2Dao = new Analsis2DAO();
			
			Analysis2DTO a3Dto = a2Dao.a3Select(array[1]);	//������ ���ϱ�
			
			ArrayList<Analysis2DTO> qua_dto3 = new ArrayList<Analysis2DTO>();
			qua_dto3 = a2Dao.a3guSelect(array[0]);	//������ ���ϱ�
		
			
			
			
			if (a3Dto != null && qua_dto3 != null) {
				System.out.println("Ȯ��3 :" + qua_dto3.get(0).getBungi() );
				System.out.println("���ۼ���3");
				
				HttpSession session = request.getSession(); 
				session.setAttribute("a3Dto", a3Dto); //������Ȳ
				session.setAttribute("qua_dto3", qua_dto3); //�б⺰������Ȳ
				response.sendRedirect("analysis3.jsp");
			} else {
				System.out.println("���۽���3!");
			}
			
			
		}
		
		
		
		
	}

}
