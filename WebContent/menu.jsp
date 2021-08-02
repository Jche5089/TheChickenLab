<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.model.MemberDTO"%>
<!DOCTYPE HTML>
<html>
<head>
<title>The Chicken Lab - Menu</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main4.css" />
<style>
.chicken_menu table td {
	border: 50px solid #FFFFFF;
	text-align: center;
}

.chicken_menu table td img {
	width: 19em;
	height: 19em;
}

.menu_name {
	margin: 0 0 .5em 0;
}

.menu_comment {
	font-size: .9em;
	letter-spacing: -1px;
	margin: 0 0 .5em 0;
}

.menu_price {
	font-size: 1.2em;
	color: #000;
}
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
					<a href="main.jsp" class="logo"><strong>THE Chicken LAB</strong> for the best quality</a>
				</header>

				<!-- Content -->
				<section>
					<header class="main">
						<h1>MENU</h1>
					</header>


					<div class="chicken_menu">
						<table>
							<tr>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20200929_BBQ_황금올리브썸네일(480x480).png"
									alt="황금올리브">
									<h3 class="menu_name">황금올리브치킨™</h3>
									<p class="menu_comment">육즙 가득한 BBQ 대표 메뉴</p>
									<p class="menu_price">19,500원</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20210315_BBQ_앱_썸네일(480x480)_황올한깐풍치킨-01.jpg"
									alt="황올한깐풍치킨">
									<h3 class="menu_name">황올한 깐풍치킨</h3>
									<p class="menu_comment">BBQ 특제깐풍소스에 향긋한 대파와 고추를 곁들인 치맥의 절대
										지존!</p>
									<p class="menu_price">19,900원</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20210315_BBQ_앱_썸네일(480x480)_황올한깐풍순살-01.jpg"
									alt="황올한깐풍순살">
									<h3 class="menu_name">황올한 깐풍순살</h3>
									<p class="menu_comment">BBQ 특제깐풍소스에 향긋한 대파와 고추를 곁들인 치맥의 절대
										지존!</p>
									<p class="menu_price">20,900원</p></td>
							</tr>


							<tr>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20210323_BBQ_앱_썸네일(480x480)_체고치.png"
									alt="체고치">

									<h3 class="menu_name">체고치 순살</h3>
									<p class="menu_comment">치즐링에 체다, 고다치즈 한번 더! 치즈맛의 최고치, 체고치
										순살!</p>
									<p class="menu_price">20,900원</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20210323_BBQ_앱_썸네일(480x480)_체고바.png"
									alt="체고바">

									<h3 class="menu_name">체고바 순살</h3>
									<p class="menu_comment">
										바삭함의 지존 바삭칸 치킨에 <br>리얼 체다, 고다치즈를 듬뿍! 체고바 순살!
									</p>
									<p class="menu_price">19,900원</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20200717_BBQ_앱_썸네일(반반류)-황금올리브치킨반반.png"
									alt="황금올리브치킨반반">

									<h3 class="menu_name">황금올리브치킨™(반반)</h3>
									<p class="menu_comment">육즙 가득한 BBQ 베스트메뉴</p>
									<p class="menu_price">19,000원</p></td>
							</tr>

							<tr>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20210318_BBQ_앱_썸네일_구이류(480x480px)-자메이카통다리구이.jpg"
									alt="자메이카통다리구이">

									<h3 class="menu_name">자메이카 통다리 구이</h3>
									<p class="menu_comment">자메이카 저크소스를 발라 더욱 맛있는 통다리구이</p>
									<p class="menu_price">19,500원</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/202007017_BBQ_앱_썸네일(후라이드류)_황올속안심.png"
									alt="황금올리브치킨™속안심">

									<h3 class="menu_name">황금올리브치킨™속안심</h3>
									<p class="menu_comment">부드럽고 담백한 속안심살 후라이드</p>
									<p class="menu_price">17,000원</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/202007017_BBQ_앱_썸네일(후라이드류)_핫윙.png"
									alt="황금올리브치킨™핫윙">

									<h3 class="menu_name">황금올리브치킨™핫윙</h3>
									<p class="menu_comment">미인들의 인기메뉴, 황금올리브핫윙</p>
									<p class="menu_price">18,000원</p></td>
							</tr>

							<tr>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20200717_BBQ_앱_썸네일(핫황금올리브-단품류)_크리스피.png"
									alt="크리스피">

									<h3 class="menu_name">핫황금올리브™크리스피</h3>
									<p class="menu_comment">핫하게 빠삭한 맛, 핫빠!</p>
									<p class="menu_price">19,000원</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20200717_BBQ_앱_썸네일(후라이드류)_순살크래커.png"
									alt="아인슈페너">

									<h3 class="menu_name">순살크래커</h3>
									<p class="menu_comment">건강한 우리 아이 간식</p>
									<p class="menu_price">18,000원</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/202007017_BBQ_앱_썸네일(후라이드류)_황올순살.png"
									alt="콜드브루라떼">

									<h3 class="menu_name">황금올리브치킨™순살</h3>
									<p class="menu_comment">드디어 나왔다 순살!</p>
									<p class="menu_price">20,000원</p></td>
							</tr>

							<tr>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/202007017_BBQ_앱_썸네일(후라이드류)_바삭칸.png"
									alt="플랫화이트">

									<h3 class="menu_name">바삭칸 치킨</h3>
									<p class="menu_comment">바삭함의 종결자</p>
									<p class="menu_price">16,000원</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/202007017_BBQ_앱_썸네일(후라이드류)_순살바삭칸.png"
									alt="아인슈페너">

									<h3 class="menu_name">순살바삭칸치킨</h3>
									<p class="menu_comment">바삭바삭한 순살 후라이드 치킨</p>
									<p class="menu_price">18,000원</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20200717_BBQ_앱_썸네일(핫황금올리브-단품류)_블랙페퍼.png"
									alt="콜드브루라떼">

									<h3 class="menu_name">핫황금올리브™ 블랙페퍼</h3>
									<p class="menu_comment">핫하고 알싸한 맛, 핫싸!</p>
									<p class="menu_price">19,000원</p></td>
							</tr>

						</table>
					</div>
				</section>
			</div>
		</div>



		<!-- Sidebar -->
		<div id="sidebar" >
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
						<li><a href="stock.jsp">재고관리</a></li>
						<li><a href="order.jsp">발주신청</a></li>
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
							

							</ul>
						</li>
					
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


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>