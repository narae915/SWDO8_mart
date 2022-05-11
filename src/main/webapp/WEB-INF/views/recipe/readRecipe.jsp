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
	
	<title>SpringDay | <spring:message code="message.readRecipe.title" /></title>
	
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
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/recipeCss/readRecipe.css" type="text/css">
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
				<div class="col-lg-12">
					<div class="blog-details-inner">
						<div class="blog-detail-title">
							<h2>${recipe.title }</h2>
							<p>
								<span>✒${recipe.indate } 👁 ${recipe.readCount }</span>
							</p>
						</div>
						<div class="blog-large-pic"></div>
						<div class="blog-detail-desc"></div>
						<div class="blog-quote">${recipe.content }</div>
						<div>
							<c:if test="${tagArr != null }">
								<c:forEach items="${tagArr }" var="tag">
									<input type="button" class="recipe-tag" value="# ${tag }" onclick="location.href='/allSearch?searchword=${tag }';">
								</c:forEach>
							</c:if>
						</div>
						<spring:message code="message.readRecipe.rating" />
						<div class="star-ratings">
							<div class="star-ratings-fill space-x-2 text-lg" id="star-fill" style="width:calc(${recipe.score } * 20)%">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
							<div class="star-ratings-base space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
						</div>
						<input type="hidden" class="stars" value="${recipe.score }">
						<span id="toPointTotalNumber"> <strong>${recipe.score }</strong>
						</span>
						<div class="rating-wrapper" style="display: inline-block;">
							<c:if test="${scoreFlag == 0 }">
								<select id="selectScore">
									<option value="5">★★★★★</option>
									<option value="4">★★★★☆</option>
									<option value="3">★★★☆☆</option>
									<option value="2">★★☆☆☆</option>
									<option value="1">★☆☆☆☆</option>
								</select>
								<input type="button" id="rating-btn" value="<spring:message code='message.readRecipe.ratingBtnValue'/>" onclick="addScore(${loginNum });">
							</c:if>
							<c:if test="${scoreFlag == 1 }">
								<span>
									<spring:message code="message.readRecipe.ratingMessage" />
								</span>
							</c:if>
						</div>
						<span id="rating-complete"></span>
						<div style="float: right; display: inline-block;">
							<a style="color: black;" href="/recipe/recipeList">
								<spring:message code="message.readRecipe.gotoRecipeList" />
							</a>
							<c:if test="${recipe.userNum == loginNum }">
								|<a style="color: black;" href="/recipe/updateRecipe?recipeNum=${recipe.recipeNum }">
									<spring:message code="message.readRecipe.gotoUpdatePost" />
								</a> |
								<a style="color: black;" href="javascript:deleteRecipe(${recipe.recipeNum });">
									<spring:message code="message.readRecipe.gotoDeletePost" />
								</a>
							</c:if>
						</div>
						<hr>
						<div class="blog-post">
							<div class="row">
								<c:if test="${empty prev }">
									<div class="col-lg-5 col-md-6">
										<a style="cursor: default;" class="prev-blog">
											<div class="pb-text">
												<c:if test="${not empty emptyPrevMessage }">
													<h5>
														<spring:message code="message.readRecipe.emptyPrevMessage" />
													</h5>
												</c:if>
											</div>
										</a>
									</div>
								</c:if>
								<c:if test="${!empty prev }">
									<div class="col-lg-5 col-md-6">
										<a href="/recipe/readRecipe?recipeNum=${prev.recipeNum }" class="prev-blog">
											<div class="pb-pic">
												<i class="ti-arrow-left"></i>
											</div>
											<div class="pb-text">
												<span><spring:message code="message.readRecipe.prev" /></span>
												<h5>${prev.title }</h5>
											</div>
										</a>
									</div>
								</c:if>
								<c:if test="${empty next }">
									<div class="col-lg-5 offset-lg-2 col-md-6">
										<a style="cursor: default;" class="next-blog">
											<div class="nb-text">
												<c:if test="${not empty emptyNextMessage }">
													<h5>
														<spring:message code="message.readRecipe.emptyNextMessage" />
													</h5>
												</c:if>
											</div>
										</a>
									</div>
								</c:if>
								<c:if test="${!empty next }">
									<div class="col-lg-5 offset-lg-2 col-md-6">
										<a href="/recipe/readRecipe?recipeNum=${next.recipeNum }" class="next-blog">
											<div class="nb-pic">
												<i class="ti-arrow-right"></i>
											</div>
											<div class="nb-text">
												<span>
													<spring:message code="message.readRecipe.prev" />
												</span>
												<h5>${next.title }</h5>
											</div>
										</a>
									</div>
								</c:if>
							</div>
						</div>
						<div class="leave-comment">
							<h4 id="comment-title">
								<spring:message code="message.readRecipe.reply" />
							</h4>
							<input type="hidden" id="loginNum" value="${loginNum }">
							<input type="hidden" id="userMail" value="${requestScope.userMail }">
							<div class="comment-list">
								<c:forEach items="${replyList }" var="reply" varStatus="status">
									<div id="comment-wrapper${reply.replyNum }" class="comment-wrapper">
										<div class="comment-name">
											<strong>${reply.userMail }</strong>
										</div>
										<div class="comment-content">${reply.replyContent }</div>
										<div class="comment-date">${reply.replyDate }
											<c:if test="${reply.userNum == loginNum }">
												<span class="login-user-only" onclick="updateReply(${reply.replyNum })">
													<spring:message code="message.readRecipe.uprply" />
												</span>
												<span class="login-user-only" onclick="deleteReply(${reply.replyNum })">
													<spring:message code="message.readRecipe.delrply" />
												</span>
											</c:if>
										</div>
										<hr>
									</div>
									<form id="updateReply${reply.replyNum }" class="update-comment">
										<div class="col-lg-6">
											<span style="font-weight: bold;">${requestScope.userMail }</span>
											<spring:message code="message.readRecipe.userSama" />
										</div>
										<div class="col-lg-12">
											<textarea id="upContent${reply.replyNum }" name="updateContent">${reply.replyContent }</textarea>
											<input type="button" class="site-btn" name="cxl" value="<spring:message code="message.readRecipe.cancel"/>" onclick="updateCancel(${reply.replyNum });"> 
											<input type="button" class="site-btn" name="upd" value="<spring:message code="message.readRecipe.uprply"/>" onclick="updateReplyContent(${reply.replyNum });">
										</div>
									</form>
								</c:forEach>
							</div>
							<form id="replyForm" class="comment-form">
								<input type="hidden" name="recipeNum" value="${recipe.recipeNum }">
								<div class="row">
									<div class="col-lg-6">
										<span style="font-weight: bold;">${requestScope.userMail }</span>
										<spring:message code="message.readRecipe.userSama" />
									</div>
									<div class="col-lg-6"></div>
									<div class="col-lg-12">
										<textarea placeholder="<spring:message code="message.readRecipe.replyComment"/>" id="replyContent" name="replyContent"></textarea>
										<input type="button" class="site-btn" value="<spring:message code="message.readRecipe.write"/>" onclick="insertReply();">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->
	<div class="modal" id="confirm-modal">
		<div class="modal_content" id="confirm-modal-content"></div>
	</div>

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
	<script type="text/javascript">
		//jsp페이지 출력과 동시에 실행
		$(function(){
			var score=$(".stars").val();
			score = score*20;
			//1를 더하여 주는 이유는 half star일 시 미세하게 절반이 안되어보여서 보여지는 값을 조정하기 위해 추가한 offset 값이다.
			$("#star-fill").css("width", score + 1 +"%");
			
			$("li#menu-community").attr("class", "active");
		});
		
		function deleteRecipe(recipeNum) {
			confirmModal();
			showConfirmModal();
			
			$("#yes-button").click(function() {
				location.href="/recipe/deleteRecipe?recipeNum="+recipeNum;
    		});
		}

		// 모달 출력
    	function showConfirmModal() {
    		$("#confirm-modal").fadeIn();

    		$("#no-button").click(function() {
    			$("#confirm-modal").fadeOut();
    		});
    	}

		// 컨펌 모달
    	function confirmModal() {			
    		$("#confirm-modal-content").html("<p></p><span><spring:message code='message.readRecipe.alertDelete1'/></span><p><spring:message code='message.readRecipe.alertDelete2'/></p>");
    		$("#confirm-modal-content").append('<button class="primary-btn" id="yes-button" style="border-radius:5px; position: relative; top: 20px; right: 50px;"><spring:message code="message.footer.modal.yes"/></button>');
    		$("#confirm-modal-content").append('<button class="primary-btn" id="no-button" style="border-radius:5px; position: relative; bottom: 29px; left: 50px"><spring:message code="message.footer.modal.no"/></button>');
    	}
		
		// 방금 작성한 댓글 조회
		function newReply() {
			var userMail = $("#userMail").val();
			var str = "";
			
			$.ajax({
				url:"/recipe/newReply",
				type:"GET",
				data: {
					recipeNum : $("input[name=recipeNum]").val()
				},
				success: function(reply) {
					console.log("성공");
					str += "<div id='comment-wrapper"+reply.replyNum +"' class='comment-wrapper'>";
					str += "<div class='comment-name'><strong>"+ reply.userMail +"</strong></div>";
					str += "	<div class='comment-content'>"+ reply.replyContent + "</div>";
					str += "		<div class='comment-date'>"+ reply.replyDate;
					str += "			<span class='login-user-only' onclick='updateReply("+ reply.replyNum +")'><spring:message code='message.readRecipe.uprply'/></span>";
					str += "			<span class='login-user-only' onclick='deleteReply("+ reply.replyNum +")'><spring:message code='message.readRecipe.delrply'/></span>";
					str += "		</div>";
					str += "	<hr>";
					str += "</div>";
					str += "	<form id='updateReply"+ reply.replyNum +"' class='update-comment'>";
					str += "		<div class='col-lg-6'>";
					str += "		<span style='font-weight:bold;'>"+userMail+"</span> <spring:message code='message.readRecipe.userSama'/>";
					str += "		</div>";
					str += "		<div class='col-lg-12'>";
					str += "			<textarea id='upContent"+ reply.replyNum +"' name='updateContent'>"+ reply.replyContent +"</textarea>";
					str += "			<input type='button' class='site-btn' name='cxl' value='<spring:message code='message.readRecipe.cancel'/>' onclick='updateCancel("+reply.replyNum +");'>";
					str += "			<input type='button' class='site-btn' name='upd' value='<spring:message code='message.readRecipe.uprply'/>' onclick='updateReplyContent("+reply.replyNum +");'>";
					str += "		</div>";
					str += "	</form>";
					$(".comment-list").append(str);
				},
				error: function(e) {
					console.log("실패");
				}
			});
		} 
		
		// 댓글 입력
		function insertReply() {
			$.ajax({
				url:"/recipe/insertReply",
				type:"POST",
				data: {
					recipeNum : $("input[name=recipeNum]").val(),
					replyContent : $("textarea#replyContent").val()
				},
				success: function(res){
					console.log("성공");
					$("textarea#replyContent").val("");
					newReply();
				},
				error: function(e) {
					console.log("실패");
				}
			});
		}
		
		// 댓글 삭제
		function deleteReply(replyNum) {
			var loginNum = $("#loginNum").val();
			var userMail = $("#userMail").val();
			
			$.ajax({
				url: "/recipe/deleteReply",
				type: "POST",
				data: {
					replyNum : replyNum,
					recipeNum : $("input[name=recipeNum]").val()
				},
				success: function(res) {
					console.log("성공");
					$(".comment-list").empty(); // comment-list의 하위태그 삭제
					var str = "";
					$.each(res, function (index, reply) {
						str += "<div id='comment-wrapper"+reply.replyNum +"' class='comment-wrapper'>";
						str += "	<div class='comment-name'><strong>"+ reply.userMail +"</strong></div>";
						str += "	<div class='comment-content'>"+ reply.replyContent + "</div>";
						str += "	<div class='comment-date'>"+ reply.replyDate;
						if(reply.userNum == loginNum) {
							str += "		<span class='login-user-only' onclick='updateReply("+ reply.replyNum +")'><spring:message code='message.readRecipe.uprply'/></span>";
							str += "		<span class='login-user-only' onclick='deleteReply("+ reply.replyNum +")'><spring:message code='message.readRecipe.delrply'/></span>";
						}
						str += "	</div>";
						str += "	<hr>";
						str += "</div>";
						str += "	<form id='updateReply"+ reply.replyNum +"' class='update-comment'>";
						str += "		<div class='col-lg-6'>";
						str += "		<span style='font-weight:bold;'>"+userMail+"</span> <spring:message code='message.readRecipe.userSama'/>";
						str += "		</div>";
						str += "		<div class='col-lg-12'>";
						str += "			<textarea id='upContent"+ reply.replyNum +"' name='updateContent'>"+ reply.replyContent +"</textarea>";
						str += "			<input type='button' class='site-btn' name='cxl' value='<spring:message code='message.readRecipe.cancel'/>' onclick='updateCancel("+reply.replyNum +");'>";
						str += "			<input type='button' class='site-btn' name='upd' value='<spring:message code='message.readRecipe.uprply'/>' onclick='updateReplyContent("+reply.replyNum +");'>";
						str += "		</div>";
						str += "	</form>";
					});
					$(".comment-list").html(str);
				},
				error: function(e) {
					console.log(e);
					console.log("실패");
				}
			});
		}
		
		//댓글 수정 클릭시 텍스트라 나오게 하기
		function updateReply(replyNum) {
			$("#updateReply"+replyNum).attr("class", "update-comment-on");
			$("#comment-wrapper"+replyNum).attr("class", "comment-wrapper-off");
		}
		
		//댓글 수정 클릭 후, 다시 취소를 눌렀을 경우
		function updateCancel(replyNum) {
			$("#comment-wrapper"+replyNum).attr("class", "comment-wrapper");
			$("#updateReply"+replyNum).attr("class", "update-comment");
		}

		//댓글 수정
		function updateReplyContent(replyNum) {
			var updateContent = $("textarea#upContent"+replyNum).val();
			var loginNum = $("#loginNum").val();
			var userMail = $("#userMail").val();

			 $.ajax({
				url: "/recipe/updateReply",
				type: "POST",
				data: {
					replyNum : replyNum,
					recipeNum : $("input[name=recipeNum]").val(),
					updateContent : updateContent
				},
				success: function(res) {
					console.log("성공");
					$(".comment-list").empty(); // comment-list의 하위태그 삭제
					var str = "";
					$.each(res, function (index, reply) {
						str += "<div id='comment-wrapper"+reply.replyNum +"' class='comment-wrapper'>";
						str += "	<div class='comment-name'><strong>"+ reply.userMail +"</strong></div>";
						str += "	<div class='comment-content'>"+ reply.replyContent + "</div>";
						str += "	<div class='comment-date'>"+ reply.replyDate;
						if(reply.userNum == loginNum) {
							str += "		<span class='login-user-only' onclick='updateReply("+ reply.replyNum +")'><spring:message code='message.readRecipe.uprply'/></span>";
							str += "		<span class='login-user-only' onclick='deleteReply("+ reply.replyNum +")'><spring:message code='message.readRecipe.delrply'/></span>";
						}
						str += "	</div>";
						str += "	<hr>";
						str += "</div>";
						str += "	<form id='updateReply"+ reply.replyNum +"' class='update-comment'>";
						str += "		<div class='col-lg-6'>";
						str += "		<span style='font-weight:bold;'>"+userMail+"</span> <spring:message code='message.readRecipe.userSama'/>";
						str += "		</div>";
						str += "		<div class='col-lg-12'>";
						str += "			<textarea id='upContent"+ reply.replyNum +"' name='updateContent'>"+ reply.replyContent +"</textarea>";
						str += "			<input type='button' class='site-btn' name='cxl' value='<spring:message code='message.readRecipe.cancel'/>' onclick='updateCancel("+reply.replyNum +");'>";
						str += "			<input type='button' class='site-btn' name='upd' value='<spring:message code='message.readRecipe.uprply'/>' onclick='updateReplyContent("+reply.replyNum +");'>";
						str += "		</div>";
						str += "	</form>";
					});
					$(".comment-list").html(str);
				},
				error: function(e) {
					console.log(e);
					console.log("실패");
				}
			}); 
		}
		
		//평가하기
		function addScore(userNum) {
			
			$.ajax({
				url: "/recipe/addScore",
				type: "POST",
				data: {
					userNum : userNum,
					recipeNum : $("input[name=recipeNum]").val(),
					rating : $("#selectScore").val()
				},
				success: function(res) {
					console.log("성공");
					$(".rating-wrapper").css("display","none");
					$("#toPointTotalNumber>strong").text(res);
					$(".stars").val(res);
					res = res*20;
					//1를 더하여 주는 이유는 half star일 시 미세하게 절반이 안되어보여서 보여지는 값을 조정하기 위해 추가한 offset 값이다.
					$("#star-fill").css("width", res+1 +"%");
					$("#rating-complete").text("<spring:message code='message.readRecipe.ratingMessage'/>");
				},
				error : function(e) {
					console.log(e);
					consele.log("실패");
				}
			});
		}
	</script>
</body>
</html>