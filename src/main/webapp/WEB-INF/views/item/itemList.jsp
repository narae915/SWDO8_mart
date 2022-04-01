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
    <title>SpringDay | 식품 마트</title>

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
                    <div class="breadcrumb-text">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <span>상품</span>
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
                        <h4 class="fw-title">카테고리</h4>
                        <ul class="filter-catagories">
                        	<!-- HashMap 반복할 때는 안에 들어있는 key값을 대문자로 작성해야 한다. -->
                        	<c:forEach items="${categoryList }" var="category">
	                        	<li><a style="cursor: pointer;" onclick="option(${category.CATEGORYNUM });">
	                        		${category.CATEGORYNAME }</a></li>
                        	</c:forEach>
                        </ul>
                    </div>
                    <div class="filter-widget">
                        <div class="filter-range-wrap">
                            <div class="range-slider">
                            </div>
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
	                                        <option value="new">최근 등록순</option>
	                                        <option value="high">가격 높은순</option>
	                                        <option value="low">가격 낮은순</option>
	                                    </select>
	                                    <input type="hidden" id="cate-num" value="">
                                    </c:if>
                                    <c:if test="${categoryList == null }">
	                                    <select class="sorting" id="sorting" name="sorting" onchange="option(0);">
	                                    	<option value="new">최근 등록순</option>
	                                        <option value="high">가격 높은순</option>
	                                        <option value="low">가격 낮은순</option>
	                                    </select>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-list">
						<div class="row" id="productList">
							<c:forEach items="${itemList }" var="item" varStatus="status">
							<div class="col-lg-4 col-sm-6">
								<div class="product-item">
									<div class="pi-pic">
										<img src="/resources/img/products/product-${status.count }.jpg" alt="">
										<!-- 세일상품 <div class="sale pp-sale">Sale</div> -->
										<ul>
											<li class="w-icon active" onclick="insertCart(${item.itemNum });"><a href="#"><i class="icon_bag_alt"></i></a></li>
											<li class="quick-view"><a href="/item/readItem?itemNum=${item.itemNum }">+ 상세 보기</a></li>
										</ul>
									</div>
									<div class="pi-text">
										<div class="catagory-name">${item.categoryName }</div>
										<a href="#"><h5>${item.itemName }</h5></a>
										<!-- 가격사이에 ,를 찍기 위해 fmt 사용 -->
										<div class="product-price"><fmt:formatNumber value="${item.price }" pattern="#,###원"/></div>
									</div>
								</div>
							</div>
							</c:forEach>
                        </div>
                    </div>
                    <div class="loading-more">
                    	<i class="icon_loading"></i>
                        <a href="javascript:loadingMore(9);" style="cursor: pointer;">
                           	상품 더 보기
                        </a>
                        <input type="hidden" id="viewCount" value="0">
                        <input type="hidden" id="startCount" value="0">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Shop Section End -->

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
	
    //카테고리 번호 찾기(정렬 select에서 categoryNum을 알 수 없기 때문)
    function searchCategoryNum(categoryNum) {
    	var searchNum = $("#cate-num").val();
    	console.log(searchNum);

    	if(searchNum == null || searchNum == "" ){
    		searchNum = 0;
    	}

    		//찾은 번호로 카테고리 + 정렬 실행
        	option(searchNum);
    }

    //카테고리 별로 보기 + 정렬
    function option(categoryNum) {
		//카테고리 번호를 hidden에 value값으로 주기
    	$("#cate-num").val(categoryNum);
    	
    	var sorting = $("#sorting").val();
		console.log(sorting);
    	console.log(categoryNum);

    	//ajax에 jstl태그를 사용할 수 없으므로 ajax용 jsp를 만들어서 태그를 끌어오는 방식
    	$.ajax({
    		url: "/item/sorting",
    		type: "POST", 
    		data: {
				sorting: $("#sorting").val(),    			
    			sendNum:categoryNum
    		},
    		success: function(res){
				console.log(res); 
				$(".row > .col-lg-4 col-sm-6").remove();
				$("#productList").html(res);
    		},
			error: function(e){
				console.log("실패");
			}
		});
	}//함수 닫기
	
	//더보기 실행하기(페이징)
	function loadingMore(cnt){
		var temp = $("#productList>div>div>div>ul").length;
		console.log(temp);
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
			type: "POST", 
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
				console.log("실패");
			}
		});
	}
	
	//장바구니에 넣기
	function insertCart(itemNum) {
		console.log(itemNum);
		itemNum = parseInt(itemNum);
		var cartAmount = 1;

		//장바구니에 넣을 것인지 확인하는 모달창
		ilShowModal();
		
		//넣는다고 했을 경우
		$("#il-modal-button").click(function(){
			$.ajax({
				url: "/order/insertCart",
				type: "GET", 
				data: {
					itemNum : itemNum,
					cartAmount : cartAmount
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