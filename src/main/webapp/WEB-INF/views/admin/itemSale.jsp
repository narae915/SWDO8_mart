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
    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css" type="text/css">
    
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
	    .primary-btn, #cancel-btn {
			border:none;
			position:relative;
			transition:800ms ease all;
			height:40px; 
			border-radius:5px;
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
                        <span>상품 판매글 작성</span>
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
	                <div class="col-lg-9" style="left:12em;">
	                    <div class="row"><!-- 위쪽 파트 -->
	                        <div class="col-lg-6"><!-- 사진모음 -->
	                            <div class="product-pic-zoom"><!-- 줌 가능 페이지 -->
	                                <img class="product-big-img" src="/resources/img/product-single/product-1.jpg" alt=""><!-- 큰 이미지 -->
	                                <div class="zoom-icon"><!-- 줌 아이콘 -->
	                                    <i class="fa fa-search-plus"></i>
	                                </div>
	                            </div>
	                            <div class="product-thumbs"><!-- 네 개 이상의 사진 -->
	                                <div class="product-thumbs-track ps-slider owl-carousel">
	                                    <div class="pt active" data-imgbigurl="/resources/img/product-single/product-1.jpg">
	                                    	<img src="/resources/img/product-single/product-1.jpg" alt="">
	                                    </div>
	                                    <div class="pt" data-imgbigurl="/resources/img/product-single/product-2.jpg">
	                                    	<img src="/resources/img/product-single/product-2.jpg" alt="">
	                                    </div>
	                                    <div class="pt" data-imgbigurl="/resources/img/product-single/product-3.jpg">
	                                    	<img src="/resources/img/product-single/product-3.jpg" alt="">
	                                    </div>
	                                    <div class="pt" data-imgbigurl="/resources/img/product-single/product-3.jpg">
	                                    	<img src="/resources/img/product-single/product-3.jpg" alt="">
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <c:forEach var="Item" items="${itemList }"><!-- 상품 정보 -->
	                        <div class="col-lg-6">
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
	                        </div>
	                        </c:forEach>
	                    </div>
	                    
	                    <div class="product-tab">
	                    	<p style="font-size:36px;">💡상품 정보(상세 설명)</p>
	                    	<input type="button" value="작성">
	                    </div>
	                    <div class="product-tab">
	                    	<p style="font-size:36px;">👐간단한 손질법👐</p>
	                    	<input type="button" value="작성">
	                    </div>
	                    <div class="product-tab">
	                    	<p style="font-size:36px;">👨식자재 보관법👩</p>
	                    	<input type="button" value="작성">
	                    </div>
							                    
	                    <!-- 여기부터!!!!!!!!!!!!11111! -->
	                    <!-- <div class="product-tab">
	                        <div class="tab-item">
	                            <ul class="nav" role="tablist" style="">
	                                <li>
	                                	<input type="button" value="💡상품 정보(상세 설명)" id="tab1" data-toggle="tab" href="#tab-1" class="primary-btn" style="border:3px solid #D1FF3B;width:250px; height:62.13px;background-color: #E7AB3C;color: #fff; border-radius:5px">
	                                </li>
	                                <li>
	                                	<input type="button" value="👐간단한 손질법👐" id="tab2" data-toggle="tab" href="#tab-2" class="primary-btn" style="border:3px solid #D1FF3B; width:250px; height:62.13px;margin-left:40px;background-color: #E7AB3C;color: #fff; border-radius:5px">
	                                </li>
	                                <li>
										<input type="button" value="👨식자재 보관법👩" id="tab3" data-toggle="tab" href="#tab-3" class="primary-btn" style="border:3px solid #D1FF3B; width:250px; height:62.13px;margin-left:40px;background-color: #E7AB3C;color: #fff; border-radius:5px">
	                                </li>
	                            </ul>
	                        </div>
 	                        <div class="tab-item-content">탭 내용
	                            <div class="tab-content">
	                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">1번 탭
	                                    <div class="product-content">
	                                        <div class="row" style="margin-left: 0px;">
	                                        1번 탭 내용 편집기 
		                                        <form action="/recipe/write" method="post">
												<textarea id="summernote" name="editordata"></textarea>
												<a href="#tab-2">
													<input type="button" class="primary-btn" id="submit-btn1" value="다음 단계로" style="margin-top: 2em;margin-left: 20em">
												</a>
												<input type="button" class="primary-btn" id="cancel-btn" value="취소" style="margin-top : 2em; margin-left: 2em;">
												</form>
												
	                                        </div>
	                                    </div>
	                                </div>
	                                
	                                <div class="tab-pane fade" id="tab-2" role="tabpanel">2번 탭
	                                    <div class="product-content">
	                                        <div class="row" style="margin-left: 0px;">
	                                        2번 탭 내용 편집기 
		                                        <form action="/recipe/write" method="post">
												<textarea id="summernote" name="editordata"></textarea>
												<a href="#tab-2">
													<input type="button" class="primary-btn" id="submit-btn2" value="다음 단계로" style="margin-top: 2em;margin-left: 20em">
												</a>
												<input type="button" class="primary-btn" id="cancel-btn" value="취소" style="margin-top : 2em; margin-left: 2em;">
												</form>
												
	                                        </div>
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
	                        </div> -->
	                        <!-- 여기까지!!!! -->
	                        
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
    
    <!-- 썸머노트 -->
    <script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<script src="/resources/js/summernote/summernote-lite.js"></script>
  
	<script type="text/javascript">
		$(document).ready(function() {
			// 글꼴 리스트
			var fontList = ['맑은 고딕','굴림','돋움','바탕','궁서','Arial','Courier New','Tahoma'];

			// 툴바
			var toolbar = [
			    // 글꼴 설정
			    ['fontname', ['fontname']],
			    // 글자 크기 설정
			    ['fontsize', ['fontsize']],
			    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    // 글자색
			    ['color', ['forecolor','color']],
			    // 표만들기
			    ['table', ['table']],
			    // 글머리 기호, 번호매기기, 문단정렬
			    ['para', [/* 'ul', 'ol',  */'paragraph']],
			    // 줄간격
			    ['height', ['height']],
			    // 그림첨부, 링크만들기, 동영상첨부
			    ['insert',['picture','link','video']],
			    // 코드보기, 확대해서보기, 도움말
			    ['view', ['codeview','fullscreen', 'help']]
			]
			
			// 기본설정
			var setting = {
	            height : 500,
	            minHeight : 500,
	            maxHeight : 1000,
	            width : 830,
	            focus : true,
	            lang : 'ko-KR',
	            fontNames: fontList,
	            fontNamesignoreCheck: fontList,
	            placeholder: '내용을 입력하세요.',
	            toolbar : toolbar,
	            callbacks : { // 콜백 함수
	            	// 이미지 업로드 시 동작
		            onImageUpload : function(files, editor, welEditable) {
			            // 파일 업로드(다중업로드를 위해 반복문 사용)
		            	for (var i = files.length - 1; i >= 0; i--) {
				            uploadSummernoteImageFile(files[i],
				            this);
				      	}
		            }
	            }
	        };
	
			// 설정을 추가
	        $('#summernote').summernote(setting);
		});
		
		
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}


		// 작성 중 페이지를 벗어날 시,
		var checkUnload = true;/* 
		$(window).on('beforeunload', function () {
		    if (checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
		});
		 */
		var tab1 = document.getElementById("tab1");
		var tab2 = document.getElementById("tab2");
		var tab1Content = document.getElementById("tab-1");
		var tab2Content = document.getElementById("tab-2");
		var tab1Class = tab1.getAttribute('class');
		
		// 유효성 검사
		$("#submit-btn1").click(function() {
			
			var content = $('#summernote').val();

			// 내용 칸이 비어있을 시,
			if(content.trim() == ''){
				exitAlert();
				$("#footer-modal-content").prepend("내용을 입력해 주십시오.");
				showModalAlert()
				
				return false;
			}
		
			tab1.setAttribute("aria-selected", false);
			tab2.setAttribute("aria-selected", true);
			tab1.setAttribute("class", "");
			tab2.setAttribute("class", "active");
			tab1Content.setAttribute("class", "tab-pane fade");
			tab2Content.setAttribute("class", "tab-pane fade-in active");
			tab1.removeAttribute("href");
			
			checkUnload = false;
		});
		

  	//jsp페이지 출력과 동시에 실행 
	$(function(){
		//현재 페이지를 선택했음을 알림 4/17 박나래
		$("li#menu-foodMart").attr("class", "active");
	});

    </script>
</body>

</html>