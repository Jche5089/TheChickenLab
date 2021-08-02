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


@WebServlet("/UpdateGradeService")
public class UpdateGradeService extends HttpServlet {
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      request.setCharacterEncoding("EUC-KR");
      
      String Grade = request.getParameter("UpGrade");
      String Id = request.getParameter("Id");
      String Password = request.getParameter("Password");
   
      System.out.println(Grade);
      
      // ���� & �� �ε����� ã�´� - �ε��� ��: 2
        int idx = Grade.indexOf("&"); 
        
        // & �պκ��� ����
        // substring�� ù��° ������ �ε����� �������� �ʴ´�.
        // �Ʒ��� ���� ù��° ���ڿ��� k ���� ����ȴ�.
        String updateId = Grade.substring(0, idx);
        
        // �޺κ��� ����
        // �Ʒ� substring�� & �ٷ� �޺κ��� n���� ����ȴ�.
        String updateGrade= Grade.substring(idx+1);
      
        System.out.println("id : "+updateId);
        System.out.println("grade : "+updateGrade);
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      
      MemberDAO dao = new MemberDAO();
      MemberDTO dto = new MemberDTO(updateGrade,updateId,0);
      int cnt = dao.UpdateGrade(dto);
      
      if (cnt > 0) {
         out.println("<script>alert('ȸ����� ���� ����'); location.href='select.jsp'; </script>");
         out.flush();
      } else {
         out.println("<script>alert('ȸ����� ���� ����'); location.href='select.jsp'; </script>");
         out.flush();
      }
   }

}