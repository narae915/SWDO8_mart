<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
						<i class=" fa fa-envelope"></i> springday24365@gmail.com
					</div>
					<div class="phone-service">
						<i class=" fa fa-phone"></i> +82 62.123.456
					</div>
				</div>
				<div class="ht-right">
					<sec:authorize access="isAnonymous()">
						<a href="/user/login" class="login-panel"><i class="fa fa-user"></i> 
							<spring:message code="message.header.login" />
						</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<!-- 로그아웃(form안의 내용을 가지고감) -->
						<a href="#" class="login-panel" onclick="document.getElementById('logout').submit();">
							<i class="fa fa-user"></i> <spring:message code="message.header.logout" />
						</a>
						<form id="logout" action="/user/logout" method="POST">
							<input name="${_csrf.parameterName}" id="token" type="hidden" value="${_csrf.token}"/>
						</form>
					</sec:authorize>
					<div class="lan-selector">
						<select class="language_drop" name="countries" id="countries" style="width: 300px;" onchange="changeLocale();">
							<option>For Foreigners</option>
							<option value="ko" data-image="/resources/img/flag-1.jpg" data-imagecss="flag yt" data-title="Korea">
								<spring:message code="message.header.languageKO" />
							</option>
							<option value="ja" data-image="/resources/img/flag-2.jpg" data-imagecss="flag yu" data-title="Japanese">
								<spring:message code="message.header.languageJA" />
							</option>
						</select>
					</div>
					<div class="top-social" style="width: 110px;"></div>
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
						<form action="/allSearch" method="GET">
							<div class="advanced-search">
								<div class="input-group">
									<input type="text" name="searchword" placeholder="<spring:message code='message.header.searchword.placeholder'/>">
									<button>
										<i class="ti-search"></i>
									</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-lg-3 text-right col-md-3">
						<ul class="nav-right">
							<li class="heart-icon">
							<c:if test="${not empty sessionScope.empName }">
								<sec:authorize access="isAuthenticated()">
									<span>
										${sessionScope.welcomeMessage }
										<spring:message code="message.header.welcomeMessage"/>
									</span>
								</sec:authorize>
							</c:if>
							<li class="cart-icon">
								<a href="#" onmouseover="selectCartList();">
								<i class="icon_bag_alt" onmouseover="selectCartList();"></i> 
								<span>+</span>
							</a>
								<div class="cart-hover">
									<div class="select-items">
										<table id="cartList">
											<tbody>
												<c:forEach items="${cartList }" var="cart">
													<tr>
														<td class="si-pic">
															<img src="/resources/img/select-product-1.jpg" alt="">
														</td>
														<td class="si-text">
															<div class="product-selected">
																<p>${cart.price }x${cart.cartAmount }</p>
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
										<a href="/order/cart" class="primary-btn checkout-btn">
											<spring:message code="message.header.cartBtn"/>
										</a>
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
						<span>
							<spring:message code="message.header.group.menu"/>
						</span>
						<ul class="depart-hover">
							<li>
								<a href="/item/itemList">
									<spring:message code="message.header.group.itemList"/>
								</a>
							</li>
							<li>
								<a href="/recipe/recipeList">
									<spring:message code="message.header.group.recipeList"/>
								</a>
							</li>
							<li>
								<a href="/order/orderList">
									<spring:message code="message.header.group.mypage"/>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<nav class="nav-menu mobile-menu">
					<ul>
						<li id="menu-home">
							<a href="/">
								<spring:message code="message.header.group.menuHome"/> | Home
							</a>
						</li>
						<li id="menu-foodMart">
							<a href="/item/itemList">
								<spring:message code="message.header.group.itemList"/> | Food Mart
							</a>
						</li>
						<li id="menu-community">
							<a href="/recipe/recipeList">
								<spring:message code="message.header.group.recipeList"/> | Community
							</a>
						</li>
						<c:choose>
							<c:when test="${not empty sessionScope.userMail }">
								<li id="menu-mypage">
								<a href="/order/orderList">
									<spring:message code="message.header.group.mypage"/> | My Page
								</a>
									<ul class="dropdown">
										<li>
											<a href="/order/orderList">
												<spring:message code="message.header.group.mypage.orderList"/>
											</a>
										</li>
										<li>
											<a href="#" onclick="userConfirm('${sessionScope.userMail }');">
												<spring:message code="message.header.group.mypage.userInfo"/>
											</a>
										</li>
									</ul>
								</li>
							</c:when>
							<c:otherwise>
								<li id="menu-signUp">
									<a href="/user/signUp">
										<spring:message code="message.header.group.signUp" /> | Sign Up
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
				<div id="mobile-menu-wrap"></div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<!-- Js Plugins -->
	<script src="/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		//상품 조회
		function selectCartList() {
			var str = "";

			$.ajax({
				url : "/order/selectCartList",
				type : "POST",
				data : {
					userMail : $("#loginMail").val()
				},
				success : function(res) {
					$("#cartList").remove();
					$(".select-items").html(res);
				},
				error : function(e) {
					console.log(e);
					console.log("실패");
				}
			});
		}

		//상품 삭제
		function deleteCart(cartNum, itemNum) {
			$.ajax({
				url : "/order/deleteCart",
				type : "POST",
				data : {
					cartNum : cartNum,
					itemNum : itemNum
				},
				success : function(res) {
					$("#cartList").remove();
					$(".select-items").html(res);
				},
				error : function(e) {
					console.log(e);
					console.log("실패");
				}

			});
		}

		/* 유저 본인 확인 */
		function userConfirm(userId) 
		{
			confirmModal();
			$("#footer-modal-content").prepend("&ensp;&ensp;<b style='color: red; position: absolute; left: 8.3em; bottom: 10em;'><spring:message code='message.header.modal.userConfirm'/></b>");
			$("#footer-modal-content").prepend("<b style='position: absolute; left: 3.5em;'><spring:message code='message.signUp.form.password'/>:</b>&ensp;<input type='password' id='userPw' name='userPw' style='position: absolute; right: 3em;'>");
			$("#footer-modal-content").prepend("<b style='position: absolute; left: 6.5em; bottom: 8em;'>ID:</b>&ensp;<span style='position: absolute; right: 5.3em; bottom: 8em;'>"+ userId + "</span>");

			showModalAlert();

			$('#yes-button').click(function() 
			{
				$.ajax
				({
					url : "/user/userConfirm",
					type : "get",
					data : 
					{
						userId : userId,
						userPw : $("#userPw").val()
					},
					success : function(result) 
					{
						if (result == "success") 
						{
							exitAlert();
							$("#footer-modal-content").prepend("<spring:message code='message.header.modal.userConfirmChk'/>");
							showModalAlert();
							location.href = "/user/userUpdate?userMail="+ userId;
						}
						else
						{
							alert("<spring:message code='message.header.userConfirm.alert'/>");
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

		/* 페이지 언어 변경 */
		function changeLocale() 
		{
			var selectLocale = $(".language_drop option:selected").val();
			if (selectLocale == "ja") 
			{
				location.href = "/?lang=ja";
			}
			if (selectLocale == "ko") 
			{
				location.href = "/?lang=ko";
			}
		}
	</script>
</body>
</html>