<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Fashi Template">
	<meta name="keywords" content="Fashi, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>SpringDay | <spring:message code="message.cart.title"/></title>
	
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
	
	<!-- Css Styles -->
	<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/orderCss/cart.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
	<script src="https://kit.fontawesome.com/af95d2c333.js" crossorigin="anonymous"></script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/">
							<i class="fa fa-home"></i> Home
						</a> 
						<span>
							<spring:message code="message.cart.title"/>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Faq Section Begin -->
	<div class="faq-section spad">
		<!-- ?????? ?????? ?????? -->
		<div class="container">
			<!-- ?????? ?????? ?????? -->
			<div class="row">
				<!-- flex ?????? -->
				<div class="col-lg-12">
					<!-- ????????? ???????????? ?????? ?????? -->
					<div class="faq-accordin">
						<!-- ?????? ??????, ????????? -->
						<!-- 22/04/01 ????????? -->
						<h1 id="content-title">
							<spring:message code="message.cart.title"/>
						</h1><br>
						<div class="container-h5"><br>
							<h5>* <spring:message code="message.cart.description1"/></h5>
							<h5>* <spring:message code="message.cart.description2"/></h5>
							<h5>* <spring:message code="message.cart.description3"/></h5><br>
						</div>
						<br>
						<!-- ???????????? ?????? ??? ?????? -->
						<!-- ????????? ?????? -->
						<c:if test="${not empty cartList }">
							<form name="cartform" id="cartform" method="get" class="cartform" action="orderForm">
								<input type="hidden" name="cmd" value="cart">
								<div class="basketdiv" id="basket">
									<!-- ????????? ?????? ??? -->
									<div class="row head">
										<div class="subdiv">
											<div class="check" id="check">
												<spring:message code="message.cart.form.head1"/>
											</div>
											<div class="img" id="img">
												<spring:message code="message.cart.form.head2"/>
											</div>
											<div class="pname" id="pname">
												<spring:message code="message.cart.form.head3"/>
											</div>
										</div>
										<div class="subdiv">
											<div class="basketprice">
												<spring:message code="message.cart.form.head4"/>
											</div>
											<div class="num">
												<spring:message code="message.cart.form.head5"/>
											</div>
											<div class="sum">
												<spring:message code="message.cart.form.head6"/>
											</div>
										</div>
										<div class="subdiv">
											<div class="basketcmd">
												<spring:message code="message.cart.form.head7"/>
											</div>
										</div>
										<div class="split"></div>
									</div>
									<c:forEach var="Cart" items="${cartList }">
										<div class="row data">
											<div class="subdiv">
												<div class="check">
													<input type="checkbox" name="buy" value="${Cart.cartNum }" onclick="javascript:basket.checkItem();">&nbsp;
												</div>
												<c:if test="${Cart.savedFileNum eq Cart.itemNum }">
													<div class="img">
														<img src="/uploadImg/${Cart.savedFilename }" style="height: 130px; width: 280px" alt="????????????">
													</div>
												</c:if>
												<c:if test="${Cart.savedFileNum ne Cart.itemNum }">
													<div class="img">
														<img src="/resources/img/itemDefault.png" style="height: 130px; width: 280px" alt="????????????">
													</div>
												</c:if>
												<div class="pname">
													<!-- ????????? -->
													<span>${Cart.itemName }</span>
												</div>
											</div>
											<div class="subdiv">
												<!-- ?????? -->
												<div class="basketprice">
													<input type="hidden" name="p_price" id="p_price2" class="p_price" value="${Cart.price }">
													<fmt:formatNumber value="${Cart.price }" pattern='#,###???' />
												</div>
												<div class="num">
													<!-- ${Cart.price }.??? -->
													<!-- ?????? -->
													<div class="updown">
														<span style="cursor: pointer" onclick="javascript:basket.changePNum('${Cart.cartNum}');">
															<i class="fas fa-arrow-alt-circle-up up fa-2xs"></i>
														</span> 
														<input type="text" name="p_num" id="p_num${Cart.cartNum }" size="2" maxlength="3" class="p_num" value="${Cart.cartAmount }" onkeyup="javascript:basket.changePNum('${Cart.cartNum}');">
														<span style="cursor: pointer" onclick="javascript:basket.changePNum('${Cart.cartNum}');">
															<i class="fas fa-arrow-alt-circle-down down fa-2xs"></i>
														</span>
													</div>
												</div>
												<div class="sum">
													<fmt:formatNumber value="${Cart.cartAmount*Cart.price }" pattern='#,###???' />
												</div>
											</div>
											<div class="subdiv">
												<div class="basketcmd">
													<input type="hidden" id="hiddenNum" value="${Cart.cartNum }">
													<input type="button" id="cancel-btn" class="abutton" onclick="return cartCancel();" value="X">
												</div>
											</div>
										</div>
									</c:forEach>
									
									<!-- ????????? ?????? -->
									<div style="text-align: center;">
										<span> 
											<c:if test="${navi.currentPage > 1 }">
												<a href="/order/cart?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em; display: inline-block; padding-top: 1.5em;">
													<spring:message code="message.cart.paging.prev"/>&nbsp; 
												</a>
											</c:if> 
											<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="pageNum">
												<c:if test="${pageNum == navi.currentPage }">
													<a href="/order/cart?currentPage=${pageNum }" style="text-decoration: none; text-align: center; font-size: 1.5em; display: inline-block; padding-top: 1.5em;">
														<span style="color: #E7AB3C; border: 1px solid;">
															&nbsp;${pageNum } 
														</span>
													</a>
												&nbsp;
											</c:if>
												<c:if test="${pageNum != navi.currentPage }">
													<a href="/order/cart?currentPage=${pageNum }" style="color: black; text-decoration: none; text-align: center; font-size: 1.5em; display: inline-block; padding-top: 1.5em;">
														<span> 
															${pageNum }&nbsp; 
														</span>
													</a>
												</c:if>
											</c:forEach> <c:if test="${navi.currentPage < navi.totalPageCount }">
												<a href="/order/cart?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em; display: inline-block; padding-top: 1.5em;">
													<spring:message code="message.cart.paging.next"/>
												</a>
											</c:if>
										</span>
									</div>
									<!-- ????????? ??? -->
								</div>
								<div id="gocart" class="">
									<div class="buttongroup center-align cmd">
										<!-- forward ?????? -->
										<input type="submit" id="purchase" value="<spring:message code='message.cart.purchaseBtn'/>" />
										<!-- ?????? ???????????? ????????? ??? -->
										<div id="forwardDiv">
											<input type="hidden" name="totalPrice" id="totalPrice" />
										</div>
									</div>
								</div>
							</form>
							<div class=result-box>
								<br>
								<div class="bigtext right-align sumcount" id="sum_p_num">
									<spring:message code="message.cart.totalCount"/>
								</div>
								<div class="bigtext right-align box summoney" id="sum_p_price">
									<spring:message code="message.cart.totalPrice"/>
								</div>
								<br>
							</div>
						</c:if>
						<!--  ????????? ??? -->
						<!-- ????????? ?????? ??? -->
						<c:if test="${empty cartList }">
							<div class="container-h5">
								<a href="https://www.flaticon.com/kr/free-icons/" title="?????? ?????????">
									<img src="/resources/img/not.png" alt="?????? ?????????  ?????????: Freepik - Flaticon" id="image-not">
								</a>
								<h2 id="emptyList">
									<spring:message code="message.cart.emptyCart"/>
								</h2>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Faq Section End -->

	<!-- Footer Section Begin -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- Js Plugins -->
	<script src="/resources/js/jquery-3.6.0.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jquery.countdown.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.zoom.min.js"></script>
	<script src="/resources/js/jquery.dd.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>
	<script src="/resources/js/orderJs/cart.js"></script>
	<script type="text/javascript">
		var total = "<spring:message code='message.cart.updateUI.total'/>";
		var count = "<spring:message code='message.cart.updateUI.count'/>";
		var totalPrice1 = "<spring:message code='message.cart.updateUI.totalPrice1'/>";
		var totalPrice2 = "<spring:message code='message.cart.updateUI.totalPrice2'/>";
		var purchaseEmpty = "<spring:message code='message.cart.formChk.modal.purchaseEmpty'/>";
		var cancelMassage = "<spring:message code='message.cart.cancelMassage'/>";
	</script>
</body>

</html>