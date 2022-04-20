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
    <title>SpringDay | 직원 조회</title>

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
                        <a href="empManagement">직원</a>
                        <span>직원 조회</span>
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
                                    <th style="color: white;">사원 번호</th>
                                    <th style="color: white;">이름</th>
                                    <th style="color: white;">직급</th>
                                    <th style="color: white;">연락처</th>
                                    <th style="color: white;">e-mail</th>
                                    <th style="color: white;">수정/삭제</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:choose>
									<c:when test="${empty empList }">
										<tr>
											<td colspan="7" style="text-align: center;">직원이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${empList }" var="emp">
											<tr>
												<c:choose>
													<c:when test="${not empty emp.savedFilename }">
														<td class="empImg"><img src="/uploadImg/${emp.savedFilename }" alt="사원사진"></td>
													</c:when>
													<c:otherwise>
														<td class="empImg"><img src="/resources/img/empDefault.png" alt="사원사진"></td>
													</c:otherwise>
												</c:choose>
												<td><h5>${emp.empNum }</h5></td>
												<td>${emp.empName }</td>
												<td>${emp.position }</td>
												<td>${fn:substring(emp.empCall,0,3) }&nbsp;-&nbsp;${fn:substring(emp.empCall,3,7) }&nbsp;-&nbsp;${fn:substring(emp.empCall,7,11) }</td>
												<td>${emp.empMail }</td>
												<td>
												<c:choose>
													<c:when test="${sessionScope.loginPosition eq '사장' || sessionScope.loginPosition eq '부장'}">
														<input type="button" value="수정" onclick="empUpdate(${emp.empNum });">
														<input type="button" value="삭제" onclick="empDelete(${emp.empNum}, '${emp.savedFilename }');">
													</c:when>
													<c:when test="${sessionScope.loginId == emp.empNum }">
														<input type="button" value="수정" onclick="empUpdate(${emp.empNum });">
														<input type="button" value="삭제" disabled>
													</c:when>
													<c:otherwise>
														<input type="button" value="수정" disabled>
														<input type="button" value="삭제" disabled>
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
							<!-- 현재 페이지가 첫 페이지가 아니라면, 이전 그룹/페이지로 이동 -->
							<span>
							<c:choose>
								<c:when test="${searchWord eq '' }">
									<c:if test="${navi.currentPage > 1 }">
										<!-- 이전 그룹으로 이동 -->
										<c:if test="">
										</c:if>
										<a href="/admin/empManagement?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
											< 이전&nbsp;
										</a>
									</c:if>
									
									<!-- 반복문을 통해 현재 그룹 내 모든 페이지를 하나씩 출력 -->
									<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="pageNum">
										<!-- 출력하고자 하는 페이지 번호가 현재 접속한 페이지와 같은 경우 강조 표시 -->
										<c:if test="${pageNum == navi.currentPage }">
											<a href="/admin/empManagement?currentPage=${pageNum }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
												<span style="color: #e7ab3c; border: 1px solid;">
													&nbsp;${pageNum }
												</span>
											</a>&nbsp;
										</c:if>
										<!-- 강조하지 않는 표시 -->
										<c:if test="${pageNum != navi.currentPage }">
											<a href="/admin/empManagement?currentPage=${pageNum }" style="color: #252525; text-decoration: none; font-size: 1.5em; text-align: center;">
												${pageNum }&nbsp;
											</a>
										</c:if>
									</c:forEach>
									
									<!-- 현재 페이지가 마지막 페이지가 아니라면, 다음 페이지/그룹으로 이동 -->
									<c:if test="${navi.currentPage < navi.totalPageCount }">
										<!-- 다음 그룹으로 이동 -->
										<a href="/admin/empManagement?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #e7ab3c; text-decoration: none; font-size: 1.5em; text-align: center;">
											다음 >
										</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:if test="${navi.currentPage > 1 }">
										<a href="/admin/empManagement?searchType=${searchType }&searchWord=${searchWord }&currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
											< 이전&nbsp;
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
											다음 >
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
							<select id="" name="searchType" style="width: 15%; height: 45px; position:relative; left: 20em; bottom:-1em; border: none; border-radius: 5px; border: #e7ab3c solid 3px; padding-right: 20px;">
								<option value="searchEmpName">이름</option>
								<option value="searchEmpNum">사원 번호</option>
								<option value="searchPosition">직급</option>
							</select>
							<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력해주세요." style="position:relative; left: 20em; bottom:-1em; border: none; border: #e7ab3c solid 3px; padding-right: 20px;">
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
	var positionCheck = "${loginPosition }"; // 로그인한 직원의 직급
	</script>
</html>