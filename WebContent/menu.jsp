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
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20200929_BBQ_Ȳ�ݿø�������(480x480).png"
									alt="Ȳ�ݿø���">
									<h3 class="menu_name">Ȳ�ݿø���ġŲ��</h3>
									<p class="menu_comment">���� ������ BBQ ��ǥ �޴�</p>
									<p class="menu_price">19,500��</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20210315_BBQ_��_�����(480x480)_Ȳ���ѱ�ǳġŲ-01.jpg"
									alt="Ȳ���ѱ�ǳġŲ">
									<h3 class="menu_name">Ȳ���� ��ǳġŲ</h3>
									<p class="menu_comment">BBQ Ư����ǳ�ҽ��� ����� ���Ŀ� ���߸� ����� ġ���� ����
										����!</p>
									<p class="menu_price">19,900��</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20210315_BBQ_��_�����(480x480)_Ȳ���ѱ�ǳ����-01.jpg"
									alt="Ȳ���ѱ�ǳ����">
									<h3 class="menu_name">Ȳ���� ��ǳ����</h3>
									<p class="menu_comment">BBQ Ư����ǳ�ҽ��� ����� ���Ŀ� ���߸� ����� ġ���� ����
										����!</p>
									<p class="menu_price">20,900��</p></td>
							</tr>


							<tr>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20210323_BBQ_��_�����(480x480)_ü��ġ.png"
									alt="ü��ġ">

									<h3 class="menu_name">ü��ġ ����</h3>
									<p class="menu_comment">ġ�񸵿� ü��, ���ġ�� �ѹ� ��! ġ����� �ְ�ġ, ü��ġ
										����!</p>
									<p class="menu_price">20,900��</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20210323_BBQ_��_�����(480x480)_ü���.png"
									alt="ü���">

									<h3 class="menu_name">ü��� ����</h3>
									<p class="menu_comment">
										�ٻ����� ���� �ٻ�ĭ ġŲ�� <br>���� ü��, ���ġ� ���! ü��� ����!
									</p>
									<p class="menu_price">19,900��</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20200717_BBQ_��_�����(�ݹݷ�)-Ȳ�ݿø���ġŲ�ݹ�.png"
									alt="Ȳ�ݿø���ġŲ�ݹ�">

									<h3 class="menu_name">Ȳ�ݿø���ġŲ��(�ݹ�)</h3>
									<p class="menu_comment">���� ������ BBQ ����Ʈ�޴�</p>
									<p class="menu_price">19,000��</p></td>
							</tr>

							<tr>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20210318_BBQ_��_�����_���̷�(480x480px)-�ڸ���ī��ٸ�����.jpg"
									alt="�ڸ���ī��ٸ�����">

									<h3 class="menu_name">�ڸ���ī ��ٸ� ����</h3>
									<p class="menu_comment">�ڸ���ī ��ũ�ҽ��� �߶� ���� ���ִ� ��ٸ�����</p>
									<p class="menu_price">19,500��</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/202007017_BBQ_��_�����(�Ķ��̵��)_Ȳ�üӾȽ�.png"
									alt="Ȳ�ݿø���ġŲ��ӾȽ�">

									<h3 class="menu_name">Ȳ�ݿø���ġŲ��ӾȽ�</h3>
									<p class="menu_comment">�ε巴�� ����� �ӾȽɻ� �Ķ��̵�</p>
									<p class="menu_price">17,000��</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/202007017_BBQ_��_�����(�Ķ��̵��)_����.png"
									alt="Ȳ�ݿø���ġŲ������">

									<h3 class="menu_name">Ȳ�ݿø���ġŲ������</h3>
									<p class="menu_comment">���ε��� �α�޴�, Ȳ�ݿø�������</p>
									<p class="menu_price">18,000��</p></td>
							</tr>

							<tr>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20200717_BBQ_��_�����(��Ȳ�ݿø���-��ǰ��)_ũ������.png"
									alt="ũ������">

									<h3 class="menu_name">��Ȳ�ݿø����ũ������</h3>
									<p class="menu_comment">���ϰ� ������ ��, �ֺ�!</p>
									<p class="menu_price">19,000��</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20200717_BBQ_��_�����(�Ķ��̵��)_����ũ��Ŀ.png"
									alt="���ν����">

									<h3 class="menu_name">����ũ��Ŀ</h3>
									<p class="menu_comment">�ǰ��� �츮 ���� ����</p>
									<p class="menu_price">18,000��</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/202007017_BBQ_��_�����(�Ķ��̵��)_Ȳ�ü���.png"
									alt="�ݵ����">

									<h3 class="menu_name">Ȳ�ݿø���ġŲ�����</h3>
									<p class="menu_comment">���� ���Դ� ����!</p>
									<p class="menu_price">20,000��</p></td>
							</tr>

							<tr>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/202007017_BBQ_��_�����(�Ķ��̵��)_�ٻ�ĭ.png"
									alt="�÷�ȭ��Ʈ">

									<h3 class="menu_name">�ٻ�ĭ ġŲ</h3>
									<p class="menu_comment">�ٻ����� ������</p>
									<p class="menu_price">16,000��</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/202007017_BBQ_��_�����(�Ķ��̵��)_����ٻ�ĭ.png"
									alt="���ν����">

									<h3 class="menu_name">����ٻ�ĭġŲ</h3>
									<p class="menu_comment">�ٻ�ٻ��� ���� �Ķ��̵� ġŲ</p>
									<p class="menu_price">18,000��</p></td>
								<td><img
									src="https://img.bbq.co.kr:449/uploads/bbq_d/thumbnail/20200717_BBQ_��_�����(��Ȳ�ݿø���-��ǰ��)_������.png"
									alt="�ݵ����">

									<h3 class="menu_name">��Ȳ�ݿø���� ������</h3>
									<p class="menu_comment">���ϰ� �˽��� ��, �ֽ�!</p>
									<p class="menu_price">19,000��</p></td>
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
						<li><a href="brandstory.jsp">�귣�� ���丮</a></li>
						<li><a href="menu.jsp">�޴� �Ұ�</a></li>

						<%
						if (info != null) {
						%>
						<%
						if (info.getMem_id().equals("admin")) {
						%>
						<li><span class="opener">������ �м� LAB</span>
							<ul>
								<li><a href="mat_map.jsp">��Ǻм�</a></li>
							</ul></li>
						<li><a href="select.jsp">ȸ������</a></li>
						<li><a href="order_list.jsp">���ֽ�û����</a></li>
						<li><a href="questionAdmin.jsp">���ͽ�û����</a></li>

						<%
						} else {
						%>
						<li><span class="opener">������ �м� LAB</span>
							<ul>
								<li><a href="mat_map.jsp">��Ǻм�</a></li>
							</ul></li>
						<%
						if (info.getMem_grade().equals("B")) {
						%>
						<li><a href="stock.jsp">������</a></li>
						<li><a href="order.jsp">���ֽ�û</a></li>
						<%
						}
						%>

						<li><a href="question.jsp">���͹���</a></li>
						<li><span class="opener">����������</span>
							<ul>
								<li><a href="#update" class="trigger-btn"
									data-toggle="modal">ȸ����������</a>
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
									data-toggle="modal">ȸ��Ż��</a></li>

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
															aria-label="Ż��">
															<option selected>Ż���Ͻðڽ��ϱ�?</option>
															<option value="Y">��</option>
															<option value="N">�ƴϿ�</option>
														</select>
													</div>

													<div class="form-group">
														<input type="submit"
															class="btn btn-primary btn-block btn-lg" value="Ȯ��">
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