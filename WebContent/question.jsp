<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>The Chicken Lab - Menu</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main4.css" />

</head>
<body class="is-preload">

   <%
   MemberDTO info = null;
   info = (MemberDTO) session.getAttribute("info");
   

   %>

   <!-- Wrapper -->
   <div id="wrapper">

      <!-- Main -->
      <div id="main">
         <div class="inner">

            <!-- Header -->
            <header id="header">
               <a href="main.jsp" class="logo"><strong>THE Chicken LAB</strong>
                  for the best quality</a>
            </header>

            
            <section>
               <header class="main">
               </header>

               <div class="image main" style = " width : 100%; height : 339px; background : url(https://www.bbqchangup.co.kr:446/images/common/bg_content_header01.jpg) no-repeat; background-size : 100% auto; overflow : hidden;">
                  <h1 style = "color : #fff; margin : 30px !important;">���͹���</h1>
                  <p style = "color : #fff; margin-left : 30px"> ��ġŲ��â�����������Ҵ� �������� ����â���� ���� �����մϴ�.</p><br>
                  <p style = "color : #fff; margin-left : 30px"> !!!���� ��û�� �����Ŀ� ȸ�� ������ �޴��� ��ȣ�� �����帮�ڽ��ϴ�.!!!</p>
               </div>
               
               
               <h1 style = "font-size : 30px">���Ͱ��ù���</h1>
               <br/>
               <form action="AddQuestionList">
               <table>
               
                  <tr height ='40'>
                     <th align="left" bgcolor = "white">�������</th>
                        <td bgcolor = "white" style = "width : 200px; display : inline-block;" >
                 		<input type="text" name="location">
                        </td>
                  </tr>   
                  
                  <tr height ='40'>
                     <th align="left" bgcolor = "white" >������</th>
                        <td bgcolor = "white">
                           <input type = "text" name="arc" style = "width : 200px; display:inline-block;"><span style= "display: inline-block;"> ��</span>
                        </td>
                  </tr>   
                  <tr height ='40'>
                     <th align="left" bgcolor = "white" >���ǻ���</th>
                     <td bgcolor = "white"><textarea rows='5' cols='70' name="question"></textarea></td>
                    
               </table>
               <input margin-left = "50px" type = "submit" value = "��û�ϱ�">
               </form>
                     
              </section>
         </div>
      </div>
      </div>

      <!-- Sidebar -->
    

   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>

</body>
</html>