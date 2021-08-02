<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.model.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta charset="EUC-KR">
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

<title>The Coffee Lab - ��Ǻм�</title>
<style>
.area {
	position: absolute;
	background: #fff;
	border: 1px solid #888;
	border-radius: 3px;
	font-size: 12px;
	top: -5px;
	left: 15px;
	padding: 2px;
}

.info {
	font-size: 12px;
	padding: 5px;
}

.info .title {
	font-weight: bold;
}
</style>
</head>
<body>
<%	MemberDTO info = null;
	info=(MemberDTO)session.getAttribute("info");%>
	<div id="sidebar" bgcolor="#008080" style="float:left;">
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
						
						<%if (info != null) {%>
						<%if (info.getMem_id().equals("admin")){ %>
						<li><span class="opener">������ �м� LAB</span>
							<ul>
								<li><a href="mat_map.jsp">��Ǻм�</a></li>
							</ul>
						</li>
						<li><a href="select.jsp">ȸ������</a></li>
						<li><a href="order_list.jsp">���ֽ�û����</a></li>
						<li><a href="questionAdmin.jsp">���ͽ�û����</a></li>
						
						<%} else{%>
						<li><span class="opener">������ �м� LAB</span>
							<ul>
								<li><a href="mat_map.jsp">��Ǻм�</a></li>
							</ul>
						</li>
						<%if (info.getMem_grade().equals("B")) {%>
						<li><a href="stock.jsp">������</a></li>
						<li><a href="order.jsp">���ֽ�û</a></li>
						<%}%>
						
						<li><a href="question.jsp">���͹���</a></li>
						<li><span class="opener">����������</span>
							<ul>
								 <li><a href="#update" class="trigger-btn" data-toggle="modal">ȸ����������</a>
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
								
								<li><a href="#secession" class="trigger-btn" data-toggle="modal">ȸ��Ż��</a></li>

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
						<%} %>
					<%} %>	
					</ul>
					
				</nav>

			</div>
		</div>
		
		
	<div id="map" style="width: 80%; height: 100vh;"></div>

	
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=60b0eb459106b414dcbdad37a0dd09e6"></script>
	<script>
		//���� ���� ���
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
			level : 9, // ������ Ȯ�� ����
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		// ��������
		};

		// īī���� ����
		var map = new kakao.maps.Map(mapContainer, mapOption), customOverlay = new kakao.maps.CustomOverlay(
				{}), infowindow = new kakao.maps.InfoWindow({
			removable : true
		});
		//�������� ����
		$.getJSON("seoul_geo.json", function(geojson) {
			var data = geojson.features;
			var coordinates = []; //��ǥ ������ �迭
			var name = ''; //���� �� �̸�

			$.each(data, function(index, val) {
				coordinates = val.geometry.coordinates;
				name = val.properties.name;
				displayArea(coordinates, name);

			})
		})

		var polygons = []; //function �� �ʿ� ���������� �����ϱ� ������ �ϳ� ������ ������ �迭�� �� Ŭ������ �� ��ü�� �� ������.  �׷��� ���������� ����.

		//�������� ������
		function displayArea(coordinates, name) {

			var path = []; //������ �׷��� path
			var points = []; //�߽���ǥ ���ϱ� ���� ������ ��ǥ��

			$.each(coordinates[0], function(index, coordinate) {
				//console.log(coordinates)�� Ȯ���غ��� ���� [0]��°�� �迭�� �ַ� ������ ��.  �׷��� [0]��° �迭���� ������.
				var point = new Object();
				point.x = coordinate[1];
				point.y = coordinate[0];

				points.push(point);
				path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
				//new kakao.maps.LatLng�� ������ �ν��� ���ؼ� path �迭�� �߰�
			})

			// �ٰ����� �����ϰ� �̺�Ʈ�� ����ϴ� �Լ��Դϴ�
			// �ٰ����� �����մϴ� 
			var polygon = new kakao.maps.Polygon({
				map : map, // �ٰ����� ǥ���� ���� ��ü
				path : path,
				strokeWeight : 2,
				strokeColor : '#AAA8AC',
				strokeOpacity : 0.8,
				fillColor : '#fff',
				fillOpacity : 0.7
			});

			polygons.push(polygon);

			// �ٰ����� mouseover �̺�Ʈ�� ����ϰ� �̺�Ʈ�� �߻��ϸ� �������� ä����� �����մϴ� 
			// �������� ǥ���ϴ� Ŀ���ҿ������̸� �������� ǥ���մϴ�
			kakao.maps.event.addListener(polygon, 'mouseover', function(
					mouseEvent) {
				polygon.setOptions({
					fillColor : '#AAA8AC'

				});
				customOverlay
						.setContent('<div class="area">' + name + '</div>');
				customOverlay.setPosition(mouseEvent.latLng);
				customOverlay.setMap(map);
			});

			// �ٰ����� mousemove �̺�Ʈ�� ����ϰ� �̺�Ʈ�� �߻��ϸ� Ŀ���� ���������� ��ġ�� �����մϴ� 
			kakao.maps.event.addListener(polygon, 'mousemove', function(
					mouseEvent) {
				customOverlay.setPosition(mouseEvent.latLng);

			});

			// �ٰ����� mouseout �̺�Ʈ�� ����ϰ� �̺�Ʈ�� �߻��ϸ� �������� ä����� ���������� �����մϴ�
			// Ŀ���� �������̸� �������� �����մϴ� 
			kakao.maps.event.addListener(polygon, 'mouseout', function() {
				polygon.setOptions({
					fillColor : '#fff'
				});
				customOverlay.setMap(null);
			});

			// �ٰ����� click �̺�Ʈ�� ����ϰ� �̺�Ʈ�� �߻��ϸ� �ٰ����� �̸��� ������ ���������쿡 ǥ���մϴ� 
			//  var message = '<p>���� ������ ' + level + ' �̰�</p>';
   			// message += '<p>�߽� ��ǥ�� ���� ' + latlng.getLat() + ', �浵 ' + latlng.getLng() + '�Դϴ�</p>';

			kakao.maps.event.addListener(polygon, 'click',
					function(mouseEvent) {
				var latlng = mouseEvent.latLng;
				
//������ �� ���� ���
				var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
				mapOption = {
					center : new kakao.maps.LatLng(latlng.getLat(),latlng.getLng()), // ������ �߽���ǥ
					level : 6, // ������ Ȯ�� ����
					mapTypeId : kakao.maps.MapTypeId.ROADMAP
				// ��������
				};

				// īī���� ����
				var map = new kakao.maps.Map(mapContainer, mapOption), customOverlay = new kakao.maps.CustomOverlay(
						{}), infowindow = new kakao.maps.InfoWindow({
					removable : true
				});
				
				//�������� ����
				$.getJSON("korea_dong.json", function(geojson) {
					var data = geojson.features;
					var coordinates = []; //��ǥ ������ �迭
					var name = ''; //���� �� �̸�
					var code = ''; //�����ڵ�

					$.each(data, function(index, val) {

						code = Number(val.properties.code);

						if (code < 1125074) {
							coordinates = val.geometry.coordinates;
							name = val.properties.name;
						}
						console.log(name);
						console.log(coordinates);

						displayArea(coordinates, name);

					})
				})

				var polygons = []; //function �� �ʿ� ���������� �����ϱ� ������ �ϳ� ������ ������ �迭�� �� Ŭ������ �� ��ü�� �� ������.  �׷��� ���������� ����.

				//�������� ������
				function displayArea(coordinates, name) {

					var path = []; //������ �׷��� path
					var points = []; //�߽���ǥ ���ϱ� ���� ������ ��ǥ��

					$.each(coordinates[0],
							function(index, coordinate) {
								//console.log(coordinates)�� Ȯ���غ��� ���� [0]��°�� �迭�� �ַ� ������ ��.  �׷��� [0]��° �迭���� ������.
								var point = new Object();
								point.x = coordinate[1];
								point.y = coordinate[0];

								points.push(point);
								path.push(new kakao.maps.LatLng(coordinate[1],
										coordinate[0]));
								//new kakao.maps.LatLng�� ������ �ν��� ���ؼ� path �迭�� �߰�
							})

					// �ٰ����� �����ϰ� �̺�Ʈ�� ����ϴ� �Լ��Դϴ�
					// �ٰ����� �����մϴ� 
					var polygon = new kakao.maps.Polygon({
						map : map, // �ٰ����� ǥ���� ���� ��ü
						path : path,
						strokeWeight : 2,
						strokeColor : '#AAA8AC',
						strokeOpacity : 0.8,
						fillColor : '#fff',
						fillOpacity : 0.7
					});

					polygons.push(polygon);

					// �ٰ����� mouseover �̺�Ʈ�� ����ϰ� �̺�Ʈ�� �߻��ϸ� �������� ä����� �����մϴ� 
					// �������� ǥ���ϴ� Ŀ���ҿ������̸� �������� ǥ���մϴ�
					kakao.maps.event.addListener(polygon, 'mouseover', function(
							mouseEvent) {
						polygon.setOptions({
							fillColor : '#AAA8AC'

						});
						customOverlay
								.setContent('<div class="area">' + name + '</div>');
						customOverlay.setPosition(mouseEvent.latLng);
						customOverlay.setMap(map);
					});

					// �ٰ����� mousemove �̺�Ʈ�� ����ϰ� �̺�Ʈ�� �߻��ϸ� Ŀ���� ���������� ��ġ�� �����մϴ� 
					kakao.maps.event.addListener(polygon, 'mousemove', function(
							mouseEvent) {
						customOverlay.setPosition(mouseEvent.latLng);

					});

					// �ٰ����� mouseout �̺�Ʈ�� ����ϰ� �̺�Ʈ�� �߻��ϸ� �������� ä����� ���������� �����մϴ�
					// Ŀ���� �������̸� �������� �����մϴ� 
					kakao.maps.event.addListener(polygon, 'mouseout', function() {
						polygon.setOptions({
							fillColor : '#fff'
						});
						customOverlay.setMap(null);

					});
					
					function doAction() {
			            var s = name;
			            var s_ = encodeURIComponent(s);
			            var url = 'AnalsisService?name=' + encodeURI(s_);
			            location.href = url;
			         }

					// �ٰ����� click �̺�Ʈ�� ����ϰ� �̺�Ʈ�� �߻��ϸ� �ٰ����� �̸��� ������ ���������쿡 ǥ���մϴ� 
					kakao.maps.event.addListener(polygon, 'click',
							function(mouseEvent) {
								/* var content = '<div class="title">' + name + '</div>'
								infowindow.setContent(content);
								infowindow.setPosition(mouseEvent.latLng);
								infowindow.setMap(map); */
								doAction();
							});
				}
					});
			
		}
	</script>
</body>
</html>