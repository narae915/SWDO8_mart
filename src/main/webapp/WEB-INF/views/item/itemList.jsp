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
	<title>SpringDay | <spring:message code="message.header.group.itemList" /></title>
	
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
	<link rel="stylesheet" href="/resources/css/itemCss/itemListCss.css" type="text/css">
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
							<spring:message code="message.header.group.itemList" />
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Product Shop Section Begin -->
	<section class="product-shop spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
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
					<div class="filter-widget">
						<div class="filter-range-wrap">
							<div class="range-slider"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="product-show-option">
						<div class="row">
							<div class="col-lg-7 col-md-7">
								<div class="select-option">
									<c:if test="${categoryList != null }">
										<select class="sorting" id="sorting" name="sorting" onchange="searchCategoryNum();">
											<option value="new">
												<spring:message code="message.itemList.sort1" />
											</option>
											<option value="high">
												<spring:message code="message.itemList.sort2" />
											</option>
											<option value="low">
												<spring:message code="message.itemList.sort3" />
											</option>
										</select>
										<input type="hidden" id="cate-num" value="${requestScope.categoryNum }">
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<c:if test="${empty itemList }">
						<img alt="" src="/resources/img/preparing_item_for_main.png" style="margin-left: 100px;">
						<br>
					</c:if>
					<div class="product-list">
						<div class="row" id="productList">
							<c:forEach items="${itemList }" var="item" varStatus="status">
								<div class="col-lg-4 col-sm-6">
									<c:if test="${item.itemAmount == 0}">
										<img class="sold-out-img" src="/resources/img/products/sold-out.png">
									</c:if>
									<div class="product-item">
										<div class="pi-pic">
											<img src="${item.savedFilename }" onclick="location.href='/item/readItem?itemNum=${item.itemNum }';" style="cursor: pointer; width: 270px; height: 330px;">
											<c:if test="${item.salePrice != 0 }">
												<div class="sale pp-sale">Sale</div>
											</c:if>
											<ul>
												<li class="w-icon active" onclick="insertCart(${item.itemNum });" style="cursor: pointer;">
													<a><i class="icon_bag_alt"></i></a>
												</li>
												<li class="quick-view">
													<a href="/item/readItem?itemNum=${item.itemNum }">
													+ <spring:message code="message.home.mealSection2" /></a>
												</li>
											</ul>
										</div>
										<div class="pi-text">
											<div class="catagory-name">
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
											</div>
											<a href="#"><h5>${item.itemName }</h5></a>
											<!-- ??????????????? ,??? ?????? ?????? fmt ?????? -->
											<c:if test="${item.salePrice != 0 }">
												<div class="product-price">
													<fmt:formatNumber value="${item.salePrice }" pattern="#,###???" />
													<span>
														<fmt:formatNumber value="${item.price }" pattern="#,###???" />
													</span>
												</div>
											</c:if>
											<c:if test="${item.salePrice == 0 }">
												<div class="product-price">
													<fmt:formatNumber value="${item.price }" pattern="#,###???" />
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="loading-more">
						<i class="icon_loading"></i> 
						<a href="javascript:loadingMore(9);" style="cursor: pointer;"> 
							<spring:message code="message.itemList.itemMore" />
						</a> 
						<input type="hidden" id="viewCount" value="0"> 
						<input type="hidden" id="startCount" value="0">
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Shop Section End -->

	<!-- ?????? -->
	<div class="modal" id="il-modal">
		<div class="modal_content" id="il-modal_content">
			<spring:message code="message.itemList.cartConfirm" /><br> 
			<input type="button" class="modal-button" id="il-modal-button" value="<spring:message code="message.home.modal.cart1.yes"/>">
			<input type="button" class="modal-button1" value="<spring:message code="message.home.modal.cart1.no"/>">
		</div>
	</div>

	<!-- ?????? -->
	<div class="modal" id="ri-modal">
		<div class="modal_content" id="ri-modal_content">
			<spring:message code="message.home.modal.cart2" />
			<input type="button" class="modal-button" id="ri-modal-button" value="<spring:message code="message.home.modal.cart2.cartPage"/>">
			<input type="button" class="modal-button1" value="<spring:message code="message.home.modal.cart2.shopping"/>">
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
		
	    //???????????? ?????? ??????(?????? select?????? categoryNum??? ??? ??? ?????? ??????)
	    function searchCategoryNum(categoryNum) {
	    	var searchNum = $("#cate-num").val();
	
	    	if(searchNum == null || searchNum == "" ){
	    		searchNum = 0;
	    	}
	    		//?????? ????????? ???????????? + ?????? ??????
	        	option(searchNum);
	    }
	
	    //???????????? ?????? ?????? + ??????
	    function option(categoryNum) {
			//???????????? ????????? hidden??? value????????? ??????
	    	$("#cate-num").val(categoryNum);
	    	
	    	var sorting = $("#sorting").val();
	
	    	//ajax??? jstl????????? ????????? ??? ???????????? ajax??? jsp??? ???????????? ????????? ???????????? ??????
	    	$.ajax({
	    		url: "/item/sorting",
	    		type: "GET", 
	    		data: {
					sorting: $("#sorting").val(),    			
	    			sendNum:categoryNum
	    		},
	    		success: function(res){
					$(".row > .col-lg-4 col-sm-6").remove();
					$("#productList").html(res);
	    		},
				error: function(e){
					console.log("??????");
				}
			});
		}//?????? ??????
		
		//????????? ????????????(?????????)
		function loadingMore(cnt){
			var temp = $("#productList>div>div>div>ul").length;
			var sorting = $("#sorting").val();
			var searchNum = $("#cate-num").val();
	
			var startCount = $("input#startCount").val(temp);
			startCount = startCount.val();
			console.log(startCount);
			
			var viewCount = $("input#viewCount").val(cnt);
			viewCount = viewCount.val();
			console.log(viewCount);
			
	    	if(searchNum == null || searchNum == "" ){
	    		searchNum = 0;
			}
			
			$.ajax({
				url: "/item/loading",
				type: "GET", 
				data: {
					startCount : startCount,
					viewCount : viewCount,
					sorting: sorting,
					searchNum: searchNum
				},
	    		success: function(res){
					$(".row > .col-lg-4 col-sm-6").remove();
					$("#productList").html(res);
	    		},
	    		error: function(e){
					$("#footer-modal-content").html("");
					$("#footer-modal-content").html("<spring:message code='message.itemList.nomoreItem'/>");
					exitAlert();
					showModalAlert();
					console.log("??????");
				}
			});
		}
		
		//??????????????? ??????
		function insertCart(itemNum) {
			var userMail = $("#loginMail").val();
			itemNum = parseInt(itemNum);
			var cartAmount = 1;
	
			if(userMail == null || userMail == "" || userMail == " "){
				$("#footer-modal-content").html("");
				$("#footer-modal-content").html("<spring:message code='message.home.modal.login'/>");
				exitAlert();
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