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
    <title>상품 조회</title>

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
    <link rel="stylesheet" href="/resources/css/adminCss/itemManagement.css" type="text/css">

</head>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Header -->
    <%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <a href="/admin/adminMain">Admin</a>
                        <span>상품 조회</span>
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
	                    
	                    <!-- 22/03/27~22/03/28 노채린 -->
	                    <!-- 상품 검색 -->
	                    <c:if test="${not empty itemList }">
		                    <form action="itemManagement" method="get" onsubmit="return searchChk();">
								<select name="category" id="category">
									<option value="">카테고리 선택</option>
									<option value="10">육류</option>
									<option value="20">어패류</option>
									<option value="30">과일</option>
									<option value="40">채소</option>
									<option value="50">조미료</option>
									<option value="60">음료</option>
									<option value="70">그 외</option>
								</select>
		                    	<input type="text" name="searchWord" id="searchWord" placeholder="상품의 이름을 정확히 입력해주세요.">
		                    	<button type="submit" class="primary-btn" id="search-button"><i class="ti-search"></i></button>
		                    </form>
		                    
		                    <!-- 상품 추가 -->
			                <input type="button" class="primary-btn" id="insert-button" value="상품 추가" onclick="location.href='/admin/itemRegister'">
			                

		                    <form action="itemUpdate" method="get">
		                    	<input type="submit" id="upButton" class="primary-btn" value="상품 수정" onclick = "return itemUpdate();">
			                    <input type="button" id="deButton" name="itemNum" class="primary-btn" value="상품 삭제" onclick ="return deValueChk();">
			                   	<!-- 상품 관리 테이블 시작 -->
			                   	<table>
			                       		<tr>
			                       			<th>선택</th>
			                       			<th id="th-image">IMAGE</th>
			                       			<th>상품 번호</th>
			                       			<th>이름</th>
			                       			<th>가격</th>
			                       			<th>재고</th>
			                       			<th>카테고리</th>
			                       			<th>판매글 작성</th>
			                       		</tr>
			                       		
				                       	<!-- itemList 반복 -->
				                       	<c:forEach var="Item" items="${itemList }">
				                       		<tr>
				                       			<td>
				                       				<input type="radio" id="itemChk" name="itemChk" value="${Item.itemNum }" />
				                       			</td>
				                       			<c:choose>
					                       			<c:when test="${fileList[0].itemNum eq Item.itemNum }">
				                       				<td id="td-image"><img src="/uploadImg/${fileList[0].savedFilename }" alt="임시사진" style="height: 222px; width:260px;"></td>
				                       				</c:when>
					                       			<c:when test="${fileList[1].itemNum eq Item.itemNum }">
				                       				<td id="td-image"><img src="/uploadImg/${fileList[1].savedFilename }" alt="임시사진" style="height: 222px; width:260px;"></td>
				                       				</c:when>
					                       			<c:when test="${fileList[2].itemNum eq Item.itemNum }">
				                       				<td id="td-image"><img src="/uploadImg/${fileList[2].savedFilename }" alt="임시사진" style="height: 222px; width:260px;"></td>
				                       				</c:when>
					                       			<c:when test="${fileList[3].itemNum eq Item.itemNum }">
				                       				<td id="td-image"><img src="/uploadImg/${fileList[3].savedFilename }" alt="임시사진" style="height: 222px; width:260px;"></td>
				                       				</c:when>
					                       			<c:when test="${fileList[4].itemNum eq Item.itemNum }">
				                       				<td id="td-image"><img src="/uploadImg/${fileList[4].savedFilename }" alt="임시사진" style="height: 222px; width:260px;"></td>
				                       				</c:when>
													<c:otherwise>                       				
													<td id="td-image"><img src="/resources/img/itemDefault.png" alt="임시사진" style="height: 222px; width:260px;"></td>
													</c:otherwise>
												</c:choose>
												
				                       			<td id="itemNum">${Item.itemNum }</td>
				                       			<td id="itemName">${Item.itemName }</td>
				                       			<td id="price">${Item.price}</td>
				                       			<td id="itemAmount">${Item.itemAmount }</td>
				                       			<td id="itemCategory">${Item.categoryName }</td>
				                       			<td><input type="button" class="primary-btn" id="write-button" value="write" onclick="location.href='/admin/itemSale?itemNum=${Item.itemNum}'"></td>
				                       			
				                       		</tr>
				                       	</c:forEach>
				                       	
				                       	
								</table>
								<!-- 상품 관리 테이블 끝  -->
		                        <!-- 페이징 시작 -->
		                        <div style="text-align: center; margin-top: 20px;">
									<span>
									 <c:choose>
									<c:when test="${searchWord eq '' }">
										<c:if test="${navi.currentPage > 1 }">
											<a href="/admin/itemManagement?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
												< 이전&nbsp;
		
											</a>
										</c:if>
										<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }"
											var="pageNum">
											<c:if test="${pageNum == navi.currentPage }">
												<a href="/admin/itemManagement?currentPage=${pageNum }" style="text-decoration:none; text-align: center; font-size: 1.5em;">
													<span style="color: #E7AB3C; border: 1px solid;">
														&nbsp;${pageNum }
													</span>
												</a>
												&nbsp;
											</c:if>
											<c:if test="${pageNum != navi.currentPage }">
												<a href="/admin/itemManagement?currentPage=${pageNum }" style="color: black; text-decoration:none; text-align: center; font-size: 1.5em;">
													<span>
														${pageNum }&nbsp;
													</span>
												</a>
											</c:if>
										</c:forEach>
		
										<c:if test="${navi.currentPage < navi.totalPageCount }">
											<a href="/admin/itemManagement?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration:none;text-align: center; font-size: 1.5em;">
												다음 >
											</a>
										</c:if>
										</c:when>
									<c:otherwise>
										<c:if test="${navi.currentPage > 1 }">
											<a href="/admin/itemManagement?searchWord=${searchWord }&currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
												< 이전&nbsp;
		
											</a>
										</c:if>
										<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }"
											var="pageNum">
											<c:if test="${pageNum == navi.currentPage }">
												<a href="/admin/itemManagement?searchWord=${searchWord }&currentPage=${pageNum }" style="text-decoration:none; text-align: center; font-size: 1.5em;">
													<span style="color: #E7AB3C; border: 1px solid;">
														&nbsp;${pageNum }
													</span>
												</a>
												&nbsp;
											</c:if>
											<c:if test="${pageNum != navi.currentPage }">
												<a href="/admin/itemManagement?searchWord=${searchWord }&currentPage=${pageNum }" style="color: black; text-decoration:none; text-align: center; font-size: 1.5em;">
													<span>
														${pageNum }&nbsp;
													</span>
												</a>
											</c:if>
										</c:forEach>
		
										<c:if test="${navi.currentPage < navi.totalPageCount }">
											<a href="/admin/itemManagement?searchWord=${searchWord }&currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration:none;text-align: center; font-size: 1.5em;">
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
						<c:if test="${empty itemList }">
							<div class="container-h5">
								<a href="https://www.flaticon.com/kr/free-icons/" title="금지 아이콘">
									<img src="/resources/img/not.png" alt="금지 아이콘  제작자: Freepik - Flaticon" id="image-not">
								</a>
								<h2 id="emptyList">상품 정보가 없습니다</h2>
							</div>
						</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Faq Section End -->
    
    <!-- Partner Logo Section Begin -->
    <div class="partner-logo">
        <div class="container">
            <div class="logo-carousel owl-carousel">
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="/resources/img/logo-carousel/logo-1.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="/resources/img/logo-carousel/logo-2.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="/resources/img/logo-carousel/logo-3.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="/resources/img/logo-carousel/logo-4.png" alt="">
                    </div>
                </div>
                <div class="logo-item">
                    <div class="tablecell-inner">
                        <img src="/resources/img/logo-carousel/logo-5.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Partner Logo Section End -->

    <!-- Footer -->
    <%@ include file="/WEB-INF/views/admin/adminFooter.jsp" %>

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
    <script src="/resources/js/adminJs/itemManagement.js"></script>
</body>

</html>