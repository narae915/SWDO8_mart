<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Fashi Template">
	<meta name="keywords" content="Fashi, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>SpringDay | <spring:message code="message.home.mealSection2" /></title>
	
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
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/itemCss/readItemCss.css" type="text/css">
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
					<div class="breadcrumb-text product-more">
						<a href="/">
							<i class="fa fa-home"></i> Home
						</a> 
						<a href="/item/itemList">
							<spring:message code="message.readItem.item" />
						</a> 
						<span>
							<spring:message code="message.home.mealSection2" />
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad page-details">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="filter-widget">
						<h4 class="fw-title">
							<spring:message code="message.itemList.category" />
						</h4>
						<ul class="filter-catagories">
							<!-- HashMap ????????? ?????? ?????? ???????????? key?????? ???????????? ???????????? ??????. -->
							<c:forEach items="${categoryList }" var="category">
								<c:if test="${category.CATEGORYNUM == 10 }">
									<li>
										<a style="cursor: pointer;" href="/item/itemList?categoryNum=${category.CATEGORYNUM }">
											<spring:message code="message.itemList.categoryList10" />
										</a>
									</li>
								</c:if>
								<c:if test="${category.CATEGORYNUM == 20 }">
									<li>
										<a style="cursor: pointer;" href="/item/itemList?categoryNum=${category.CATEGORYNUM }">
											<spring:message code="message.itemList.categoryList20" />
										</a>
									</li>
								</c:if>
								<c:if test="${category.CATEGORYNUM == 30 }">
									<li>
										<a style="cursor: pointer;" href="/item/itemList?categoryNum=${category.CATEGORYNUM }">
											<spring:message code="message.itemList.categoryList30" />
										</a>
									</li>
								</c:if>
								<c:if test="${category.CATEGORYNUM == 40 }">
									<li>
										<a style="cursor: pointer;" href="/item/itemList?categoryNum=${category.CATEGORYNUM }">
											<spring:message code="message.itemList.categoryList40" />
										</a>
									</li>
								</c:if>
								<c:if test="${category.CATEGORYNUM == 50 }">
									<li>
										<a style="cursor: pointer;" href="/item/itemList?categoryNum=${category.CATEGORYNUM }">
											<spring:message code="message.itemList.categoryList50" />
										</a>
									</li>
								</c:if>
								<c:if test="${category.CATEGORYNUM == 60 }">
									<li>
										<a style="cursor: pointer;" href="/item/itemList?categoryNum=${category.CATEGORYNUM }">
											<spring:message code="message.itemList.categoryList60" />
										</a>
									</li>
								</c:if>
								<c:if test="${category.CATEGORYNUM == 70 }">
									<li>
										<a style="cursor: pointer;" href="/item/itemList?categoryNum=${category.CATEGORYNUM }">
											<spring:message code="message.itemList.categoryList70" />
										</a>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="row">
						<div class="col-lg-6">
							<div class="product-pic-zoom">
								<!-- ???????????? -->
								<c:if test="${not empty fileList }">
									<img class="product-big-img" src="/uploadImg/${fileList[0] }" style="height: 390px; width: 330px" alt="">
								</c:if>
								<c:if test="${empty fileList }">
									<img class="product-big-img" src="/resources/img/itemDefault.png" style="height: 390px; width: 330px" alt="">
								</c:if>
								<div class="zoom-icon">
									<i class="fa fa-search-plus"></i>
								</div>
							</div>
							<div class="product-thumbs">
								<div class="product-thumbs-track ps-slider owl-carousel">
									<c:forEach var="i" begin="0" end="3">
										<c:if test="${not empty fileList[i] }">
											<div class="pt" data-imgbigurl="/uploadImg/${fileList[i] }">
												<img src="/uploadImg/${fileList[i] }" alt="" style="height: 109px; width: 139px">
											</div>
										</c:if>
										<c:if test="${empty fileList[i] }">
											<div class="pt" data-imgbigurl="/resources/img/itemDefault.png">
												<img src="/resources/img/itemDefault.png" alt="" style="height: 109px; width: 139px">
											</div>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
									<span>
										<c:if test="${item.categoryName == '??????' }">
											<spring:message code="message.itemList.categoryList10" />
										</c:if>
										<c:if test="${item.categoryName == '?????????' }">
											<spring:message code="message.itemList.categoryList20" />
										</c:if>
										<c:if test="${item.categoryName == '??????' }">
											<spring:message code="message.itemList.categoryList30" />
										</c:if>
										<c:if test="${item.categoryName == '??????' }">
											<spring:message code="message.itemList.categoryList40" />
										</c:if>
										<c:if test="${item.categoryName == '?????????' }">
											<spring:message code="message.itemList.categoryList50" />
										</c:if>
										<c:if test="${item.categoryName == '??????' }">
											<spring:message code="message.itemList.categoryList60" />
										</c:if>
										<c:if test="${item.categoryName == '??? ???' }">
											<spring:message code="message.itemList.categoryList70" />
										</c:if>
									</span>
									<h3>${item.itemName }</h3>
								</div>
								<div class="pd-desc">
									<c:if test="${item.introduce == null }">
										<p></p>
									</c:if>
									<c:if test="${item.introduce != null }">
										<p>${item.introduce }</p>
									</c:if>
									<input type="hidden" id="item-amount" value="${item.itemAmount }">
									<p>
										<spring:message code="message.readItem.amount" />
										${item.itemAmount }
									</p>
									<c:if test="${item.salePrice != 0 }">
										<h4>
											<fmt:formatNumber value="${item.salePrice }" pattern="#,###???" />
										</h4>
										<span style="text-decoration: line-through; color: #cfcfcf;">
											<fmt:formatNumber value="${item.price }" pattern="#,###???" />
										</span>
									</c:if>
									<c:if test="${item.salePrice == 0 }">
										<h4>
											<fmt:formatNumber value="${item.price }" pattern="#,###???" />
										</h4>
									</c:if>
								</div>
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" name="cartAmount" value="1">
									</div>
									<a class="primary-btn pd-cart" onclick="insertCart(${item.itemNum });">
										<spring:message code="message.readItem.inputCart" />
									</a>
								</div>
							</div>
						</div>
					</div>
					<div class="product-tab">
						<div class="tab-item">
							<ul class="nav" role="tablist">
								<li>
									<a class="active" data-toggle="tab" href="#tab-1" role="tab">
										????<spring:message code="message.readItem.infoItem" />
									</a>
								</li>
								<li>
									<a data-toggle="tab" href="#tab-2" role="tab">
										????<spring:message code="message.readItem.prepIngredients" />????
									</a>
								</li>
								<li>
									<a data-toggle="tab" href="#tab-3" role="tab">
										????<spring:message code="message.readItem.store" />????
									</a>
								</li>
							</ul>
						</div>
						<div class="tab-item-content">
							<div class="tab-content">
								<div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
									<div class="product-content">
										<c:if test="${item.infor == null }">
											<img alt="" src="/resources/img/preparing_contents.png">
										</c:if>
										<c:if test="${item.infor != null }">
                                    		${item.infor }
                                    	</c:if>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-2" role="tabpanel">
									<div class="specification-table">
										<c:if test="${item.cook == null }">
											<img alt="" src="/resources/img/preparing_contents.png">
										</c:if>
										<c:if test="${item.cook != null }">
                                    		${item.cook }
                                    	</c:if>
									</div>
								</div>
								<div class="tab-pane fade" id="tab-3" role="tabpanel">
									<div class="customer-review-option">
										<c:if test="${item.inventory == null }">
											<img alt="" src="/resources/img/preparing_contents.png">
										</c:if>
										<c:if test="${item.inventory != null }">
                                    		${item.inventory }
                                    	</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Shop Section End -->

	<!-- ?????? -->
	<div class="modal" id="ri-modal">
		<div class="modal_content" id="ri-modal_content" title="<spring:message code="message.readItem.closeMsg"/>">
			<spring:message code="message.home.modal.cart2" />
			<input type="button" class="modal-button" id="ri-modal-button" value="<spring:message code="message.home.modal.cart2.cartPage"/>">
			<input type="button" class="modal-button1" id="ri-modal-close" value="<spring:message code="message.home.modal.cart2.shopping"/>">
		</div>
	</div>
	<input type="hidden" id="loginMail" value="${sessionScope.userMail }">
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- modal -->
	<div class="modal" id="footer-modal">
		<div class="modal_content" id="footer-modal-content"></div>
	</div>

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
	<script type="text/javascript">
		//jsp????????? ????????? ????????? ?????? 
		$(function(){
			//?????? ???????????? ??????????????? ?????? 4/17 ?????????
			$("li#menu-foodMart").attr("class", "active");
		});
	
		// ?????? ??????
		function exitAlert() {
			$("#footer-modal-content").append('<button name="modalClose" class="primary-btn" id="footer-modal-button" style="margin-top:30px; border-radius:5px; border:none"><spring:message code="message.footer.modal.close"/></button>');
		}
	
		// ?????? ??????
		function showModalAlert() {
			$("#footer-modal").fadeIn();
			$("button[name=modalClose]").click(function() {
				$("#footer-modal").fadeOut();
			});
		}
		
		//??????????????? ?????? ??????
		function insertCart(itemNum) {
			itemNum = parseInt(itemNum);
			cartAmount = $("input[name=cartAmount]").val();
			var userMail = $("#loginMail").val();
			var itemAmount = $("#item-amount").val();
			
			//????????? ????????? 0??? ????????? ??? ????????? ????????? ??? ?????? ??? ???, ????????? ??????
			if(itemAmount <= 0) {
				$("#footer-modal-content").html("");
				$("#footer-modal-content").css({"text-align": "center"});
				$("#footer-modal-content").html("<spring:message code='message.readItem.itemReady'/><br><spring:message code='message.readItem.closeInfo'/>");
				exitAlert();
				showModalAlert();
				
				$("button[name=modalClose]").click(function() {
					location.href="/item/itemList";
				});
				
			//???????????? ????????? ????????? ????????? ????????? ???????????? ??? ???			
			} else if(itemAmount < cartAmount) {
				$("#footer-modal-content").html("");
				$("#footer-modal-content").css({"text-align": "center"});
				$("#footer-modal-content").html("<spring:message code='message.readItem.overAmount'/>");
				exitAlert();
				showModalAlert();
			} else {
				// ???????????? ????????? ????????? ?????? ???
				if(cartAmount == 0) {
					$("#footer-modal-content").html("");
					$("#footer-modal-content").html("<spring:message code='message.readItem.underAmount'/>");
					exitAlert();
					showModalAlert();
				} else {
					//??????????????? ?????? ??????
					$.ajax({
						url: "/order/insertCart",
						type: "POST", 
						data: {
							itemNum : itemNum,
							cartAmount : cartAmount,
							userMail : userMail
						},
						success: function(res) { //cart???????????? ??????
							if(res = "yes"){
								showModal();
								$("#ri-modal-button").click(function(){
									location.href="/order/cart";
								});
								$("#ri-modal-close").click(function(){
									location.href="/item/readItem?itemNum="+itemNum;
								});
							}
						}
					});
				}
			}
			
	   	}
	   	
		//????????? ????????????
	   	function showModal() {
	   		$("#ri-modal").fadeIn();
	
	   		$("#ri-modal_content").click(function(){
	   			$("#ri-modal").fadeOut();
	   		});
	   	}
    </script>
</body>
</html>