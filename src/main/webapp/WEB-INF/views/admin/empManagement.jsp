<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <title>SpringDay | ์ง์ ์กฐํ</title>

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
	<style>
	    .modalClose,
	    .modalAccept {
			border:none;
			position:relative;
			transition:800ms ease all;
			outline:none;
			height:40px;
			border-radius:5px;
			
			display: inline-block;
			font-size: 14px;
			font-weight: 700;
			padding: 12px 30px;
			color: #ffffff;
			background: #e7ab3c;
			text-transform: uppercase;
		}
		
		.modalClose:hover,
		.modalAccept:hover {
			background:#000;
			color:#E7AB3C;
		}
		
		.modalClose:before,.modalClose:after,
		.modalAccept:before,.modalAccept:after {
			content:'';
			position:absolute;
			top:0;
			right:0;
			height:2px;
			width:0;
			background: #E7AB3C;
			transition:400ms ease all;
		}
		
		.modalClose:after,
		.modalAccept:after {
			right:inherit;
			top:inherit;
			left:0;
			bottom:0;
		}
		
		.modalClose:hover:before, .modalClose:hover:after,
		.modalAccept:hover:before, .modalAccept:hover:after {
			width:100%;
			transition:800ms ease all;
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
                        <a href="empManagement">Employee</a>
                        <span>์ง์ ์กฐํ</span>
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
					<div class="cart-table">
                        <table>
                            <thead>
                                <tr style="background-color: #252525;">
                                    <th style="color: white;">Image</th>
                                    <th style="color: white;">์ฌ์ ๋ฒํธ</th>
                                    <th style="color: white;">์ด๋ฆ</th>
                                    <th style="color: white;">์ง๊ธ</th>
                                    <th style="color: white;">์ฐ๋ฝ์ฒ</th>
                                    <th style="color: white;">e-mail</th>
                                    <th style="color: white;">์์?/์ญ์?</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
									<c:when test="${empty empList }">
										<tr>
											<td colspan="7" style="text-align: center;">์ง์์ด ์กด์ฌํ์ง ์์ต๋๋ค.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${empList }" var="emp">
											<tr>
												<c:choose>
													<c:when test="${not empty emp.savedFilename }">
														<td class="empImg"><img src="/uploadImg/${emp.savedFilename }" alt="์ฌ์์ฌ์ง"></td>
													</c:when>
													<c:otherwise>
														<td class="empImg"><img src="/resources/img/empDefault.png" alt="์ฌ์์ฌ์ง"></td>
													</c:otherwise>
												</c:choose>
												<td><h5>${emp.empNum }</h5></td>
												<td>${emp.empName }</td>
												<td>${emp.position }</td>
												<td>${fn:substring(emp.empCall,0,3) }&nbsp;-&nbsp;${fn:substring(emp.empCall,3,7) }&nbsp;-&nbsp;${fn:substring(emp.empCall,7,11) }</td>
												<td>${emp.empMail }</td>
												<td>
												<c:choose>
													<c:when test="${sessionScope.loginPosition eq '์ฌ์ฅ' || sessionScope.loginPosition eq '๋ถ์ฅ'}">
														<input type="button" value="์์?" onclick="empUpdate(${emp.empNum });">
														<input type="button" value="์ญ์?" onclick="empDelete(${emp.empNum}, '${emp.savedFilename }');">
													</c:when>
													<c:when test="${sessionScope.loginId == emp.empNum }">
														<input type="button" value="์์?" onclick="empUpdate(${emp.empNum });">
														<input type="button" value="์ญ์?" disabled>
													</c:when>
													<c:otherwise>
														<input type="button" value="์์?" disabled>
														<input type="button" value="์ญ์?" disabled>
													</c:otherwise>
												</c:choose>
												</td>
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
								<c:when test="${searchWord eq '' }">
									<c:if test="${navi.currentPage > 1 }">
										<!-- ์ด์? ๊ทธ๋ฃน์ผ๋ก ์ด๋ -->
										<c:if test="">
										</c:if>
										<a href="/admin/empManagement?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
											< ์ด์?&nbsp;
										</a>
									</c:if>
									
									<!-- ๋ฐ๋ณต๋ฌธ์ ํตํด ํ์ฌ ๊ทธ๋ฃน ๋ด ๋ชจ๋? ํ์ด์ง๋ฅผ ํ๋์ฉ ์ถ๋?ฅ -->
									<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="pageNum">
										<!-- ์ถ๋?ฅํ๊ณ?์ ํ๋ ํ์ด์ง ๋ฒํธ๊ฐ ํ์ฌ ์?์ํ ํ์ด์ง์ ๊ฐ์ ๊ฒฝ์ฐ ๊ฐ์กฐ ํ์ -->
										<c:if test="${pageNum == navi.currentPage }">
											<a href="/admin/empManagement?currentPage=${pageNum }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
												<span style="color: #e7ab3c; border: 1px solid;">
													&nbsp;${pageNum }
												</span>
											</a>&nbsp;
										</c:if>
										<!-- ๊ฐ์กฐํ์ง ์๋ ํ์ -->
										<c:if test="${pageNum != navi.currentPage }">
											<a href="/admin/empManagement?currentPage=${pageNum }" style="color: #252525; text-decoration: none; font-size: 1.5em; text-align: center;">
												${pageNum }&nbsp;
											</a>
										</c:if>
									</c:forEach>
									
									<!-- ํ์ฌ ํ์ด์ง๊ฐ ๋ง์ง๋ง ํ์ด์ง๊ฐ ์๋๋ผ๋ฉด, ๋ค์ ํ์ด์ง/๊ทธ๋ฃน์ผ๋ก ์ด๋ -->
									<c:if test="${navi.currentPage < navi.totalPageCount }">
										<!-- ๋ค์ ๊ทธ๋ฃน์ผ๋ก ์ด๋ -->
										<a href="/admin/empManagement?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
											๋ค์ >
										</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${navi.currentPage > 1 }">
										<a href="/admin/empManagement?searchType=${searchType }&searchWord=${searchWord }&currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
											< ์ด์?&nbsp;
										</a>
									</c:if>
									<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }"
										var="pageNum">
										<c:if test="${pageNum == navi.currentPage }">
											<a href="/admin/empManagement?searchType=${searchType }&searchWord=${searchWord }&currentPage=${pageNum }" style="text-decoration:none; text-align: center; font-size: 1.5em;">
												<span style="color: #E7AB3C; border: 1px solid;">
													&nbsp;${pageNum }
												</span>
											</a>
											&nbsp;
										</c:if>
										<c:if test="${pageNum != navi.currentPage }">
											<a href="/admin/empManagement?searchType=${searchType }&searchWord=${searchWord }&currentPage=${pageNum }" style="color: black; text-decoration:none; text-align: center; font-size: 1.5em;">
												<span>
													${pageNum }&nbsp;
												</span>
											</a>
										</c:if>
									</c:forEach>
									
									<c:if test="${navi.currentPage < navi.totalPageCount }">
										<a href="/admin/empManagement?searchType=${searchType }&searchWord=${searchWord }&currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration:none;text-align: center; font-size: 1.5em;">
											๋ค์ >
										</a>
									</c:if>
								</c:otherwise>
							</c:choose>
							</span>
						</div>
						<!-- Paging End -->
						<hr>
						<!-- Emp Search Begin -->
						<form action="empManagement" method="get" onsubmit="return searchEmp();">
							<select id="searchType" name="searchType" style="width: 15%; height: 45px; position:relative; left: 20em; bottom:-1em; border: none; border-radius: 5px; border: #e7ab3c solid 3px; padding-right: 20px;">
								<option value="searchEmpName">์ด๋ฆ</option>
								<option value="searchEmpNum">์ฌ์ ๋ฒํธ</option>
								<option value="searchPosition">์ง๊ธ</option>
							</select>
							<input type="text" id="searchWord" name="searchWord" placeholder="๊ฒ์์ด๋ฅผ ์๋?ฅํด์ฃผ์ธ์." style="position:relative; left: 20em; bottom:-1em; border: none; border: #e7ab3c solid 3px; padding-right: 20px;">
							<button type="submit" class="primary-btn" style="width:5px; height:45px; border-radius:5px; left: 20em; bottom:-1.12em"><i class="ti-search"></i></button>
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
	var positionCheck = "${loginPosition }"; // ๋ก๊ทธ์ธํ ์ง์์ ์ง๊ธ
	</script>
</html>