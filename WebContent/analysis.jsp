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
<title>The CHICKEN LAB - ��Ǻм�</title>
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
                     <h1 class="korean"><%=sales.getHaengjeonggu() %> <%=sales.getHaengjeongdong() %>�� ����ո����� <strong style = "color : #e72222;"><%=formatter.format(sales.getMonSales())%></strong>�� �Դϴ�.</h1>
                  
                  </header>   
               </div>
               
                  <br><br>
               <div class="content">
                  <ul class="actions">
                     <%String Haengjeongdong = sales.getHaengjeongdong(); 
                     String Haengjeonggu = sales.getHaengjeonggu();
                       
                     %>
                     <li><a href="analysis.jsp" class="button big sd1">����м�</a></li>
                     <li><a href="AnalsisService2?name=<%=Haengjeonggu%>,<%=Haengjeongdong%>,2" class="button big sd2 as">����(������)�м�</a></li>
                     <li><a href="AnalsisService2?name=<%=Haengjeonggu%>,<%=Haengjeongdong%>,3" class="button big sd3 as">���м�</a></li>
            
                  
                  </ul>
               </div>
               
               
               
            </section>
            
            
      <!-- Banner -->
            <section id="banner">
               <div class="con">
                  <h1 class="korean">��<strong> �б⺰ ����ո��� </strong></h1><br><br>
                  <br><br><br>
                  <!--  �׷��� -->
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
                     
                      �б⺰ ��ո����� ���캸�� ���� ���� �������� <strong style = "color : #e72222;"><%=max_q%>�б�</strong>�̰�,
                      ���� ���� �������� �б�� <strong style = "color : #e72222;"><%=min_q%>�б�</strong>�� ��Ÿ���� �ִ�.
                      �� �б��� ���� <strong style = "color : #e722222222;"><%=formatter.format(sum) %></strong>���̰�, ���� ���� �б�� ���� ���� �б��� ���̴� <strong style = "color : #e72222;"><%=formatter.format(max-min)%></strong>���̴�.
                  </div>
                  
                  <table class="styled-table table">
                     <thead>
                        <tr>
                           <td rowspan="2">����</td>
                           <td colspan="5">2020�� ���</td>   
                        </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td>�б⺰</td>
                           <td>1�б�</td>
                           <td>2�б�</td>      
                           <td>3�б�</td>
                           <td>4�б�</td>
                           <td>�հ�</td>   
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
                  <h1 class="korean">��<strong> ���Ϻ� ��ո��� </strong></h1><br><br>
                  <br>
                  <!--  �׷��� -->
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
                        daysN[0] = "������";
                        daysN[1] = "ȭ����";
                        daysN[2] = "������";
                        daysN[3] = "�����";
                        daysN[4] = "�ݿ���";
                        daysN[5] = "�����";
                        daysN[6] = "�Ͽ���";
                     
                        int max2=days[0];
                        int min2=days[0];
                        String maxday="������";
                        String minday="������";
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
                     ���� ���� ������ ������ <strong style = "color : #e72222;"><%=minday %></strong>�̸�, ���� ���� ������ ������ <strong style = "color : #e72222;"><%=maxday%>
                     </strong>�̴�. ���� ������ ���� ����
                     ���� ���� ���̴� <strong style = "color : #e72222;"><%=formatter.format(max2-min2) %></strong>���̸�, �� ������� ���� <strong style = "color : #e72222;"><%=formatter.format(sum2) %></strong>���̴�. 
                  </div>
                  
                  <table class="styled-table table">
                     <thead>
                        <tr>
                           <td rowspan="2">����</td>
                           <td colspan="7">2020�� ���</td>   
                        </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td>����</td>
                            <td>������</td>
                           <td>ȭ����</td>      
                           <td>������</td>
                           <td>�����</td>
                           <td>�ݿ���</td>      
                           <td>�����</td>      
                           <td>�Ͽ���</td>   
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
                  <h1 class="korean">��<strong> ���ɺ� ��ո��� </strong></h1><br><br>
                  <br><br>
                  <!--  �׷��� -->
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
                        ageN[0] = "10 ~ 20��";
                        ageN[1] = "30 ~ 40��";
                        ageN[2] = "50 ~ 60��";
                     
                     
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
                     
                     
                     ���ɺ� ��ո��⿡�� ���� ���� ���ɴ�� <strong style = "color : #e72222;"><%=minAge %></strong>�̸�, ���� ��ո����� ���� ���ɴ�� 
                     <strong style = "color : #e72222;"><%=maxAge %></strong>�̴�. ���� ���� ��ġ��
                     ���� ���� ��ġ�� ���̴� <strong style = "color : #e72222;"><%=formatter.format(max3-min3) %></strong>���̸�, �� �հ�� <strong style = "color : #e72222;"><%= formatter.format(sum3) %></strong>���̴�.
                  </div>
                  
                  <table class="styled-table table">
                     <thead>
                        <tr>
                           <td rowspan="2">����</td>
                           <td colspan="5">2020�� ���</td>   
                        </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td>���ɴ�</td>
                           <td>10 ~ 20��</td>
                           <td>30 ~ 40��</td>      
                           <td>40 ~ 60��</td>
                           <td>�հ�</td>
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
                  <h1 class="korean">��<strong> ���� ��ո��� </strong></h1><br><br>
                  <br><br>
                  <!--  �׷��� -->
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
                        genderN[0] = "����";
                        genderN[1] = "����";
                     
                        int max4 = 0;
                        int min4 = 0;
                        String m = null;
                        String fe = null;
                        
                        if(sales.getMaleSales() > sales.getFeSalesSales()){
                           max4 = sales.getMaleSales();
                           m = "����";
                           fe = "����";
                        }else{
                           min4 = sales.getFeSalesSales();
                           m = "����";
                           fe = "����";
                        }
                        
                     %>
                     
                     
                     
                     ���� ��ո��⿡�� ������ ��� ������ <strong style = "color : #e72222;"><%=formatter.format(sales.getMaleSales()) %></strong>�̸�, ������ ��� ������ 
                     <strong style = "color : #e72222;"><%=formatter.format(sales.getFeSalesSales()) %></strong>�̴�. 
                     <strong style = "color : #e72222;"><%=fe %></strong>���� <strong style = "color : #e72222;"><%=m %></strong>�� 
                     ������ �� ������, �� ������ ���� <strong style = "color : #e72222;"><%=formatter.format(sales.getMaleSales()+sales.getFeSalesSales()) %></strong>�̴�. 
                  </div>
                  
                  <table class="styled-table table">
                     <thead>
                        <tr>
                           <td rowspan="2">����</td>
                           <td colspan="5">2020�� ���</td>   
                        </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td>����</td>
                           <td>����</td>
                           <td>����</td>      
                           <td>�հ�</td>
                        
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

   </div> 



</body>
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>


  
  
<!-- /*��ư Ŭ���ϸ� ���� ����  */  -->
   
   <script type="text/javascript"> 
       var menuLinks = document.querySelectorAll('.button');
      function clickMenuHandler() {   // onclickMenu�� ���� on____ , _____listener, _____handler���� �̺�Ʈ �����ʵ��̶�� �� �� �ְ�, ���� �̷� �̸����� ����
           for (var i = 0; i < menuLinks.length; i++){
               menuLinks[i].classList.remove('active');
           }
           this.classList.add('active');
       }
   
       for (var i = 0; i < menuLinks.length; i++){
           menuLinks[i].addEventListener('click', clickMenuHandler);
       } 
   </script> 



<!-- �б⺰ ���� �׷��� ����  -->
   

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
            labels:['1�б�','2�б�','3�б�','4�б�'],
            datasets:[{
               label : '�б�',
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
               text:'�׽�Ʈ��',
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
      
      <!-- ���Ϻ� ���� �׷��� ����  -->
      let massPopChart2 = new Chart(myChart2,{
         type:'bar',//bar,horizontalBar,pie,line,doughnut, radar, polarArea
         data:{
            labels:['������','ȭ����','������','�����','�ݿ���','�����','�Ͽ���'],
            datasets:[{
               label : '����',
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
               text:'�׽�Ʈ��',
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
      
      <!-- ���ɺ� ���� �׷��� ����  -->
      let massPopChart3 = new Chart(myChart3,{
         type:'horizontalBar',//bar,horizontalBar,pie,line,doughnut, radar, polarArea
         data:{
            labels:['10~20��','30~40��','50~60��','�հ�'],
            datasets:[{
               label : '����',
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
               text:'�׽�Ʈ��',
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
      
      <!-- ���� ���� �׷��� ����  -->
      let massPopChart4 = new Chart(myChart4,{
         type:'doughnut',//bar,horizontalBar,pie,line,doughnut, radar, polarArea
         data:{
            labels:['����','����'],
            datasets:[{
               label : '�б�',
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
               text:'�׽�Ʈ��',
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