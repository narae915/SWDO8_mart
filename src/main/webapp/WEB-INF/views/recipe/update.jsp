<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Fashi Template">
	<meta name="keywords" content="Fashi, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<title>SpringDay | <spring:message code="message.recipe.update" /></title>
	
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
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
	<style></style>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row">
				<form action="/recipe/updateRecipe" method="post">
					<c:if test="${recipe != null }">
						<div class="col-lg-12">
							<input type="text" name="subject" id="subject" placeholder="<spring:message code="message.recipe.needTitle"/>" value="${recipe.title }">
							<textarea id="summernote" name="editordata"></textarea>
							<input type="hidden" id="content" value='${recipe.content }'>
							<input type="hidden" name="recipeNum" value="${recipeNum }">
						</div><br>
						<div class="recipe-tag">
							<div class="tag-wrapper">
								<c:if test="${tagArr != null }">
									<c:forEach items="${tagArr }" var="tag">
										<input type="hidden" name="recipeTag" value="${tag }">
										<span class="recipe-tag"># ${tag } <input type='button' value='x' onclick='deleteTag(this);'></span>
									</c:forEach>
								</c:if>
							</div><br>
							<input type="text" name="tag" id="tag-content" placeholder="<spring:message code="message.recipe.tagContent"/>">
						</div>
						<div class="col-lg-10" id="btn-div">
							<input type="submit" class="primary-btn" id="submit-btn" value="<spring:message code="message.recipe.success"/>">
							&emsp; 
							<input type="button" class="primary-btn" value="<spring:message code="message.readRecipe.cancel"/>" onclick="location.href='/recipe/recipeList'">
						</div>
					</c:if>
				</form>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

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
	<!-- ???????????? -->
	<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<script src="/resources/js/summernote/summernote-lite.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("li#menu-community").attr("class", "active");
			// ?????? ?????????
			var fontList = ['?????? ??????','??????','??????','??????','??????','Arial','Courier New','Tahoma'];

			// ??????
			var toolbar = [
			    // ?????? ??????
			    ['fontname', ['fontname']],
			    // ?????? ?????? ??????
			    ['fontsize', ['fontsize']],
			    // ??????, ????????????, ??????,?????? ???, ???????????????
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    // ?????????
			    ['color', ['forecolor','color']],
			    // ????????????
			    ['table', ['table']],
			    // ????????? ??????, ???????????????, ????????????
			    ['para', [/* 'ul', 'ol',  */'paragraph']],
			    // ?????????
			    ['height', ['height']],
			    // ????????????, ???????????????, ???????????????
			    ['insert',['picture','link','video']],
			    // ????????????, ??????????????????, ?????????
			    ['view', ['codeview','fullscreen', 'help']]
			]
			
			// ????????????
			var setting = {
	            height : 500,
	            minHeight : 500,
	            maxHeight : 1000,
	            focus : true,
	            lang : 'ko-KR',
	            fontNames: fontList,
	            fontNamesignoreCheck: fontList,
	            placeholder: '<spring:message code="message.recipe.needContent"/>',
	            toolbar : toolbar,
	            callbacks : { // ?????? ??????
	            	// ????????? ????????? ??? ??????
		            onImageUpload : function(files, editor, welEditable) {
			            // ?????? ?????????(?????????????????? ?????? ????????? ??????)
		            	for (var i = files.length - 1; i >= 0; i--) {
				            uploadSummernoteImageFile(files[i],
				            this);
				      	}
		            }
	            }
	        };
	
			// ????????? ??????
	        $('#summernote').summernote(setting);
			
			// ?????? ?????? ????????????
	        var content = $("#content").val();
	        $('#summernote').summernote("code", content);
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

		// ?????? ??? ???????????? ????????? ???,
		var checkUnload = true;
		$(window).on('beforeunload', function () {
		    if (checkUnload) return "??? ???????????? ???????????? ????????? ????????? ???????????? ????????????.";
		});
		
		// ????????? ??????
		$("#submit-btn").click(function() {
			
			var subject = $('#subject').val();
			var content = $('#summernote').val();
			var totalTag = $("input[name=recipeTag]").length;
			
			//?????? ????????? 10?????? ????????? ??????
			if(totalTag > 10) {
				exitAlert();
				$("#footer-modal-content").prepend("<spring:message code='message.recipe.limitTag'/>");
				showModalAlert();
				
				return false;
			}
			
			// ?????? ?????? ???????????? ???,
			if(subject.trim() == ''){
				exitAlert();
				$("#footer-modal-content").prepend("<spring:message code='message.recipe.needTitle'/>");
				showModalAlert()
				
				return false;
			}
			
			// ?????? ?????? ???????????? ???,
			if((content.trim() == '')||(content.trim() == '<p><br></p>')){
				exitAlert();
				$("#footer-modal-content").prepend("<spring:message code='message.recipe.needContent'/>");
				showModalAlert()
				
				return false;
			}
			 checkUnload = false;
		});
		
		function deleteTag(tag) {
			//tag??? button????????? ????????????, ??? ????????? ??????????????? ???????????? temp??? ??????
			var temp = tag.parentElement;
			
			//?????? ?????? ??????(controller??? ?????? ?????? ?????? ??????)
			var preSibling = temp.previousElementSibling;
			preSibling.remove();
			//tag????????? ???????????? temp ??????
			temp.remove();
		}
		
		// ?????? ???????????? ??????
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