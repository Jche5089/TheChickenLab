
<%@page import="com.model.MemberDTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.model.Analysis2DTO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>The CHICKEN LAB - 상권분석</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/analysisss.css" />
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
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<link rel="stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body class="is-preload">
<%
   Analysis2DTO sales = (Analysis2DTO)session.getAttribute("a3Dto");
   ArrayList<Analysis2DTO> qList = (ArrayList<Analysis2DTO>)session.getAttribute("qua_dto3"); 
   DecimalFormat formatter = new DecimalFormat("###,###");
   
   
	
	MemberDTO info = null;
	info = (MemberDTO)session.getAttribute("info");
	
%>

    <!-- Wrapper -->
   <div id="wrapper">

      <!-- Main -->
      <div id="main">
         <div class="inner">
            <!-- Header -->
            <header id="header">
              <a href="main.jsp" class="logo"></a>
               <ul class="icons">

                  <li><a href="#" class="icon brands fa-twitter"><span
                        class="label">Twitter</span></a></li>
                  <li><a href="#" class="icon brands fa-facebook-f"><span
                        class="label">Facebook</span></a></li>
                  <li><a href="#" class="icon brands fa-snapchat-ghost"><span
                        class="label">Snapchat</span></a></li>
                  <li><a href="#" class="icon brands fa-instagram"><span
                        class="label">Instagram</span></a></li>
                  <li><a href="#" class="icon brands fa-medium-m"><span
                        class="label">Medium</span></a></li>
                  
               </ul>
            </header>

            
            <!-- Banner -->
            <section id="banner2">
               <div class="content">
                  <header>
                     <h1 class="korean"><%=sales.getHaengjeonggu() %> <%=sales.getHaengjeongdong() %>의 평당 평균 임대료는 <strong style = "color : #e72222;"><%=formatter.format(sales.getBungi())%></strong>원 입니다.</h1>
                  
                  </header>   
               </div>
               
                  <br><br>
               <div class="content">
                  <ul class="actions">
                     
                     <li><a href="analysis.jsp" class="button big as">매출분석</a></li>
                     <li><a href="AnalsisService2?name=<%=sales.getHaengjeonggu()%>,<%=sales.getHaengjeongdong()%>,2" class="button big sd2 as">지역(배후지)분석</a></li>
                     <li><a href="analysis3.jsp" class="button big sd3 sd1">통계분석</a></li>
                  
                  
                  </ul>
               </div>
               
               
               
            </section>
            
            
      <!-- Banner -->
            <section id="banner">
               <div class="con">
                  <h1 class="korean">○<strong> <%=sales.getHaengjeonggu() %> 임대료 TOP5 </strong></h1><br><br>
                  <br>
                  <!--  그래프 -->
                  <div class= "graph">
                     <canvas id="myChart" width="800" height="500"></canvas>   
                  </div>
                  <br><br>
                  <div class="graphText div2">
   
                     
                     "선택한 <strong style = "color : #e72222;"><%=sales.getHaengjeongdong() %></strong>의 임대료는 <strong style = "color : #e72222;"><%=formatter.format(sales.getBungi())%></strong>원이며, 인근 행정동 평균대비 임대료가 
                     <%if(sales.getRentPm() > 0){%>
                     
                     
                        <strong style = "color : #e72222;"><%=sales.getRentPm() %>%</strong> 높습니다."   
                           
                     <%}else if(sales.getRentPm() < 0){ %>   
                        <strong style = "color : #e72222;"><%=sales.getRentPm() %>%</strong> 낮습니다."   
                     <% }else{%>
                        <strong style = "color : #e72222;">평균</strong>에 속합니다.   
                     <% }%>
                     
                     
                     
                     
                      
                  </div>
                  
                  <table class="styled-table table">
                     <thead>
                        <tr>
                           <td rowspan="2">구분</td>
                           <td colspan="5"><%=qList.get(0).getHaengjeonggu() %> 임대료 TOP5</td>   
                        </tr>
                      </thead>
                      <tbody>
                      <%
                         String[] name = new String[qList.size()];
                         int[] count= new int[qList.size()];
                         
                         for(int i=0; i<qList.size();i++){
                            count[i] = qList.get(i).getBungi();
                            name[i] = qList.get(i).getHaengjeongdong();
                         }
                         
                         
                         for(int i=0; i<count.length;i++){
                            for(int j=i+1; j<count.length;j++){
                               if(count[i] < count[j]){
                  
                                  int tmp = count[i];
                                  count[i] = count[j];
                                  count[j] = tmp;
                                  
                                  String tmp2 = name[i];
                                  name[i] = name[j]; 
                                  name[j] = tmp2; 
                                  
                               }
                            }
                         }

                      %>
                         <tr>
                            <td>행정동</td>
                           <td><%=name[0] %></td>
                           <td><%=name[1] %></td>      
                           <td><%=name[2] %></td>
                           <td><%=name[3] %></td>
                           <td><%=name[4] %></td>
                           
                         </tr>
                        
                        <tr class="active-row">
                           <td>임대료</td>
                           <td><%=formatter.format(count[0]) %></td>
                           <td><%=formatter.format(count[1])  %></td>
                           <td><%=formatter.format(count[2] ) %></td>
                           <td><%=formatter.format(count[3] ) %></td>
                           <td><%=formatter.format(count[4] )%></td>         
                          </tr>
                          <!-- and so on... -->
                      </tbody>
                  </table>


               </div>
            </section>
      
      
      <!-- Banner -->
            <section id="banner">
               <div class="con">
                  <h1 class="korean">○<strong> <%=sales.getHaengjeonggu() %> 가구수 TOP5 </strong></h1><br><br>
                  <br>
                  <!--  그래프 -->
                  <div class= "graph">
                     <canvas id="myChart2" width="800" height="500"></canvas>   
                  </div>
                  <br><br>
                  <div class="graphText div2">

                        
                     "선택한 <strong style = "color : #e72222;"><%=sales.getHaengjeongdong() %></strong>의 가구수는 <strong style = "color : #e72222;"><%=sales.getGagusu()%></strong>가구이며, 인근 행정동 평균대비 가구수가  
                     <%if(sales.getGagusPm() > 0){
                     
                     %>
                        <strong style = "color : #e72222;"><%=sales.getGagusPm() %>%</strong> 많습니다."   
                           
                     <%}else if(sales.getGagusPm() < 0){ %>   
                        <strong style = "color : #e72222;"><%=sales.getGagusPm() %>%</strong> 적습니다."   
                     <% }else{%>
                        <strong style = "color : #e72222;">평균</strong>에 속합니다.   
                     <% }%>
                     
                     
                  </div>
                  
                  <table class="styled-table table">
                     <thead>
                        <tr>
                           <td rowspan="2">구분</td>
                           <td colspan="5"><%=sales.getHaengjeonggu() %> 가구수 TOP5</td>   
                        </tr>
                      </thead>
                      <tbody>
                      
                      <%
                         String[] name2 = new String[qList.size()];
                         int[] count2= new int[qList.size()];
                         
                         for(int i=0; i<qList.size();i++){
                            count2[i] = qList.get(i).getGagusu();
                            name2[i] = qList.get(i).getHaengjeongdong();
                         }
                         
                         
                         for(int i=0; i<count2.length;i++){
                            for(int j=i+1; j<count2.length;j++){
                               if(count2[i] < count2[j]){
                  
                                  int tmp4 = count2[i];
                                  count2[i] = count2[j];
                                  count2[j] = tmp4;
                                  
                                  String tmp3 = name2[i];
                                  name2[i] = name[j]; 
                                  name2[j] = tmp3; 
                                  
                               }
                            }
                         }
                      %>
                      
                      
                         <tr>
                            <td>행정동</td>
                           <td><%=name2[0] %></td>
                           <td><%=name2[1] %></td>      
                           <td><%=name2[2] %></td>
                           <td><%=name2[3] %></td>
                           <td><%=name2[4] %></td>
                           
                         </tr>
                        
                        <tr class="active-row">
                           <td>가구수</td>
                           <td><%=count2[0] %></td>
                           <td><%=count2[1]  %></td>
                           <td><%=count2[2]  %></td>
                           <td><%=count2[3]  %></td>
                           <td><%=count2[4] %></td>         
                          </tr>
                          <!-- and so on... -->
                      </tbody>
                  </table>
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



</body>
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>


  
  
<!-- /*버튼 클릭하면 색상 변경  */  -->
   
   <script type="text/javascript"> 
       var menuLinks = document.querySelectorAll('.button');
      function clickMenuHandler() {   // onclickMenu와 같은 on____ , _____listener, _____handler들은 이벤트 리스너들이라고 할 수 있고, 보통 이런 이름들을 가짐
           for (var i = 0; i < menuLinks.length; i++){
               menuLinks[i].classList.remove('active');
           }
           this.classList.add('active');
       }
   
       for (var i = 0; i < menuLinks.length; i++){
           menuLinks[i].addEventListener('click', clickMenuHandler);
       } 
   </script> 



<!-- 분기별 매출 그래프 설정  -->

   <%
   int a = 10;
   %>
<script>
      let myChart = document.getElementById('myChart').getContext('2d');
      let myChart2 = document.getElementById('myChart2').getContext('2d');


      Chart.defaults.global.defaultFontFamily = 'Lato';
      Chart.defaults.global.defaultFontSize = 18;
      Chart.defaults.global.defaultFontColor = '#777';
      
      
      let massPopChart = new Chart(myChart,{
         type:'polarArea',//bar,horizontalBar,pie,line,doughnut, radar, polarArea
         data:{
            labels:['<%=name[0] %>','<%=name[1] %>','<%=name[2] %>','<%=name[3] %>','<%=name[4] %>'],
            datasets:[{
               label : '식당수',
               data:[
                  <%=count[0] %>,
                  <%=count[1] %>,
                  <%=count[2] %>,
                  <%=count[3] %>,
                  <%=count[4] %>
               ],
               backgroundColor:[
                  'rgba(255,99,132,0.6)',
                  'rgba(54,162,235,0.6)',
                  'rgba(255,206,86,0.6)',
                  'rgba(75,192,192,0.6)',
                  'rgba(153,102,255,0.6)',
                  'rgba(255,159,64,0.6)',
                  'rgba(255,99,132,0.6)'      
               ],
               borderWidth:1,
               borderColor : '#777',
               hoverBorderWidth : 3,
               hoverBorderColor : '#000'
               
            }]      
         },

         options:{
            responsive: false,
            title:{
               display:false,
               text:'테스트중',
               fontSize:25,
               
            },
            legend:{
               display:true,
               position:'right',
               labels:{
                  fontColor:'#000'
               }
            },
            layout:{
               padding:{
                  left:50,
                  right:0,
                  bottom:0,
                  top:0
               }
            },
            tooltips:{
               enabled:true
            }      
         }
      });
      
      <!-- 요일별 매출 그래프 설정  -->
      let massPopChart2 = new Chart(myChart2,{
         type:'horizontalBar',//bar,horizontalBar,pie,line,doughnut, radar, polarArea
         data:{
            labels:['<%=name2[0] %>','<%=name2[1] %>','<%=name2[2] %>','<%=name2[3] %>','<%=name2[4] %>'],
            datasets:[{
               label : '집객시설수',
               data:[
                  <%=count2[0] %>,
                  <%=count2[1] %>,
                  <%=count2[2] %>,
                  <%=count2[3] %>,
                  <%=count2[4] %>
                  
               ],
               backgroundColor:[
                  'rgba(255,99,132,0.6)',
                  'rgba(54,162,235,0.6)',
                  'rgba(255,206,86,0.6)',
                  'rgba(75,192,192,0.6)',
                  'rgba(153,102,255,0.6)',
                  'rgba(255,159,64,0.6)',
                  'rgba(255,99,132,0.6)'      
               ],
               borderWidth:1,
               borderColor : '#777',
               hoverBorderWidth : 3,
               hoverBorderColor : '#000'
               
            }]      
         },

         options:{
            responsive: false,
            title:{
               display:false,
               text:'테스트중',
               fontSize:25,
               
            },
            legend:{
               display:false,
               position:'right',
               labels:{
                  fontColor:'#000'
               }
            },
            layout:{
               padding:{
                  left:50,
                  right:0,
                  bottom:0,
                  top:0
               }
            },
            tooltips:{
               enabled:true
            }      
         }
      });
      </script>    
      

</html>