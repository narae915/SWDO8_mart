<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SpringDay | 마이 페이지</title>

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
	<script src="https://kit.fontawesome.com/af95d2c333.js" crossorigin="anonymous"></script>
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
                        <a href="#"><i class="fa fa-home"></i> Home</a>
                        <span>회원정보</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
	
    <!-- Faq Section Begin -->
    <div class="faq-section spad"> <!-- 본문 상단 여백 -->
        <div class="container"> <!-- 본문 좌측 여백 -->
            <div class="row"> <!-- flex 설정 -->
            
                <div class="col-lg-12"> <!-- 본문을 우측으로 조금 변경 -->
                    <div class="faq-accordin"> <!-- 폰트 크기, 아이콘 -->
	                    <!-- 22/04/05  노채린 -->
	                    <h1 id="content-title">회원정보</h1>
	                     <%-- onclick="userDelete('${sessionScope.userMail }');" --%>
	                    <input type="button" value="회원 탈퇴" id="userDeleteBtn">
	                    <input type="hidden" value="${sessionScope.userMail }" id="loginMail">
	                  	<input type="button" value="회원 정보 수정" onclick="userConfirm('${sessionScope.userMail }');">
			    	</div>
			            <div id="gocart" class="">
			                <div class="clear"></div>
			                <div class="buttongroup center-align cmd">
			                </div>
			            </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- Faq Section End -->
    
    <!-- Footer Section Begin -->
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
		//현재 페이지를 선택했음을 알림 4/17 박나래
		$("li#menu-mypage").css("background", "#e7ab3c");
	});
	
	function userConfirm(userId) 
    {
    	confirmModal();
    	$("#footer-modal-content").prepend("&ensp;&ensp;<b style='color: red; position: absolute; left: 7.3em; bottom: 10em;'>본인 확인이 필요합니다.</b>");
    	$("#footer-modal-content").prepend("<b style='position: absolute; left: 3.5em;'>비밀번호:</b>&ensp;<input type='password' id='userPw' name='userPw' style='position: absolute; right: 3em;'>");
    	$("#footer-modal-content").prepend("<b style='position: absolute; left: 6.5em; bottom: 8em;'>ID:</b>&ensp;<span style='position: absolute; right: 5.3em; bottom: 8em;'>" + userId + "</span>");
    	
    	showModalAlert();
    	
    	$('#yes-button').click(function() 
   			{
   				$.ajax
   				({
   					url: "/user/userConfirm",
   					type: "get",
   					data:
   					{
   						userId: userId,
   						userPw: $("#userPw").val()
   					},
   					success: function(result)
   					{
   						if ( result == "success" )
   						{
   							exitAlert();
   							$("#footer-modal-content").prepend("확인되셨습니다.");
   							showModalAlert();
   							location.href = "/user/userUpdate?userMail="+userId;
   						}
   					}
   				});
   			});
   				
   			$('#no-button').click(function() 
   			{
   				$("#footer-modal").fadeOut();
   				return false;
   			});
    }

	$('#userDeleteBtn').click(function() {
		confirmModal();	
		$("#footer-modal-content").prepend("정말 탈퇴하시겠습니까?");
		showModalAlert();
		
		$('#yes-button').click(function() {
			$.ajax({
				url: "/user/userDelete",
				type: "get",
				data: {
					userMail: $('#loginMail').val()
				},
				success: function() {
					exitAlert();
  					$("#footer-modal-content").prepend("탈퇴가 완료되었습니다.");
  					$("#footer-modal").fadeIn()	;
  		    		$("button[name=modalClose]").click(function() {
  		    			$("#footer-modal").fadeOut();
  		    			location.href="/user/logout";	
  		    		});
				}
			});
		});
		
		$('#no-button').click(function() {
			$("#footer-modal").fadeOut();
			return false;
		});
	})
	</script>
</body>
</html>