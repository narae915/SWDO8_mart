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
    <title>SpringDay | 내 주문 목록</title>

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
    <link rel="stylesheet" href="/resources/css/orderCss/orderList.css" type="text/css">
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
                        <span>내 주문 목록</span>
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
                    <!-- 22/03/24~22/03/25 노채린 -->
                    <h1 id="content-title">주문 조회</h1>
                    <br>
                    <div class="container-h5">
                    <br>
                    <h5>* 주문하신 상품의 내역을 확인하실 수 있습니다.</h5>
                    <h5>* 상품명을 클릭 시, 해당 상품의 상세 페이지로 이동합니다.</h5>
                    <h5>* 주문 취소 희망 시, 희망하는 상품에 체크 후 취소 버튼을 눌러주세요.</h5><br>
                    </div>
                    <br>
                    <c:if test="${not empty orderList }">
	                    <!-- 주문 검색 -->
	                    <form action="orderList" method="get" onsubmit="return searchChk();">
	                    	<input type="text" name="searchWord" id="searchWord" placeholder="상품의 이름을 정확히 입력해주세요.">
	                    	<button type="submit" class="primary-btn" id="search-button"><i class="ti-search"></i></button>
	                    </form>
	                    <!-- 주문 취소 및 주문 조회 -->
	                    <form action="ordercancel" method="post" id="cancelForm">
	                    	<input type="button" class="primary-btn" id="cancelButton" value="주문 취소">
	                    	<!-- 주문 조회 테이블 시작 -->
	                    	<div id = "orderTable">
		                        <table class="table-basic">
		                        	<thead>
		                        		<tr>
		                        			<th colspan="5" class="th-top">주문정보</th>
		                        			<th colspan="3" class="th-top">수취인 정보</th>
		                        		</tr>
		                        		<tr>
		                        			<th rowspan="2">체크</th>
		                        			<th>금액</th>
		                        			<th rowspan="2" colspan="2">상품명</th>
		                        			<th rowspan="2">주문량(개)</th>
		                        			<th rowspan="2">주소</th>
		                        			<th rowspan="2">전화번호</th>
		                        			<th rowspan="2">이메일</th>
		                        			<tr>
		                        			<th>주문일시</th>
		                        		</tr>
		                        	</thead>
		                        	<tbody>
			                        	<c:forEach var="Order" items="${orderList }">
			                        		<tr class="tr">
				                        		<td rowspan="2"><input type="checkbox" id="orderNum" name="orderNum" value="${Order.orderNum }" /></td> <!-- 주문취소셀렉트 -->
				                        		<c:if test="${Order.price == 0}"> <!-- 상품정보 없을 시 금액 -->
				                        			<td>- ₩</td> 
				                        		</c:if>
				                        		<c:if test="${Order.price != 0}"> <!-- 상품정보 있을 시 금액 -->
				                        			<td><fmt:formatNumber value="${Order.price * Order.amount }" pattern='#,### ₩'/></td>
				                        		</c:if>
				                        		
				                        		<td rowspan="2"><img src="/resources/img/cart-page/product-1.jpg" alt="임시사진"></td><!-- 상품사진 -->
				                        		
				                        		<c:if test="${Order.itemName == null }"> <!-- 상품정보 없을 시 상품명 -->
				                        		<td rowspan="2">판매 중지된 상품</td> 
				                        		</c:if>
				                        		<c:if test="${Order.itemName != null }"> <!-- 상품정보 있을 시 상품명 -->
				                        		<td rowspan="2">
				                        			<a href="/item/itemList?itemNum=${itemNum }" style="color: #000">
				                        				${Order.itemName }
				                        			</a>
				                        		</td> 
				                        		</c:if>
				                        		<td rowspan="2">${Order.amount }</td> <!-- 주문량 -->
				                        		<td rowspan="2">${Order.orderAddress }</td> <!-- 배송지 -->
				                        		<td rowspan="2">${fn:substring(Order.orderCall,0,3) }&nbsp;-&nbsp;${fn:substring(Order.orderCall,3,7) }&nbsp;-&nbsp;${fn:substring(Order.orderCall,7,11) }</td>
				                        		<td rowspan="2">${Order.orderMail}</td> <!-- 수취인 이메일 -->
				                        	</tr>
			                        		<tr class="tr">
			                        			<td>${Order.indate }</td> <!-- 주문일시 -->
			                        		</tr>
			                        	</c:forEach>
		                        	</tbody>
		                        </table>
	                        </div>
	                        <!-- 주문 조회 테이블 끝 -->
							<!-- 2022-03-26 노채린 -->
	                        <!-- 페이징 시작 -->
	                        <div style="text-align: center; margin-top: 20px;">
								<span>
									<c:choose>
									<c:when test="${searchWord eq '' }">
										<c:if test="${navi.currentPage > 1 }">
											<a href="/order/orderList?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
												< 이전&nbsp;
		
											</a>
										</c:if>
										<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }"
											var="pageNum">
											<c:if test="${pageNum == navi.currentPage }">
												<a href="/order/orderList?currentPage=${pageNum }" style="text-decoration:none; text-align: center; font-size: 1.5em;">
													<span style="color: #E7AB3C; border: 1px solid;">
														&nbsp;${pageNum }
													</span>
												</a>
												&nbsp;
											</c:if>
											<c:if test="${pageNum != navi.currentPage }">
												<a href="/order/orderList?currentPage=${pageNum }" style="color: black; text-decoration:none; text-align: center; font-size: 1.5em;">
													<span>
														${pageNum }&nbsp;
													</span>
												</a>
											</c:if>
										</c:forEach>
										<c:if test="${navi.currentPage < navi.totalPageCount }">
											<a href="/order/orderList?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration:none;text-align: center; font-size: 1.5em;">
												다음 >
											</a>
										</c:if>
									</c:when>

									<c:otherwise>
										<c:if test="${navi.currentPage > 1 }">
											<a href="/order/orderList?searchWord=${searchWord }&currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
												< 이전&nbsp;
		
											</a>
										</c:if>
										<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }"
											var="pageNum">
											<c:if test="${pageNum == navi.currentPage }">
												<a href="/order/orderList?searchWord=${searchWord }&currentPage=${pageNum }" style="text-decoration:none; text-align: center; font-size: 1.5em;">
													<span style="color: #E7AB3C; border: 1px solid;">
														&nbsp;${pageNum }
													</span>
												</a>
												&nbsp;
											</c:if>
											<c:if test="${pageNum != navi.currentPage }">
												<a href="/order/orderList?searchWord=${searchWord }&currentPage=${pageNum }" style="color: black; text-decoration:none; text-align: center; font-size: 1.5em;">
													<span>
														${pageNum }&nbsp;
													</span>
												</a>
											</c:if>
										</c:forEach>
		
										<c:if test="${navi.currentPage < navi.totalPageCount }">
											<a href="/order/orderList?searchWord=${searchWord }&currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration:none;text-align: center; font-size: 1.5em;">
												다음 >
											</a>
										</c:if>
									</c:otherwise>
									</c:choose>
								</span>
								
							</div>
							<!-- 페이징 끝 -->
						</form>
					</c:if> 
					<c:if test="${empty orderList }">
					<div class="container-h5">
					<a href="https://www.flaticon.com/kr/free-icons/" title="금지 아이콘">
					<img src="/resources/img/not.png" alt="금지 아이콘  제작자: Freepik - Flaticon" id="image-not">
					</a>
					<h2 id="emptyList">주문 정보가 없습니다</h2>
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
    <script src="/resources/js/orderJs/orderList.js"></script>
 	
</body>
    
</html>