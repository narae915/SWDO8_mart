<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SpringDay | 메인</title>

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
    <!-- CSS -->
    <style type="text/css">
		.modal-button {
			font-size: 16px;
			color: #ffffff;
			border: 1px solid #e7ab3c;
			background: #e7ab3c;
			height: 45px;
			padding: 12px 16px 12px;
		}
		
		.modal-button1 {
			font-size: 16px;
			color: #ffffff;
			border: 1px solid #787878;
			background: #787878;
			height: 45px;
			padding: 12px 16px 12px;
		}
		
		.modal{
			position: fixed;
			top:0; left: 0; bottom: 0; right: 0;
			background: rgba(0, 0, 0, 0.8); /* 투명도 */
		}
		
		#ri-modal_content{
			position: absolute;  /* 배경 내에서 위치 조정 */
			top: calc(50vh - 100px); left: calc(50vw - 200px);
			background-color: white;
			border-radius: 10px;
			width: 400px;
			height: 200px;
			display: flex;
			flex-wrap: wrap;
			flex-direction: row;
			align-content: center;
			justify-content: center;
		}
		
		.product-itemImg {
			cursor: pointer;
		}
    </style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<!-- Header -->
    <%@ include file="/WEB-INF/views/header.jsp" %>

    <!-- Hero Section Begin -->
    <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg" data-setbg="/resources/img/main/steak.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <span>BEST</span>
                            <h1>추천상품</h1>
                            <p>5월은 행사의 달!</p>
                            <p>우리, 오늘 저녁은 스테이크 어때?</p>
                            <a href="/item/itemList?categoryNum=10" class="primary-btn">지금 구매하기</a>
                        </div>
                    </div>
                    <div class="off-card">
                        <h2>Sale <span>30%</span></h2>
                    </div>
                </div>
            </div>
            <div class="single-hero-items set-bg" data-setbg="/resources/img/main/grape1.png">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5">
                            <span>EVENT</span>
                            <h1>제철 과일</h1>
                            <p>5월 한달동안 이벤트를 실시합니다.</p>
                            <p>포도, 참외, 오렌지 등 (5/31 23:59까지)</p>
                            <a href="/item/itemList?categoryNum=30" class="primary-btn">지금 구매하기</a>
                        </div>
                    </div>
                    <div class="off-card">
                        <h2>최대 <span>50%</span></h2>
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
                    <div class="single-banner" onclick="location.href='/item/itemList?categoryNum=10';">
                        <img src="/resources/img/main/banner-1.jpg">
                        <div class="inner-text">
                            <h4>육류</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner" onclick="location.href='/item/itemList?categoryNum=20';">
                        <img src="/resources/img/main/banner-2.png" alt="">
                        <div class="inner-text">
                            <h4>어패류</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="single-banner" onclick="location.href='/item/itemList?categoryNum=30';">
                        <img src="/resources/img/main/banner-3.png" alt="">
                        <div class="inner-text">
                            <h4>청과류</h4>
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
                        <a href="/item/itemList?categoryNum=10">신선 육류 코너</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="filter-control">
                        <ul>
                            <li class="active">신규 상품</li>
                        </ul>
                    </div>
                    <div class="product-slider owl-carousel">
                    <c:forEach items="${mealItemList }" var="mealItem" varStatus="status">
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="/resources/img/products/women-${status.count }.jpg" 
                                	onclick="location.href='/item/readItem?itemNum=${mealItem.itemNum }';" class="product-itemImg">
                                <c:if test="${mealItem.salePrice != 0 }">
    	                            <div class="sale">Sale</div>
                                </c:if>
                                <ul>
                                    <li class="w-icon active"><a onclick="insertCart(${mealItem.itemNum });" style="cursor:pointer;"><i class="icon_bag_alt"></i></a></li>
                                    <li class="quick-view"><a href="/item/readItem?itemNum=${mealItem.itemNum }">+ 상세보기</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">${mealItem.categoryName }</div>
                                <a href="#">
                                    <h5>${mealItem.itemName }</h5>
                                </a>
                                <div class="product-price">
                                	<c:if test="${mealItem.salePrice != 0 }">
	                                    <fmt:formatNumber value="${mealItem.salePrice }" pattern="#,###원"/>
    	                                <span><fmt:formatNumber value="${mealItem.price }" pattern="#,###원"/></span>
                                    </c:if>
                                    <c:if test="${mealItem.salePrice == 0 }">
                                    	<fmt:formatNumber value="${mealItem.price }" pattern="#,###원"/>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
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
                            <li class="active">신규 상품</li>
                        </ul>
                    </div>
                    <div class="product-slider owl-carousel">
                    <c:forEach items="${seafoodItemList }" var="seafoodItem" varStatus="status">
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="/resources/img/products/man-${status.count }.jpg"
									onclick="location.href='/item/readItem?itemNum=${seafoodItem.itemNum }';" class="product-itemImg">
                                <ul>
                                    <li class="w-icon active"><a onclick="insertCart(${seafoodItem.itemNum });" style="cursor:pointer;"><i class="icon_bag_alt"></i></a></li>
                                    <li class="quick-view"><a href="/item/readItem?itemNum=${seafoodItem.itemNum }">+ 상세보기</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">${seafoodItem.categoryName }</div>
                                <a href="#">
                                    <h5>${seafoodItem.itemName }</h5>
                                </a>
                                <div class="product-price">
                                    <fmt:formatNumber value="${seafoodItem.price }" pattern="#,###원"/>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="product-large set-bg m-large" id="product-large-seafood" data-setbg="/resources/img/products/man-large.jpg">
                        <h2>Seafood</h2>
                        <a href="#">신선 해산 코너</a>
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
                        <a href="#">신선 청과 코너</a>
                    </div>
                </div>
                <div class="col-lg-8 offset-lg-1">
                    <div class="filter-control">
                        <ul>
                            <li class="active">신규 상품</li>
                        </ul>
                    </div>
                    <div class="product-slider owl-carousel">
                    <c:forEach items="${produceItemList }" var="produceItem" varStatus="status">
                        <div class="product-item">
                            <div class="pi-pic">
                                <img src="/resources/img/products/women-${status.count }.jpg" 
                                	onclick="location.href='/item/readItem?itemNum=${produceItem.itemNum }';" class="product-itemImg">
                                <c:if test="${produceItem.salePrice != 0 }">
    	                            <div class="sale">Sale</div>
                                </c:if>
                                <ul>
                                    <li class="w-icon active"><a onclick="insertCart(${produceItem.itemNum });" style="cursor:pointer;"><i class="icon_bag_alt"></i></a></li>
                                    <li class="quick-view"><a href="/item/readItem?itemNum=${produceItem.itemNum }">+ 상세보기</a></li>
                                </ul>
                            </div>
                            <div class="pi-text">
                                <div class="catagory-name">${produceItem.categoryName }</div>
                                <a href="#">
                                    <h5>${produceItem.itemName }</h5>
                                </a>
                                <div class="product-price">
                                <c:if test="${produceItem.salePrice != 0 }">
	                                <fmt:formatNumber value="${produceItem.salePrice }" pattern="#,###원"/>
                                    <span><fmt:formatNumber value="${produceItem.price }" pattern="#,###원"/></span>
                                </c:if>
                                <c:if test="${produceItem.salePrice == 0 }">
                                    <fmt:formatNumber value="${produceItem.price }" pattern="#,###원"/>
                                </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
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
                        <h2>커뮤니티 최신글</h2>
                    </div>
                </div>
            </div>
            <div class="row">
            	<c:forEach items="${recipeList }" var="recipe" varStatus="status">
                <div class="col-lg-4 col-md-6">
                    <div class="single-latest-blog" style="cursor: pointer;" onclick="location.href='/recipe/readRecipe?recipeNum=${recipe.recipeNum }';">
                        <img src="${recipe.titleImg }" alt="" style="width: 355px; height: 256px;">
                        <div class="latest-text">
                            <div class="tag-list">
                                <div class="tag-item">
                                    <i class="fa fa-calendar-o"></i>
                                    ${recipe.indate }
                                </div>
                                <div class="tag-item">
                                    <i class="fa fa-comment-o"></i>
                                    ${countReplyArr[status.index] } <!-- 가져온 배열 순서대로 출력 -->
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
            <div class="benefit-items">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="/resources/img/icon-1.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>무료배송 서비스</h6>
                                <p>총 30,000원 이상 구매시 무료배송</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="/resources/img/icon-2.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>정시 배송</h6>
                                <p>배송 시각을 지킵니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-benefit">
                            <div class="sb-icon">
                                <img src="/resources/img/icon-1.png" alt="">
                            </div>
                            <div class="sb-text">
                                <h6>안전 배송</h6>
                                <p>파손/환불 100%</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->
    
    <!-- 모달 -->
	<div class="modal" id="il-modal">
		<div class="modal_content" id="il-modal_content">
			장바구니에 추가하시겠습니까?<br>
			<input type="button" class="modal-button" id="il-modal-button" value="네, 추가할래요">
			<input type="button" class="modal-button1" value="아니요, 다른 상품을 볼래요">
		</div>
	</div>

    <!-- 모달 -->
	<div class="modal" id="ri-modal">
		<div class="modal_content" id="ri-modal_content">
			장바구니에 추가되었습니다. 확인하시겠습니까?
			<input type="button" class="modal-button" id="ri-modal-button" value="장바구니로">
			<input type="button" class="modal-button1" value="쇼핑 계속하기">
		</div>
	</div>

	<input type="hidden" id="loginMail" value="${sessionScope.userMail }">
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>

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
	//jsp페이지 출력과 동시에 실행
	$(function(){
		$("li#menu-home").attr("class", "active");
	});
	
	//장바구니에 넣기
	function insertCart(itemNum) {
		console.log(itemNum);
		var userMail = $("#loginMail").val();
		console.log(userMail);
		itemNum = parseInt(itemNum);
		var cartAmount = 1;

		if(userMail == null || userMail == "" || userMail == " "){
			alert("로그인이 필요합니다.");
		} else {
			//장바구니에 넣을 것인지 확인하는 모달창
			ilShowModal();
			
			//넣는다고 했을 경우
			$("#il-modal-button").click(function(){
				$.ajax({
					url: "/order/insertCart",
					type: "POST", 
					data: {
						itemNum : itemNum,
						cartAmount : cartAmount,
						userMail : userMail
					},
					success: function(res) { //cart테이블에 입력
						if(res = "yes") {
							//장바구니로 이동할 것인지 확인
							showModal();
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