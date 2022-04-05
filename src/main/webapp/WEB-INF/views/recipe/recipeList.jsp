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
	    .star-container span{
			font-size:12px;
			letter-spacing:-4px;
			display:inline-block;
			color:#ccc;
		}
		.star-container span.on {
			color:#ffa500;
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
                            <form id="searchForm">
                                <input type="text" name="searchword" placeholder="검색어 ">
                                <button type="button" onclick="search();"><i class="fa fa-search"></i></button>
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
                    	<c:forEach items="${recipeList }" var="recipe" varStatus="status">
							<div class="col-lg-6 col-sm-6">
							<input type="hidden" id="recipe${status.count }" value="${recipe.score }">
                            <div class="blog-item">
                                <div class="bi-pic">
                                    <img src="/resources/img/blog/blog-${status.count }.jpg" alt="">
                                </div>
                                <div class="bi-text">
                                    <a href="/recipe/readRecipe?recipeNum='${recipe.recipeNum }'">
                                        <h4>${recipe.title }</h4>
                                    </a>
                                    <p><span>${recipe.indate } - </span>
                                    </p>
                                   	<span class="star-container" id="star-con${status.count }">
										<span id="star1">★</span>
										<span id="star2">★</span>
										<span id="star3">★</span>
										<span id="star4">★</span>
										<span id="star5">★</span>
									</span>
                                </div>
                            </div>
                        </div>
						</c:forEach>
                        <div class="col-lg-12">
                            <div class="loading-more">
                                <i class="icon_loading"></i>
                                <a href="#">
                                    Loading More
                                </a>
                            </div>
                        </div>
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
  //리뷰 별 채우기
    $(function() {
    	var score = $('input:hidden').length; //hidden태그의 value
    	console.log(score);
    	   
    	for(var i=1; i<=score; i++) {
    		$("#star-con"+i+" span").removeAttr("class");
    		var test = $("#recipe" + i).val();
    		for(var j=1; j<=test; j++) {
    			console.log(test);
    			$("#star-con"+i+" #star"+j).attr("class", "on");
    		}
		}
	});

	function search(){
		var searchword = $("input[name='searchword']").val();
		console.log(searchword);
		
	  	$.ajax({
			url: "/recipe/search",
			data: {
				searchword:searchword
			},
			success: function(res){
				console.log("검색 성공");
				$(".row > .col-lg-4 col-sm-6").remove();
				$("#getRecipeList").html(res);
			}
	  	});
	}
    </script>
</body>

</html>