<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SpringDay | forward</title>
    
    <!-- Css Styles -->
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
</head>

<body>
<!-- 22-04-16 노채린 -->
<!-- itemMangement.jsp와 itemUpdateForward.jsp의 중간 역할. -->
	<jsp:forward page="itemUpdateForward.jsp">
		<jsp:param value="" name="" />
	</jsp:forward>
</body>
</html>