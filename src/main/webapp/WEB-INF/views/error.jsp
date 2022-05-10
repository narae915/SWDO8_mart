<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<title>ERROR</title>
	
	<style type="text/css">
		.errorcode {
			color: red;
		}
		
		.errordiv {
			margin-top: 2em;
			text-align: center;
		}
		
		.details {
			margin-top: 2em;
			font-size: 20px;
			font-weight: 800;
		}
		
		button, input[type="button"] {
			border: none;
			transition: 800ms ease all;
			outline: none;
		}
		
		button:hover, input[type="button"]:hover {
			background: #000;
			color: #E7AB3C;
		}
		
		input[type="button"]:before, input[type="button"]:after {
			content: '';
			position: absolute;
			top: 0;
			right: 0;
			height: 2px;
			width: 0;
			background: #E7AB3C;
			transition: 400ms ease all;
		}
		
		input[type="button"]:after {
			right: inherit;
			top: inherit;
			left: 0;
			bottom: 0;
		}
		
		input[type="button"]:hover:before, input[type="button"]:hover:after {
			width: 100%;
			transition: 800ms ease all;
		}
		
		.primary-btn {
			font-size: 14px;
			font-weight: 700;
			padding: 12px 30px;
			color: #ffffff;
			background: #e7ab3c;
			text-transform: uppercase;
			border-radius: 5px;
			margin-top: 2em;
		}
	</style>
</head>
<body>
	<div>
		<div>
			<div class="errordiv">
				<img src="/resources/img/alert-g7a69a278d_1280.png" style="width: 20%; margin-top: 10%">
				<div class="details">
					<span class="errorcode"> 
						<c:out value="${error.STATUS_CODE }"></c:out> 
						&nbsp;:&nbsp;${error.MESSAGE } <br> 
						<input type="button" class="primary-btn" value="메인 페이지로" onclick="location.href='/'">
					</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>