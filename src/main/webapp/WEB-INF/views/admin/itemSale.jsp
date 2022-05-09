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
    <title>SpringDay | 상품 판매글 작성</title>

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
    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
    
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
		
    	/* 버튼 관련 */
    	.primary-btn,
    	input[type="button"] {
    		border-radius:5px;
    		bottom:0.5em;
			border:none;
			position:relative;
			transition:800ms ease all;
			outline:none;
		}
		
		.primary-btn:hover,
		input[type="button"]:hover
		 {
			background:#000;
			color:#E7AB3C;
		}
		
		.primary-btn:before, .primary-btn:after,
		input[type="button"]:before,input[type="button"]:after {
			content:'';
			position:absolute;
			top:0;
			right:0;
			height:2px;
			width:0;
			background: #E7AB3C;
			transition:400ms ease all;
		}
		
		.primary-btn:after,
		input[type="button"]:after {
			right:inherit;
			top:inherit;
			left:0;
			bottom:0;
		}
		
		.primary-btn:hover:before, .primary-btn:hover:after,
		input[type="button"]:hover:before, input[type="button"]:hover:after {
			width:100%;
			transition:800ms ease all;
		}
		
		.line {
			border-right: solid 1px #d6d6d6;
			border-left: solid 1px #d6d6d6;
		}
		
	</style>
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
                    <div class="breadcrumb-text product-more">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <a href="/admin/adminMain">Admin</a>
                        <a href="/admin/itemManagement">상품 조회</a>
                        <span>상품 상세 정보 작성</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Product Shop Section Begin -->
    <section class="product-shop spad page-details">
        <div class="container">
	        <div class="line">
	            <div class="row">
	            <div class="col-lg-1"></div>
	                <div class="col-lg-9" style="left:2em;">
	                    <div class="row"><!-- 위쪽 파트 -->
	                        <div class="col-lg-5"><!-- 사진모음 -->
	                            <div class="product-pic-zoom"><!-- 줌 가능 페이지 -->
				<c:if test="${not empty fileList }">
					<img class="product-big-img" src="/uploadImg/${fileList[0] }" style="height:390px;width:330px"alt=""><!-- 큰 이미지 -->
				</c:if>
	                      	     <c:if test="${empty fileList }">
	                      	  		<img class="product-big-img" src="/resources/img/itemDefault.png" style="height:390px;width:330px"alt=""><!-- 큰 이미지 -->
	                     	   	</c:if>
                                <div class="zoom-icon"><!-- 줌 아이콘 -->
                                    <i class="fa fa-search-plus"></i>
                                </div>
                            </div>
                            <div class="product-thumbs"><!-- 사진 네개 -->
                                <div class="product-thumbs-track ps-slider owl-carousel">
	                                <c:if test="${not empty fileList[0] }">
	                                    <div class="pt active" data-imgbigurl="/uploadImg/${fileList[0] }">
	                                    	<img src="/uploadImg/${fileList[0] }" alt="" style="height:109px;width:139px">
	                                    	<div style="position:absolute;bottom: 2em;left: 2.2em;z-index:2">
												<i class="fa fa-times-circle fa-2x" style="color:#FFFFDB;" onclick="itemImgDelete('${fileList[0] }')"></i>
											</div>
	                                    </div>
									</c:if>
		                         	<c:if test="${empty fileList[0] }"> 
	                                    <div class="pt active" data-imgbigurl="/resources/img/itemDefault.png">
	                                    	<img src="/resources/img/itemDefault.png" alt="" style="height:109px;width:139px">
	                                    </div>
		                            </c:if>
									<c:forEach var="i" begin="1" end="3">
										<c:if test="${not empty fileList[i] }">
											<div class="pt" data-imgbigurl="/uploadImg/${fileList[i] }">
												<div style="position:absolute">
													<i class="fa fa-times-circle fa-2x" style="color:#FFFFDB; margin:40px" onclick="itemImgDelete('${fileList[i] }')"></i>
												</div>
												<img src="/uploadImg/${fileList[i] }" alt="" style="height:109px;width:139px">
											</div>
										</c:if>
										<c:if test="${empty fileList[i] }">
											<div class="pt" data-imgbigurl="/resources/img/itemDefault.png">
												<img src="/resources/img/itemDefault.png" alt=""  style="height:109px; width:139px">
											</div>
										</c:if>
                                    </c:forEach>
								</div>
                            </div>
                            <form action="itemSale" method="post" enctype="multipart/form-data" onsubmit="return imgCheck();">
                            	<input type="hidden" name="itemNum" id="itemNum" value="${itemNum }">
								<label class="primary-btn" id="file-btn" for="input-file" style="top:2em; left:7em;">
									사진 첨부하기
								</label>
								
								<input type="file" style="border:1px solid #000; padding:1em;display:none;" id= "input-file" name="uploadFile" accept="image/*" multiple>
                           	</form>
                           	<input type="hidden" value="${fileCount }" id="fileCount">
                        </div>
                        <div class="col-lg-2"></div>
                        <c:forEach var="Item" items="${itemList }"><!-- 상품 정보 -->
                        <div class="col-lg-5">
                            <div class="product-details">
                                <div class="pd-title">
                                    <span>${Item.categoryName }</span>
                                    <h3>${Item.itemName }</h3>
                                </div>
                                <div class="pd-desc">
                                    <p>현재 남은 수량 ${Item.itemAmount }</p>
                                    <h4><fmt:formatNumber value="${Item.price }" pattern="#,###원"/></h4>
                                </div>
                            </div>
                            
                           	<br>
		                    	<span style="font-size:36px;">상세 설명&nbsp;</span>
		                    	<input type="button" class="primary-btn" value="작성" onclick="window.open('/admin/itemInfor?itemNum=${itemNum }', '상품 상세설명 작성', 'width=800, height=600, location=no,status=no, scrollbars=yes')">
		                    <div class="product-tab">
		                    	<span style="font-size:36px;">손질법</span>
		                    	&emsp;&emsp;&emsp;
		                    	<input type="button" class="primary-btn" value="작성" onclick="window.open('/admin/itemCook?itemNum=${itemNum }', '상품 손질법 작성', 'width=800, height=600, location=no,status=no, scrollbars=yes')">
		                    </div>
		                    <div class="product-tab">
		                    	<span style="font-size:36px;">보관법</span>
		                    	&emsp;&emsp;&emsp;
		                    	<input type="button" class="primary-btn" value="작성" onclick="window.open('/admin/itemInventory?itemNum=${itemNum }', '상품 보관법 작성', 'width=800, height=600, location=no,status=no, scrollbars=yes')">
		                    </div>
		                        </div>
		                        <input type="submit" name="file-btn" id="submit-btn" value="등록하기" class="primary-btn" style="bottom: 1.8em;left: 48em; border:3px black double">
		                        </c:forEach>
		                    </div>
	                    </div>
	                </div>
	            </div>
            </div>
            
    </section>
    <!-- Product Shop Section End -->

	<input type="hidden" id="loginMail" value="${sessionScope.userMail }">
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

	<script>
	  	//jsp페이지 출력과 동시에 실행 
		$(function(){
			//현재 페이지를 선택했음을 알림 4/17 박나래
			$("li#menu-foodMart").attr("class", "active");
		});

	  	// 유효성 검사
	  	function imgCheck(){
	  	
	  	}
	  	
	  	// 사진 삭제
	  	function itemImgDelete(fileName) {
	  		var itemNum = $("#itemNum").val();

	  		$.ajax({
				data : {
					fileName: fileName
				},
				type: "post",
				url: "/admin/itemImgDelete",
				success: function(res) {
					exitAlert();
					$("#footer-modal-content").prepend("사진이 삭제되었습니다.");
					$("#footer-modal").fadeIn();
		    		
					$("button[name=modalClose]").click(function() {
		    			$("#footer-modal").fadeOut();
		    			location.reload();
		    		});
				}
			});
	  	
	  	}
	  	
	  	// 파일 첨부 시 알림
	  	$("#input-file").change(function(){
	  		var fileInput = $('#input-file');
	  		var fileInputCount = fileInput[0].files.length;
	  		var fileCount = $('#fileCount').val();
	  		
	  		
	  		if (fileInputCount != 0) {
	  			exitAlert();
	  			$("#footer-modal-content").prepend("파일 "+fileInputCount+"개가 첨부되었습니다.");
	  			showModalAlert()
	  		}
	  		
	  		// 이미 업로드 된 사진 네 장 이상일 때 더 업로드 x
	  		if(fileCount*1 >= 4){
	  			exitAlert();
				$("#footer-modal-content").prepend("사진을 더 이상 업로드 할 수 없습니다.<br>사진을 삭제해주세요.");
				showModalAlert()
				
	  			return false;
	  		}
	  		
	  		// 빈 슬롯보다 첨부된 파일 개수가 더 많을 경우
	  		if(fileCount*1 + fileInputCount*1  > 4) {
	  			exitAlert();
				$("#footer-modal-content").prepend("사진은 한 상품 당 4장까지 첨부할 수 있습니다.<br>다시 선택해주세요.");
				showModalAlert()
	  			
	  			return false;
	  		}
	  		
	  		// 첨부된 사진이 없을 경우 업로드 불가
	  		if(fileInputCount*1 == 0) {
	  			exitAlert();
				$("#footer-modal-content").prepend("첨부된 사진이 없습니다.");
				showModalAlert()
	  			
	  			return false;	
	  		}
	  		
	  	});
    </script>
</body>

</html>