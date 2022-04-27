<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${itemList }" var="item" varStatus="status">
		<div class="col-lg-4 col-sm-6">
			<div class="product-item">
				<div class="pi-pic">
					<img src="/resources/img/products/product-${item.itemNum }.jpg" alt="">
					<ul>
						<li class="w-icon active" onclick="insertCart(${item.itemNum });" style="cursor:pointer;">
							<a><i class="icon_bag_alt"></i></a>
						</li>
						<li class="quick-view">
							<a href="/item/readItem?itemNum=${item.itemNum }">+ 상세 보기</a>
						</li>
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
	<input type="hidden" id="cate-num" value="${requestScope.categoryNum }">
	<input type="hidden" id="viewCount" value="0">
	<input type="hidden" id="startCount" value="0">
	
	<script src="/resources/js/jquery-3.6.0.min.js"></script>
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
    			console.log(res);
    				$(".row > .col-lg-4 col-sm-6").remove();
    				$("#productList").html(res);
    		},
    		error: function(e){
   				$("#footer-modal-content").html("표시할 게시물이 없습니다.");
   				exitAlert();
   				showModalAlert();
				console.log("실패");
			}
		});
	}
	
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