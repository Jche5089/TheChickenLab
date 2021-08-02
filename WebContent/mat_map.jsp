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

<title>The Coffee Lab - 상권분석</title>
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
		
		
	<div id="map" style="width: 80%; height: 100vh;"></div>

	
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script
		src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=60b0eb459106b414dcbdad37a0dd09e6"></script>
	<script>
		//구별 지역 출력
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 9, // 지도의 확대 레벨
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		// 지도종류
		};

		// 카카오맵 생성
		var map = new kakao.maps.Map(mapContainer, mapOption), customOverlay = new kakao.maps.CustomOverlay(
				{}), infowindow = new kakao.maps.InfoWindow({
			removable : true
		});
		//행정구역 구분
		$.getJSON("seoul_geo.json", function(geojson) {
			var data = geojson.features;
			var coordinates = []; //좌표 저장할 배열
			var name = ''; //행정 구 이름

			$.each(data, function(index, val) {
				coordinates = val.geometry.coordinates;
				name = val.properties.name;
				displayArea(coordinates, name);

			})
		})

		var polygons = []; //function 안 쪽에 지역변수로 넣으니깐 폴리곤 하나 생성할 때마다 배열이 비어서 클릭했을 때 전체를 못 없애줌.  그래서 전역변수로 만듦.

		//행정구역 폴리곤
		function displayArea(coordinates, name) {

			var path = []; //폴리곤 그려줄 path
			var points = []; //중심좌표 구하기 위한 지역구 좌표들

			$.each(coordinates[0], function(index, coordinate) {
				//console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
				var point = new Object();
				point.x = coordinate[1];
				point.y = coordinate[0];

				points.push(point);
				path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
				//new kakao.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
			})

			// 다각형을 생상하고 이벤트를 등록하는 함수입니다
			// 다각형을 생성합니다 
			var polygon = new kakao.maps.Polygon({
				map : map, // 다각형을 표시할 지도 객체
				path : path,
				strokeWeight : 2,
				strokeColor : '#AAA8AC',
				strokeOpacity : 0.8,
				fillColor : '#fff',
				fillOpacity : 0.7
			});

			polygons.push(polygon);

			// 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
			// 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
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

			// 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
			kakao.maps.event.addListener(polygon, 'mousemove', function(
					mouseEvent) {
				customOverlay.setPosition(mouseEvent.latLng);

			});

			// 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
			// 커스텀 오버레이를 지도에서 제거합니다 
			kakao.maps.event.addListener(polygon, 'mouseout', function() {
				polygon.setOptions({
					fillColor : '#fff'
				});
				customOverlay.setMap(null);
			});

			// 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
			//  var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
   			// message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';

			kakao.maps.event.addListener(polygon, 'click',
					function(mouseEvent) {
				var latlng = mouseEvent.latLng;
				
//행정동 별 지도 출력
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(latlng.getLat(),latlng.getLng()), // 지도의 중심좌표
					level : 6, // 지도의 확대 레벨
					mapTypeId : kakao.maps.MapTypeId.ROADMAP
				// 지도종류
				};

				// 카카오맵 생성
				var map = new kakao.maps.Map(mapContainer, mapOption), customOverlay = new kakao.maps.CustomOverlay(
						{}), infowindow = new kakao.maps.InfoWindow({
					removable : true
				});
				
				//행정구역 구분
				$.getJSON("korea_dong.json", function(geojson) {
					var data = geojson.features;
					var coordinates = []; //좌표 저장할 배열
					var name = ''; //행정 구 이름
					var code = ''; //행정코드

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

				var polygons = []; //function 안 쪽에 지역변수로 넣으니깐 폴리곤 하나 생성할 때마다 배열이 비어서 클릭했을 때 전체를 못 없애줌.  그래서 전역변수로 만듦.

				//행정구역 폴리곤
				function displayArea(coordinates, name) {

					var path = []; //폴리곤 그려줄 path
					var points = []; //중심좌표 구하기 위한 지역구 좌표들

					$.each(coordinates[0],
							function(index, coordinate) {
								//console.log(coordinates)를 확인해보면 보면 [0]번째에 배열이 주로 저장이 됨.  그래서 [0]번째 배열에서 꺼내줌.
								var point = new Object();
								point.x = coordinate[1];
								point.y = coordinate[0];

								points.push(point);
								path.push(new kakao.maps.LatLng(coordinate[1],
										coordinate[0]));
								//new kakao.maps.LatLng가 없으면 인식을 못해서 path 배열에 추가
							})

					// 다각형을 생상하고 이벤트를 등록하는 함수입니다
					// 다각형을 생성합니다 
					var polygon = new kakao.maps.Polygon({
						map : map, // 다각형을 표시할 지도 객체
						path : path,
						strokeWeight : 2,
						strokeColor : '#AAA8AC',
						strokeOpacity : 0.8,
						fillColor : '#fff',
						fillOpacity : 0.7
					});

					polygons.push(polygon);

					// 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
					// 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
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

					// 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다 
					kakao.maps.event.addListener(polygon, 'mousemove', function(
							mouseEvent) {
						customOverlay.setPosition(mouseEvent.latLng);

					});

					// 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
					// 커스텀 오버레이를 지도에서 제거합니다 
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

					// 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다 
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