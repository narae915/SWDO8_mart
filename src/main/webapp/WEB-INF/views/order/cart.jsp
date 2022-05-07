<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SpringDay | 장바구니</title>

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
	<script src="https://kit.fontawesome.com/af95d2c333.js" crossorigin="anonymous"></script>
	
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
                        <span>장바구니</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
	
    <!-- Faq Section Begin -->
    <div class="faq-section spad"> <!-- 본문 상단 여백 -->
        <div class="container"> <!-- 본문 좌측 여백 -->
            <div class="row"> <!-- flex 설정 -->
            
                <div class="col-lg-12"> <!-- 본문을 우측으로 조금 변경 -->
                    <div class="faq-accordin"> <!-- 폰트 크기, 아이콘 -->
	                    <!-- 22/04/01 노채린 -->
	                    <h1 id="content-title">장바구니</h1>
	                    <br>
	                    <div class="container-h5">
		                    <br>
		                    <h5>* 장바구니에 담긴 상품의 내역을 확인하실 수 있습니다.</h5>
		                    <h5>* 상품명을 클릭 시, 해당 상품의 상세 페이지로 이동합니다.</h5>
		                    <h5>* 장바구니에서 삭제하고 싶으시다면, 해당  상품을 체크 후 취소 버튼을 눌러주세요.</h5><br>
						</div>
	                    <br>
	                    <!-- 장바구니 취소 및 조회 -->
                    	<!-- 테이블 시작 -->
                    	<c:if test="${not empty cartList }">
							<form name="cartform" id="cartform" method="get" class="cartform" action="orderForm">
				    
				            <input type="hidden" name="cmd" value="cart">
				            <div class="basketdiv" id="basket">
				           	 	<!-- 데이터 있을 때 -->
				                <div class="row head">
				                    <div class="subdiv">
				                        <div class="check" id="check">선택</div>
				                        <div class="img" id="img">이미지</div>
				                        <div class="pname" id="pname">상품명</div>
				                    </div>
				                    <div class="subdiv">
				                        <div class="basketprice">가격</div>
				                        <div class="num">수량</div>
				                        <div class="sum">합계</div>
				                    </div>
				                    <div class="subdiv">
				                        <div class="basketcmd">삭제</div>
				                    </div>
				                    <div class="split"></div>
				                </div>
				        		<c:forEach var="Cart" items="${cartList }">
					                <div class="row data" >
					                    <div class="subdiv">
					                        <div class="check"><input type="checkbox" name="buy" value="${Cart.cartNum }" onclick="javascript:basket.checkItem();">&nbsp;</div>
					                        <c:if test="${Cart.savedFileNum eq Cart.itemNum }">

					                        <div class="img"><img src="/uploadImg/${Cart.savedFilename }" style="height:130px; width:280px" alt="임시사진"></div>
					                        </c:if>
					                        <c:if test="${Cart.savedFileNum ne Cart.itemNum }">
					                        <div class="img"><img src="/resources/img/itemDefault.png" style="height:130px; width:280px" alt="임시사진"></div>
					                        </c:if>
					                        
					                        <div class="pname"><!-- 상품명 -->
					                            <span>${Cart.itemName }</span>
					                        </div>
					                    </div>
		
					                    <div class="subdiv">
					                    <!-- 가격 -->
					                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" value="${Cart.price }">
					                        	<fmt:formatNumber value="${Cart.price }" pattern='#,###원' />
					                        </div>
					                        <div class="num"><!-- ${Cart.price }.원 -->
					                        <!-- 수량 -->
					                            <div class="updown">
													<span style="cursor:pointer" onclick="javascript:basket.changePNum('${Cart.cartNum}');"><i class="fas fa-arrow-alt-circle-up up fa-2xs"></i></span>
					                                <input type="text" name="p_num" id="p_num${Cart.cartNum }" size="2" maxlength="3" class="p_num" value="${Cart.cartAmount }" onkeyup="javascript:basket.changePNum('${Cart.cartNum}');">
					                                <span style="cursor:pointer" onclick="javascript:basket.changePNum('${Cart.cartNum}');"><i class="fas fa-arrow-alt-circle-down down fa-2xs"></i></span>
					                            </div>
					                        </div>
					                        <div class="sum">
					                        	<fmt:formatNumber value="${Cart.cartAmount*Cart.price }" pattern='#,###원' />
					                        </div>
					                    </div>
					                    <div class="subdiv">
				                        	<div class="basketcmd">
				                        		<input type="hidden" id="hiddenNum" value="${Cart.cartNum }">
				                        		<button id="cancel-btn" class="abutton"onclick="return cartCancel();"><i class="fa-solid fa-xmark fa-lg"></i></button>
				                        	</div>
					                    </div>
					                </div>
				                </c:forEach>
								<!-- 페이징 시작 -->
								<div style="text-align: center;">
									<span>
										<c:if test="${navi.currentPage > 1 }">
											<a href="/order/cart?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em; display: inline-block; padding-top: 1.5em;">
												< 이전&nbsp;
			
											</a>
										</c:if>
										<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }"
											var="pageNum">
											<c:if test="${pageNum == navi.currentPage }">
												<a href="/order/cart?currentPage=${pageNum }" style="text-decoration:none; text-align: center; font-size: 1.5em; display: inline-block; padding-top: 1.5em;">
													<span style="color: #E7AB3C; border: 1px solid;">
														&nbsp;${pageNum }
													</span>
												</a>
												&nbsp;
											</c:if>
											<c:if test="${pageNum != navi.currentPage }">
												<a href="/order/cart?currentPage=${pageNum }" style="color: black; text-decoration:none; text-align: center; font-size: 1.5em; display: inline-block; padding-top: 1.5em;">
													<span>
														${pageNum }&nbsp;
													</span>
												</a>
											</c:if>
										</c:forEach>
			
										<c:if test="${navi.currentPage < navi.totalPageCount }">
											<a href="/order/cart?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration:none;text-align: center; font-size: 1.5em; display: inline-block; padding-top: 1.5em;">
												다음 >
											</a>
										</c:if>
									</span>
								</div>
								<!-- 페이징 끝 --> 
				            </div>
				            <div id="gocart" class="">
			                	<div class="buttongroup center-align cmd">
					                <!-- forward 시도 -->
									<input type="submit" id="purchase" value="선택한 상품 주문" />
					           		<!-- 결제 페이지로 보내는 값 -->
					           		<div id="forwardDiv">
						           		<input type="hidden" name="totalPrice" id="totalPrice" />
				                	</div>
			                	</div>
				            </div>
				            </form>
					   	 	<div class=result-box>
					   	 	<br>
					            <div class="bigtext right-align sumcount" id="sum_p_num">총 0개</div>
					            <div class="bigtext right-align box summoney" id="sum_p_price">합계금액: 0원</div>
					            <br>
					    	</div>
				        </c:if>
                        <!--  테이블 끝 -->
                        <!-- 데이터 없을 때 -->
                        <c:if test="${empty cartList }">
	                        <div class="container-h5">
								<a href="https://www.flaticon.com/kr/free-icons/" title="금지 아이콘">
									<img src="/resources/img/not.png" alt="금지 아이콘  제작자: Freepik - Flaticon" id="image-not">
								</a>
								<h2 id="emptyList">장바구니에 담긴 상품이 없습니다</h2>
							</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
	</div>
    <!-- Faq Section End -->
    
    <!-- Footer Section Begin -->
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
    <script src="/resources/js/orderJs/cart.js"></script>
    
</body>

</html>