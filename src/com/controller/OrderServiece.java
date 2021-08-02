package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.FranchiesDAO;
import com.model.MemberDTO;
import com.model.OrdersDAO;
import com.model.OrdersDTO;


@WebServlet("/OrderServiece")
public class OrderServiece extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * private int frc_num; 
		 * private int art_id; 
		 * private int order_count; 
		 * private int total_price;
		 */
		request.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		MemberDTO dto= (MemberDTO)session.getAttribute("info");
		String userId=dto.getMem_id();
		FranchiesDAO fdao= new  FranchiesDAO();
		
		
		int frc_num=fdao.select_franchies_id(userId);
	
		int art_id_one=Integer.parseInt(request.getParameter("1")) ;
		int art_id_two=Integer.parseInt(request.getParameter("2")) ;
		int art_id_three=Integer.parseInt(request.getParameter("3")) ;
		int art_id_four=Integer.parseInt(request.getParameter("4")) ;
		int art_id_five=Integer.parseInt(request.getParameter("5")) ;
		int art_id_six=Integer.parseInt(request.getParameter("6")) ;
		int art_id_seven=Integer.parseInt(request.getParameter("7")) ;
	
		
		int order_count_chicken=Integer.parseInt(request.getParameter("chicken_count")) ;
		int order_count_oil=Integer.parseInt(request.getParameter("oil_count")) ;
		int order_count_daikon=Integer.parseInt(request.getParameter("doikon_count")) ;
		int order_count_powder=Integer.parseInt(request.getParameter("powder_count")) ;
		int order_count_beer=Integer.parseInt(request.getParameter("bear_count")) ;
		int order_count_soju=Integer.parseInt(request.getParameter("soju_count")) ;
		int order_count_sauce=Integer.parseInt(request.getParameter("sauce_count")) ;
		
		
		int total_price_one=Integer.parseInt(request.getParameter("partOne")) ;
		int total_price_two=Integer.parseInt(request.getParameter("partTwo")) ;
		int total_price_three=Integer.parseInt(request.getParameter("partThree")) ;
		int total_price_four=Integer.parseInt(request.getParameter("partFour")) ;
		int total_price_five=Integer.parseInt(request.getParameter("partFive")) ;
		int total_price_six=Integer.parseInt(request.getParameter("partSix")) ;
		int total_price_seven=Integer.parseInt(request.getParameter("partSeven")) ;
		
		
		System.out.println("»Æ¿Œ : " + art_id_one);
		OrdersDAO odao=new OrdersDAO();
	
		OrdersDTO odto1=new OrdersDTO(frc_num, art_id_one, order_count_chicken, total_price_one);
		OrdersDTO odto2=new OrdersDTO(frc_num, art_id_two, order_count_oil, total_price_two);
		OrdersDTO odto3=new OrdersDTO(frc_num, art_id_three, order_count_daikon, total_price_three);
		OrdersDTO odto4=new OrdersDTO(frc_num, art_id_four, order_count_powder, total_price_four);
		OrdersDTO odto5=new OrdersDTO(frc_num, art_id_five, order_count_beer, total_price_five);
		OrdersDTO odto6=new OrdersDTO(frc_num, art_id_six, order_count_soju, total_price_six);
		OrdersDTO odto7=new OrdersDTO(frc_num, art_id_seven, order_count_sauce, total_price_seven);
		
		ArrayList<OrdersDTO> Order_list=new ArrayList<OrdersDTO>();
		
		Order_list.add(odto1);
		Order_list.add(odto2);
		Order_list.add(odto3);
		Order_list.add(odto4);
		Order_list.add(odto5);
		Order_list.add(odto6);
		Order_list.add(odto7);
		
		for(int i=0; i<Order_list.size();i++) {
			odao.addOrder(Order_list.get(i));
		}
		
		
	}

}
