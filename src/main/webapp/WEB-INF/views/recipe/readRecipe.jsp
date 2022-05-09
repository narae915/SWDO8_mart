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

    <title>SpringDay | 게시글</title>

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
    <style type="text/css">
    	div.comment-date {
    		font-size: 12px;
    		color: gray;
    	}
    	span.login-user-only {
    		cursor: pointer;
    	}
    	form.update-comment {
    		display: none;
    	}
    	form.update-comment-on {
    		display: block;
    	}
    	div.comment-wrapper-off {
    		display: none;
    	}
    	.update-comment-on .col-lg-12 textarea {
    		resize: none;
    		width: 77%;
    		margin-bottom: -12px;
    		border: 1px solid #ebebeb;
    		padding-left: 20px;
    		padding-top: 10px;
    	}
    	.update-comment-on .col-lg-12 input[name=upd] {
    		width: 7%;
    		margin-bottom: 20px;
    		border-radius: 5px;
    		height: 40px;
    		padding-left: 23px;
    	}
    	.update-comment-on .col-lg-12 input[name=cxl] {
    		width: 7%;
    		margin-bottom: 20px;
    		border-radius: 5px;
    		height: 40px;
    		padding-left: 23px;
    		background-color: #DCDCDC;
    		color: #787878;
    		border: none;
    	}
    	/* 별점 */
		.star-ratings {
			display:inline-block;
			color: #aaa9a9; 
			position: relative;
			unicode-bidi: bidi-override;
			width: max-content;
			-webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
			-webkit-text-stroke-width: 0.5px;
			-webkit-text-stroke-color: black;
		}
		.star-ratings-fill {
			color: #fff58c;
			padding: 0;
			position: absolute;
			z-index: 1;
			display: inline-block;
			top: 0;
			left: 0;
			overflow: hidden;
			-webkit-text-fill-color: gold;
		}
		.star-ratings-base {
			z-index: 0;
			padding: 0;
		}
		
		/* 모달 */
		.modal-button {
			font-size: 16px;
			color: #ffffff;
			border: 1px solid #e7ab3c;
			background: #e7ab3c;
			height: 45px;
			padding: 12px 16px 12px;
		}
		
		.modal{
			position: fixed;
			top:0; left: 0; bottom: 0; right: 0;
			background: rgba(0, 0, 0, 0.8); /* 투명도 */
		}
		
		.modal_content{
			position: absolute;  /* 배경 내에서 위치 조정 */
			top: calc(50vh - 100px); left: calc(50vw - 200px);
			background-color: white;
			display: flex; 
			justify-content: center;
			align-items: center;
			border-radius: 10px;
			width: 400px;
			height: 200px;
			flex-direction: column;
		}
		
	input.recipe-tag {
		display: inline-block;
	    font-size: 12px;
	    color: #636363;
	    padding: 5px 15px;
	    border: 1px solid #636363;
	    margin-right: 5px;
	    margin-bottom: 9px;
	    border-radius: 2px;
	    background-color: white;
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

    <!-- Blog Details Section Begin -->
    <section class="blog-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                            <h2>${recipe.title }</h2>
							<p><span>✒${recipe.indate }  👁 ${recipe.readCount }</span>
							</p>
                        </div>
                        <div class="blog-large-pic">
                        </div>
                        <div class="blog-detail-desc">
                        </div>
                        <div class="blog-quote">
                             ${recipe.content }
                        </div>
                        
                        <div>
                        	<c:if test="${tagArr != null }">
                        		<c:forEach items="${tagArr }" var="tag">
                        			<input type="button" class="recipe-tag" value="# ${tag }" onclick="location.href='/allSearch?searchword=${tag }';">
                        		</c:forEach>
                        	</c:if>
                        </div>
                        
						이 게시글의 평점
						<div class="star-ratings">
							<div class="star-ratings-fill space-x-2 text-lg" id="star-fill" style="width:calc(${recipe.score } * 20)%">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
							<div class="star-ratings-base space-x-2 text-lg">
								<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
							</div>
						</div>
                        <input type="hidden" class="stars" value="${recipe.score }">
						<span id="toPointTotalNumber">
							<strong>${recipe.score }</strong>
						</span>

						<div class="rating-wrapper" style="display:inline-block;">
						<c:if test="${scoreFlag == 0 }">
						<select id="selectScore">
						    <option value="5">★★★★★</option>
						    <option value="4">★★★★☆</option>
						    <option value="3">★★★☆☆</option>
						    <option value="2">★★☆☆☆</option>
						    <option value="1">★☆☆☆☆</option>
						</select>
						<input type="button" id="rating-btn" value="점수주기" onclick="addScore(${loginNum });">
						</c:if>
						<c:if test="${scoreFlag == 1 }">
						<span>평가하셨습니다.</span>
						</c:if>
						</div>
						<span id="rating-complete"></span>
						<div style="float:right; display: inline-block;">
							<a style="color:black;" href="/recipe/recipeList">레시피 목록으로</a>
							<c:if test="${recipe.userNum == loginNum }">
								|<a style="color:black;" href="/recipe/updateRecipe?recipeNum=${recipe.recipeNum }">글 수정</a> |
								<a style="color:black;" href="javascript:deleteRecipe(${recipe.recipeNum });">글 삭제</a>
							</c:if>
						</div>
                        <hr>
                        <div class="blog-post">
                            <div class="row">
                            <c:if test="${empty prev }">
                            	<div class="col-lg-5 col-md-6">
                                    <a style="cursor:default;" class="prev-blog">
                                        <div class="pb-text">
                                            <h5>${emptyPrevMessage }</h5>
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
                                            <span>이전 게시글</span>
                                            <h5>${prev.title }</h5>
                                        </div>
                                    </a>
                                </div>
                            </c:if>
							<c:if test="${empty next }">
                            	<div class="col-lg-5 offset-lg-2 col-md-6">
                                    <a style="cursor:default;" class="next-blog">
		                                <div class="nb-text">
		                                    <h5>${emptyNextMessage }</h5>
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
                                            <span>다음 게시글</span>
                                            <h5>${next.title }</h5>
                                        </div>
                                    </a>
                                </div>
                            </c:if>
                            </div>
                        </div>
                        <div class="leave-comment">
                            <h4 id="comment-title">댓글</h4>
                            <input type="hidden" id="loginNum" value="${loginNum }">
                            <input type="hidden" id="userMail" value="${requestScope.userMail }" >
                            <div class="comment-list">
                            	<c:forEach items="${replyList }" var="reply" varStatus="status">
                           		<div id="comment-wrapper${reply.replyNum }" class="comment-wrapper">
		                        	<div class="comment-name"><strong>${reply.userMail }</strong></div>
			                        	<div class="comment-content">${reply.replyContent }</div>
			                        	<div class="comment-date">${reply.replyDate } 
			                        		<c:if test="${reply.userNum == loginNum }">
			                        		<span class="login-user-only" onclick="updateReply(${reply.replyNum })">수정</span> 
			                        		<span class="login-user-only" onclick="deleteReply(${reply.replyNum })">삭제</span>
			                        		</c:if>
			                        	</div>
		                        		<hr>
	                        		</div>
									<form id="updateReply${reply.replyNum }" class="update-comment">
										<div class="col-lg-6">
											<span style="font-weight:bold;">${requestScope.userMail }</span> 님
										</div>
										<div class="col-lg-12">
											<textarea id="upContent${reply.replyNum }" name="updateContent">${reply.replyContent }</textarea>
											<input type="button" class="site-btn" name="cxl" value="취소" onclick="updateCancel(${reply.replyNum });">
											<input type="button" class="site-btn" name="upd" value="수정" onclick="updateReplyContent(${reply.replyNum });">
										</div>
		                        	</form>
	                        	</c:forEach>
                        	</div>
                            <form id="replyForm" class="comment-form">
                            	<input type="hidden" name="recipeNum" value="${recipe.recipeNum }" >
                                <div class="row">
                                    <div class="col-lg-6">
                                    	<span style="font-weight:bold;">${requestScope.userMail }</span> 님
                                    </div>
                                    <div class="col-lg-6">
                                    </div>
                                    <div class="col-lg-12">
                                        <textarea placeholder="댓글을 입력하세요" id="replyContent" name="replyContent"></textarea>
                                        <input type="button" class="site-btn" value="작성" onclick="insertReply();">
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
		<div class="modal_content" id="confirm-modal-content">
		</div>
	</div>
    
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
    		$("#confirm-modal-content").html("<p></p><span>삭제된 글을 되돌릴 수 없습니다.</span><p>정말로 삭제하시겠습니까?</p>");
    		$("#confirm-modal-content").append('<button class="primary-btn" id="yes-button" style="border-radius:5px; position: relative; top: 20px; right: 50px;">예</button>');
    		$("#confirm-modal-content").append('<button class="primary-btn" id="no-button" style="border-radius:5px; position: relative; bottom: 29px; left: 50px">아니오</button>');
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
					console.log("조회 성공");
					str += "<div id='comment-wrapper"+reply.replyNum +"' class='comment-wrapper'>";
					str += "<div class='comment-name'><strong>"+ reply.userMail +"</strong></div>";
					str += "	<div class='comment-content'>"+ reply.replyContent + "</div>";
					str += "		<div class='comment-date'>"+ reply.replyDate;
					str += "			<span class='login-user-only' onclick='updateReply("+ reply.replyNum +")'>수정</span>";
					str += "			<span class='login-user-only' onclick='deleteReply("+ reply.replyNum +")'>삭제</span>";
					str += "		</div>";
					str += "	<hr>";
					str += "</div>";
					str += "	<form id='updateReply"+ reply.replyNum +"' class='update-comment'>";
					str += "		<div class='col-lg-6'>";
					str += "		<span style='font-weight:bold;'>"+userMail+"</span> 님";
					str += "		</div>";
					str += "		<div class='col-lg-12'>";
					str += "			<textarea id='upContent"+ reply.replyNum +"' name='updateContent'>"+ reply.replyContent +"</textarea>";
					str += "			<input type='button' class='site-btn' name='cxl' value='취소' onclick='updateCancel("+reply.replyNum +");'>";
					str += "			<input type='button' class='site-btn' name='upd' value='수정' onclick='updateReplyContent("+reply.replyNum +");'>";
					str += "		</div>";
					str += "	</form>";
					$(".comment-list").append(str);
				},
				error: function(e) {
					console.log("조회 실패");
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
					console.log("삭제 성공");
					$(".comment-list").empty(); // comment-list의 하위태그 삭제
					var str = "";
					$.each(res, function (index, reply) {
						str += "<div id='comment-wrapper"+reply.replyNum +"' class='comment-wrapper'>";
						str += "	<div class='comment-name'><strong>"+ reply.userMail +"</strong></div>";
						str += "	<div class='comment-content'>"+ reply.replyContent + "</div>";
						str += "	<div class='comment-date'>"+ reply.replyDate;
						if(reply.userNum == loginNum) {
							str += "		<span class='login-user-only' onclick='updateReply("+ reply.replyNum +")'>수정</span>";
							str += "		<span class='login-user-only' onclick='deleteReply("+ reply.replyNum +")'>삭제</span>";
						}
						str += "	</div>";
						str += "	<hr>";
						str += "</div>";
						str += "	<form id='updateReply"+ reply.replyNum +"' class='update-comment'>";
						str += "		<div class='col-lg-6'>";
						str += "		<span style='font-weight:bold;'>"+userMail+"</span> 님";
						str += "		</div>";
						str += "		<div class='col-lg-12'>";
						str += "			<textarea id='upContent"+ reply.replyNum +"' name='updateContent'>"+ reply.replyContent +"</textarea>";
						str += "			<input type='button' class='site-btn' name='cxl' value='취소' onclick='updateCancel("+reply.replyNum +");'>";
						str += "			<input type='button' class='site-btn' name='upd' value='수정' onclick='updateReplyContent("+reply.replyNum +");'>";
						str += "		</div>";
						str += "	</form>";
					});
					$(".comment-list").html(str);
				},
				error: function(e) {
					console.log(e);
					console.log("삭제 실패");
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
					console.log("수정 성공");
					$(".comment-list").empty(); // comment-list의 하위태그 삭제
					var str = "";
					$.each(res, function (index, reply) {
						str += "<div id='comment-wrapper"+reply.replyNum +"' class='comment-wrapper'>";
						str += "	<div class='comment-name'><strong>"+ reply.userMail +"</strong></div>";
						str += "	<div class='comment-content'>"+ reply.replyContent + "</div>";
						str += "	<div class='comment-date'>"+ reply.replyDate;
						if(reply.userNum == loginNum) {
							str += "		<span class='login-user-only' onclick='updateReply("+ reply.replyNum +")'>수정</span>";
							str += "		<span class='login-user-only' onclick='deleteReply("+ reply.replyNum +")'>삭제</span>";
						}
						str += "	</div>";
						str += "	<hr>";
						str += "</div>";
						str += "	<form id='updateReply"+ reply.replyNum +"' class='update-comment'>";
						str += "		<div class='col-lg-6'>";
						str += "		<span style='font-weight:bold;'>"+userMail+"</span> 님";
						str += "		</div>";
						str += "		<div class='col-lg-12'>";
						str += "			<textarea id='upContent"+ reply.replyNum +"' name='updateContent'>"+ reply.replyContent +"</textarea>";
						str += "			<input type='button' class='site-btn' name='cxl' value='취소' onclick='updateCancel("+reply.replyNum +");'>";
						str += "			<input type='button' class='site-btn' name='upd' value='수정' onclick='updateReplyContent("+reply.replyNum +");'>";
						str += "		</div>";
						str += "	</form>";
					});
					$(".comment-list").html(str);
				},
				error: function(e) {
					console.log(e);
					console.log("수정 실패");
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
					$("#rating-complete").text("평가하셨습니다.");
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