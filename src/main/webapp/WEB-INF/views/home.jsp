<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
	<title>SpringDay | Home</title>
	
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
	<link rel="stylesheet" href="/resources/css/homeCss.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- Hero Section Begin -->
	<section class="hero-section">
		<div class="hero-items owl-carousel">
			<div class="single-hero-items set-bg"
				data-setbg="/resources/img/main/steak.png">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<span>BEST</span>
							<h1>
								<spring:message code="message.home.heroSection.recommend1" />
							</h1>
							<p>
								<spring:message code="message.home.heroSection.recommend2" />
							</p>
							<p>
								<spring:message code="message.home.heroSection.recommend3" />
							</p>
							<a href="/item/itemList?categoryNum=10" class="primary-btn">
								<spring:message code="message.home.heroSection.recommendBtn" />
							</a>
						</div>
					</div>
					<div class="off-card">
						<h2> Sale <span>30%</span> </h2>
					</div>
				</div>
			</div>
			<div class="single-hero-items set-bg"
				data-setbg="/resources/img/main/grape1.png">
				<div class="container">
					<div class="row">
						<div class="col-lg-5">
							<span>EVENT</span>
							<h1>
								<spring:message code="message.home.heroSection.recommend4" />
							</h1>
							<p>
								<spring:message code="message.home.heroSection.recommend5" />
							</p>
							<p>
								<spring:message code="message.home.heroSection.recommend6" />
							</p>
							<a href="/item/itemList?categoryNum=30" class="primary-btn">
								<spring:message code="message.home.heroSection.recommendBtn" />
							</a>
						</div>
					</div>
					<div class="off-card">
						<h2>
							<spring:message code="message.home.heroSection.recommend7" />
							<span>50%</span>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Banner Section Begin -->
	<div class="banner-section spad">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4">
					<div class="single-banner"
						onclick="location.href='/item/itemList?categoryNum=10';">
						<img src="/resources/img/main/banner-1.jpg">
						<div class="inner-text">
							<h4>
								<spring:message code="message.home.bannerSection.banner1" />
							</h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-banner"
						onclick="location.href='/item/itemList?categoryNum=20';">
						<img src="/resources/img/main/banner-2.png" alt="">
						<div class="inner-text">
							<h4>
								<spring:message code="message.home.bannerSection.banner2" />
							</h4>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="single-banner"
						onclick="location.href='/item/itemList?categoryNum=30';">
						<img src="/resources/img/main/banner-3.png" alt="">
						<div class="inner-text">
							<h4>
								<spring:message code="message.home.bannerSection.banner3" />
							</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner Section End -->

	<!-- meal Section Begin -->
	<section class="women-banner spad">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3">
					<div class="product-large set-bg" id="product-large-meal" data-setbg="/resources/img/products/women-large.jpg">
						<h2>Meal</h2>
						<a href="/item/itemList?categoryNum=10">
							<spring:message code="message.home.mealSection.banner1" />
						</a>
					</div>
				</div>
				<div class="col-lg-8 offset-lg-1">
					<div class="filter-control">
						<ul>
							<li class="active">
								<spring:message code="message.home.mealSection1" />
							</li>
						</ul>
					</div>
					<c:if test="${empty mealItemList }">
						<div class="emptyItemList">
							<img alt="" src="/resources/img/preparing_item_for_main.png">
						</div>
					</c:if>
					<c:if test="${!empty mealItemList }">
						<div class="product-slider owl-carousel">
						<c:forEach items="${mealItemList }" var="mealItem" varStatus="status">
							<div class="product-item">
								<div class="pi-pic">
									<img src="${mealItem.savedFilename }" style="width: 270px; height: 330px;" onclick="location.href='/item/readItem?itemNum=${mealItem.itemNum }';" class="product-itemImg">
									<c:if test="${mealItem.salePrice != 0 }">
										<div class="sale">Sale</div>
									</c:if>
									<ul>
										<li class="w-icon active">
											<a onclick="insertCart(${mealItem.itemNum });" style="cursor: pointer;">
												<i class="icon_bag_alt"></i>
											</a>
										</li>
										<li class="quick-view">
											<a href="/item/readItem?itemNum=${mealItem.itemNum }">
												+ <spring:message code="message.home.mealSection2" />
											</a>
										</li>
									</ul>
								</div>
								<div class="pi-text">
									<div class="catagory-name">
										<c:if test="${mealItem.categoryName == '??????' }">
											 <spring:message code="message.home.bannerSection.banner1" />
										</c:if>
									</div>
									<a href="#">
									<h5>${mealItem.itemName }</h5>
									</a>
									<div class="product-price">
									<c:if test="${mealItem.salePrice != 0 }">
										<fmt:formatNumber value="${mealItem.salePrice }" pattern="#,###???" />
										<span>
											<fmt:formatNumber value="${mealItem.price }" pattern="#,###???" />
										</span>
									</c:if>
									<c:if test="${mealItem.salePrice == 0 }">
										<fmt:formatNumber value="${mealItem.price }" pattern="#,###???" />
									</c:if>
									</div>
								</div>
								</div>
							</c:forEach>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!-- meal Section End -->

	<!-- seafood Section Begin -->
	<section class="man-banner spad">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-8">
					<div class="filter-control">
						<ul>
							<li class="active">
								<spring:message code="message.home.mealSection1" />
							</li>
						</ul>
					</div>
					<c:if test="${empty seafoodItemList }">
						<div class="emptyItemList">
							<img alt="" src="/resources/img/preparing_item_for_main.png">
						</div>
					</c:if>
					<c:if test="${!empty seafoodItemList }">
						<div class="product-slider owl-carousel">
						<c:forEach items="${seafoodItemList }" var="seafoodItem" varStatus="status">
							<div class="product-item">
								<div class="pi-pic">
									<img src="${seafoodItem.savedFilename }" style="width: 270px; height: 330px;" onclick="location.href='/item/readItem?itemNum=${seafoodItem.itemNum }';" class="product-itemImg">
									<ul>
										<li class="w-icon active">
											<a onclick="insertCart(${seafoodItem.itemNum });" style="cursor: pointer;">
												<i class="icon_bag_alt"></i>
											</a>
										</li>
										<li class="quick-view">
											<a href="/item/readItem?itemNum=${seafoodItem.itemNum }">
												+ <spring:message code="message.home.mealSection2" />
											</a>
										</li>
									</ul>
								</div>
								<div class="pi-text">
									<div class="catagory-name">
										<c:if test="${seafoodItem.categoryName== '?????????' }">
											 <spring:message code="message.home.seafoodItem.categoryNm" />
										</c:if>
									</div>
									<a href="#">
										<h5>${seafoodItem.itemName }</h5>
									</a>
									<div class="product-price">
										<fmt:formatNumber value="${seafoodItem.price }" pattern="#,###???" />
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					</c:if>
				</div>
				<div class="col-lg-3 offset-lg-1">
					<div class="product-large set-bg m-large" id="product-large-seafood" data-setbg="/resources/img/products/man-large.jpg">
						<h2>Seafood</h2>
						<a href="/item/itemList?categoryNum=20">
							<spring:message code="message.home.seafoodSection" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- seafood Section End -->

	<!-- Produce Section Begin -->
	<section class="women-banner spad">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-3">
					<div class="product-large set-bg" id="product-large-fruit" data-setbg="/resources/img/products/fruit-large.jpg">
						<h2>Produce</h2>
						<a href="/item/itemList?categoryNum=30">
							<spring:message code="message.home.fruitSection" />
						</a>
					</div>
				</div>
				<div class="col-lg-8 offset-lg-1">
					<div class="filter-control">
						<ul>
							<li class="active">
								<spring:message code="message.home.mealSection1" />
							</li>
						</ul>
					</div>
					<c:if test="${empty produceItemList }">
						<div class="emptyItemList">
							<img alt="" src="/resources/img/preparing_item_for_main.png">
						</div>
					</c:if>
					<c:if test="${!empty produceItemList }">
						<div class="product-slider owl-carousel">
						<c:forEach items="${produceItemList }" var="produceItem" varStatus="status">
							<div class="product-item">
								<div class="pi-pic">
									<img src="${produceItem.savedFilename }" style="width: 270px; height: 330px;" onclick="location.href='/item/readItem?itemNum=${produceItem.itemNum }';" class="product-itemImg">
									<c:if test="${produceItem.salePrice != 0 }">
										<div class="sale">Sale</div>
									</c:if>
									<ul>
										<li class="w-icon active">
											<a onclick="insertCart(${produceItem.itemNum });" style="cursor: pointer;">
												<i class="icon_bag_alt"></i>
											</a>
										</li>
										<li class="quick-view">
											<a href="/item/readItem?itemNum=${produceItem.itemNum }">
												+ <spring:message code="message.home.mealSection2" />
											</a>
										</li>
									</ul>
								</div>
								<div class="pi-text">
									<div class="catagory-name">
										<c:if test="${produceItem.categoryName == '??????' }">
											 <spring:message code="message.home.produceItem.categoryNm1" />
										</c:if>
										<c:if test="${produceItem.categoryName == '??????' }">
											 <spring:message code="message.home.produceItem.categoryNm2" />
										</c:if>
									</div>
									<a href="#">
										<h5>${produceItem.itemName }</h5>
									</a>
									<div class="product-price">
										<c:if test="${produceItem.salePrice != 0 }">
											<fmt:formatNumber value="${produceItem.salePrice }" pattern="#,###???" />
											<span>
												<fmt:formatNumber value="${produceItem.price }" pattern="#,###???" />
											</span>
										</c:if>
										<c:if test="${produceItem.salePrice == 0 }">
											<fmt:formatNumber value="${produceItem.price }" pattern="#,###???" />
										</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!-- Produce Section End -->

	<!-- Latest Blog Section Begin -->
	<section class="latest-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>
							<spring:message code="message.home.blogSection" />
						</h2>
					</div>
				</div>
			</div>
			<c:if test="${empty recipeList }">
				<div>
					<table id="nothing">
						<tr>
							<td>
								<img alt="<spring:message code="message.recipeList.nothing"/>" src="/resources/img/no-message.png">
							</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<th>
								<spring:message code="message.recipeList.emptyPost" />
							</th>
						</tr>
						<tr>
							<td>
								<a href="/recipe/write">
									<spring:message code="message.recipeList.newPost1" />
								</a>
							</td>
						</tr>
					</table>
				</div>
			</c:if>
			<c:if test="${!empty recipeList }">
				<div class="row">
					<c:forEach items="${recipeList }" var="recipe" varStatus="status">
					<div class="col-lg-4 col-md-6">
						<div class="single-latest-blog" style="cursor: pointer;" onclick="location.href='/recipe/readRecipe?recipeNum=${recipe.recipeNum }';">
							<img src="${recipe.titleImg }" alt="" style="width: 355px; height: 256px;">
							<div class="latest-text">
								<div class="tag-list">
									<div class="tag-item">
										<i class="fa fa-calendar-o"></i> ${recipe.indate }
									</div>
									<div class="tag-item">
										<i class="fa fa-comment-o"></i> ${countReplyArr[status.index] }
										<!-- ????????? ?????? ???????????? ?????? -->
									</div>
								</div>
								<a href="/recipe/readRecipe?recipeNum=${recipe.recipeNum }">
									<h4>${recipe.title }</h4>
								</a>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</c:if>
			<div class="benefit-items">
				<div class="row">
					<div class="col-lg-4">
						<div class="single-benefit">
							<div class="sb-icon">
								<img src="/resources/img/icon-1.png" alt="">
							</div>
							<div class="sb-text">
								<h6>
									<spring:message code="message.home.info1" />
								</h6>
								<p>
									<spring:message code="message.home.info2" />
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="single-benefit">
							<div class="sb-icon">
								<img src="/resources/img/icon-2.png" alt="">
							</div>
							<div class="sb-text">
								<h6>
									<spring:message code="message.home.info3" />
								</h6>
								<p>
									<spring:message code="message.home.info4" />
								</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="single-benefit">
							<div class="sb-icon">
								<img src="/resources/img/icon-1.png" alt="">
							</div>
							<div class="sb-text">
								<h6>
									<spring:message code="message.home.info5" />
								</h6>
								<p>
									<spring:message code="message.home.info6" />
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Blog Section End -->

	<!-- ?????? -->
	<div class="modal" id="il-modal">
		<div class="modal_content" id="il-modal_content">
			<spring:message code="message.home.modal.cart1" /><br> 
			<input type="button" class="modal-button" id="il-modal-button" value="<spring:message code='message.home.modal.cart1.yes'/>">
			<input type="button" class="modal-button1" value="<spring:message code='message.home.modal.cart1.no'/>">
		</div>
	</div>

	<!-- ?????? -->
	<div class="modal" id="ri-modal">
		<div class="modal_content" id="ri-modal_content">
			<spring:message code="message.home.modal.cart2" />
			<input type="button" class="modal-button" id="ri-modal-button" value="<spring:message code='message.home.modal.cart2.cartPage'/>">
			<input type="button" class="modal-button1" value="<spring:message code='message.home.modal.cart2.shopping'/>">
		</div>
	</div>

	<input type="hidden" id="loginMail" value="${sessionScope.userMail }">
	<!-- Footer -->
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
	<script type="text/javascript">
	//jsp????????? ????????? ????????? ??????
	$(function(){
		$("li#menu-home").attr("class", "active");
	});
	
	//??????????????? ??????
	function insertCart(itemNum) {
		var userMail = $("#loginMail").val();
		itemNum = parseInt(itemNum);
		var cartAmount = 1;

		if(userMail == null || userMail == "" || userMail == " "){
			exitAlert();
			$("#footer-modal-content").prepend("<spring:message code='message.home.modal.login'/>");
			showModalAlert();
		} else {
			//??????????????? ?????? ????????? ???????????? ?????????
			ilShowModal();
			
			//???????????? ?????? ??????
			$("#il-modal-button").click(function(){
				$.ajax({
					url: "/order/insertCart",
					type: "POST", 
					data: {
						itemNum : itemNum,
						cartAmount : cartAmount,
						userMail : userMail
					},
					success: function(res) { //cart???????????? ??????
						if(res = "yes") {
							$("#il-modal").fadeOut();
							//??????????????? ????????? ????????? ??????
							$("#ri-modal").fadeIn();
							$(".modal-button1").click(function(){
								location.reload();
							});
							$("#ri-modal-button").click(function(){
								location.href="/order/cart";
							});
						}
					}
				});
			});
		}
	}
	
	function ilShowModal() {
		$("#il-modal").fadeIn();
		
		$(".modal-button1").click(function(){
			$("#il-modal").fadeOut();
		});
	}
	
	function showModal() {
		$("#ri-modal").fadeIn();
		
		$(".modal-button1").click(function(){
			$("#ri-modal").fadeOut();
		});
	}
    </script>
</body>

</html>