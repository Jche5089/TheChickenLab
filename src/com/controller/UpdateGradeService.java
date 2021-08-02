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
      
      // 먼저 & 의 인덱스를 찾는다 - 인덱스 값: 2
        int idx = Grade.indexOf("&"); 
        
        // & 앞부분을 추출
        // substring은 첫번째 지정한 인덱스는 포함하지 않는다.
        // 아래의 경우는 첫번째 문자열인 k 부터 추출된다.
        String updateId = Grade.substring(0, idx);
        
        // 뒷부분을 추출
        // 아래 substring은 & 바로 뒷부분인 n부터 추출된다.
        String updateGrade= Grade.substring(idx+1);
      
        System.out.println("id : "+updateId);
        System.out.println("grade : "+updateGrade);
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      
      
      MemberDAO dao = new MemberDAO();
      MemberDTO dto = new MemberDTO(updateGrade,updateId,0);
      int cnt = dao.UpdateGrade(dto);
      
      if (cnt > 0) {
         out.println("<script>alert('회원등급 수정 성공'); location.href='select.jsp'; </script>");
         out.flush();
      } else {
         out.println("<script>alert('회원등급 수정 실패'); location.href='select.jsp'; </script>");
         out.flush();
      }
   }

}