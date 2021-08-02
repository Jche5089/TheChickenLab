package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.model.StocksDAO;
import com.model.StocksDTO;


@WebServlet("/StocksService")
public class StocksService extends HttpServlet {


	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		HttpSession session = request.getSession();
		
	
		
		int a = Integer.parseInt(request.getParameter("0"));
		int b = Integer.parseInt(request.getParameter("1"));
		int c = Integer.parseInt(request.getParameter("2"));
		int d = Integer.parseInt(request.getParameter("3"));
		int e = Integer.parseInt(request.getParameter("4"));
		int f = Integer.parseInt(request.getParameter("5"));
		int g = Integer.parseInt(request.getParameter("6"));
		
		System.out.println("a" + a);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		StocksDTO[] saveto = new StocksDTO[7]; //货酚霸 函版等 蔼
		
		ArrayList<StocksDTO> dtolist = new ArrayList<StocksDTO>();
		saveto[0] = new StocksDTO(1,1,"积催",3000,a);
		saveto[1] = new StocksDTO(1,2,"积催",3000,b);
		saveto[2] = new StocksDTO(1,3,"积催",3000,c);
		saveto[3] = new StocksDTO(1,4,"积催",3000,d);
		saveto[4] = new StocksDTO(1,5,"积催",3000,e);
		saveto[5] = new StocksDTO(1,6,"积催",3000,f);
		saveto[6] = new StocksDTO(1,7,"积催",3000,g);
		
		dtolist.add(saveto[0]);
		dtolist.add(saveto[1]);
		dtolist.add(saveto[2]);
		dtolist.add(saveto[3]);
		dtolist.add(saveto[4]);
		dtolist.add(saveto[5]);
		dtolist.add(saveto[6]);
		
		StocksDAO dao = new StocksDAO();
		
		int cnt = 0;
		for(int i=0; i<saveto.length;i++) {
			 cnt = dao.save(dtolist,i);
		}
		System.out.println("cnt" +cnt);
				
		if(cnt>0) {
		
			session.setAttribute("saveto",saveto);
			out.println("<script>alert('历厘己傍'); location.href='main.jsp'; </script>");
			out.flush();
			
			
		}else {
			out.println("<script>alert('历厘角菩'); location.href='main.jsp'; </script>");
			out.flush();
		}
	}

}
