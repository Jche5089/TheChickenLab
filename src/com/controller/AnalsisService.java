package com.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.AnalysisDAO;
import com.model.AnalysisDTO;

@WebServlet("/AnalsisService")
public class AnalsisService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<AnalysisDTO> qua_dto = new ArrayList<AnalysisDTO>();
		
		String dongName = request.getParameter("name");

		dongName = URLDecoder.decode(dongName, "utf-8");

		System.out.println(dongName);

		AnalysisDAO a_dao = new AnalysisDAO();

		AnalysisDTO anal_dto = a_dao.AnalSales(dongName);
		qua_dto = a_dao.QuarterSales(dongName);
		
		System.out.println("������ : " + qua_dto.get(0).getHaengjeonggu());
		
		
		if (anal_dto != null && qua_dto != null) {
			System.out.println("���ۼ���");
			
			HttpSession session = request.getSession(); 
			session.setAttribute("anal", anal_dto); //������Ȳ
			session.setAttribute("quar", qua_dto); //�б⺰������Ȳ
			response.sendRedirect("analysis.jsp");
		} else {
			System.out.println("���۽���!");
		}
	}

}
