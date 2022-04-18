<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

    <title>SpringDay | 커뮤니티</title>

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
    
    	/* 검색결과 없을 때 테이블 정렬 */
    	div#not-found-search {
    		margin-left:auto;
    		margin-right:auto;
    		height: 300px;
    		bottom: 100px;
    	}
    	div table td {
    		 text-align:center;
    	}
    	div table td a {
    		color:blue;
    	}
    	div table td a:hover {
    		color:blue;
    	}
    	div table th {
    		font-size:20px;
    		text-align :center;
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
    </style>
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
                        <span>게시판</span>
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
                            <h4>레시피 검색</h4>
                            <form id="searchForm" action="/recipe/search" method="GET" onsubmit="return searchFormChk();">
                                <input type="text" name="searchword" placeholder="검색어 ">
                                <button><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        <div class="recent-post">
                            <h4>최신글</h4>
                            <div class="recent-blog">
                            	<c:forEach items="${recipeList }" var="recipe" varStatus="status">
									<a href="/recipe/readRecipe?recipeNum=${recipe.recipeNum }" class="rb-item">
	                                    <div class="rb-pic">
	                                        <img src="/resources/img/blog/recent-${status.count }.jpg" alt="">
	                                    </div>
	                                    <div class="rb-text">
	                                        <h6>${recipe.title }</h6>
	                                        <p><span>${recipe.indate }</span></p>
	                                    </div>
                                	</a>
								</c:forEach>
                            </div>
                        </div>
                        <div class="blog-tags">
                            <h4>Product Tags</h4>
                            <div class="tag-item">
                                <a href="#">Towel</a>
                                <a href="#">Shoes</a>
                                <a href="#">Coat</a>
                                <a href="#">Dresses</a>
                                <a href="#">Trousers</a>
                                <a href="#">Men's hats</a>
                                <a href="#">Backpack</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="row" id="getRecipeList">
                    <c:if test="${empty recipeList }">
						<div id="not-found-search">
						<table>
							<tr>
								<td><img alt="검색 결과 없음" src="/resources/img/not-found.png"></td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<th><span style="color:blue;">'${searchword }'</span>에 대한 레시피를 찾을 수 없습니다.</th>
							</tr>
							<tr>
								<td>아직 등록되지 않은 레시피일 수 있습니다. 요리의 레시피를 직접 작성하시겠습니까?</td>
							</tr>
							<tr>
								<td><a href="/recipe/write">글 쓰러 가기</a></td>
							</tr>
						</table>
						</div>
					</c:if>
					<c:if test="${!empty recipeList }">
                    	<c:forEach items="${recipeList }" var="recipe" varStatus="status">
							<div class="col-lg-6 col-sm-6">
							<input type="hidden" class="scores" id="avg-score${status.count }" value="${recipe.score }">
                            <div class="blog-item">
                                <div class="bi-pic" style="cursor:pointer;" onclick="location.href='/recipe/readRecipe?recipeNum=${recipe.recipeNum }'">
                                    <img src="/resources/img/blog/blog-${status.count }.jpg" alt="">
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
                           			상품 더 보기
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
                           			검색 결과 더 보기
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
    
    //검색어 폼 체크
    function searchFormChk() {
		var searchword = $("input[name=searchword]").val().trim();
    	if(searchword == null || searchword.length == 0 || searchword == "") {
    		alert("검색어를 입력해주세요.");
    		return false;
    	} else {
    		return true;
    	}
    }
	//jsp페이지 출력과 동시에 실행
	$(function(){
		var score = 0;
		var countPost = $(".scores").length;
		console.log(countPost);
		
		for(var i = 0; i <= countPost; i++) {
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
				alert("표시할 게시물이 없습니다.");
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
				alert("표시할 게시물이 없습니다.");
				console.log("실패");
			}
		});
	}
    </script>
</body>

</html>