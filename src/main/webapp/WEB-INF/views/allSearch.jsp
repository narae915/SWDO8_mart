<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	<title>SpringDay | <spring:message code="message.allSearch.title"/></title>
	
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
	<style type="text/css">
	/* 검색결과 없을 때 테이블 정렬 */
	div#not-found-search {
		margin-left: 30em;
		margin-right: auto;
		margin-top: 50px;
		height: 200px;
	}
	
	div#not-found-search table td {
		text-align: center;
	}
	
	div#not-found-search table td a {
		color: blue;
	}
	
	div#not-found-search table td a:hover {
		color: blue;
	}
	
	div#not-found-search table th {
		font-size: 20px;
		text-align: center;
	}
	
	div.recipe-wrapper {
		display: inline-block;
		width: 300px;
		text-align: center;
	}
	
	div.recipe-wrapper p {
		font-size: 20px;
	}
	
	table#itemListTB {
		width: 100%;
		border-spacing: 10px;
		border-collapse: separate;
		text-align: left;
	}
	
	input.buy-btn {
		font-size: 16px;
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
		display: flex;
		top: 0;
		left: 0;
		overflow: hidden;
		-webkit-text-fill-color: gold;
	}
	
	.star-ratings-base {
		z-index: 2;
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
							<spring:message code="message.allSearch.title"/>
						</span>
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
									'${searchword }'<spring:message code="message.allSearch.cardHeading1"/> ${totalCount }<spring:message code="message.allSearch.cardHeading2"/>
								</div>
							</div>
							<hr>
							<c:if test="${totalCount == 0}">
								<div id="not-found-search">
									<table>
										<tr>
											<td>
												<img alt="검색 결과 없음" src="/resources/img/not-found.png" style="width: 80px; height: 80px;">
											</td>
										</tr>
										<tr>
											<td></td>
										</tr>
										<tr>
											<th>
												<span style="color: blue;">'${searchword }'</span>
												<spring:message code="message.allSearch.notFound1"/>
											</th>
										</tr>
										<tr>
											<td>
												<spring:message code="message.allSearch.notFound2"/>
											</td>
										</tr>
									</table>
								</div>
							</c:if>
							<c:if test="${totalCount > 0 }">
								<div class="card">
									<div class="card-heading active">
										<a>
											<spring:message code="message.allSearch.cardHeading3"/>
											${countItem }
											<spring:message code="message.allSearch.cardHeading2"/>
										</a>
									</div>
									<br>
									<div id="collapseOne" class="collapse show" data-parent="#accordionExample">
										<div class="card-body">
											<table id="itemListTB">
												<c:if test="${!empty searchItemList }">
													<c:forEach items="${searchItemList }" var="item">
														<tr>
															<td style="width: 250px;">
																<img src="${item.savedFilename }" style="width: 250px; height: 300px; cursor: pointer;" onclick="location.href='/item/readItem?itemNum=${item.itemNum }';">
															</td>
															<td style="text-align: left;">
																<p style="font-size: 14px;">
																	${item.categoryName }
																</p>
																<div class="itemName" style="display: block; font-size: 25px; font-weight: bold;">
																	${item.itemName }
																</div>
																<!-- 가격사이에 ,를 찍기 위해 fmt 사용 -->
																<c:if test="${item.salePrice != 0 }">
																	<div class="product-price">
																		<span style="color: #e7ab3c; font-size: 20px; font-weight: 700;">
																			<fmt:formatNumber value="${item.salePrice }" pattern="#,###원" />
																		</span>
																		<span class="itemPrice" style="font-size: 12px; color: #b2b2b2; text-decoration: line-through;">
																			<fmt:formatNumber value="${item.price }" pattern="#,###원" />
																		</span>
																	</div>
																</c:if> 
																<c:if test="${item.salePrice == 0 }">
																	<div class="product-price">
																		<span style="color: #e7ab3c; font-size: 20px; font-weight: 700;">
																			<fmt:formatNumber value="${item.price }" pattern="#,###원" />
																		</span>
																	</div>
																</c:if>
															</td>
															<td>
																<input type="button" class="buy-btn" value="<spring:message code='message.allSearch.buyBtn'/>" onclick="location.href='/item/readItem?itemNum=${item.itemNum }'">
															</td>
														</tr>
													</c:forEach>
												</c:if>
											</table>
										</div>
									</div>
								</div>

								<hr>
								<div class="card">
									<div class="card-heading active">
										<a>
											<spring:message code="message.allSearch.searchResult"/>
											${countRecipe } 
											<spring:message code="message.allSearch.cardHeading2"/>
										</a>
									</div>
									<div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
										<div class="card-body">
											<c:choose>
												<c:when test="${empty searchRecipeList }"></c:when>
												<c:otherwise>
													<c:forEach items="${searchRecipeList }" var="recipe" varStatus="status">
													<input type="hidden" class="scores" id="avg-score${status.count }" value="${recipe.score }">
														<div class="recipe-wrapper">
															<p>
																<img alt="" src="${recipe.titleImg }" onclick="location.href='/recipe/readRecipe?recipeNum=${recipe.recipeNum }';" style="cursor: pointer; margin-bottom: 10px;">
															</p>
															<div>
																<p onclick="location.href='/recipe/readRecipe?recipeNum=${recipe.recipeNum }';" style="cursor: pointer;">
																	${recipe.title }
																</p>
																<div class="star-ratings">
																	<div class="star-ratings-fill space-x-2 text-lg" id="star-rate${status.count }">
																		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																	</div>
																	<div class="star-ratings-base space-x-2 text-lg">
																		<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
																	</div>
																</div>
																<span class="score" id="avg${status.count }" style="display: inline; font-weight: bold; font-size: 15px;">
																	${recipe.score }
																</span>
																<span class="indate" style="font-weight: bold; display: block">
																	${recipe.indate }
																</span>
															</div>
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
	$(function() {
		$("li#menu-home").attr("class", "active");
		
		var score = 0;
		var countPost = $(".scores").length;
		var starFill = null;
		
		for(var i = 1; i <= countPost; i++) {
			score = $("#avg-score"+i).val();
			score = (score*20) + 1;
			
			//1를 더하여 주는 이유는 half star일 시 미세하게 절반이 안되어보여서 보여지는 값을 조정하기 위해 추가한 offset 값이다.
			$("#star-rate"+i).css("width", score+"%");
		} 
	});
    </script>
</body>

</html>