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
    <!-- Spring Security로 인한 ajax POST 해결 -->
    <meta name="_csrf" content="${_csrf.token}">
	<meta name="_csrf_header" content="${_csrf.headerName}">

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
                            <img src="/resources/img/blog/blog-detail.jpg" alt="">
                        </div>
                        <div class="blog-detail-desc">
                            <p>psum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
                                labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco
                                laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure Lorem ipsum dolor sit
                                amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
                                magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.
                            </p>
                        </div>
                        <div class="blog-quote">
                            <p>“ Technology is nothing. What's important is that you have a faith in people, that
                                they're basically good and smart, and if you give them tools, they'll do wonderful
                                things with them.” <span>- Steven Jobs ${recipe.content }</span></p>
                        </div>
                        <div class="blog-more">
                            <div class="row">
                                <div class="col-sm-4">
                                    <img src="/resources/img/blog/blog-detail-1.jpg" alt="">
                                </div>
                                <div class="col-sm-4">
                                    <img src="/resources/img/blog/blog-detail-2.jpg" alt="">
                                </div>
                                <div class="col-sm-4">
                                    <img src="/resources/img/blog/blog-detail-3.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <p>Sum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                            et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
                            nisi ut aliquip ex ea commodo consequat. Duis aute irure Lorem ipsum dolor sit amet,
                            consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna
                            aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                            ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.</p>
                            
						이 게시글의 평점
                        <span class="star-container" id="star-con${status.count }">
										<span id="star1">★</span>
										<span id="star2">★</span>
										<span id="star3">★</span>
										<span id="star4">★</span>
										<span id="star5">★</span>
							</span>
						<div style="float:right; display: inline-block;">
						<a style="color:black;" href="/recipe/recipeList">레시피 목록으로</a>
						</div>
                        <hr>
                        <div class="blog-post">
                            <div class="row">
                            <c:if test="${empty prev }">
                            	<div class="col-lg-5 col-md-6">
                                    <a style="cursor:default;" class="prev-blog">
                                        <div class="pb-text">
                                            <h5>${emptyMessage }</h5>
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
		                                    <h5>${emptyMessage }</h5>
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
                        <div>
                        	댓글 올릴 곳 
                        </div>
                        <div class="leave-comment">
                            <h4>댓글</h4>
                            <form action="#" class="comment-form">
                                <div class="row">
                                    <div class="col-lg-6">
                                    	<span style="font-weight:bold;">${userMail }</span> 님
                                    </div>
                                    <div class="col-lg-6">
                                    </div>
                                    <div class="col-lg-12">
                                        <textarea placeholder="댓글을 입력하세요"></textarea>
                                        <button type="submit" class="site-btn">작성</button>
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
</body>

</html>