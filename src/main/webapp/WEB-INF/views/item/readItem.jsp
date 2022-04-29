<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SpringDay | 상세보기</title>

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
	</style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <a href="/item/itemList">상품</a>
                        <span>상세 보기</span>
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
                        <h4 class="fw-title">카테고리</h4>
                        <ul class="filter-catagories">
                        	<!-- HashMap 반복할 때는 안에 들어있는 key값을 대문자로 작성해야 한다. -->
                        	<c:forEach items="${categoryList }" var="category">
	                        	<li><a style="cursor: pointer;" href="/item/itemList?categoryNum=${category.CATEGORYNUM }">
	                        		${category.CATEGORYNAME }</a></li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="product-pic-zoom">
                                <img class="product-big-img" src="/resources/img/product-single/product-1.jpg" alt="">
                                <div class="zoom-icon">
                                    <i class="fa fa-search-plus"></i>
                                </div>
                            </div>
                            <div class="product-thumbs">
                                <div class="product-thumbs-track ps-slider owl-carousel">
                                    <div class="pt active" data-imgbigurl="/resources/img/product-single/product-1.jpg"><img
                                            src="/resources/img/product-single/product-1.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="/resources/img/product-single/product-2.jpg"><img
                                            src="/resources/img/product-single/product-2.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="/resources/img/product-single/product-3.jpg"><img
                                            src="/resources/img/product-single/product-3.jpg" alt=""></div>
                                    <div class="pt" data-imgbigurl="/resources/img/product-single/product-3.jpg"><img
                                            src="/resources/img/product-single/product-3.jpg" alt=""></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-details">
                                <div class="pd-title">
                                    <span>${item.categoryName }</span>
                                    <h3>${item.itemName }</h3>
                                </div>
                                <div class="pd-desc">
                                    <p>- 상품 설명 -</p>
                                    <p>현재 남은 수량 ${item.itemAmount }</p>
                                    <input type="hidden" id="item-amount" value="${item.itemAmount }">
                                    <h4><fmt:formatNumber value="${item.price }" pattern="#,###원"/></h4>
                                </div>
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" name="cartAmount" value="1">
                                    </div>
                                    <a class="primary-btn pd-cart" onclick="insertCart(${item.itemNum });">장바구니에 담기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-tab">
                        <div class="tab-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-toggle="tab" href="#tab-1" role="tab">💡상품 정보(상세 설명)</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-2" role="tab">👐간단한 손질법👐</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-3" role="tab">👨식자재 보관법👩</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <h5>Introduction</h5>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                    aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
                                                <h5>Features</h5>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
                                                    eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                                                    ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                    aliquip ex ea commodo consequat. Duis aute irure dolor in </p>
                                            </div>
                                            <div class="col-lg-5">
                                                <img src="/resources/img/product-single/tab-desc.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-2" role="tabpanel">
                                    <div class="specification-table">
                                        <table>
                                            <tr>
                                                <td class="p-catagory">Customer Rating</td>
                                                <td>
                                                    <div class="pd-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <span>(5)</span>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Price</td>
                                                <td>
                                                    <div class="p-price">$495.00</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Add To Cart</td>
                                                <td>
                                                    <div class="cart-add">+ add to cart</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Availability</td>
                                                <td>
                                                    <div class="p-stock">22 in stock</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Weight</td>
                                                <td>
                                                    <div class="p-weight">1,3kg</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Size</td>
                                                <td>
                                                    <div class="p-size">Xxl</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Color</td>
                                                <td><span class="cs-color"></span></td>
                                            </tr>
                                            <tr>
                                                <td class="p-catagory">Sku</td>
                                                <td>
                                                    <div class="p-code">00012</div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-3" role="tabpanel">
                                    <div class="customer-review-option">
                                        <h4>2 Comments</h4>
                                        <div class="comment-option">
                                            <div class="co-item">
                                                <div class="avatar-pic">
                                                    <img src="/resources/img/product-single/avatar-1.png" alt="">
                                                </div>
                                                <div class="avatar-text">
                                                    <div class="at-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <h5>Brandon Kelley <span>27 Aug 2019</span></h5>
                                                    <div class="at-reply">Nice !</div>
                                                </div>
                                            </div>
                                            <div class="co-item">
                                                <div class="avatar-pic">
                                                    <img src="/resources/img/product-single/avatar-2.png" alt="">
                                                </div>
                                                <div class="avatar-text">
                                                    <div class="at-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <h5>Roy Banks <span>27 Aug 2019</span></h5>
                                                    <div class="at-reply">Nice !</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="personal-rating">
                                            <h6>Your Ratind</h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                        </div>
                                        <div class="leave-comment">
                                            <h4>Leave A Comment</h4>
                                            <form action="#" class="comment-form">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <input type="text" placeholder="Name">
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <input type="text" placeholder="Email">
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <textarea placeholder="Messages"></textarea>
                                                        <button type="submit" class="site-btn">Send message</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
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

	<!-- 모달 -->
	<div class="modal" id="ri-modal">
		<div class="modal_content" id="ri-modal_content" title="클릭하면 창이 닫힙니다.">
			장바구니에 추가되었습니다. 확인하시겠습니까?
			<input type="button" class="modal-button" id="ri-modal-button" value="장바구니로">
			<input type="button" class="modal-button1" id="ri-modal-close" value="쇼핑 계속하기">
		</div>
	</div>

	<input type="hidden" id="loginMail" value="${sessionScope.userMail }">
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>
    
    <!-- modal -->
	<div class="modal" id="footer-modal">
		<div class="modal_content" id="footer-modal-content">
		</div>
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
    
	//jsp페이지 출력과 동시에 실행 
	$(function(){
		//현재 페이지를 선택했음을 알림 4/17 박나래
		$("li#menu-foodMart").attr("class", "active");
	});

	// 닫기 모달
	function exitAlert() {
		$("#footer-modal-content").append('<button name="modalClose" class="primary-btn" id="footer-modal-button" style="margin-top:30px; border-radius:5px; border:none">창 닫기</button>');
	}

	// 모달 출력
	function showModalAlert() {
		$("#footer-modal").fadeIn();
		$("button[name=modalClose]").click(function() {
			$("#footer-modal").fadeOut();
		});
	}
	
	//장바구니에 상품 넣기
	function insertCart(itemNum) {
		console.log(itemNum);
		itemNum = parseInt(itemNum);
		cartAmount = $("input[name=cartAmount]").val();
		var userMail = $("#loginMail").val();
		console.log(cartAmount);
		var itemAmount = $("#item-amount").val();
		
		//아이템 수량이 0개 이하일 때 더이상 구매할 수 없게 한 뒤, 페이지 이동
		if(itemAmount <= 0) {
			$("#footer-modal-content").html("");
			$("#footer-modal-content").css({"text-align": "center"});
			$("#footer-modal-content").html("준비 중인 상품입니다.<br>창닫기를 누르시면 상품 리스트 페이지로 이동합니다.");
			exitAlert();
			showModalAlert();
			
			$("button[name=modalClose]").click(function() {
				location.href="/item/itemList";
			});
			
		//사용자가 입력한 수량이 등록된 아이템 수량보다 클 때			
		} else if(itemAmount < cartAmount) {
			$("#footer-modal-content").html("");
			$("#footer-modal-content").css({"text-align": "center"});
			$("#footer-modal-content").html("입력한 개수가 너무 많습니다.");
			exitAlert();
			showModalAlert();
		} else {
			// 사용자가 입력한 수량이 없을 때
			if(cartAmount == 0) {
				$("#footer-modal-content").html("");
				$("#footer-modal-content").html("수량을 1개 이상 선택해주세요.");
				exitAlert();
				showModalAlert();
			} else {
				//장바구니에 상품 넣기
				$.ajax({
					url: "/order/insertCart",
					type: "POST", 
					data: {
						itemNum : itemNum,
						cartAmount : cartAmount,
						userMail : userMail
					},
					success: function(res) { //cart테이블에 입력
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
   	
	//모달창 띄워주기
   	function showModal() {
   		$("#ri-modal").fadeIn();

   		$("#ri-modal_content").click(function(){
   			$("#ri-modal").fadeOut();
   		});
   	}
    </script>
</body>

</html>