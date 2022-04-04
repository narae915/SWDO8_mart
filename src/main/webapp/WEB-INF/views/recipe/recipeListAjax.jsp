<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	<script src="/resources/js/jquery-3.6.0.min.js"></script>
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
	</script>
</body>
</html>