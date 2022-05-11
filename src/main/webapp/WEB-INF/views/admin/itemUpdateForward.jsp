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
    <title>SpringDay | 상품 수정</title>

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
    <link rel="stylesheet" href="/resources/css/adminCss/itemUpdate.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
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
                        <a href="/admin/itemManagement">상품 조회</a>
                        <span>상품 수정</span>
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
                    
                    <!-- 22/03/30, 04/17 노채린 -->
                    <!-- 상품 수정 -->
                    <form action="itemUpdate" method="post" enctype="multipart/form-data" onsubmit="">
                    
                       <table>
                       <c:forEach items="${itemList }" var="item">
                       		<tr>
                       			<th id="th-image">IMAGE</th>
                       			<td id="td-image">
									<c:if test="${not empty item.savedFilename }">
	                                	<img src="/uploadImg/${item.savedFilename }" style="height:300px;width:280px; margin-top:1em"alt="">
	                                	<input type="hidden" value="${item.savedFilename }" name="basicFile">
	                                </c:if>
	                                <c:if test="${empty item.savedFilename }">
	                        			<img src="/resources/img/itemDefault.png" style="height:300px;width:280px"alt="">
	                        		</c:if>
	                        		
										<input type = "hidden" name = "itemNum" value="${itemChk }">
										<label class="primary-btn" id="file-btn" for="input-file">
											사진 첨부하기
										</label>
										<input type="file" style="border:1px solid #000; padding:1em;display:none;" id= "input-file" name="uploadFile" accept="image/*" multiple>
		                           	
								</td>
                       			<th>카테고리</th>
                       			<td>
                       				<select name="category" id="category">
	                       				<option value="${item.categoryNum }">${item.categoryName }</option>
	                       				<option value="10">육류</option>
	                       				<option value="20">어패류</option>
	                       				<option value="30">과일</option>
	                       				<option value="40">채소</option>
	                       				<option value="50">조미료</option>
	                       				<option value="60">음료</option>
	                       				<option value="70">그 외</option>
	                       			</select>
	                       		</td>
                       		</tr>
                       		<tr>
                       			<th id="th-name">상품 이름</th>
                       			<td>
                       				<input type="text" name="itemName" class="text-type" id="itemName" value="${item.itemName }" required>
                       			</td>
                       			<th id="th-price">가격</th>
                       			<td>
                       				<input type="text" name="price" class="text-type" id="price" value="${item.price }" required>
                       			</td>
                       		</tr>
                       		<tr>
                       			<th id="th-amount">재고</th>
                       			<td id="td-amount">
                       				<input type="text" name="itemAmount" class="text-type" id="itemAmount" value="${item.itemAmount }" required>
                       			</td>
                       			<th>상품소개(간략)</th>
                       			<td id="td-submit">
                       				<input type="text" name="introduce" class="text-type" value="${item.introduce }" required>
                       			</td>
                       		</tr>
						</c:forEach>
						</table>
					<input type="submit" id="submit-btn" class="primary-btn" value="완료">
                    <!--상품 관리 테이블 끝  -->
					</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Faq Section End -->
    
    <!-- Footer Section Begin -->
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
    <script src="/resources/js/adminJs/itemUpdate.js"></script>
    
</body>
<script type="text/javascript">
// 파일 첨부 시 알림
$("#input-file").change(function(){
	var fileInput = $('#input-file');
	var fileInputCount = fileInput[0].files.length;
	if (fileInputCount == 1) {
		exitAlert();
		$("#footer-modal-content").prepend("파일이 첨부되었습니다.");
		showModalAlert()
	}
});
</script>
</html>