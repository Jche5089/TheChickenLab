package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.OrdersDAO;
import com.model.OrdersDTO;


@WebServlet("/OrderListService")
public class OrderListService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		OrdersDAO dao = new OrdersDAO();
		
		ArrayList<OrdersDTO> list = new ArrayList<OrdersDTO>();
		list = dao.ListSelect();
		
		
		System.out.println("확인 : " + list.get(0).getTotal_price());
		if (list != null) {
			HttpSession session = request.getSession(); 
			session.setAttribute("ListSelct", list); //매출현황
			
			response.sendRedirect("order_list.jsp");
			
		} else {
			System.out.println("전송실패!");
		}
		
		
		
		
		
		
		
		
	}

}
