<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    
    <title>SpringDay | 검색결과</title>

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
    		margin-left:30em;
    		margin-right:auto;
    		margin-top: 50px;
    		height: 200px;
    	}
    	div#not-found-search table td {
    		 text-align:center;
    	}
    	div#not-found-search table td a {
    		color:blue;
    	}
    	div#not-found-search table td a:hover {
    		color:blue;
    	}
    	div#not-found-search table th {
    		font-size:20px;
    		text-align :center;
    	}
    
	    table#itemListTB
		{
			width: 80%;
			border-spacing: 10px;
			border-collapse: separate;
		}
		
		input.buy-btn {
			font-size: 16px;
			margin-left: -440px;
			margin-top: -20px;
			position: absolute;
			color: #ffffff;
			border: 1px solid #e7ab3c;
			background: #e7ab3c;
			padding: 12px 16px 12px;
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
                        <span>검색 결과</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- Faq Section Begin -->
    <div class="faq-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="faq-accordin">
                        <div class="accordion" id="accordionExample">
                        	<div class="card">
								<div class="card-heading active">
								'${searchword }'에 대한 전체 검색 결과(총 ${totalCount }개)
								</div>
							</div>
							<hr>
							<c:if test="${totalCount == 0}">
							<div id="not-found-search">
							<table>
								<tr>
									<td><img alt="검색 결과 없음" src="/resources/img/not-found.png" style="width:80px; height:80px;"></td>
								</tr>
								<tr>
									<td></td>
								</tr>
								<tr>
									<th><span style="color:blue;">'${searchword }'</span>에 대한 검색 결과가 없습니다.</th>
								</tr>
								<tr>
									<td>검색어를 한번 더 확인해주세요</td>
								</tr>
							</table>
							</div>
							</c:if>
							<c:if test="${totalCount > 0 }">
                            <div class="card">
                                <div class="card-heading active">
                                    <a>
										식품 코너 내 검색 결과(${countItem }개)
                                    </a>
                                </div>
                                <br>
                                <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
									<table id="itemListTB">
									<c:if test="${!empty searchItemList }">
									<c:forEach items="${searchItemList }" var="item">
									<tr>
									<td>이미지</td>
									<td>
									<p style="font-size:14px;">${item.categoryName }</p>
									<span class="itemName" style="display:block; font-size:20px;">${item.itemName }</span>
									<span class="itemPrice" style="font-weight:bold;"><fmt:formatNumber value="${item.price }" pattern="#,###원"/></span>
									</td>
									<td>
									<input type="button" class="buy-btn" value="구매하러가기" onclick="location.href='/item/readItem?itemNum=${item.itemNum }'">
									</td>
									</tr>
									</c:forEach>
									</c:if>
									</table>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading active">
                                    <a>
										커뮤니티 내 검색 결과(${countRecipe } 개)
                                    </a>
                                </div>
                                <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                    <div class="card-body">
                                    <c:choose>
									<c:when test="${empty searchRecipeList }">
									<span style="text-align: center;">검색 결과가 없습니다.</span>
									</c:when>
									<c:otherwise>
									<c:forEach items="${searchRecipeList }" var="recipe" varStatus="status">
									<div class="recipe-wrapper" <%-- onclick="location.href='/recipe/readRecipe?recipeNum=${recipe.recipeNum }';" --%>>
									<p>이미지</p>
									<p style="text-align:left; font-size:20px;">${recipe.title }</p>
									<div class="star-ratings">
										<div class="star-ratings-fill space-x-2 text-lg" id="star-fill${status.count }" style="width:calc(${recipe.score } * 20)%">
											<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
										</div>
										<div class="star-ratings-base space-x-2 text-lg">
											<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
										</div>
									</div>
									<span class="score" id="avg-score${status.count }" style="display:inline; font-weight:bold; font-size: 15px;">${recipe.score }</span>
									<span class="indate" style="font-weight:bold; display:block">${recipe.indate }</span>
									</div>
									</c:forEach>
									</c:otherwise>
									</c:choose>
                                    </div>
                                </div>
                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Faq Section End -->

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
		$("li#menu-home").attr("class", "active");
		
		var score = 0;
		var countPost = $(".score").length;
		console.log(countPost);
		
		for(var i = 1; i <= countPost; i++) {
			score = $("#avg-score"+i).text();
			score = score*20;
			//1를 더하여 주는 이유는 half star일 시 미세하게 절반이 안되어보여서 보여지는 값을 조정하기 위해 추가한 offset 값이다.
			$("#star-fill"+i).css("width", score + 1 +"%");
		}
	});
    </script>
</body>

</html>