<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

    <title>SpringDay | Footer</title>

	<!-- CSS -->
	<style>
		.modal-button {
			font-size: 16px;
			color: #ffffff;
			border: 1px solid #e7ab3c;
			background: #e7ab3c;
			height: 45px;
			padding: 12px 16px 12px;
		}
		
		.modal{
			position: fixed;
			top:0; left: 0; bottom: 0; right: 0;
			background: rgba(0, 0, 0, 0.8); /* 투명도 */
		}
		
		.modal_content{
			position: absolute;  /* 배경 내에서 위치 조정 */
			top: calc(50vh - 100px); left: calc(50vw - 200px);
			background-color: white;
			display: flex; 
			justify-content: center;
			align-items: center;
			border-radius: 10px;
			width: 400px;
			height: 200px;
			flex-direction: column;
		}
	</style>
</head>

<body>
    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer-left">
                        <div class="footer-logo">
                            <a href="/"><img src="/resources/img/footer-logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 광주광역시 광산구</li>
                            <li>Phone: +82 62.123.456</li>
                            <li>Email: springday24@gmail.com</li>
                        </ul>
                        <div class="footer-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <div class="footer-widget">
                        <h5>Spring Day24</h5>
                        <ul>
                            <li><a href="/item/itemList">식품 마트</a></li>
                            <li><a href="/recipe/recipeList">커뮤니티</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="footer-widget">
                        <h5>My Account</h5>
                        <ul>
                            <li><a href="/user/mypage">마이 페이지</a></li>
                            <li><a href="/order/orderList">장바구니</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="newslatter-item">
                        <h5>Staff Only</h5>
                        <form action="/admin/adminLogin" class="subscribe-form" onsubmit="return staffOnlyChk()">
                            <input type="text" name="admin">
                            <button>입장</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> 1조 박나래 안찬호 노채린 이상우 | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

	<!-- 모달 연습 -->
	<!-- <div class="modal" id="staff-modal">
		<div class="modal_content" id="staff-modal-content">
			관계자만 접속할 수 있습니다.<br><br>
			<input type="button" class="modal-button" id="staff-modal-button" value="창 닫기">
		</div>
	</div> -->
	
	<!-- 22-04-05 노채린 -->
	<!-- 모달 방식 수정 -->
	<!-- 모달 창 형식 함수 추가, id 값 변경 및 StaffOnlyChk()의 success-else 부분 수정. -->
	<div class="modal" id="footer-modal">
		<div class="modal_content" id="footer-modal-content">
		</div>
	</div>
	
    <!-- Js Plugins -->
    <script src="/resources/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    	//이름과 사원번호를 합쳐서 입력하면 관리자 페이지로 이동하는 ajax 만들기
    	function staffOnlyChk() {
			var chkMessage = $("input[name=admin]").val();
			console.log(chkMessage);
    		var result = false;
    		
    		$.ajax({
    			url: "/admin/staffOnlyChk",
    			data: {
    				chkMessage:$("input[name=admin]").val(),
    			},
    			async: false, //ajax는 비동기방식이기 때문에 함수가 실행되고 나서 ajax가 실행됨
    						//하지만 async를 false로 해놓으면 비동기방식을 무시할 수 있음
        		success: function(res){
        			if(res == "yes") {
        				result = true;
        			} else {
        				/* showStaffModal(); */
        				$("#footer-modal-content").html("");
        	    		$("#footer-modal-content").prepend("관계자만 접속할 수 있습니다.");
        	    		$("#footer-modal-content").append('<input type="button" class="modal-button" id="footer-modal-button" value="창 닫기">');
        				
        	    		showStaffModal();
            			result = false;
        			}
        		},
    			error: function(e){
    				console.log("실패");
    			}
    		});
    		
    		return result;
    	}
    	
    	function showStaffModal() {
    		$("#footer-modal").fadeIn();
    		
    		$("#footer-modal-button").click(function(){
    			$("#footer-modal").fadeOut();
    		});
    	}
    	
    	// 닫기 모달
    	function exitAlert() {
    		$("#footer-modal-content").html("");
    		$("#footer-modal-content").append('<button name="modalClose" class="primary-btn" id="footer-modal-button" style="margin-top:30px; border-radius:5px; border:none">창 닫기</button>');
    	}

    	// 모달 출력
    	function showModalAlert() {
    		$("#footer-modal").fadeIn();

    		$("button[name=modalClose]").click(function() {
    			$("#footer-modal").fadeOut();
    		});
    	}

    	// 컨펌 모달
    	function confirmModal() {
    		$("#footer-modal-content").html("");
    		$("#footer-modal-content").append('<button class="primary-btn" id="yes-button" style="border-radius:5px; position: relative; top: 45px; right: 50px;">예</button>');
    		$("#footer-modal-content").append('<button class="primary-btn" id="no-button" style="border-radius:5px; position: relative; left: 50px">아니오</button>');
    	}

    </script>
</body>

</html>