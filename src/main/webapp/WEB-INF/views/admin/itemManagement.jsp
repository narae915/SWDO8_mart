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
    <title>SpringDay | ์ํ ์กฐํ</title>

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
    <link rel="stylesheet" href="/resources/css/adminCss/itemManagement.css" type="text/css">
	<link rel="stylesheet" href="/resources/css/font.css" type="text/css">
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
                    <div class="breadcrumb-text">
                        <a href="adminMain"><i class="fa fa-home"></i> Home</a>
                        <a>Item</a>
                        <span>์ํ ์กฐํ</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
    
    <!-- Faq Section Begin -->
    <div class="faq-section spad"> <!-- ๋ณธ๋ฌธ ์๋จ ์ฌ๋ฐฑ -->
        <div class="container"> <!-- ๋ณธ๋ฌธ ์ข์ธก ์ฌ๋ฐฑ -->
            <div class="row"> <!-- flex ์ค์? -->
                <div class="col-lg-12"> <!-- ๋ณธ๋ฌธ์ ์ฐ์ธก์ผ๋ก ์กฐ๊ธ ๋ณ๊ฒฝ -->
                    <div class="faq-accordin"> <!-- ํฐํธ ํฌ๊ธฐ, ์์ด์ฝ -->
	                    
	                    <!-- 22/03/27~22/03/28 ๋ธ์ฑ๋ฆฐ -->
	                    <!-- ์ํ ๊ฒ์ -->
	                    <c:if test="${not empty itemList }">
		                    <form action="itemManagement" method="get" onsubmit="return searchChk();">
								<select name="category" id="category">
									<option value="">์นดํ๊ณ?๋ฆฌ ์?ํ</option>
									<option value="10">์ก๋ฅ</option>
									<option value="20">์ดํจ๋ฅ</option>
									<option value="30">๊ณผ์ผ</option>
									<option value="40">์ฑ์</option>
									<option value="50">์กฐ๋ฏธ๋ฃ</option>
									<option value="60">์๋ฃ</option>
									<option value="70">๊ทธ ์ธ</option>
								</select>
		                    	<input type="text" name="searchWord" id="searchWord" placeholder="์ํ์ ์ด๋ฆ์ ์๋?ฅํด์ฃผ์ธ์.">
		                    	<button type="submit" class="primary-btn" id="search-button"><i class="ti-search"></i></button>
		                    </form>
		                    
		                    <!-- ์ํ ์ถ๊ฐ -->
			                <input type="button" class="primary-btn" id="insert-button" value="์ํ ์ถ๊ฐ" onclick="location.href='/admin/itemRegister'">
			                
			                <!-- ์ธ์ผ ์ํ ์ค์? -->
							<input type="button" class="primary-btn" id="sale-button" value="์ธ์ผ ์ํ ์ค์?" onclick="setUpSale();" style="top: 3.55em;height: 40px;">

		                    <form action="itemUpdate" method="get">
		                    	<input type="submit" id="upButton" class="primary-btn" value="์ํ ์์?" onclick = "return itemUpdate();">
			                    <input type="button" id="deButton" name="itemNum" class="primary-btn" value="์ํ ์ญ์?" onclick ="return deValueChk();">
			                   	<!-- ์ํ ๊ด๋ฆฌ ํ์ด๋ธ ์์ -->
			                   	<table>
			                       		<tr>
			                       			<th>์?ํ</th>
			                       			<th id="th-image">IMAGE</th>
			                       			<th>์ํ ๋ฒํธ</th>
			                       			<th>์ด๋ฆ</th>
			                       			<th>๊ฐ๊ฒฉ</th>
			                       			<th>์ฌ๊ณ?</th>
			                       			<th>์นดํ๊ณ?๋ฆฌ</th>
			                       			<th>ํ๋งค๊ธ ์์ฑ</th>
			                       		</tr>
			                       		
				                       	<!-- itemList ๋ฐ๋ณต -->
				                       	<c:forEach var="Item" items="${itemList }">
				                       		<tr>
				                       			<td>
				                       				<input type="radio" id="itemChk" name="itemChk" value="${Item.itemNum }" />
				                       			</td>
				                       			<c:choose>
					                       			<c:when test="${fileList[0].itemNum eq Item.itemNum }">
				                       				<td id="td-image"><img src="/uploadImg/${fileList[0].savedFilename }" alt="์์์ฌ์ง" style="height: 222px; width:260px;"></td>
				                       				</c:when>
					                       			<c:when test="${fileList[1].itemNum eq Item.itemNum }">
				                       				<td id="td-image"><img src="/uploadImg/${fileList[1].savedFilename }" alt="์์์ฌ์ง" style="height: 222px; width:260px;"></td>
				                       				</c:when>
					                       			<c:when test="${fileList[2].itemNum eq Item.itemNum }">
				                       				<td id="td-image"><img src="/uploadImg/${fileList[2].savedFilename }" alt="์์์ฌ์ง" style="height: 222px; width:260px;"></td>
				                       				</c:when>
					                       			<c:when test="${fileList[3].itemNum eq Item.itemNum }">
				                       				<td id="td-image"><img src="/uploadImg/${fileList[3].savedFilename }" alt="์์์ฌ์ง" style="height: 222px; width:260px;"></td>
				                       				</c:when>
					                       			<c:when test="${fileList[4].itemNum eq Item.itemNum }">
				                       				<td id="td-image"><img src="/uploadImg/${fileList[4].savedFilename }" alt="์์์ฌ์ง" style="height: 222px; width:260px;"></td>
				                       				</c:when>
													<c:otherwise>                       				
													<td id="td-image"><img src="/resources/img/itemDefault.png" alt="์์์ฌ์ง" style="height: 222px; width:260px;"></td>
													</c:otherwise>
												</c:choose>
												
				                       			<td id="itemNum">${Item.itemNum }</td>
				                       			<td id="itemName">${Item.itemName }</td>
				                       			<td id="price">${Item.price}</td>
				                       			<td id="itemAmount">${Item.itemAmount }</td>
				                       			<td id="itemCategory">${Item.categoryName }</td>
				                       			<td><input type="button" class="primary-btn" id="write-button" value="write" onclick="location.href='/admin/itemSale?itemNum=${Item.itemNum}'"></td>
				                       			
				                       		</tr>
				                       	</c:forEach>
				                       	
				                       	
								</table>
								<!-- ์ํ ๊ด๋ฆฌ ํ์ด๋ธ ๋  -->
		                        <!-- ํ์ด์ง ์์ -->
		                        <div style="text-align: center; margin-top: 20px;">
									<span>
									 <c:choose>
									<c:when test="${searchWord eq '' }">
										<c:if test="${navi.currentPage > 1 }">
											<a href="/admin/itemManagement?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
												< ์ด์?&nbsp;
		
											</a>
										</c:if>
										<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }"
											var="pageNum">
											<c:if test="${pageNum == navi.currentPage }">
												<a href="/admin/itemManagement?currentPage=${pageNum }" style="text-decoration:none; text-align: center; font-size: 1.5em;">
													<span style="color: #E7AB3C; border: 1px solid;">
														&nbsp;${pageNum }
													</span>
												</a>
												&nbsp;
											</c:if>
											<c:if test="${pageNum != navi.currentPage }">
												<a href="/admin/itemManagement?currentPage=${pageNum }" style="color: black; text-decoration:none; text-align: center; font-size: 1.5em;">
													<span>
														${pageNum }&nbsp;
													</span>
												</a>
											</c:if>
										</c:forEach>
		
										<c:if test="${navi.currentPage < navi.totalPageCount }">
											<a href="/admin/itemManagement?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration:none;text-align: center; font-size: 1.5em;">
												๋ค์ >
											</a>
										</c:if>
										</c:when>
									<c:otherwise>
										<c:if test="${navi.currentPage > 1 }">
											<a href="/admin/itemManagement?searchWord=${searchWord }&currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration: none; text-align: center; font-size: 1.5em;">
												< ์ด์?&nbsp;
		
											</a>
										</c:if>
										<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }"
											var="pageNum">
											<c:if test="${pageNum == navi.currentPage }">
												<a href="/admin/itemManagement?searchWord=${searchWord }&currentPage=${pageNum }" style="text-decoration:none; text-align: center; font-size: 1.5em;">
													<span style="color: #E7AB3C; border: 1px solid;">
														&nbsp;${pageNum }
													</span>
												</a>
												&nbsp;
											</c:if>
											<c:if test="${pageNum != navi.currentPage }">
												<a href="/admin/itemManagement?searchWord=${searchWord }&currentPage=${pageNum }" style="color: black; text-decoration:none; text-align: center; font-size: 1.5em;">
													<span>
														${pageNum }&nbsp;
													</span>
												</a>
											</c:if>
										</c:forEach>
		
										<c:if test="${navi.currentPage < navi.totalPageCount }">
											<a href="/admin/itemManagement?searchWord=${searchWord }&currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color: #E7AB3C; text-decoration:none;text-align: center; font-size: 1.5em;">
												๋ค์ >
											</a>
										</c:if>
									</c:otherwise>
									</c:choose>
									</span>
								</div>
								<!-- ํ์ด์ง ๋ -->
							</form>
						</c:if>
						<c:if test="${empty itemList }">
							<div class="container-h5">
								<a href="https://www.flaticon.com/kr/free-icons/" title="๊ธ์ง ์์ด์ฝ">
									<img src="/resources/img/not.png" alt="๊ธ์ง ์์ด์ฝ  ์?์์: Freepik - Flaticon" id="image-not">
								</a>
								<h2 id="emptyList">์ํ ์?๋ณด๊ฐ ์์ต๋๋ค</h2>
							</div>
						</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Faq Section End -->
    
    <!-- Footer -->
    <%@ include file="/WEB-INF/views/admin/adminFooter.jsp" %>

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
    <script src="/resources/js/adminJs/itemManagement.js"></script>
</body>

</html>