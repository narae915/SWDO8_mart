<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	
	<title>SpringDay | <spring:message code="message.header.group.recipeList" /></title>
	
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
	<link rel="stylesheet" href="/resources/css/recipeCss/recipeList.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp"%>

	<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-text">
						<a href="/">
							<i class="fa fa-home"></i> Home
						</a> 
						<span>
							<spring:message code="message.recipeList.board" />
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section Begin -->

	<!-- Blog Section Begin -->
	<section class="blog-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1">
					<div class="blog-sidebar">
						<div class="search-form">
							<h4>
								<spring:message code="message.recipeList.searchRecipe" />
							</h4>
							<form id="searchForm" action="/recipe/search" method="GET" onsubmit="return searchFormChk();">
								<input type="text" id="search-word" name="searchword" placeholder="<spring:message code="message.recipeList.searchWord"/>">
								<button>
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
						<div class="recent-post">
							<h4>
								<spring:message code="message.recipeList.newPost" />
							</h4>
							<div class="recent-blog">
								<c:forEach items="${newPostList }" var="newPost" varStatus="status">
									<a href="/recipe/readRecipe?recipeNum=${newPost.recipeNum }" class="rb-item">
										<div class="rb-pic">
											<img src="${newPost.titleImg }" alt="">
										</div>
										<div class="rb-text">
											<h6>${newPost.title }</h6>
											<p>
												<span>${newPost.indate }</span>
											</p>
										</div>
									</a>
								</c:forEach>
							</div>
						</div>
						<br> <input type="button" value="<spring:message code="message.recipeList.newPost1"/>" class="primary-btn" onclick="location.href = '/recipe/write'">
					</div>
				</div>
				<div class="col-lg-9 order-1 order-lg-2">
					<div class="row" id="getRecipeList">
						<c:if test="${empty recipeList }">
							<c:if test="${nothing eq 'nothing' }">
								<table id="nothing">
									<tr>
										<td>
											<img alt="<spring:message code="message.recipeList.nothing"/>" src="/resources/img/no-message.png">
										</td>
									</tr>
									<tr>
										<td></td>
									</tr>
									<tr>
										<th>
											<spring:message code="message.recipeList.emptyPost" />
										</th>
									</tr>
									<tr>
										<td>
											<a href="/recipe/write">
												<spring:message code="message.recipeList.newPost1" />
											</a>
										</td>
									</tr>
								</table>
							</c:if>
							<c:if test="${nothing eq null }">
								<div id="not-found-search">
									<table>
										<tr>
											<td>
												<img alt="<spring:message code="message.recipeList.nothing"/>" src="/resources/img/not-found.png">
											</td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<th>
												<span style="color: blue;">'${searchword }'</span>
												<spring:message code="message.recipeList.noword" />
											</th>
										</tr>
										<tr>
											<td>
												<spring:message code="message.recipeList.noword2" />
											</td>
										</tr>
										<tr>
											<td>
												<a href="/recipe/write">
													<spring:message code="message.recipeList.newPost1" />
												</a>
											</td>
										</tr>
									</table>
								</div>
							</c:if>
						</c:if>
						<c:if test="${!empty recipeList }">
							<c:forEach items="${recipeList }" var="recipe" varStatus="status">
								<div class="col-lg-6 col-sm-6">
									<input type="hidden" class="scores" id="avg-score${status.count }" value="${recipe.score }">
									<div class="blog-item">
										<div class="bi-pic" style="cursor: pointer;" onclick="location.href='/recipe/readRecipe?recipeNum=${recipe.recipeNum }'">
											<img src="${recipe.titleImg }" alt="" style="cursor: pointer; width: 400px; height: 280px;">
										</div>
										<div class="bi-text">
											<a href="/recipe/readRecipe?recipeNum=${recipe.recipeNum }">
												<h4>${recipe.title }</h4>
												<p>
													<span>${recipe.indate } - </span>
												</p>
											</a>
											<div class="star-ratings">
												<div class="star-ratings-fill space-x-2 text-lg" id="star-fill${status.count }" style="width:calc(${recipe.score } * 20)%">
													<span>???</span><span>???</span><span>???</span><span>???</span><span>???</span>
												</div>
												<div class="star-ratings-base space-x-2 text-lg">
													<span>???</span><span>???</span><span>???</span><span>???</span><span>???</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<c:if test="${searchword == null}">
								<div class="col-lg-12">
									<div class="loading-more">
										<i class="icon_loading"></i> 
										<a href="javascript:loadingMore(6);" style="cursor: pointer;">
											<spring:message code="message.recipeList.loadingmore" />
										</a> 
										<input type="hidden" id="viewCount" value="0"> 
										<input type="hidden" id="startCount" value="0">
									</div>
								</div>
							</c:if>
							<c:if test="${searchword != null}">
								<div class="col-lg-12">
									<div class="loading-more">
										<i class="icon_loading"></i> 
										<a href="javascript:searchLoadingMore(6);" style="cursor: pointer;"> 
											<spring:message code="message.recipeList.loadingmore2" />
										</a> 
										<input type="hidden" id="viewCount" value="0"> 
										<input type="hidden" id="startCount" value="0"> 
										<input type="hidden" id="word" value="${searchword }">
									</div>
								</div>
							</c:if>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div id="chatbotId">
			<div id="frogue-container" class="position-right-bottom"
			data-chatbot="f5ec9dae-b96c-4cc6-8fd8-8aa55ec90405"
			data-user="?????????ID"
			data-init-key="value"
			data-close-use="Y" data-close-bgcolor="#ffffff" data-close=linecolor="#000000"
			data-move-use="Y" data-move-bgcolor="#ffffff" data-move=linecolor="#000000">
			</div>
		</div>
		<!-- data-init-?????????=??? ?????? ???????????? ??????????????? ??????????????? ????????????. ???????????? ???????????? ?????? -->
		<!-- data ?????? ????????? https://doc.danbee.ai/channel_frogu.html -->
		<script>
			(function(d, s, id){
				var js, fjs = d.getElementsByTagName(s)[0];
				if (d.getElementById(id)) {return;}
				js = d.createElement(s); js.id = id;
				js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
				fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'frogue-embed'));
		</script>
	<!-- Blog Section End -->

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>

	<!-- modal -->
	<div class="modal" id="footer-modal">
		<div class="modal_content" id="footer-modal-content"></div>
	</div>

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
	    //jsp????????? ????????? ????????? ?????? 
		$(function(){
			$("li#menu-community").attr("class", "active");
		});
		// ?????? ??????
		function exitAlert() { 
			$("#footer-modal-content").append('<button name="modalClose" class="primary-btn" id="footer-modal-button" style="margin-top:30px; border-radius:5px; border:none"><spring:message code="message.footer.modal.close"/></button>');
		}
	
		// ?????? ??????
		function showModalAlert() {
			$("#footer-modal").fadeIn();
			$("button[name=modalClose]").click(function() {
				$("#footer-modal").fadeOut();
			});
		}
	    
		//????????? ??? ??????
		function searchFormChk() {
			var searchword = $("#search-word").val().trim();
			if(searchword == null || searchword.length == 0 || searchword == "") {
				$("#footer-modal-content").html("<spring:message code='message.recipeList.inputSearch'/>");
				exitAlert();
				showModalAlert();
	    		return false;
	    	} else {
	    		return true;
	    	}
	    }
		
		//jsp????????? ????????? ????????? ??????
		$(function() {
			var score = 0;
			var countPost = $(".scores").length;
			
			for(var i = 1; i <= countPost; i++) {
				score = $("#avg-score"+i).val();
				score = score*20;
				//1??? ????????? ?????? ????????? half star??? ??? ???????????? ????????? ?????????????????? ???????????? ?????? ???????????? ?????? ????????? offset ?????????.
				$("#star-fill"+i).css("width", score + 1 +"%");
			}
			
			$("li#menu-community").attr("class", "active");
		});
		
		//????????? ????????????(?????????) - ??????ver
		function loadingMore(cnt){
			var temp = $("#getRecipeList>div>div.blog-item").length;
	
			var startCount = $("input#startCount").val(temp);
			startCount = startCount.val();
			console.log('???????????? ??????' +startCount);
			
			var viewCount = $("input#viewCount").val(cnt);
			viewCount = viewCount.val();
			console.log('???????????? ?????? ?????? ' +viewCount);
			
			$.ajax({
				url: "/recipe/loading",
				type: "GET", 
				data: {
					startCount : startCount,
					viewCount : viewCount
				},
	    		success: function(res){
	    			console.log("??????");
	       			$(".row > .col-lg-4 col-sm-6").remove();
	   				$("#getRecipeList").html(res);
	    		},
				error: function(e){
					$("#footer-modal-content").html("");
					$("#footer-modal-content").html("<spring:message code='message.recipeList.nomorePost'/>");
					exitAlert();
					showModalAlert();
					console.log("??????");
				}
			});
		}
		
		//????????? ????????????(?????????) -- ?????? ??????ver
		function searchLoadingMore(cnt) {
			var temp = $("#getRecipeList>div>div.blog-item").length;
	
			var startCount = $("input#startCount").val(temp);
			startCount = startCount.val();
			console.log('???????????? ??????' +startCount);
			
			var viewCount = $("input#viewCount").val(cnt);
			viewCount = viewCount.val();
			console.log('???????????? ?????? ?????? ' +viewCount);
			
			var searchword = $("#word").val();
			
			$.ajax({
				url: "/recipe/searchLoading",
				type: "GET", 
				data: {
					startCount : startCount,
					viewCount : viewCount,
					searchword : searchword
				},
	    		success: function(res){
	    			console.log("??????");
	       			$(".row > .col-lg-4 col-sm-6").remove();
	   				$("#getRecipeList").html(res);
	    		},
				error: function(e){
					//?????? ???????????? ?????? ?????? ?????????, ?????? ?????? ?????? ?????? ??????
					$("#footer-modal-content").html("");
					$("#footer-modal-content").html("<spring:message code='message.recipeList.nomorePost'/>");
					exitAlert();
					showModalAlert();
					console.log("??????");
				}
			});
		}
    </script>
</body>
</html>