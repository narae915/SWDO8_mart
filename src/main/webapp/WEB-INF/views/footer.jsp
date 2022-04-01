<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

    <title>Fashi | Template</title>

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

    <!-- Js Plugins -->
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
            			alert("관계자만 접속할 수 있습니다.");
            			result = false;
        			}
        		},
    			error: function(e){
    				console.log("실패");
    			}
    		});
    		
    		return result;
    	}
    	
    </script>
</body>

</html>