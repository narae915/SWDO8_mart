<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>SpringDay | Header</title>
</head>

<body>
    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="header-top">
            <div class="container">
                <div class="ht-left">
                    <div class="mail-service">
                        <i class=" fa fa-envelope"></i>
                        springday24@gmail.com
                    </div>
                    <div class="phone-service">
                        <i class=" fa fa-phone"></i>
                        +82 62.123.456
                    </div>
                </div>
                <div class="ht-right">
                	<sec:authorize access="isAnonymous()">
                    <a href="/user/login" class="login-panel"><i class="fa fa-user"></i>로그인</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<!-- 로그아웃(form안의 내용을 가지고감) -->
  					<a href="#" class="login-panel" onclick="document.getElementById('logout').submit();"><i class="fa fa-user"></i>로그아웃</a>
                    <form id="logout" action="/user/logout" method="POST">
   						<input name="${_csrf.parameterName}" id="token" type="hidden" value="${_csrf.token}"/>
					</form>
					</sec:authorize>
                    <div class="lan-selector">
                        <select class="language_drop" name="countries" id="countries" style="width:300px;">
                            <option value='yt' data-image="/resources/img/flag-1.jpg" data-imagecss="flag yt"
                                data-title="Korea">한국어</option>
                            <option value='yu' data-image="/resources/img/flag-2.jpg" data-imagecss="flag yu"
                                data-title="Japanese">일본어 </option>
                        </select>
                    </div>
                    <div class="top-social">
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="/">
                                <img src="/resources/img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <div class="input-group">
                                <input type="text" placeholder="무엇을 원하시나요?">
                                <button type="button"><i class="ti-search"></i></button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                        	<li class="heart-icon">
 	                      	<sec:authorize access="isAuthenticated()">
                                <span>${sessionScope.welcomeMessage }</span>
                            </sec:authorize>
                            <li class="cart-icon">
                                <a href="#" onmouseover="selectCartList();">
                                <input type="hidden" id="loginMail" value="${sessionScope.userMail }">
                                    <i class="icon_bag_alt" onmouseover="selectCartList();"></i>
                                    <span>+</span>
                                </a>
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table id="cartList">
                                            <tbody>
                                            	<c:forEach items="${cartList }" var="cart">
                                                <tr>
                                                    <td class="si-pic"><img src="/resources/img/select-product-1.jpg" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>${cart.price } x ${cart.cartAmount }</p>
                                                            <h6>${cart.itemName }</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <i class="ti-close"></i>
                                                    </td>
                                                </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="select-button">
                                        <a href="/order/cart" class="primary-btn view-card">장바구니 바로가기</a>
                                        <a href="/order/orderList" class="primary-btn checkout-btn">결제 바로가기</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>모든 메뉴</span>
                        <ul class="depart-hover">
                            <li class="active"><a href="/item/itemList">식품 마트</a></li>
                            <li><a href="/recipe/recipeList">커뮤니티</a></li>
                            <li><a href="/user/mypage">마이 페이지</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li class="active"><a href="/">메인 | Home</a></li>
                        <li><a href="/item/itemList">식품 마트 | Food Mart</a></li>
                        <li><a href="/recipe/recipeList">커뮤니티 | Community</a>
                        <c:choose>
                        <c:when test="${not empty sessionScope.userMail }">
							<li><a href="/user/mypage">마이 페이지 | My Page</a>
								<ul class="dropdown">
									<li><a href="/order/orderList">내 주문 목록</a></li>
									<li><a href="#" onclick="userConfirm('${sessionScope.userMail }');">회원 정보 수정</a></li>
								</ul>
                        	</li>
                        </c:when>
                        <c:otherwise>
                        	<li><a href="/user/signUp">회원가입 | Sign Up</a></li>
                        </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->
    <script src="/resources/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    
    function selectCartList(){
    	var str = "";
    	var userMail = $("#loginMail").val();
    	console.log(userMail);
    	
    	$.ajax({
   			url: "/order/selectCartList",
   			type: "POST",
   			data: {
   				userMail: $("#loginMail").val()
   			},
   			success: function(res){
   				$("#cartList").remove();
   				$(".select-items").html(res);
       		},
   			error: function(e){
   				console.log(e);
   				console.log("실패");
   			}
   		});
    }
    
    function userConfirm(userId) 
    {
    	confirmModal();
    	$("#footer-modal-content").prepend("&ensp;&ensp;본인 확인이 필요합니다.");
    	$("#footer-modal-content").prepend("비밀번호:&ensp;<input type='password' id='userPw' name='userPw'>");
    	$("#footer-modal-content").prepend("ID:&ensp;" + userId);
    	
    	showModalAlert();
    	
    	$('#yes-button').click(function() 
   			{
   				$.ajax
   				({
   					url: "/user/userConfirm",
   					type: "get",
   					data:
   					{
   						userId: userId,
   						userPw: $("#userPw").val()
   					},
   					success: function(result)
   					{
   						if ( result == "success" )
   						{
   							exitAlert();
   							$("#footer-modal-content").prepend("확인되셨습니다.");
   							showModalAlert();
   							location.href = "/user/userUpdate?userMail="+userId;
   						}
   					}
   				});
   			});
   				
   			$('#no-button').click(function() 
   			{
   				$("#footer-modal").fadeOut();
   				return false;
   			});
    }
    </script>
</body>
</html>