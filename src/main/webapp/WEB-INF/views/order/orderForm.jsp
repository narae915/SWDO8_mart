<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <!-- <meta charset="UTF-8"> -->
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SpringDay * 결제 정보 넘김</title>

</head>

<body>
<!-- 22-04-07 노채린 -->
<!-- cart.jsp와 orderFormForward.jsp의 중간 역할. -->
<!-- 띄워지는 페이지는 orderFormForward.jsp 이지만, 주소값은 orderForm.jsp. -->
<table border="1">
      <tr>
      <%-- 	<jsp:forward page="orderFormForward.jsp">
 			<jsp:param value="" name="" />
		</jsp:forward> --%>
		
		<%
			/* 총계 */
			String totalPrice = request.getParameter("totalPrice");
			
			String total1 = totalPrice.substring(totalPrice.length()-3,totalPrice.length());
			String total2 = totalPrice.substring(0, totalPrice.length()-3);
			// int total2 = Integer.parseInt(total1);
			
			// int total3 = Integer.parseInt(totalPrice);
			// String total4 = total3.toLocaleString();
			// String total3 = totalPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
			request.setAttribute("total3", total2 + ',' + total1);

			/* 체크박스 */
			/*
			for(int i=0; i<6; i++){
				// String cartItemNumi = request.getParameter("cartItemNum"+i);
				// request.setAttribute("cartItemNum"+i, cartItemNumi);
				String [] cartNumArr = request.getParameterValues("cartNumArr");
				
				String cartItemAmounti = request.getParameter("cartItemAmount"+i);
				request.setAttribute("cartItemAmount"+i, cartItemAmounti);
			}
			*/
			
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("orderFormForward.jsp");
			
			dispatcher.forward(request, response);
			
		%>			
	</tr>
</table>
   
</body>

</html>