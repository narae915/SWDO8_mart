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
    <title>SpringDay | 회원 조회</title>

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
                        <span>회원 조회</span>
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
                                    <th style="color: white;">회원 번호</th>
                                    <th style="color: white;">이름</th>
                                    <th style="color: white;">연락처</th>
                                    <th style="color: white;">e-mail</th>
                                    <th style="color: white;">등록된 주소</th>
                                    <c:if test="${sessionScope.loginPosition eq '사장' || sessionScope.loginPosition eq '부장'}">
									<th style="color: white;">강제 탈퇴</th>
									</c:if>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
									<c:when test="${empty userList }">
										<tr>
											<td colspan="6" style="text-align: center;">등록된 회원이 존재하지 않습니다.</td>
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
												<c:if test="${sessionScope.loginPosition eq '사장' || sessionScope.loginPosition eq '부장'}">
												<td><input type="button" value="탈퇴" onclick="deleteUser(${user.userNum });"></td>
												</c:if>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
                            </tbody>
                        </table>
                        
                        <!-- Paging Begin -->
						<div style="text-align: center; margin-top: 20px;">
							<!-- 현재 페이지가 첫 페이지가 아니라면, 이전 그룹/페이지로 이동 -->
							<span>
							<c:choose>
								<c:when test="${searchWord eq null }">
									<c:if test="${navi.currentPage > 1 }">
										<!-- 이전 그룹으로 이동 -->
										<a href="/admin/userManagement?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
											< 이전&nbsp;
										</a>
									</c:if>
									
									<!-- 반복문을 통해 현재 그룹 내 모든 페이지를 하나씩 출력 -->
									<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="pageNum">
										<!-- 출력하고자 하는 페이지 번호가 현재 접속한 페이지와 같은 경우 강조 표시 -->
										<c:if test="${pageNum == navi.currentPage }">
											<a href="/admin/userManagement?currentPage=${pageNum }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
												<span style="color: #e7ab3c; border: 1px solid;">
													&nbsp;${pageNum }
												</span>
											</a>&nbsp;
										</c:if>
										<!-- 강조하지 않는 표시 -->
										<c:if test="${pageNum != navi.currentPage }">
											<a href="/admin/userManagement?currentPage=${pageNum }" style="color: #252525; text-decoration: none; font-size: 1.5em; text-align: center;">
												${pageNum }&nbsp;
											</a>
										</c:if>
									</c:forEach>
									
									<!-- 현재 페이지가 마지막 페이지가 아니라면, 다음 페이지/그룹으로 이동 -->
									<c:if test="${navi.currentPage < navi.totalPageCount }">
										<!-- 다음 그룹으로 이동 -->
										<a href="/admin/userManagement?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
											다음 >
										</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${navi.currentPage > 1 }">
										<a href="/admin/userManagement?searchType=${searchType }&searchWord=${searchWord }&currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
											< 이전&nbsp;
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
											다음 >
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
								<option value="searchName">이름</option>
								<option value="searchTelNum">연락처</option>
								<option value="searchMail">메일주소</option>
							</select>
							<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력해주세요." style="position:relative; left: 20em; bottom:-1em; border: none; border: #e7ab3c solid 3px; padding-right: 20px;">
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
	/* 직원 검색 */
	function searchUser() {
		var searchWord = $.trim($("input[name=searchWord]").val());
		//길이 확인
		var lengthCheck = /([^{2,5}])/i;
		if ( !(lengthCheck.test(searchWord)) ) 
		{
			modalContent();
			$("#modalAlert_content").prepend("2글자 이상, 5글자 이하로 입력해주십시오.");
			showModalAlert();
			return false;
		} 
		else 
		{	
			//특수문자 확인
			var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20a-zA-Z0-9])/i;
			if ( kor_check.test(searchWord) )
			{
				modalContent();
				$("#modalAlert_content").prepend("특수문자는 입력할 수 없습니다.");
				showModalAlert();
				return false;
			} 
		}
		
		return true;
	}
	
	function deleteUser(userNum) {
		confirmModal();
		$("#footer-modal-content").prepend("정말 강제 회원탈퇴 시키겠습니까?");
		showModalConfirm();
		
		$("#yes-button").click(function(){
			location.href = "/admin/deleteUser?userNum="+ userNum;
		});
	}
	
	// 컨펌 모달
	function confirmModal() {
		$("#footer-modal-content").html("");
		$("#footer-modal-content").append('<button class="primary-btn" id="yes-button" style="border-radius:5px; position: relative; top: 40px; right: 60px; width: 106px;">예</button>');
		$("#footer-modal-content").append('<button class="primary-btn" id="no-button" style="border-radius:5px; position: relative; left: 60px;">아니오</button>');
	}
	
	function showModalConfirm() {
		$("#footer-modal").fadeIn();
		
		$("#no-button").click(function(){
			$("#footer-modal").fadeOut();
		});
	}

	</script>
</html>