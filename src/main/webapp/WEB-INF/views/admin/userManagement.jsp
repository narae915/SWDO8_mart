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
    <title>SpringDay | ํ์ ์กฐํ</title>

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
	<link rel="stylesheet" href="/resources/css/adminCss/empManagement.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
	<style type="text/css">
		.cart-table table tr td {
			padding-top: 10px;
			text-align: center;
			padding-bottom: 10px;
		}
	</style>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<!-- Header -->
    <%@ include file="/WEB-INF/views/admin/adminHeader.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text product-more">
                        <a href="adminMain"><i class="fa fa-home"></i> Home</a>
                        <a>User</a>
                        <span>ํ์ ์กฐํ</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->

    <!-- EmpManagement Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
					<div class="user-table">
                        <table>
                            <thead>
                                <tr style="background-color: #252525;">
                                    <th style="color: white;">ํ์ ๋ฒํธ</th>
                                    <th style="color: white;">์ด๋ฆ</th>
                                    <th style="color: white;">์ฐ๋ฝ์ฒ</th>
                                    <th style="color: white;">e-mail</th>
                                    <th style="color: white;">๋ฑ๋ก๋ ์ฃผ์</th>
                                    <c:if test="${sessionScope.loginPosition eq '์ฌ์ฅ' || sessionScope.loginPosition eq '๋ถ์ฅ'}">
									<th style="color: white;">๊ฐ์? ํํด</th>
									</c:if>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
									<c:when test="${empty userList }">
										<tr>
											<td colspan="6" style="text-align: center;">๋ฑ๋ก๋ ํ์์ด ์กด์ฌํ์ง ์์ต๋๋ค.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${userList }" var="user">
											<tr>
												<td><h5>${user.userNum }</h5></td>
												<td>${user.userName }</td>
												<td>${fn:substring(user.userCall,0,3) }&nbsp;-&nbsp;${fn:substring(user.userCall,3,7) }&nbsp;-&nbsp;${fn:substring(user.userCall,7,11) }</td>
												<td>${user.userMail }</td>
												<td>
													<c:if test="${user.postcode != 0 }">${user.postcode },</c:if> 
													${user.userAddress }</td>
												<c:if test="${sessionScope.loginPosition eq '์ฌ์ฅ' || sessionScope.loginPosition eq '๋ถ์ฅ'}">
												<td><input type="button" value="ํํด" onclick="deleteUser(${user.userNum });"></td>
												</c:if>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
                            </tbody>
                        </table>
                        
                        <!-- Paging Begin -->
						<div style="text-align: center; margin-top: 20px;">
							<!-- ํ์ฌ ํ์ด์ง๊ฐ ์ฒซ ํ์ด์ง๊ฐ ์๋๋ผ๋ฉด, ์ด์? ๊ทธ๋ฃน/ํ์ด์ง๋ก ์ด๋ -->
							<span>
							<c:choose>
								<c:when test="${searchWord eq null }">
									<c:if test="${navi.currentPage > 1 }">
										<!-- ์ด์? ๊ทธ๋ฃน์ผ๋ก ์ด๋ -->
										<a href="/admin/userManagement?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
											< ์ด์?&nbsp;
										</a>
									</c:if>
									
									<!-- ๋ฐ๋ณต๋ฌธ์ ํตํด ํ์ฌ ๊ทธ๋ฃน ๋ด ๋ชจ๋? ํ์ด์ง๋ฅผ ํ๋์ฉ ์ถ๋?ฅ -->
									<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="pageNum">
										<!-- ์ถ๋?ฅํ๊ณ?์ ํ๋ ํ์ด์ง ๋ฒํธ๊ฐ ํ์ฌ ์?์ํ ํ์ด์ง์ ๊ฐ์ ๊ฒฝ์ฐ ๊ฐ์กฐ ํ์ -->
										<c:if test="${pageNum == navi.currentPage }">
											<a href="/admin/userManagement?currentPage=${pageNum }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
												<span style="color: #e7ab3c; border: 1px solid;">
													&nbsp;${pageNum }
												</span>
											</a>&nbsp;
										</c:if>
										<!-- ๊ฐ์กฐํ์ง ์๋ ํ์ -->
										<c:if test="${pageNum != navi.currentPage }">
											<a href="/admin/userManagement?currentPage=${pageNum }" style="color: #252525; text-decoration: none; font-size: 1.5em; text-align: center;">
												${pageNum }&nbsp;
											</a>
										</c:if>
									</c:forEach>
									
									<!-- ํ์ฌ ํ์ด์ง๊ฐ ๋ง์ง๋ง ํ์ด์ง๊ฐ ์๋๋ผ๋ฉด, ๋ค์ ํ์ด์ง/๊ทธ๋ฃน์ผ๋ก ์ด๋ -->
									<c:if test="${navi.currentPage < navi.totalPageCount }">
										<!-- ๋ค์ ๊ทธ๋ฃน์ผ๋ก ์ด๋ -->
										<a href="/admin/userManagement?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
											๋ค์ >
										</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${navi.currentPage > 1 }">
										<a href="/admin/userManagement?searchType=${searchType }&searchWord=${searchWord }&currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
											< ์ด์?&nbsp;
										</a>
									</c:if>
									<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }"
										var="pageNum">
										<c:if test="${pageNum == navi.currentPage }">
											<a href="/admin/userManagement?searchType=${searchType }&searchWord=${searchWord }&currentPage=${pageNum }" style="text-decoration:none; text-align: center; font-size: 1.5em;">
												<span style="color: #E7AB3C; border: 1px solid;">
													&nbsp;${pageNum }
												</span>
											</a>
											&nbsp;
										</c:if>
										<c:if test="${pageNum != navi.currentPage }">
											<a href="/admin/userManagement?searchType=${searchType }&searchWord=${searchWord }&currentPage=${pageNum }" style="color: black; text-decoration:none; text-align: center; font-size: 1.5em;">
												<span>
													${pageNum }&nbsp;
												</span>
											</a>
										</c:if>
									</c:forEach>
									
									<c:if test="${navi.currentPage < navi.totalPageCount }">
										<a href="/admin/userManagement?searchType=${searchType }&searchWord=${searchWord }&currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration:none;text-align: center; font-size: 1.5em;">
											๋ค์ >
										</a>
									</c:if>
								</c:otherwise>
							</c:choose>
							</span>
						</div>
						<!-- Paging End -->
						<hr>
						<!-- user Search Begin -->
						<form action="/admin/searchUser" method="GET" onsubmit="return searchUser();">
							<select id="" name="searchType" style="width: 15%; height: 45px; position:relative; left: 20em; bottom:-1em; border: none; border-radius: 5px; border: #e7ab3c solid 3px; padding-right: 20px;">
								<option value="searchName">์ด๋ฆ</option>
								<option value="searchTelNum">์ฐ๋ฝ์ฒ</option>
								<option value="searchMail">๋ฉ์ผ์ฃผ์</option>
							</select>
							<input type="text" id="searchWord" name="searchWord" placeholder="๊ฒ์์ด๋ฅผ ์๋?ฅํด์ฃผ์ธ์." style="position:relative; left: 20em; bottom:-1em; border: none; border: #e7ab3c solid 3px; padding-right: 20px;">
							<button type="submit" class="primary-btn" style="width:5px; height:45px; border-radius:5px; left: 254px; bottom:-1.12em"><i class="ti-search"></i></button>
						</form>
						<!-- Emp Search End -->
					</div>
                </div>
            </div>
        </div>
    </section>
    <!-- EmpManagement Section End -->

 	<!-- Footer -->
    <%@ include file="/WEB-INF/views/admin/adminFooter.jsp" %>
	
	<!-- modal -->
	<div class="modalAlert">
		<div class="modalAlert_content" id="modalAlert_content">
		</div>
	</div>
	
	<div class="modal" id="footer-modal">
		<div class="modal_content" id="footer-modal-content">
		</div>
	</div>
	
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
    <script src="/resources/js/adminJs/empManagement.js"></script>
	<script type="text/javascript">
	/* ์ง์ ๊ฒ์ */
	function searchUser() {
		var searchWord = $.trim($("input[name=searchWord]").val());
		//๊ธธ์ด ํ์ธ
		var lengthCheck = /([^{2,5}])/i;
		if ( !(lengthCheck.test(searchWord)) ) 
		{
			modalContent();
			$("#modalAlert_content").prepend("2๊ธ์ ์ด์, 5๊ธ์ ์ดํ๋ก ์๋?ฅํด์ฃผ์ญ์์ค.");
			showModalAlert();
			return false;
		} 
		else 
		{	
			//ํน์๋ฌธ์ ํ์ธ
			var kor_check = /([^๊ฐ-ํฃใฑ-ใใ-ใฃ\x20a-zA-Z0-9])/i;
			if ( kor_check.test(searchWord) )
			{
				modalContent();
				$("#modalAlert_content").prepend("ํน์๋ฌธ์๋ ์๋?ฅํ? ์ ์์ต๋๋ค.");
				showModalAlert();
				return false;
			} 
		}
		
		return true;
	}
	
	function deleteUser(userNum) {
		confirmModal();
		$("#footer-modal-content").prepend("์?๋ง ๊ฐ์? ํ์ํํด ์ํค๊ฒ?์ต๋๊น?");
		showModalConfirm();
		
		$("#yes-button").click(function(){
			location.href = "/admin/deleteUser?userNum="+ userNum;
		});
	}
	
	// ์ปจํ ๋ชจ๋ฌ
	function confirmModal() {
		$("#footer-modal-content").html("");
		$("#footer-modal-content").append('<button class="primary-btn" id="yes-button" style="border-radius:5px; position: relative; top: 40px; right: 60px; width: 106px;">์</button>');
		$("#footer-modal-content").append('<button class="primary-btn" id="no-button" style="border-radius:5px; position: relative; left: 60px;">์๋์ค</button>');
	}
	
	function showModalConfirm() {
		$("#footer-modal").fadeIn();
		
		$("#no-button").click(function(){
			$("#footer-modal").fadeOut();
		});
	}

	</script>
</html>