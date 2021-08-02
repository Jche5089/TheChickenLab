<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<div class="alert alert-primary" role="alert">
  <h3>
  �ݾ� input �ڽ��� �ݾ� �Է½� �ϴܿ� �ݾ� �ڵ���� 
</h3>
</div>

<table class="table table-bordered exam">
  <tbody>
    <tr class="">
      <th class="align-middle w-10 bg-light text-center">�ݾ�</th>
      <td class="w-70 pl-4"><input type="text" class="form-control num_only num_comma num_sum" id="fn_type1_price" name="fn_type1_price" value="" placeholder=""></td>
    </tr>
    <tr>
      <th class="align-middle w-10 bg-light text-center">�ݾ�</th>
      <td class="w-70 pl-4"><input type="text" class="form-control num_only num_comma num_sum" id="fn_type2_price" name="fn_type2_price" value="" placeholder=""></td>
    </tr>
    <tr>
      <th class="align-middle w-10 bg-light text-center">�ݾ�</th>
      <td class="w-70 pl-4"><input type="text" class="form-control num_only num_comma num_sum" id="fn_one_price" name="fn_one_price" value="" placeholder=""></td>
    </tr>
    <tr>
      <th class="align-middle w-10 bg-light text-center">�ݾ�</th>
      <td class="w-70 pl-4"><input type="text" class="form-control num_only num_comma num_sum" id="fn_flw_price" name="fn_flw_price" value="" placeholder=""></td>
    </tr>
    <tr>
      <th class="align-middle w-10 bg-light text-center">�ݾ�</th>
      <td class="w-70 pl-4"><input type="text" class="form-control num_only num_comma num_sum" id="fn_flag_price" name="fn_flag_price" value="" placeholder=""></td>
    </tr>
    <tr>
      <th class="align-middle w-10 bg-light text-center">�ݾ�</th>
      <td class="w-70 pl-4"><input type="text" class="form-control num_only num_comma num_sum" id="fn_etc_price" name="fn_etc_price" value="" placeholder=""></td>
    </tr>
    <tr>

      <th class="align-middle w-10 bg-light text-center">�ݾ�</th>
      <td class="w-70 pl-4"><input type="text" class="form-control num_only num_comma num_sum" id="fn_change_price" name="fn_change_price" value="" placeholder=""></td>
    </tr>
    <tr>
      <th class="align-middle bg-light text-center p-2" >�հ�</th>
      <td class="pl-4" colspan="2">
        <input type="text" class="form-control text-right font-weight-bold num_only num_comma num_sum" id="fn_total" name="fn_total" value="" placeholder="">
        <div id="han_money" class="text-right"></div>
      </td>
    </tr>

  </tbody>
</table>
	
 <script src="./JavaScript/jquery-3.6.0.min.js"></script>	
<script type="text/javascript">

$(function(){

	$('input.num_only').on('keyup',function(){
	          var cnt = $(".exam input.num_sum").length;     
	          console.log(cnt);
	          

	  
	            var sum1 = parseInt($("#fn_type1_price").val() || 0 ); // input ���� �������� ��������� ���� ������� 0�� ���Եȴ�  �޺κп� ( || 0 ) ������� �հ迡 ������ ���� NaN ���� ��������
	            var sum2 = parseInt($("#fn_type2_price").val() || 0);
	            var sum3 = parseInt($("#fn_one_price").val() || 0);
	            var sum4 = parseInt($("#fn_flw_price").val() || 0);
	            var sum5 = parseInt($("#fn_flag_price").val() || 0);
	            var sum6 = parseInt($("#fn_etc_price").val() || 0);
	            var sum7 = parseInt($("#fn_change_price").val() || 0);

	            var sum = sum1 + sum2 + sum3 + sum4 + sum5 + sum6 + sum7;
	            console.log(sum);
	            $("#fn_total").val(sum);
	        });


	 
	});


</script>
	
	


</body>
</html>