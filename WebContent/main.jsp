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
							data-toggle="modal">�α���</a> <%
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
							%><a href="#join" class="button next scrolly" data-toggle="modal">ȸ������</a>
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
													<select class="form-control" name="Gender" aria-label="����">
														<option selected>����</option>
														<option value="M">����</option>
														<option value="F">����</option>
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
							%><a href="LogoutService" class="button next scrolly">�α׾ƿ�</a> <%
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
										<h4 style="color: #fff;">�ְ��� ġŲ�� ���� ���,</h4>
										<h1 style="color: #fff;">The Chicken Lab</h1> <br />
										<p style="color: #fff;">
											������ & AI ������ <strong style="color: #fff;">��ġŲ��</strong> �Դϴ�.
										</p>
										<p style="color: #fff;">IT ����� ġŲ ���������� �귣���� ����</p>
										<p style="color: #fff;">4�� ������� �ô�, �����Ϳ� ����� �Բ��ϴ� â������ ������
											�� �ֽ��ϴ�.</p>
										<p style="color: #fff;">���� ��ġŲ���� ������ �м��� ���� �������� â���� ����,</p>
										<p style="color: #fff;">���ֺе��� ����ũ�� �ٿ� ���� �������� ���� â����
											�����մϴ�.</p>
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
										<h4 style="color: #fff;">���� ���������� ���� ����������,</h4>
										<h1 style="color: #fff;">��ġŲ������ ����</h1> <br />
										<p style="color: #fff;">â�� �� ������, ������ ������ �Ǹſ� �������� ���ߴ�
											�е�,</p>
										<p style="color: #fff;">�߸��� ��Ǻм����� ���� â�����а� ������ �е�,</p>
										<p style="color: #fff;">�Ź� ���� ���� ���� ���⺸�� ���ذ� �� ũ�̴� �е��� ����</p>
										<p style="color: #fff;">1�� 365��, 24�ð� �����Ǵ� Ư���� ������ �м�
											���񽺸� �޾ƺ�����.</p>
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
										<h3>��Ǻм��� ���� ������ â�� ���� �ȳ� ����</h3> <br />
										<p>â���� ���� �߿��� '��ġ'</p>
										<p>��ġ�� ���� ���� ������ �м����� �˷��帳�ϴ�.</p>
										<p>���� �α��� �ϼż� �м� ���񽺸� ü���غ�����!</p>
									</td>
									<td width="50%" align="right"><img class="future"
										src="images/future_p.png"></td>

								</tr>

								<tr>
									<td width="50%" align="left"><img
										src="images/future_p2.png"></td>
									<td width="50%">
										<h3>���� ��� ��� �ֹ��� ������ ���� ���ַ� ����</h3> <br />
										<p>�������п��� �����Ǵ� Ư���� ������ ����</p>
										<p>�ӽŷ��� AI ����� �̿��Ͽ� ������ ��� �ֹ����� �����մϴ�.</p>
										<p>�ý��� ������ �ð�ȭ ��� ����ȭ�� ����͸����� �ż��� ��Ḧ</p>
										<p>�������ÿ� ���޹ް�, �ξ� �����ϰ� ���� ����, ���� ������ �����մϴ�.</p>
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
						<!-- <li><a href="stock.jsp">������</a></li> -->

						<li><span class="opener">���ֽ�û</span>
							<ul>
								<li><form action="http://localhost:9003/titanic/predict"
										method="post">
										<input id="predict" type="submit" value="�����ϱ�">
									</form></li>
								<li><a href="order_list.jsp">���ֽ�û����</a></li>
							</ul></li>

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