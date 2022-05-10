<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="message.recipeListAjax.search"/></title>
<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
</head>
<body>
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

	<script src="/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
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
	
	//더보기 실행하기(페이징) - 일반 ver
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
				//원래 모달안에 있던 글을 지우고, 다시 쓰고 싶은 말을 추가
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