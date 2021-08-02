<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.OrdersDTO"%>
<%@page import="com.model.OrdersDAO"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

<title>The Chicken Lab - Menu</title>
</head>
<body>
<%

MemberDTO info = null;
info = (MemberDTO)session.getAttribute("info");

OrdersDAO odao = new OrdersDAO();
ArrayList<OrdersDTO> olist = new ArrayList<OrdersDTO>();
olist=odao.select();


%>
  <!-- Wrapper -->
   <div id="wrapper">

      <!-- Main -->
      <div id="main">
         <div class="inner">

            <!-- Header -->
            <header id="header">
               <a href="main.jsp" class="logo"><strong>THE CHICKEN LA</strong>
                  for the best quality</a>
             
            </header>

            <!-- Banner -->
            <section id="banner">
               <div class="content">
                  <header>
                     <center><h2>���ֳ���</h2>
                     <br />
                     </center>
                  </header>
                  <!-- <form action="UpdateGradeService"> -->
                  <table>
                     <tr>
                     <td>��������ȣ</td>
                     <td>��ǰ��ȣ</td>
                     <td>��ǰ����</td>
                     <td>��ǰ�ѱݾ�</td>
                     </tr>
                     
                     <%for (int i = 0; i < olist.size(); i++) {%>

      
                     <tr>
                        <td><%=olist.get(i).getFrc_num()%></td>
                        <td><%=olist.get(i).getArt_id()%></td>
                        <td><%=olist.get(i).getOrder_count()%></td>
                        <td><%=olist.get(i).getTotal_price()%></td>
                     </tr>

                     <%}%>
                     
                  </table>
                    
                  <!-- </form> -->
                  
               </div>
               
            </section>

         </div>
      </div>
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
                  
                  <%if (info != null) {%>
                  <%if (info.getMem_id().equals("admin")){ %>
                  <li><span class="opener">������ �м� LAB</span>
                     <ul>
                        <li><a href="mat_map.jsp">��Ǻм�</a></li>
                     </ul>
                  </li>
                  <li><a href="select.jsp">ȸ������</a></li>
                  <li><a href="#">���ֽ�û����</a></li>
                  <li><a href="questionAdmin.jsp">���ͽ�û����</a></li>
                  
                  <%} else{%>
                  <li><span class="opener">������ �м� LAB</span>
                     <ul>
                        <li><a href="mat_map.jsp">��Ǻм�</a></li>
                     </ul>
                  </li>
                  <%if (info.getMem_grade().equals("B")) {%>
                  <!-- <li><a href="stock.jsp">������</a></li> -->
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
</html>