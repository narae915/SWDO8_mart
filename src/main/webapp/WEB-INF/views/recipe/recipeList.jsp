<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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

    <title>SpringDay | <spring:message code="message.header.group.recipeList"/></title>

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
	<%@ include file="/WEB-INF/views/header.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="/"><i class="fa fa-home"></i> Home</a>
                        <span><spring:message code="message.recipeList.board"/></span>
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
                            <h4><spring:message code="message.recipeList.searchRecipe"/></h4>
                            <form id="searchForm" action="/recipe/search" method="GET" onsubmit="return searchFormChk();">
                                <input type="text" id="search-word" name="searchword" placeholder="<spring:message code="message.recipeList.searchWord"/>">
                                <button><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        <div class="recent-post">
                            <h4><spring:message code="message.recipeList.newPost"/></h4>
                            <div class="recent-blog">
                            	<c:forEach items="${newPostList }" var="newPost" varStatus="status">
									<a href="/recipe/readRecipe?recipeNum=${newPost.recipeNum }" class="rb-item">
	                                    <div class="rb-pic">
	                                        <img src="${newPost.titleImg }" alt="">
	                                    </div>
	                                    <div class="rb-text">
	                                        <h6>${newPost.title }</h6>
	                                        <p><span>${newPost.indate }</span></p>
	                                    </div>
                                	</a>
								</c:forEach>
                            </div>
                        </div>
                        <br>
                    	<input type="button" value="<spring:message code="message.recipeList.newPost1"/>" class="primary-btn" onclick="location.href = '/recipe/write'">
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="row" id="getRecipeList">
                    <c:if test="${empty recipeList }">
                    <c:if test="${nothing eq 'nothing' }">
                    	<table id="nothing">
							<tr>
								<td><img alt="<spring:message code="message.recipeList.nothing"/>" src="/resources/img/no-message.png"></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<th><spring:message code="message.recipeList.emptyPost"/></th>
							</tr>
							<tr>
								<td><a href="/recipe/write"><spring:message code="message.recipeList.newPost1"/></a></td>
							</tr>
						</table>
                    </c:if>
                    <c:if test="${nothing eq null }">
						<div id="not-found-search">
						<table>
							<tr>
								<td><img alt="<spring:message code="message.recipeList.nothing"/>" src="/resources/img/not-found.png"></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<th><span style="color:blue;">'${searchword }'</span><spring:message code="message.recipeList.noword"/></th>
							</tr>
							<tr>
								<td><spring:message code="message.recipeList.noword2"/></td>
							</tr>
							<tr>
								<td><a href="/recipe/write"><spring:message code="message.recipeList.newPost1"/></a></td>
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
                                <div class="bi-pic" style="cursor:pointer;" onclick="location.href='/recipe/readRecipe?recipeNum=${recipe.recipeNum }'">
                                    <img src="${recipe.titleImg }" alt="" style="cursor:pointer;width: 400px; height:280px;">
                                </div>
                                <div class="bi-text">
                                	<a href="/recipe/readRecipe?recipeNum=${recipe.recipeNum }">
                                        <h4>${recipe.title }</h4>
                                    <p><span>${recipe.indate } - </span></p></a>
									<div class="star-ratings">
										<div class="star-ratings-fill space-x-2 text-lg" id="star-fill${status.count }" style="width:calc(${recipe.score } * 20)%">
											<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
										</div>
										<div class="star-ratings-base space-x-2 text-lg">
											<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
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
                           			<spring:message code="message.recipeList.loadingmore"/>
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
                           			<spring:message code="message.recipeList.loadingmore2"/>
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
    <!-- Blog Section End -->
    
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/footer.jsp" %>
    
    <!-- modal -->
	<div class="modal" id="footer-modal">
		<div class="modal_content" id="footer-modal-content">
		</div>
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
    //jsp페이지 출력과 동시에 실행 
	$(function(){
		$("li#menu-community").attr("class", "active");
	});
	// 닫기 모달
	function exitAlert() { 
		$("#footer-modal-content").append('<button name="modalClose" class="primary-btn" id="footer-modal-button" style="margin-top:30px; border-radius:5px; border:none"><spring:message code="message.footer.modal.close"/></button>');
	}

	// 모달 출력
	function showModalAlert() {
		$("#footer-modal").fadeIn();
		$("button[name=modalClose]").click(function() {
			$("#footer-modal").fadeOut();
		});
	}
    
	//검색어 폼 체크
	function searchFormChk() {
		var searchword = $("#search-word").val().trim();
		console.log(searchword);
		if(searchword == null || searchword.length == 0 || searchword == "") {
			$("#footer-modal-content").html("<spring:message code='message.recipeList.inputSearch'/>");
			exitAlert();
			showModalAlert();
    		return false;
    	} else {
    		return true;
    	}
    }
	
	//jsp페이지 출력과 동시에 실행
	$(function() {
		var score = 0;
		var countPost = $(".scores").length;
		console.log(countPost);
		
		for(var i = 1; i <= countPost; i++) {
			score = $("#avg-score"+i).val();
			score = score*20;
			//1를 더하여 주는 이유는 half star일 시 미세하게 절반이 안되어보여서 보여지는 값을 조정하기 위해 추가한 offset 값이다.
			$("#star-fill"+i).css("width", score + 1 +"%");
		}
		
		$("li#menu-community").attr("class", "active");
	});
	
	//더보기 실행하기(페이징) - 일반ver
	function loadingMore(cnt){
		var temp = $("#getRecipeList>div>div.blog-item").length;
		console.log(temp);

		var startCount = $("input#startCount").val(temp);
		startCount = startCount.val();
		console.log('시작하는 숫자' +startCount);
		
		var viewCount = $("input#viewCount").val(cnt);
		viewCount = viewCount.val();
		console.log('보여주고 싶은 갯수 ' +viewCount);
		
		$.ajax({
			url: "/recipe/loading",
			type: "GET", 
			data: {
				startCount : startCount,
				viewCount : viewCount
			},
    		success: function(res){
    			console.log("성공");
       			$(".row > .col-lg-4 col-sm-6").remove();
   				$("#getRecipeList").html(res);
    		},
			error: function(e){
				$("#footer-modal-content").html("");
				$("#footer-modal-content").html("<spring:message code='message.recipeList.nomorePost'/>");
				exitAlert();
				showModalAlert();
				console.log("실패");
			}
		});
	}
	
	//더보기 실행하기(페이징) -- 검색 결과ver
	function searchLoadingMore(cnt) {
		var temp = $("#getRecipeList>div>div.blog-item").length;
		console.log(temp);

		var startCount = $("input#startCount").val(temp);
		startCount = startCount.val();
		console.log('시작하는 숫자' +startCount);
		
		var viewCount = $("input#viewCount").val(cnt);
		viewCount = viewCount.val();
		console.log('보여주고 싶은 갯수 ' +viewCount);
		
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
    			console.log("성공");
       			$(".row > .col-lg-4 col-sm-6").remove();
   				$("#getRecipeList").html(res);
    		},
			error: function(e){
				//원래 모달안에 있던 글을 지우고, 다시 쓰고 싶은 말을 추가
				$("#footer-modal-content").html("");
				$("#footer-modal-content").html("<spring:message code='message.recipeList.nomorePost'/>");
				exitAlert();
				showModalAlert();
				console.log("실패");
			}
		});
	}
    </script>
</body>

</html>