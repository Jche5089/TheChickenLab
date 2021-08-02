<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.model.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>The Chicken Lab - Menu</title>
<meta charset="utf-8" >
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main4.css" />
<style>
	table {border:1px solid rgba(210, 215, 217, 0.75); }
	table th {padding:0.75rem;border:1px solid rgba(210, 215, 217, 0.75); width:25%; text-align:center; font-size:1.1rem;}
	table tr {border:0 !important;}
	table td {border:1px solid rgba(210, 215, 217, 0.75); text-align:center;font-size:.9rem; color:#000;}
</style>
</head>
<body>
<%	MemberDTO info = null;
	info=(MemberDTO)session.getAttribute("info");%>
	
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="main.jsp" class="logo"><strong>THEdsafsaf Chicken LAB</strong>
						for the best quality</a>
					
				</header>

				<!-- Content -->
				<section>
					<header class="main">
						<!-- <h1>가맹문의</h1> -->
					</header>

					<div class ="smain">
						<h1>재고관리</h1>
						<p>점주님들을 위한 재고관리시스템도입!</p>
					</div>
					
					
					<form action="StocksService" method="post">
					<div href = "stocks.jsp" style="text-align:right;" >
						<input type = "submit" value = "저장하기">
					</div>
							
					
					
					
					<table>
					
					
						<tr height ='40'>
							<th align="center" bgcolor = "white">물품번호</th>
							<th align="left" bgcolor = "white">물품명</th>
							<th align="left" bgcolor = "white">단가(수량1기준)</th>
							<th align="left" bgcolor = "white">재고수량</th>
							
							
						</tr>	
						
						<tr>
							<td align="left" bgcolor = "white" name = "1">1</td>
							<td align="left" bgcolor = "white" name = "chicken">생닭</td>
							<td align="left" bgcolor = "white" name = "1.price">3,000원</td>
							<td align="center" bgcolor = "white" name = "s.chicken"><input  type = "number" min = "0" max = "500" style = "text-align:center; width : 100%" name = "0"  > 숫자당700g기준</td>
							
							
							
							
						</tr>
						<tr>
							<td align="left" bgcolor = "white" name ="2">2</td>
							<td align="left" bgcolor = "white" name = "oil">식용유</td>
							<td align="left" bgcolor = "white" name = "2.price">34,500원</td>
							<td align="center" bgcolor = "white" name ="s.oil"><input type = "number" min = "0" max = "500" style = "text-align:center; width : 100%"  name = "1"> 숫자당18L기준</td>
							
						</tr>
						<tr>
							<td align="left" bgcolor = "white" name = "3">3</td>
							<td align="left" bgcolor = "white" name = "daikon">치킨무</td>
							<td align="left" bgcolor = "white" name = 3.price>400원</td>
							<td align="center" bgcolor = "white" name ="s.daikon"><input type = "number" min = "0" max = "500" style = "text-align:center; width : 100%"  name = "2"> 숫자당170g기준</td>
							
						</tr>
						<tr>
							<td align="left" bgcolor = "white" name ="4">4</td>
							<td align="left" bgcolor = "white" name ="frying powder">튀김가루</td>
							<td align="left" bgcolor = "white" name ="4.price">20,000원</td>
							<td align="center" bgcolor = "white" name ="4.frying powder"><input type = "number" min = "0" max = "500" style = "text-align:center; width : 100%"  name = "3"> 숫자당5kg기준</td>
							
						</tr>
						<tr>
							<td align="left" bgcolor = "white" name ="5">5</td>
							<td align="left" bgcolor = "white" name ="beer">맥주</td>
							<td align="left" bgcolor = "white" name ="5.price">2,150원</td>
							<td align="center" bgcolor = "white" name ="s.beer"><input type = "number" min = "0" max = "500" style = "text-align:center; width : 100%"  name = "4"> 숫자당500ml기준</td>
						</tr>
						<tr>
							<td align="left" bgcolor = "white" name ="6">6</td>
							<td align="left" bgcolor = "white" name ="soju">소주</td>
							<td align="left" bgcolor = "white" name ="6.price">1,454원</td>
							<td align="center" bgcolor = "white" name ="s.soju"><input type = "number" min = "0" max = "500" style = "text-align:center; width : 100%"  name = "5"> 숫자당360ml기준</td>
						</tr>
						<tr>
							<td align="left" bgcolor = "white" name ="7">7</td>
							<td align="left" bgcolor = "white" name ="sauce">치킨양념</td>
							<td align="left" bgcolor = "white" name ="7.price">30,000원</td>
							<td align="center" bgcolor = "white" ><input type = "number" min = "0" max = "500" style = "text-align:center; width : 100%"  name = "6" > 숫자당5kg기준</td>
						</tr>
						
						

						
					</table>
					
					</form>
					
	
					
					
							
							

				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
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

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>