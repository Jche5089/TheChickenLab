<%@page import="com.model.MemberDTO"%>
<%@page import="com.model.AnalysisDTO"%>
<%@page import="java.text.DecimalFormat"%>
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
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<link rel="stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body class="is-preload">
<%
   AnalysisDTO sales = (AnalysisDTO)session.getAttribute("anal");
   ArrayList<AnalysisDTO> qList = (ArrayList<AnalysisDTO>)session.getAttribute("quar");
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
                     <h1 class="korean"><%=sales.getHaengjeonggu() %> <%=sales.getHaengjeongdong() %>의 월평균매출은 <strong style = "color : #e72222;"><%=formatter.format(sales.getMonSales())%></strong>원 입니다.</h1>
                  
                  </header>   
               </div>
               
                  <br><br>
               <div class="content">
                  <ul class="actions">
                     <%String Haengjeongdong = sales.getHaengjeongdong(); 
                     String Haengjeonggu = sales.getHaengjeonggu();
                       
                     %>
                     <li><a href="analysis.jsp" class="button big sd1">매출분석</a></li>
                     <li><a href="AnalsisService2?name=<%=Haengjeonggu%>,<%=Haengjeongdong%>,2" class="button big sd2 as">지역(배후지)분석</a></li>
                     <li><a href="AnalsisService2?name=<%=Haengjeonggu%>,<%=Haengjeongdong%>,3" class="button big sd3 as">통계분석</a></li>
            
                  
                  </ul>
               </div>
               
               
               
            </section>
            
            
      <!-- Banner -->
            <section id="banner">
               <div class="con">
                  <h1 class="korean">○<strong> 분기별 월평균매출 </strong></h1><br><br>
                  <br><br><br>
                  <!--  그래프 -->
                  <div class= "graph">
                     <canvas id="myChart" width="800" height="500"></canvas>   
                  </div>
                  <br><br>
                  <div class="graphText div2">
                     <%
                        int max=qList.get(0).getSalesAmount();
                        int min = qList.get(0).getSalesAmount();
                        int max_q=1;
                        int min_q=1;
                        int sum=0;
                        
                        for(int i=1; i<qList.size();i++){
                           if(max <= qList.get(i).getSalesAmount()){
                              max = qList.get(i).getSalesAmount();
                              max_q = i+1;
                           }
                           
                           if(min >= qList.get(i).getSalesAmount()){
                              min = qList.get(i).getSalesAmount();
                              min_q = i+1;
                           }
                        }
                        
                        for(int i=0;i<qList.size();i++){
                           sum += qList.get(i).getSalesAmount();
                        }
                     
                     %> 
                     
                      분기별 평균매출을 살펴보면 가장 높은 월매출은 <strong style = "color : #e72222;"><%=max_q%>분기</strong>이고,
                      가장 낮은 월매출의 분기는 <strong style = "color : #e72222;"><%=min_q%>분기</strong>로 나타나고 있다.
                      각 분기의 합은 <strong style = "color : #e722222222;"><%=formatter.format(sum) %></strong>원이고, 가장 높은 분기와 가장 낮은 분기의 차이는 <strong style = "color : #e72222;"><%=formatter.format(max-min)%></strong>원이다.
                  </div>
                  
                  <table class="styled-table table">
                     <thead>
                        <tr>
                           <td rowspan="2">구분</td>
                           <td colspan="5">2020년 평균</td>   
                        </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td>분기별</td>
                           <td>1분기</td>
                           <td>2분기</td>      
                           <td>3분기</td>
                           <td>4분기</td>
                           <td>합계</td>   
                         </tr>
                        
                        <tr class="active-row">
                           <td><%=sales.getHaengjeongdong() %></td>
                           <td><%=formatter.format( qList.get(0).getSalesAmount()) %></td>
                           <td><%=formatter.format( qList.get(1).getSalesAmount() )%></td>
                           <td><%=formatter.format( qList.get(2).getSalesAmount()) %></td>
                           <td><%=formatter.format( qList.get(3).getSalesAmount() )%></td>
                           <td><%=formatter.format( sum)%></td>         
                          </tr>
                          <!-- and so on... -->
                      </tbody>
                  </table>


               </div>
            </section>
      
      
      <!-- Banner -->
            <section id="banner">
               <div class="con">
                  <h1 class="korean">○<strong> 요일별 평균매출 </strong></h1><br><br>
                  <br>
                  <!--  그래프 -->
                  <div class= "graph">
                     <canvas id="myChart2" width="800" height="500"></canvas>   
                  </div>
                  <br><br>
                  <div class="graphText div2">
                     <%
                        int[] days = new int[7];
                        days[0] = sales.getMonSales();
                        days[1] = sales.getTueSales();
                        days[2] = sales.getWenSales();
                        days[3] = sales.getThrSales();
                        days[4] = sales.getFriSalse();
                        days[5] = sales.getSatSales();
                        days[6] = sales.getSunSales();
                        
                        String[] daysN = new String[7];
                        daysN[0] = "월요일";
                        daysN[1] = "화요일";
                        daysN[2] = "수요일";
                        daysN[3] = "목요일";
                        daysN[4] = "금요일";
                        daysN[5] = "토요일";
                        daysN[6] = "일요일";
                     
                        int max2=days[0];
                        int min2=days[0];
                        String maxday="월요일";
                        String minday="월요일";
                        int sum2=0;
                        
                        for(int i=0; i<7;i++){
                           if(max2 <= days[i]){
                              max2 = days[i];
                              maxday = daysN[i];
                           }
                           if(min2 >= days[i]){
                              min2 = days[i];
                              minday = daysN[i];
                           }
                        }
                        
                        for(int i=0;i<7;i++){
                           sum2 += days[i];
                        }
                        
                     %>
                     가장 낮은 매출의 요일은 <strong style = "color : #e72222;"><%=minday %></strong>이며, 가장 높은 매출의 요일은 <strong style = "color : #e72222;"><%=maxday%>
                     </strong>이다. 가장 매출이 높은 날과
                     낮은 날의 차이는 <strong style = "color : #e72222;"><%=formatter.format(max2-min2) %></strong>원이며, 총 매출액의 합은 <strong style = "color : #e72222;"><%=formatter.format(sum2) %></strong>원이다. 
                  </div>
                  
                  <table class="styled-table table">
                     <thead>
                        <tr>
                           <td rowspan="2">구분</td>
                           <td colspan="7">2020년 평균</td>   
                        </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td>요일</td>
                            <td>월요일</td>
                           <td>화요일</td>      
                           <td>수요일</td>
                           <td>목요일</td>
                           <td>금요일</td>      
                           <td>토요일</td>      
                           <td>일요일</td>   
                         </tr>
                        
                        <tr class="active-row">
                           <td><%=sales.getHaengjeongdong() %></td>
                           <td><%=formatter.format(sales.getMonSales()) %></td>
                           <td><%=formatter.format(sales.getTueSales()) %></td>
                           <td><%=formatter.format(sales.getWenSales()) %></td>
                           <td><%=formatter.format(sales.getThrSales()) %></td>
                           <td><%=formatter.format(sales.getFriSalse()) %></td>
                           <td><%=formatter.format(sales.getSatSales()) %></td>
                           <td><%=formatter.format(sales.getSunSales()) %></td>         
                          </tr>
                          <!-- and so on... -->
                      </tbody>
                  </table>
               </div>
            </section>
            
            
                  <!-- Banner -->
            <section id="banner">
               <div class="con">
                  <h1 class="korean">○<strong> 연령별 평균매출 </strong></h1><br><br>
                  <br><br>
                  <!--  그래프 -->
                  <div class= "graph">
                     <canvas id="myChart3" width="800" height="500"></canvas>   
                  </div>
                  <br><br>
                  <div class="graphText div2">
                  
                     <%
                        int[] ageS = new int[3];
                        ageS[0] = sales.getAge20Sales();
                        ageS[1] = sales.getAge40Sales();
                        ageS[2] = sales.getAge60Sales();
                     
                        
                        String[] ageN = new String[3];
                        ageN[0] = "10 ~ 20대";
                        ageN[1] = "30 ~ 40대";
                        ageN[2] = "50 ~ 60대";
                     
                     
                        int max3=ageS[0];
                        int min3=ageS[0];
                        String maxAge=null;
                        String minAge=null;
                        int sum3=0;
                        
                        for(int i=0; i<ageS.length;i++){
                           if(max3 <= ageS[i]){
                              max3 = ageS[i];
                              maxAge = ageN[i];
                           }
                           
                           if(min3 >= ageS[i]){
                              min3 = ageS[i];
                              minAge = ageN[i];
                           }
                        }
                        
                        for(int i=0;i<3;i++){
                           sum3 += ageS[i];
                        }
                        
                     %>
                     
                     
                     연령별 평균매출에서 가장 낮은 연령대는 <strong style = "color : #e72222;"><%=minAge %></strong>이며, 가장 평균매출이 높은 연령대는 
                     <strong style = "color : #e72222;"><%=maxAge %></strong>이다. 가장 높은 수치와
                     가장 낮은 수치의 차이는 <strong style = "color : #e72222;"><%=formatter.format(max3-min3) %></strong>원이며, 총 합계는 <strong style = "color : #e72222;"><%= formatter.format(sum3) %></strong>원이다.
                  </div>
                  
                  <table class="styled-table table">
                     <thead>
                        <tr>
                           <td rowspan="2">구분</td>
                           <td colspan="5">2020년 평균</td>   
                        </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td>연령대</td>
                           <td>10 ~ 20대</td>
                           <td>30 ~ 40대</td>      
                           <td>40 ~ 60대</td>
                           <td>합계</td>
                         </tr>
                        
                        <tr class="active-row">
                              <td><%=sales.getHaengjeongdong() %></td>
                           <td><%=formatter.format(sales.getAge20Sales()) %></td>
                           <td><%=formatter.format(sales.getAge40Sales()) %></td>
                           <td><%=formatter.format(sales.getAge60Sales()) %></td>
                           <td><%=formatter.format(sales.getAge20Sales()+sales.getAge40Sales()+sales.getAge60Sales())%></td>
                        </tr>
                          <!-- and so on... -->
                      </tbody>
                  </table>
               </div>
            </section>
            
            
            <!-- Banner -->
            <section id="banner">
               <div class="con">
                  <h1 class="korean">○<strong> 성별 평균매출 </strong></h1><br><br>
                  <br><br>
                  <!--  그래프 -->
                  <div class= "graph">
                     <canvas id="myChart4" width="800" height="500"></canvas>   
                  </div>
                  <br><br>
                  <div class="graphText div2">
                  
                  <%
                        int[] gender = new int[2];
                        gender[0] = sales.getMaleSales();
                        gender[1] = sales.getFeSalesSales();

                        
                        String[] genderN = new String[2];
                        genderN[0] = "남성";
                        genderN[1] = "여성";
                     
                        int max4 = 0;
                        int min4 = 0;
                        String m = null;
                        String fe = null;
                        
                        if(sales.getMaleSales() > sales.getFeSalesSales()){
                           max4 = sales.getMaleSales();
                           m = "남성";
                           fe = "여성";
                        }else{
                           min4 = sales.getFeSalesSales();
                           m = "여성";
                           fe = "남성";
                        }
                        
                     %>
                     
                     
                     
                     성별 평균매출에서 남자의 평균 매출은 <strong style = "color : #e72222;"><%=formatter.format(sales.getMaleSales()) %></strong>이며, 여자의 평균 매출은 
                     <strong style = "color : #e72222;"><%=formatter.format(sales.getFeSalesSales()) %></strong>이다. 
                     <strong style = "color : #e72222;"><%=fe %></strong>보다 <strong style = "color : #e72222;"><%=m %></strong>의 
                     매출이 더 높으며, 두 매출의 합은 <strong style = "color : #e72222;"><%=formatter.format(sales.getMaleSales()+sales.getFeSalesSales()) %></strong>이다. 
                  </div>
                  
                  <table class="styled-table table">
                     <thead>
                        <tr>
                           <td rowspan="2">구분</td>
                           <td colspan="5">2020년 평균</td>   
                        </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td>성별</td>
                           <td>남성</td>
                           <td>여성</td>      
                           <td>합계</td>
                        
                        <tr class="active-row">
                           <td><%=sales.getHaengjeongdong() %></td>
                           <td><%=formatter.format(sales.getMaleSales()) %></td>
                           <td><%=formatter.format(sales.getFeSalesSales()) %></td>
                           <td><%=formatter.format(sales.getFeSalesSales() + sales.getMaleSales() )%></td></tr>
                          <!-- and so on... -->
                      </tbody>
                  </table>
               </div>
            </section>
            
         </div>
      </div>


		<!-- Sidebar -->
		<div id="sidebar" bgcolor="#8B0000">
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
   

<script>
      let myChart = document.getElementById('myChart').getContext('2d');
      let myChart2 = document.getElementById('myChart2').getContext('2d');
      let myChart3 = document.getElementById('myChart3').getContext('2d');
      let myChart4 = document.getElementById('myChart4').getContext('2d');

      Chart.defaults.global.defaultFontFamily = 'Lato';
      Chart.defaults.global.defaultFontSize = 18;
      Chart.defaults.global.defaultFontColor = '#777';
      
      
      let massPopChart = new Chart(myChart,{
         type:'line',//bar,horizontalBar,pie,line,doughnut, radar, polarArea
         data:{
            labels:['1분기','2분기','3분기','4분기'],
            datasets:[{
               label : '분기',
               data:[
                  <%= qList.get(0).getSalesAmount() %>,
                  <%= qList.get(1).getSalesAmount() %>,
                  <%= qList.get(2).getSalesAmount() %>,
                  <%= qList.get(3).getSalesAmount() %>,
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
         type:'bar',//bar,horizontalBar,pie,line,doughnut, radar, polarArea
         data:{
            labels:['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
            datasets:[{
               label : '요일',
               data:[
                  <%=sales.getMonSales()%>,
                  <%=sales.getTueSales()%>,
                  <%=sales.getWenSales()%>,
                  <%=sales.getThrSales()%>,
                  <%=sales.getFriSalse()%>,
                  <%=sales.getSatSales()%>,
                  <%=sales.getSunSales()%>,
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
      
      <!-- 연령별 매출 그래프 설정  -->
      let massPopChart3 = new Chart(myChart3,{
         type:'horizontalBar',//bar,horizontalBar,pie,line,doughnut, radar, polarArea
         data:{
            labels:['10~20대','30~40대','50~60대','합계'],
            datasets:[{
               label : '요일',
               data:[
                  <%=sales.getAge20Sales()%>,
                  <%=sales.getAge40Sales()%>,
                  <%=sales.getAge60Sales()%>,
                  <%=sales.getAge20Sales()+sales.getAge40Sales()+sales.getAge60Sales()%>
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
      
      <!-- 성별 매출 그래프 설정  -->
      let massPopChart4 = new Chart(myChart4,{
         type:'doughnut',//bar,horizontalBar,pie,line,doughnut, radar, polarArea
         data:{
            labels:['여자','남자'],
            datasets:[{
               label : '분기',
               data:[
                  <%=sales.getFeSalesSales()%>,
                  <%=sales.getMaleSales()%>,
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
   </script> 
   

</html>