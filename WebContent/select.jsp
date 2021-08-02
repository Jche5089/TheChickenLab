<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>The Coffee Lab</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main4.css" />
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="assets/css/login.css" />

</head>
<body class="is-preload">
   <%
   MemberDTO info = null;
   info = (MemberDTO)session.getAttribute("info");
   MemberDAO dao = new MemberDAO();
   ArrayList<MemberDTO> list = dao.select();
   
   /* 키info의 value는 loginDto임. 즉 info는 MemberDTO형임 */
   
   /* MessageDAO dao = new MessageDAO();
   ArrayList<MessageDTO>mlist = null;
   
   if(info !=null){
      mlist = dao.select(info.getMem_id());
   } */

   %>


   <!-- Wrapper -->
   <div id="wrapper">

      <!-- Main -->
      <div id="main">
         <div class="inner">

            <!-- Header -->
            <header id="header">
               <a href="main.jsp" class="logo"><strong>THE CHICKEN LAB</strong>
                  for the best quality</a>
              
            </header>

            <!-- Banner -->
            <section id="banner">
               <div class="content">
                  <header>
                     <center><h2>회원정보관리</h2></center>
                  </header>
                  <!-- <form action="UpdateGradeService"> -->
                  <table>
                     <tr>
                     <td>아이디</td>
                     <td>비밀번호</td>
                     <td>이름</td>
                     <td>생년월일</td>
                     <td>주소</td>
                     <td>전화번호</td>
                     <td>성별</td>
                     <td>등급</td>
                     <td>수정될 등급</td>
               
                     </tr>
                     <%for (int i = 0; i < list.size(); i++) {%>
                     <form action="UpdateGradeService">
      
                     <tr>
                        <td><%=list.get(i).getMem_id()%></td>
                        <td><%=list.get(i).getMem_pw()%></td>
                        <td><%=list.get(i).getMem_name()%></td>
                        <td><%=list.get(i).getMem_dob()%></td>
                        <td><%=list.get(i).getMem_add()%></td>
                        <td><%=list.get(i).getMem_tell()%></td>
                        <td><%=list.get(i).getMem_gender()%></td>
                        <td><%=list.get(i).getMem_grade()%></td>
                        <td>
                        
                        <%-- <%MemberDTO updateDto = null;%> --%>
         
                           <div>
                              <select class="form-control" name="UpGrade" aria-label="등급">
                                    <option selected>등급수정</option>
                                    <option value="<%=list.get(i).getMem_id()+"&A"%>">A</option>
                                    <option value="<%=list.get(i).getMem_id()+"&B"%>">B</option>
                                    <option value="<%=list.get(i).getMem_id()+"&C"%>">C</option>
                              </select>
                              <input type="submit" name="UpGrade" value="등급 수정 완료" >
                           </div>
                        </td>
                     </tr>
                     </form>
                     <%}%>
                     
                  </table>
                  <center><a href="main.jsp" class="button next scrolly">되돌아가기</a></center>   
                  <!-- </form> -->
                  
               </div>
               
            </section>

         </div>
      </div>

      <!-- Sidebar -->
      <div id="sidebar" bgcolor="#008080">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="brandstory.jsp">브랜드 스토리</a></li>
						<li><a href="menu.jsp">메뉴 소개</a></li>
						
						<%if (info != null) {%>
						<%if (info.getMem_id().equals("admin")){ %>
						<li><span class="opener">데이터 분석 LAB</span>
							<ul>
								<li><a href="mat_map.jsp">상권분석</a></li>
							</ul>
						</li>
						<li><a href="select.jsp">회원관리</a></li>
						<li><a href="order_list.jsp">발주신청내역</a></li>
						<li><a href="questionAdmin.jsp">가맹신청내역</a></li>
						
						<%} else{%>
						<li><span class="opener">데이터 분석 LAB</span>
							<ul>
								<li><a href="mat_map.jsp">상권분석</a></li>
							</ul>
						</li>
						<%if (info.getMem_grade().equals("B")) {%>
						<li><a href="stock.jsp">재고관리</a></li>
						<li><a href="order.jsp">발주신청</a></li>
						<%}%>
						
						<li><a href="question.jsp">가맹문의</a></li>
						<li><span class="opener">마이페이지</span>
							<ul>
								 <li><a href="#update" class="trigger-btn" data-toggle="modal">회원정보수정</a>
                     <div id="update" class="modal fade">
                        <div class="modal-dialog modal-login">
                           <div class="modal-content">
                              <div class="modal-header">
                                 <h4 class="modal-title">Member Update</h4>
                                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                              </div>
                              <div class="modal-body">
                                 <form action="UpdateService" method="post">
                                 
                                    <div class="form-group">
                                       <i class="fa fa-lock"></i> 
                                       <input type="password" class="form-control" 
                                       placeholder="Password" name="pw" required="required">
                                    </div>
                                    
                                    <div class="form-group">
                                       <input type="text" class="form-control"
                                          placeholder="Address" name="addr" required="required">
                                    </div>
                                    
                                    <div class="form-group">
                                       <input type="text" class="form-control"
                                          placeholder="Phone_Number" name="tel" required="required">
                                    </div>
                                    
                                    <div class="form-group">
                                       <input type="submit"
                                          class="btn btn-primary btn-block btn-lg" value="Update">
                                    </div>
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                     </li>
								
								<li><a href="#secession" class="trigger-btn" data-toggle="modal">회원탈퇴</a></li>

                        <div id="secession" class="modal fade">
                           <div class="modal-dialog modal-secession">
                              <div class="modal-content">

                                 <div class="modal-header">
                                    <h2 class="modal-title">Withdraw from membership</h2>
                                    <button type="button" class="close" data-dismiss="modal"
                                       aria-hidden="true">&times;</button>
                                 </div>
                                 <div class="modal-body">
                                    <form action="SecessionService" method="post">
                                       <div class="form-group">
                                          <select class="form-control" name="secession"
                                             aria-label="탈퇴">
                                             <option selected>탈퇴하시겠습니까?</option>
                                             <option value="Y">예</option>
                                             <option value="N">아니오</option>
                                          </select>
                                       </div>

                                       <div class="form-group">
                                          <input type="submit"
                                             class="btn btn-primary btn-block btn-lg" value="확인"> 
                                       </div>
                                    </form>
                                 </div>
                              </div>
                           </div>
                        </div>

							</ul>
						</li>
						<%} %>
					<%} %>	
					</ul>
					
				</nav>


				

			</div>
		</div>

   </div>

   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>
</body>
</html>