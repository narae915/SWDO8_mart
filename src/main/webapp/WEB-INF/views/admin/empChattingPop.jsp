<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SpringDay | 직원 메신저 POP</title>

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
		.button
		{
			border:1x solid #e7ab3c;
			border-radius: 5px;
			background-Color:#e7ab3c;
			color: white;
		}    
		.button:hover:enabled
		{
			border:1x solid #e7ab3c;
			border-radius: 5px;
			background-Color: #e7ab3c;
			font-weight: bold;
			color: white;
		}
		.button:disabled
		{
			border:1x solid #ebebe4;
			border-radius: 5px;
			background-Color: #ebebe4;;
			color: white;
		}
		
		.loginBtn
		{
			border-radius: 5px;
			color: white;
			background-Color: black;
			width: 110px;
			height: 30px;
		}
		.loginBtn:hover
		{
			border-radius: 5px;
			color: white;
			background-Color: #e7ab3c;
			font-weight: bold;
			width: 110px;
			height: 30px;
		}
		
		.fromChatting 
		{
			float: right;
			white-space: break-word;
			color: white;
			border-radius: 5px;
		    position: relative;
		    background: #e7ab3c;
			margin: 10px;
		}
		.fromChatting:after 
		{
		    content: "";
		    position: absolute;
		    border-top: 10px solid #e7ab3c;
		    border-right: 10px solid transparent;
		    border-left: 0px solid transparent;
		    bottom: 10px;
		    right: -10px;
		}
		
		.toChatting 
		{
			float: left;
			white-space: break-word;
			border-radius: 5px;
		    position: relative;
		    background: #ffeecf;
		    margin: 10px;
		}
		.toChatting:after 
		{
		    content: "";
		    position: absolute;
		    border-top: 10px solid #ffeecf;
		    border-right: 0px solid transparent;
		    border-left: 10px solid transparent;
		    bottom: 10px;
		    left: -10px;
		}
	</style>
</head>
<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	
    <!-- Chatting Section Begin -->
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
					<h2 style="text-align: center; margin-bottom: 35px; font-weight: bold;">메신저</h2>
					<div class="scroll" style="position: relative; text-align: center; bottom: 10px; background: #f5fff6;">
					<c:choose>
						<c:when test="${empty sessionScope.loginName }">
							<b style="color: red; font-size: 20px;">로그인이 필요합니다.</b><br><br>
							<button type="button" class="loginBtn">로그인</button>
						</c:when>
						<c:otherwise>
							<!-- 주고 받는 메세지 내용 -->
							<div id="messages">
							</div>
							<br/><br/><br/>
							<div class="divStatus" style="display: none;"> <!-- 입력 화면 비표시 -->
								<b>메세지 입력 : </b>
								<input type="text" id="sender" value="${sessionScope.loginName } ${sessionScope.loginPosition }" style="display: none;">
								<input type="text" id="inputMessage" maxlength="25" placeholder="25字씩 입력 가능">
								<button type="button" class="button" id="sendBtn" onclick="send();" disabled="disabled">메세지 전송</button><br><br>
								<button type="button" class="button" id="clearBtn" onclick="javascript:clearText();">대화내용 지우기</button>
							</div>
							<br/><br/>
							<button type="button" class="button" id="enterBtn" onclick="openSocket();">채팅 참여</button>
							<button type="button" class="button" id="closeBtn" onclick="closeSocket();" disabled="disabled">채팅 나가기</button>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>			
	<!-- Chatting Section End -->

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
    <script src="/resources/js/adminJs/sockjs.min.js"></script>
    <script type="text/javascript">
    var ws;
    var messages = document.getElementById("messages");
    
    /* 로그인 페이지 이동 */
    $(".loginBtn").click(function() 
   	{
    	window.open("/admin/adminLogin", "_blank");
    	window.close(); // 팝업창 닫기
	});
    
    $(function() 
    {
    	var divStatus = $(".divStatus");
    	
    	//$("#inputMessage").scrollTop($("#inputMessage").height());
    	
    	// 채팅 참여 시 메세지 작성란을 표시
    	$("#enterBtn").click(function() 
    	{
    		divStatus.css("display", "block");
    		$("#inputMessage").focus();
		});
    	
    	$("#closeBtn").click(function() 
    	{
    		divStatus.css("display", "none");
		});
    	
		// 텍스트 입력 시 전송 버튼 활성화
		$("#inputMessage").on("input", function() 
		{
			if ( $("#inputMessage").val() == "" )
			{
				$("#sendBtn").attr("disabled", true);
			}
			else
			{
				$("#sendBtn").attr("disabled", false);
			}
		});
		
		// 엔터키 누를 시 메세지 전송
		$("#inputMessage").keydown(function(key) 
		{
	        if ( key.keyCode == 13 )
        	{
	        	if ( !($("#sendBtn").is(":disabled")) ) // 메세지 전송 버튼이 비활성화 상태가 아니라면
	        	{
	        		send();
	        	}
        	}
		});
	})
    
	/* 웹소켓 */
    function openSocket()
    {
    	$("#enterBtn").attr("disabled", true);	// 입장 버튼 비활성화
    	$("#closeBtn").attr("disabled", false);	// 나가기 버튼 활성화
    	
        if ( ws !== undefined && ws.readyState !== WebSocket.CLOSED )
        {
            writeResponse("WebSocket is already opened.");
            return;
        }
        
        // 웹소켓 객체 생성
        ws = new WebSocket("ws://localhost:8889/empChatting");
        
        ws.onopen = function(event)
        {
            if ( event.data === undefined )
            {
          		return;
            }
            writeResponse(event.data);
        };
        
        ws.onmessage = function(event)
        {
            writeResponse(event.data);
        };
        
        ws.onclose = function(event)
        {
            writeResponse("<b style='color: red;'>채팅 종료</b>");
        }
    }
    
    /* 메세지 전송 */
    function send()
    {
    	var text = $("#inputMessage").val() + "," + $("#sender").val();
        ws.send(text);							
        text = "";
        $("#inputMessage").val("");				// 메세지 전송 후 입력란 비워주기
        $("#sendBtn").attr("disabled", true);	// 입력란이 비어있게 되므로 메세지 전송 버튼 비활성화
    }
    
    /* 채팅방 나가기 */
    function closeSocket()
    {
    	$("#enterBtn").attr("disabled", false);	// 입장 버튼 활성화
    	$("#closeBtn").attr("disabled", true);	// 나가기 버튼 비활성화
        ws.close();								// 웹소켓 종료
    }
    
    function writeResponse(text)
    {
        messages.innerHTML += "<br/>" + text;
    }

    function clearText()
    {
        $("#messages").empty();
        
  	}
</script>
</body>
</html>