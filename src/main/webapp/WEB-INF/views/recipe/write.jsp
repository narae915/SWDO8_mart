<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>SpringDay | 게시글 작성</title>

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
    <link rel="stylesheet" href="/resources/css/recipeCss/write.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css" type="text/css">
<style>

</style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp" %>

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
            <form action="/recipe/write" method="post">
                <div class="col-lg-12">
					<input type="text" name="subject" id="subject" placeholder="제목을 입력하세요.">
					<textarea id="summernote" name="editordata"></textarea>
					<br>
					<div class="recipe-tag">
						<div class="tag-wrapper"></div><br>
						<input type="text" name="tag" id="tag-content" placeholder="사용된  주재료를 작성해주세요.(태그작성)">
					</div>
                </div>
                <div class="col-lg-10" id="btn-div">
  					<input type="submit" class="primary-btn" id="submit-btn" value="완료">
  					&emsp;
					<input type="button" class="primary-btn" value="취소">
                </div>
            </form>
            </div>
        </div>
    </section>
    
    
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
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    
    <!-- 썸머노트 -->
    <script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<script src="/resources/js/summernote/summernote-lite.js"></script>
  
	<script type="text/javascript">
		$(document).ready(function() {
			$("li#menu-community").attr("class", "active");
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
			
			var subject = $('#subject').val();
			var content = $('#summernote').val();
	
			var totalTag = $("input[name=recipeTag]").length;
			
			//태그 개수가 10개를 넘었을 경우
			if(totalTag > 10) {
				exitAlert();
				$("#footer-modal-content").prepend("태그는 10개까지만 입력 가능합니다.");
				showModalAlert();
				
				return false;
			}
			
			// 제목 칸이 비어있을 시,
			if(subject.trim() == ''){
				exitAlert();
				$("#footer-modal-content").prepend("제목을 입력해 주십시오.");
				showModalAlert();
				
				return false;
			}
			
			// 내용 칸이 비어있을 시,
			if(content.trim() == ''){
				exitAlert();
				$("#footer-modal-content").prepend("내용을 입력해 주십시오.");
				showModalAlert();
				
				return false;
			}
			
			 checkUnload = false;
		});
		
		function deleteTag(tag) {
			//tag는 button태그를 가르키고, 그 태그의 부모태그를 불러와서 temp에 저장
			var temp = tag.parentElement;
			var inputText = temp.className;
			//controller로 가는 히든 태그 삭제
			var hiddenTag = document.getElementById(inputText);
			hiddenTag.remove();
			//tag내용이 적혀있던 temp 삭제
			temp.remove();
		}
		
		// 태그 입력하는 기능
		$("#tag-content").keyup(function(event) {
			var inputText = $(this).val();
			if(event.keyCode == 32) {
				$(".tag-wrapper").append("<input type='hidden' id='" + inputText + "' name='recipeTag' value='"+ inputText +"'>");
				$(".tag-wrapper").append("<span class='"+ inputText +"'># "+ inputText +"<input type='button' value='x' onclick='deleteTag(this);' ></span>");
				$("#tag-content").val("");
			}
		});
		
	</script>
</body>

</html>