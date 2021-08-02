<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
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
<title>Insert title here</title>
</head>
<body>

<% 
   String pre = request.getParameter("predict"); 
   String[] array = pre.split(",");
   
   //��¥
   SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
   Date currentTime = new Date();
   String mTime = s.format(currentTime);

    String dt = mTime;  // ���� ��¥
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
   Calendar c = Calendar.getInstance();
   c.setTime(sdf.parse(dt));
   
   String[] dtime = new String[7];
   for(int i=0; i<7;i++){
      c.add(Calendar.DATE, 1);  //�Ϸ縦 �����ش�.
      dtime[i] = sdf.format(c.getTime());  // dt�� �Ϸ縦 ���� ��¥ */
      
   }
   
%>
    <!--  �׷��� -->

    <div id="wrapper">

      <!-- Main -->
      <div id="main">
         <div class="inner">

            <!-- Header -->
            <header id="header">
               <a href="main.jsp" class="logo"><strong>THE COFFEE LAB</strong>
                  for the best quality</a>

            </header>

  <!-- Banner -->
            <section class= "graph1">
              <h1 class="korean">��<strong> ������ </strong></h1><br><br>
                  <br>

                 <div class= "graph1">
                                 <canvas id="myChart" width="1400" height="700"></canvas>   
                 </div>
                 
                            
            </section>
     
            <!-- Banner -->
            <section id="banner">
               <div class="content">
                  <header>
                     <center><h2>ǰ��</h2></center>
                  </header>
                
                  <table>
                     <tr>
                     <td>ǰ����̵�</td>
                     <td>ǰ�� �̸�</td>
                     <td>�ܰ�</td>
                     <td>����</td>
                     <td>����</td>
                     </tr>
                    </table>
                    
                    
                    <form action="UpdateGradeService" name="updateForm">
                     <table>
                     
                     <tr>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                     </tr>
                     
                     </table>
                   </form>
                  <button type="button"  class="button next scrolly" id="selectBtn" >�ֹ�</button>          
                  <a href="" class="button next scrolly">�ʱ�ȭ</a>                
               </div>               
            </section>
         </div>
      </div>
      
         <div id="sidebar" bgcolor="#008080">
         <div class="inner">

            
            <section id="search" class="alt">
               <form method="post" action="#">
                  <input type="text" name="query" id="query" placeholder="Search">
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

                  <li><span class="opener">������ �м� LAB</span>
                     <ul>
                        <li><a href="#">��Ǻм�</a></li>
                     </ul>
                  <li><a href="#">������</a></li>
                  <li><a href="#">���͹���</a></li>
                  <li><span class="opener">����������</span>
                     <ul>
                        <li><a href="#">���� Ȯ��</a></li>
                        <li><a href="#">ȸ������ ����</a></li>
                        <li><a href="#">ȸ��Ż��</a></li>
                     </ul></li>                   
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

   <%
   int a = 10;
   %>
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
               label : '������',
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