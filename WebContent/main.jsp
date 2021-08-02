<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>The Chicken Lab</title>
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
<style type="text/css">
</style>
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
					<a href="main.jsp" class="logo"><strong>THE CHICKEN
							LAB</strong> for the best quality</a>
					<ul class="icons">
						<li>
							<%
							if (info == null) {
							%><a href="#myModal" class="button next scrolly"
							data-toggle="modal">로그인</a> <%
 }
 %>
							<div id="myModal" class="modal fade">
								<div class="modal-dialog modal-login">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">Member Login</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body">
											<form action="LoginService" method="post">
												<div class="form-group">
													<i class="fa fa-user"></i> <input type="text"
														class="form-control" placeholder="Id" name="Id"
														required="required">
												</div>
												<div class="form-group">
													<i class="fa fa-lock"></i> <input type="password"
														class="form-control" placeholder="Password"
														name="Password" required="required">
												</div>
												<div class="form-group">
													<input type="submit"
														class="btn btn-primary btn-block btn-lg" value="Login">
												</div>
											</form>
										</div>
										<div class="modal-footer">
											<a href="#">Forgot Password?</a>
										</div>
									</div>
								</div>
							</div>
						</li>

						<li>
							<%
							if (info == null) {
							%><a href="#join" class="button next scrolly" data-toggle="modal">회원가입</a>
							<%
							}
							%>
							<div id="join" class="modal fade">
								<div class="modal-dialog modal-login">

									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">Member Join</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body">
											<form action="JoinService" method="post">
												<div class="form-group">
													<i class="fa fa-user"></i> <input type="text"
														class="form-control" placeholder="Id" name="Id"
														required="required">
												</div>
												<div class="form-group">
													<i class="fa fa-lock"></i> <input type="password"
														class="form-control" placeholder="Password"
														name="Password" required="required">
												</div>
												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Username" name="Username" required="required">
												</div>
												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Birth_Day" name="Birth_Day"
														required="required">
												</div>
												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Address" name="Address" required="required">
												</div>
												<div class="form-group">
													<input type="text" class="form-control"
														placeholder="Phone_Number" name="Phone_Number"
														required="required">
												</div>
												<div class="form-group">
													<select class="form-control" name="Gender" aria-label="성별">
														<option selected>성별</option>
														<option value="M">남자</option>
														<option value="F">여자</option>
													</select>
												</div>
												<div class="form-group">
													<input type="submit"
														class="btn btn-primary btn-block btn-lg" value="Join">
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<%
							if (info != null) {
							%><a href="LogoutService" class="button next scrolly">로그아웃</a> <%
 }
 %>
						</li>
					</ul>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<table>
								<tr
									style="border: 0; padding: 0; vertical-align: middle !important;">
									<td bgcolor="#444" style="margin: 0; padding: 50px;">
										<h4 style="color: #fff;">최고의 치킨를 향한 노력,</h4>
										<h1 style="color: #fff;">The Chicken Lab</h1> <br />
										<p style="color: #fff;">
											빅데이터 & AI 연구소 <strong style="color: #fff;">더치킨랩</strong> 입니다.
										</p>
										<p style="color: #fff;">IT 기술과 치킨 프랜차이즈 브랜드의 만남</p>
										<p style="color: #fff;">4차 산업혁명 시대, 데이터와 기술과 함께하는 창업만이 성공할
											수 있습니다.</p>
										<p style="color: #fff;">저희 더치킨랩은 빅데이터 분석을 통해 성공적인 창업은 물론,</p>
										<p style="color: #fff;">점주분들의 리스크를 줄여 보다 안정적인 수익 창출이
											가능합니다.</p>
									</td>

									<td bgcolor="#444"
										style="margin: 0; padding: 50px 50px 60px 50px; vertical-align: bottom; text-align: right;">
										<a href="brandstory.jsp" class="button big" id="guide"
										style="color: #fff !important; border: 1px solid #fff;">guide
											more</a>
									</td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr
									style="border: 0; padding: 0; vertical-align: middle !important;">

									<td colspan="2" align="center" style="padding: 0"><img
										src="images/chi01.png" alt="" width="100%" /></td>
								</tr>
								<tr class="blank">
									<td></td>
								</tr>
								<tr>
									<td bgcolor="#444" style="margin: 0; padding: 50px;">
										<h4 style="color: #fff;">가장 과학적으로 보다 객관적으로,</h4>
										<h1 style="color: #fff;">더치킨랩만의 서비스</h1> <br />
										<p style="color: #fff;">창업 후 마케팅, 재고관리 등으로 판매에 집중하지 못했던
											분들,</p>
										<p style="color: #fff;">잘못된 상권분석으로 인해 창업실패가 있으신 분들,</p>
										<p style="color: #fff;">매번 남는 재고로 인해 매출보다 손해가 더 크셨던 분들을 위한</p>
										<p style="color: #fff;">1년 365일, 24시간 제공되는 특별한 빅데이터 분석
											서비스를 받아보세요.</p>
									</td>
									<td bgcolor="#444"
										style="margin: 0; padding: 50px 50px 60px 50px; vertical-align: bottom; text-align: right;">
										<a href="brandstory.jsp" class="button big"
										style="color: #fff !important; border: 1px solid #fff;">guide
											more</a>
									</td>
								</tr>
								<tr>
									<td>
										<h3>상권분석을 통한 최적의 창업 입지 안내 서비스</h3> <br />
										<p>창업시 가장 중요한 '위치'</p>
										<p>위치에 대한 답을 데이터 분석으로 알려드립니다.</p>
										<p>지금 로그인 하셔서 분석 서비스를 체험해보세요!</p>
									</td>
									<td width="50%" align="right"><img class="future"
										src="images/future_p.png"></td>

								</tr>

								<tr>
									<td width="50%" align="left"><img
										src="images/future_p2.png"></td>
									<td width="50%">
										<h3>날씨 기반 배달 주문량 예측을 통한 발주량 관리</h3> <br />
										<p>가맹점분에게 제공되는 특별한 재고관리 서비스</p>
										<p>머신러닝 AI 기술을 이용하여 일주일 배달 주문량을 예측합니다.</p>
										<p>시스템 데이터 시각화 기반 지능화된 모니터링으로 신선한 재료를</p>
										<p>적재적시에 공급받고, 훨씬 간편하게 발주 관리, 문서 관리가 가능합니다.</p>
									</td>

								</tr>
							</table>
						</header>
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

						<%
						if (info != null) {
						%>
						<%
						if (info.getMem_id().equals("admin")) {
						%>
						<li><span class="opener">데이터 분석 LAB</span>
							<ul>
								<li><a href="mat_map.jsp">상권분석</a></li>
							</ul></li>
						<li><a href="select.jsp">회원관리</a></li>
						<li><a href="order_list.jsp">발주신청내역</a></li>
						<li><a href="questionAdmin.jsp">가맹신청내역</a></li>

						<%
						} else {
						%>
						<li><span class="opener">데이터 분석 LAB</span>
							<ul>
								<li><a href="mat_map.jsp">상권분석</a></li>
							</ul></li>
						<%
						if (info.getMem_grade().equals("B")) {
						%>
						<!-- <li><a href="stock.jsp">재고관리</a></li> -->

						<li><span class="opener">발주신청</span>
							<ul>
								<li><form action="http://localhost:9003/titanic/predict"
										method="post">
										<input id="predict" type="submit" value="예측하기">
									</form></li>
								<li><a href="order_list.jsp">발주신청내역</a></li>
							</ul></li>

						<%
						}
						%>

						<li><a href="question.jsp">가맹문의</a></li>
						<li><span class="opener">마이페이지</span>
							<ul>
								<li><a href="#update" class="trigger-btn"
									data-toggle="modal">회원정보수정</a>
									<div id="update" class="modal fade">
										<div class="modal-dialog modal-login">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">Member Update</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
												</div>
												<div class="modal-body">
													<form action="UpdateService" method="post">

														<div class="form-group">
															<i class="fa fa-lock"></i> <input type="password"
																class="form-control" placeholder="Password" name="pw"
																required="required">
														</div>

														<div class="form-group">
															<input type="text" class="form-control"
																placeholder="Address" name="addr" required="required">
														</div>

														<div class="form-group">
															<input type="text" class="form-control"
																placeholder="Phone_Number" name="tel"
																required="required">
														</div>

														<div class="form-group">
															<input type="submit"
																class="btn btn-primary btn-block btn-lg" value="Update">
														</div>
													</form>
												</div>
											</div>
										</div>
									</div></li>

								<li><a href="#secession" class="trigger-btn"
									data-toggle="modal">회원탈퇴</a></li>

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

							</ul></li>
						<%
						}
						%>
						<%
						}
						%>
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