<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.model.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
#myChart {
	left: 50%;
}

div.graph1 {
	/* float : left; */
	/* position: relative; 
	 margin-bottom : 10px;
	 bottom : 60px; */
	margin-left: 100px;
	margin: 0 auto;
	left: 50%;
}
</style>
</head>
<body>


	<%
	int total00 = 0;
   MemberDTO info = null;
   info = (MemberDTO)session.getAttribute("info");
   
   
     String pre = request.getParameter("predict"); 
      String[] array = pre.split(",");
      
      //날짜
      SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
      Date currentTime = new Date();
      String mTime = s.format(currentTime);

       String dt = mTime;  // 시작 날짜
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      Calendar c = Calendar.getInstance();
      c.setTime(sdf.parse(dt));
      
      String[] dtime = new String[7];
      for(int i=0; i<7;i++){
         c.add(Calendar.DATE, 1);  //하루를 더해준다.
         dtime[i] = sdf.format(c.getTime());  // dt는 하루를 더한 날짜 */
         
      }
   
   
%>
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="main.jsp" class="logo"><strong>THE CHICKEN
							LAB</strong> for the best quality</a>

				</header>

				<!-- Banner -->
				<section class="graph1">
					
						<h1 class="korean">
							○<strong> 재고관리 </strong>
						</h1>
						<br> <br> <br>

						<div class="graph1">
							<center><canvas id="myChart" width="1000" height="700"></canvas>
					</center>
			</div>


			</section>


			<!-- Banner -->


			<section id="banner">

				<div class="content">
					<header>
						<center>
							<h2>품목 발주</h2>
							<br />
						</center>
					</header>

					<form action="OrderServiece">
						<table class="exam">
							<tr align="center">
								<td>품목번호</td>
								<td>품목 이름</td>
								<td>단가</td>
								<td>수량</td>
								<td><b>추천량</b></td>
								<td>가격</td>
							</tr>

							<tr align="center">
								<td bgcolor="white" id="1">1</td>
								<td bgcolor="white">생닭</td>
								<td bgcolor="white" name="1.price" id="1.price">3000원<br />(숫자당
									700g기준)
								</td>

								<td bgcolor="white" name="s.chicken"><input type="number"
									min="0" max="500" style="text-align: center; width: 50%"
									name="chicken" id="oneCount" class="num_only num_sum"></td>
								<% 
                     	int sum=0;
                     	for(int i=0; i<array.length;i++){
                     		sum += Integer.parseInt(array[i]);
                     		
                     	}
                     	sum = sum/10;
                     	
                     	
                     %>
								<td><b><%=sum %></b></td>

								<td id="partOne" id="partOne"></td>
							</tr>
							<tr align="center">
								<td bgcolor="white" id="2">2</td>
								<td bgcolor="white">식용유</td>
								<td bgcolor="white" name="2.price" id="2.price">34500원<br />(숫자당
									18L기준)
								</td>

								<td bgcolor="white" name="s.oil"><input type="number"
									min="0" max="500" style="text-align: center; width: 50%"
									name="oil" id="twoCount" class="num_only num_sum"></td>

								<td><b><%=sum/70 %></b></td>

								<td id="partTwo" id="partTwo"></td>
							</tr>
							<tr align="center">
								<td bgcolor="white" id="3">3</td>
								<td bgcolor="white">치킨무</td>
								<td bgcolor="white" name="3.price" id="3.price">400원<br />(숫자당
									170g기준)
								</td>

								<td bgcolor="white" name="s.daikon"><input type="number"
									min="0" max="500" style="text-align: center; width: 50%"
									name="daikon" id="threeCount" class="num_only num_sum">
								</td>
								<td><b><%=sum %></b></td>

								<td id="partThree" id="partThree"></td>
							</tr>
							<tr align="center">
								<td bgcolor="white" id="4">4</td>
								<td bgcolor="white">튀김가루</td>
								<td bgcolor="white" name="4.price" id="4.price">20000원<br />(숫자당
									5kg기준)
								</td>

								<td bgcolor="white" name="4.frying powder"><input
									type="number" min="0" max="500"
									style="text-align: center; width: 50%" name="powder"
									id="fourCount" class="num_only num_sum"></td>
								<td><b><%=sum/40 %></b></td>

								<td id="partFour" id="partFour"></td>
							</tr>
							<tr align="center">
								<td bgcolor="white" id="5">5</td>
								<td bgcolor="white">콜라</td>
								<td bgcolor="white" name="5.price" id="5.price">460원<br />(숫자당
									500ml기준)
								</td>

								<td bgcolor="white" name="s.beer"><input type="number"
									min="0" max="500" style="text-align: center; width: 50%"
									name="beer" id="fiveCount" class="num_only num_sum"></td>
								<td><b><%=sum %></b></td>

								<td id="partFive" id="partFive"></td>

							</tr>
							<tr align="center">
								<td bgcolor="white" id="6">6</td>
								<td bgcolor="white">맥주</td>
								<td bgcolor="white" name="6.price" id="6.price">2150원<br />(숫자당
									360ml기준)
								</td>

								<td bgcolor="white" name="s.soju"><input type="number"
									min="0" max="500" style="text-align: center; width: 50%"
									name="soju" id="sixCount" class="num_only num_sum"></td>
								<td><b><%=sum %></b></td>

								<td id="partSix" id="partSix"></td>

							</tr>
							<tr align="center">
								<td bgcolor="white" id="7">7</td>
								<td bgcolor="white">치킨양념</td>
								<td bgcolor="white" id="7.price">30000원<br />(숫자당 5kg기준)
								</td>

								<td bgcolor="white"><input type="number" min="0" max="500"
									style="text-align: center; width: 50%" name="sauce"
									id="sevenCount" class="num_only num_sum"></td>
								<td><b><%=sum/40 %></b></td>

								<td id="partSeven" id="partSeven"></td>
							</tr>


							<tr align="center">
								<td bgcolor="white" id="7"></td>
								<td bgcolor="white"></td>
								<td bgcolor="white" id="7.price"></td>

								<td bgcolor="white"></td>
								<td>총 발주금액</td>

								<td id="part0"></td>
							</tr>



						</table>
						<center>
							<input class="button next scrolly" id="selectBtn" value="주문">
							<!-- <a href="" class="button next scrolly">초기화</a> -->
						</center>
					</form>

				</div>
			</section>


		</div>
	</div>
	<script src="./JavaScript/jquery-3.6.0.min.js"></script>

	<script type="text/javascript">
      $("#selectBtn").click(function(){
   		alert('주문 완료되었습니다.')
         location.href="main.jsp";
         
         let one =document.getElementById("1");
         let two =document.getElementById("2");
         let three =document.getElementById("3");
         let four =document.getElementById("4");
         let five =document.getElementById("5");
         let six =document.getElementById("6");
         let seven =document.getElementById("7");
        
         let partOne=document.getElementById("partOne");
         let partTwo=document.getElementById("partTwo");
         let partThree=document.getElementById("partThree");
         let partFour=document.getElementById("partFour");
         let partFive=document.getElementById("partFive");
         let partSix=document.getElementById("partSix");
         let partSeven=document.getElementById("partSeven");
         
         let chicken=document.getElementById("oneCount").value;
         let oil=document.getElementById("twoCount").value;
         let doikon=document.getElementById("threeCount").value;
         let powder=document.getElementById("fourCount").value;
         let bear=document.getElementById("fiveCount").value;
         let soju=document.getElementById("sixCount").value;
         let sauce=document.getElementById("sevenCount").value;
         
         $.ajax({ 
            type : "post",
            charset : "EUC-KR",
            data :{
               "1":one.innerHTML, '2':two.innerHTML,   "3":three.innerHTML, "4":four.innerHTML, "5":five.innerHTML, "6":six.innerHTML, "7":seven.innerHTML,
               "chicken_count":chicken, "oil_count":oil, "doikon_count":doikon, "powder_count":powder, "bear_count":bear, "soju_count":soju, "sauce_count":sauce,
               "partOne":partOne.innerHTML, "partTwo":partTwo.innerHTML, "partThree":partThree.innerHTML, "partFour":partFour.innerHTML,
               "partFive":partFive.innerHTML, "partSix":partSix.innerHTML, "partSeven":partSeven.innerHTML
               },// "id":$('#id').val() ===> key값:value id를 통해서 .val()-> 안에있는 content 값
            url : "OrderServiece" //연결할 servelt, api를 받아올때도 url 로 받았는데 그때그때 상황에 맞게 사용하면 되는지?
         });
         
        
      });
   
      
      let onePrice=null;
      var array_one=null;
      var array_price=null;
      var price1=null;
      let oneCount=null;
      var totalOne=null;
	  var total00 = 0;
   
      
         $('#oneCount').on('click',function(){
              onePrice=document.getElementById("1.price");
              array_one=onePrice.innerHTML;
              array_price=array_one.split("원");
              
              price1= parseInt(array_price[0]);
              oneCount=document.getElementById("oneCount").value;
              console.log(oneCount.innerHTML)
              totalOne=price1*oneCount;
              
              console.log(totalOne);
              let partOne=document.getElementById("partOne");
                partOne.innerHTML=totalOne;  
                total00 += totalOne;
         });
         

       let twoPrice=null;
       var array_two=null;
       var array_price=null;
       var  price2=null;
       let twoCount=null;
       var totalTwo=null; 
      
         
         
         $('#twoCount').on('click',function(){
            twoPrice=document.getElementById("2.price");
            
            array_two=twoPrice.innerHTML;
            array_price=array_two.split("원");
            price2= parseInt(array_price[0]);
            
            twoCount=document.getElementById("twoCount").value;
             console.log(twoCount.innerHTML);
             totalTwo=price2*twoCount;
              
              console.log(totalTwo);
              
              let partTwo=document.getElementById("partTwo");
                partTwo.innerHTML=totalTwo;
                total00 += totalTwo;
           
         });
         
         

      let threePrice=null;
       var array_three=null; 
       var array_price= null;
       var price3=null; 
      let threeCount=null;
      var totalThree=null;
        
      $('#threeCount').on('click',function(){
          threePrice = document.getElementById("3.price");
          array_three = threePrice.innerHTML;
          array_price = array_three.split("원");
          price3= parseInt(array_price[0]);
            
          threeCount=document.getElementById("threeCount").value;
           console.log(threeCount.innerHTML);
           totalThree=price3*threeCount;
             
           console.log(totalThree);
              
           let partThree=document.getElementById("partThree");
           partThree.innerHTML=totalThree;
           total00 += totalThree;
         
         }); 
      
      let fourPrice=null;
      var array_four=null;
         var array_price= null
         var price4= null;
       let fourCount=null;
       var totalFour=null;
      
        
      $('#fourCount').on('click',function(){
         fourPrice = document.getElementById("4.price");
         array_four = fourPrice.innerHTML;
         array_price = array_four.split("원");
         price4= parseInt(array_price[0]);
            
         fourCount=document.getElementById("fourCount").value;
           console.log(fourCount);
           totalFour=price4*fourCount;
             
           console.log(totalFour);
              
          let partFour=document.getElementById("partFour");
            partFour.innerHTML=totalFour;
            total00 += totalFour;
         }); 
       
        let fivePrice=null;
         var array_five=null;
         var array_price=null;
         var price5= null;
       let fiveCount=null;
       var totalFive=null;
      
        
      $('#fiveCount').on('click',function(){
         fivePrice = document.getElementById("5.price");
         array_five = fivePrice.innerHTML;
         array_price = array_five.split("원");
         price5= parseInt(array_price[0]);
            
         fiveCount=document.getElementById("fiveCount").value;
           console.log(fiveCount);
           totalFive=price5*fiveCount;
             
           console.log(totalFive);
              
           let partFive=document.getElementById("partFive");
            partFive.innerHTML=totalFive;
            total00 += totalFive;
         }); 

       
       let sixPrice=null;
         var array_six=null;
         var array_price=null;
         var price6=null;
       let sixCount=null;
       var totalSix=null;
          
        
      $('#sixCount').on('click',function(){
         sixPrice = document.getElementById("6.price");
         array_six = sixPrice.innerHTML;
         array_price = array_six.split("원");
         price6=  parseInt(array_price[0]);
            
         sixCount=document.getElementById("sixCount").value;
           console.log(sixCount);
           totalSix=price6*sixCount;
             
           console.log(totalSix);
              
           let partSix=document.getElementById("partSix");
            partSix.innerHTML=totalSix;
            total00 += totalSix;
         }); 
   
       let sevenPrice=null;
       var array_seven=null;
         var array_price=null;
         var price7= null;
         let sevenCount=null;
         var totalSeven=null;
         
         
         $('#sevenCount').on('click',function(){
            sevenPrice =document.getElementById("7.price");
            array_seven = sevenPrice.innerHTML;
            array_price = array_seven.split("원");
            price7=  parseInt(array_price[0]);
            
            sevenCount=document.getElementById("sevenCount").value;
           console.log(sevenCount);
           totalSeven=price7*sevenCount;
             
           console.log(totalSeven);
           
            let partSeven=document.getElementById("partSeven");
            partSeven.innerHTML=totalSeven;
            total00 += totalSeven;
            

    
         }); 
              
/*          
         
         $('#count').on('click',function(){

                
                let partSeven=document.getElementById("part0");
                part0.innerHTML=total00;
                 
                 
         
              });  */
         
    $(function(){
         
          	$('input.num_only').on('keyup',function(){
  	          var cnt = $(".exam input.num_sum").length;     
  	          console.log("cnt" + cnt);
  	          
		   
  	        var sum1 = parseInt($("#sevenCount").val() || 0 ) *30000;
  	        var sum2 = parseInt($("#sixCount").val() || 0 ) *2150;
  	        var sum3 = parseInt($("#fiveCount").val() || 0 ) *460;
  	        var sum4 = parseInt($("#fourCount").val() || 0 ) *20000;
  	        var sum5 = parseInt($("#threeCount").val() || 0 ) *400;
  	        var sum6 = parseInt($("#twoCount").val() || 0 ) *34500;
  	        var sum7 = parseInt($("#oneCount").val() || 0 ) *3000;
  	        
  	      var sum = sum1 + sum2 + sum3 + sum4 + sum5 + sum6 + sum7; 
			  				part0.innerHTML=sum;
        		});


        		 
     });
       
      </script>

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
						</ul></li>
					<li><a href="select.jsp">회원관리</a></li>
					<li><a href="order_list.jsp">발주신청내역</a></li>
					<li><a href="questionAdmin.jsp">가맹신청내역</a></li>

					<%} else{%>
					<li><span class="opener">데이터 분석 LAB</span>
						<ul>
							<li><a href="mat_map.jsp">상권분석</a></li>
						</ul></li>
					<%if (info.getMem_grade().equals("B")) {%>
					<li><a href="stock.jsp">재고관리</a></li>
					<li><a href="order.jsp">발주신청</a></li>
					<%}%>

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

	<%=total00 %>

</body>

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


      Chart.defaults.global.defaultFontFamily = 'Lato';
      Chart.defaults.global.defaultFontSize = 18;
      Chart.defaults.global.defaultFontColor = '#777';
      
      
      let massPopChart = new Chart(myChart,{
          type:'bar',//bar,horizontalBar,pie,line,doughnut, radar, polarArea
          data:{
             labels:['<%=dtime[0]%>','<%=dtime[1]%>','<%=dtime[2]%>','<%=dtime[3]%>','<%=dtime[4]%>','<%=dtime[5]%>','<%=dtime[6]%>'],
             datasets:[{
                label : '예측량',
                data:[
                   
                   <%=array[0]%>,
                   <%=array[1]%>,
                   <%=array[2]%>,
                   <%=array[3]%>,
                   <%=array[4]%>,
                   <%=array[5]%>,
                   <%=array[6]%>,

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