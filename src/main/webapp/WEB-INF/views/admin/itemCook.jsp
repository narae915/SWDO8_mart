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
    <title>SpringDay | 상품 손질법 작성</title>

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
    <style>
        	/* 버튼 관련 */
    	input[type="submit"] {
    		border-radius:5px;
    		bottom:0.5em;
			border:none;
			position:relative;
			transition:800ms ease all;
			outline:none;
		}
		
		input[type="submit"]:hover {
			background:#000;
			color:#E7AB3C;
		}
		
		input[type="submit"]:before,input[type="submit"]:after {
			content:'';
			position:absolute;
			top:0;
			right:0;
			height:2px;
			width:0;
			background: #E7AB3C;
			transition:400ms ease all;
		}
		
		input[type="submit"]:after {
			right:inherit;
			top:inherit;
			left:0;
			bottom:0;
		}
		
		submit:hover:before, submit:hover:after,
		input[type="submit"]:hover:before, input[type="submit"]:hover:after {
			width:100%;
			transition:800ms ease all;
		}
    </style>
</head>
<body>
	<div class="col-lg-3" style="left:10em; top:3em">
		<textarea id="summernote" name="editordata"></textarea>
	</div>
	<div class="col-lg-6">
		<input type="submit" class="primary-btn" id="submit-btn" value="작성 완료" style="left: 36.5em;top: 5em;">
	</div>
	<input type="hidden" id="itemNum" value="${itemNum }">
</body>

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
		var checkUnload = true; 
		$(window).on('beforeunload', function () {
		    if (checkUnload) return "이 페이지를 벗어나면 작성된 내용은 저장되지 않습니다.";
		});
		// 유효성 검사
		$("#submit-btn").click(function() {
			
			var content = $('#summernote').val();

			// 내용 칸이 비어있을 시,
			if(content.trim() == ''){
				exitAlert();
				$("#footer-modal-content").prepend("내용을 입력해 주십시오.");
				showModalAlert()
				
				return false;
			}
		
			checkUnload = false;

			// 컨트롤러에 전달
			$.ajax({
				data : {
					itemNum : $('#itemNum').val(),
					editordata : $('#summernote').val(),
				},
				type: "post",
				url: "/admin/itemCook",
				success: function(res) {
					setTimeout(function() {   
						self.close()
					 },100);
				}
			});
		});
		 
	</script>
</html>