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
    
	<script type="text/javascript">
		function itemUpdate(){
			var updateNum = [];
			var checked = $("input[name=itemChk]:checked");
			checked.each(function() {
				updateNum.push($(this).val());
			});
			
			var allData = {"updateNumArray": updateNum};
	/* 
			if(updateNum.length >= 2){
				alert("한 개만 선택해주세요.");
				
				return false;
			}
			 */
			if(updateNum == "") { // 체크박스가 체크되어있지 않은 경우 경고창을 띄우며 수정을 진행하지 않음.
				alert("선택된 항목이 없습니다.");
				
				return false;
			} /*else {
				 $.ajax({
					url: "/admin/itemUpdate",
					type: "post",
					data: allData,
					success: function(res, url) {
						alert("성공");
						location.href="/admin/itemRegister";
					}
				});
			}*/
		}
	</script>
	
	<style type="text/css">
	table, th, tr, td {
		text-align: center;
		border-collapse: collapse;
		margin: auto;
	}
	
	table {
		border: 1px #E3E3E3 solid;
		height: 50%;
		width: 100%;
	}
	
	th, td {
		font-weight: normal;
    }
    	
	th {
		border: #fff 1px solid;
		background-color: black;
		color: #fff; 
	}

	.button-cell {
		border-left: 2px #D1D1D1 solid;
	}
	
	tr:not(:last-child) {
		border-bottom: 2px #D1D1D1 solid;
	}
	
	#searchWord {
		width: 25%;
		height: 45px;
		border: none;
		font-size: 16px;
		border: #E7AB3C solid 3px;
		border-radius: 5px;
		color: #000;
		padding-right: 20px;
		position:relative;
		top:47px;
	}
	
    button {
		border:none;
		position:relative;
		transition:800ms ease all;
		outline:none;
	}
	
	button:hover {
		background:#000;
		color:#E7AB3C;
	}
	
	button:before,button:after {
		content:'';
		position:absolute;
		top:0;
		right:0;
		height:2px;
		width:0;
		background: #E7AB3C;
		transition:400ms ease all;
	}
	
	button:after {
		right:inherit;
		top:inherit;
		left:0;
		bottom:0;
	}
	
	button:hover:before, button:hover:after {
		width:100%;
		transition:800ms ease all;
	}
	#search-button {
		width:5px;
		height:45.7px;
		border-radius:5px;
		top:3.3em;
		right:1.8em;
	}
	
	#insert-button {
		display: inline-block;
		vertical-align:center;
		border-radius:5px;
		left: 21%;
		margin: 10px;
		height: 40px;
		position: relative;
		top: 50px;
		padding: 12px 30px;
	}
	#image-not {
		 width: 50px;
		 height: 50px;
		 display:block;
		 margin:auto;
		 margin-top: 10%;
		 margin-bottom:3%;
	}
	
	.container-h5 {
			background: linear-gradient(-45deg, #f3f5f0 50%, #969696 50%);
			border-style: solid;
			border-width: 5px;
			border-color: #E3E3E3;
			border-radius: 15px;
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
								<select name="category" style="position:relative; top:2.9em; left:0.2em; height:45px;">
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
			                <input type="button" class="primary-btn" id="insert-button" value="상품 추가" onclick="location.href='/admin/itemRegisterForward'" style="border-radius:5px; border:none">
			                
		                    <form action="itemUpdate" method="get">
		                    	<input type="submit" id="upButton" class="primary-btn" value="상품 수정" style="height: 40px; border-radius:5px; border:none" onclick = "return itemUpdate();">
			                    <input type="button" name="itemNum" class="primary-btn" style="height:40px; border-radius:5px; border:none" value="상품 삭제" onclick ="return deValueChk();">
			                   	<!-- 상품 관리 테이블 시작 -->
								<table>
									<thead>
			                       		<tr>
			                       			<th>선택</th>
			                       			<th style="padding-top:15px; padding-bottom:15px">IMAGE</th>
			                       			<th>상품 번호</th>
			                       			<th>이름</th>
			                       			<th>가격</th>
			                       			<th>재고</th>
			                       			<th>카테고리</th>
			                       		</tr>
									</thead>
			                       	<tbody>
			                       		<c:forEach var="Item" items="${itemList }">
			                       		<tr>
			                       			<td>
			                       				<input type="radio" id="itemChk" name="itemChk" value="${Item.itemNum }" style="width:30px; height:30px;" />
			                       				<%-- <input type="checkbox" id="itemChk" name="itemChk" value="${Item.itemNum }" style="width:30px; height:30px;" /> --%>
			                       			</td>
			                       			<td style="width:20%; height: 200px;"><img src="/resources/img/cart-page/product-1.jpg" alt="임시사진"></td>
			                       			<td style="width:10%;">${Item.itemNum }</td>
			                       			<td id="itemName" style="width:10%;">${Item.itemName }</td>
			                       			<td id="price" style="width:15%;">${Item.price}</td>
			                       			
			                       			<td id="itemAmount" style="width:15%;">${Item.itemAmount }</td>
			                       			
			                       			<td id="itemCategory">${Item.categoryName }</td>
			                       		</tr>
			                       		</c:forEach>
			                       </tbody>
								</table>
								<!--상품 관리 테이블 끝  -->
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
								<h2 style="color: #3B4A3F; text-align: center;font-weight: 900; margin-bottom:25%">상품 정보가 없습니다</h2>
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
    <script src="/resources/js/itemManager.js"></script>
</body>

</html>