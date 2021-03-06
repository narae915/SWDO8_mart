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
    <title>SpringDay | μν μΆκ°</title>

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
    <link rel="stylesheet" href="/resources/css/adminCss/itemRegister.css" type="text/css">
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
                        <a href="/admin/itemManagement">μν μ‘°ν</a>
                        <span>μν μΆκ°</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section Begin -->
    
    <!-- Faq Section Begin -->
    <div class="faq-section spad"> <!-- λ³Έλ¬Έ μλ¨ μ¬λ°± -->
        <div class="container"> <!-- λ³Έλ¬Έ μ’μΈ‘ μ¬λ°± -->
            <div class="row"> <!-- flex μ€μ  -->
                <div class="col-lg-12"> <!-- λ³Έλ¬Έμ μ°μΈ‘μΌλ‘ μ‘°κΈ λ³κ²½ -->
                    <div class="faq-accordin"> <!-- ν°νΈ ν¬κΈ°, μμ΄μ½ -->
                    
	                    <!-- 22/03/30, 04/16 λΈμ±λ¦° -->
	                    <!-- μν μ κ· λ±λ‘ -->
	                    <form action="itemRegister" method="POST" enctype="multipart/form-data">
	                       <table>
								<tr><th id="th-image" colspan="4">IMAGE</th></tr>
	                       		<tr>
	                       			<td id="table-td" colspan="4">
	                       				<p><img src="/resources/img/itemDefault.png" style="height:300px;width:300px" alt="μμμ¬μ§"></p>
	                       				<label class="primary-btn" id="file-btn" for="input-file">
											μ¬μ§ μ²¨λΆνκΈ°
										</label>
										<!-- <input type="submit" name="file-btn" value="μ¬μ§ λ±λ‘νκΈ°" class="primary-btn"> -->
										<input type="file" style="border:1px solid #000; padding:1em;display:none;" id= "input-file" name="uploadFile" accept="image/*">
	                       			</td>
	                       		<tr>
 	                       			<th>μΉ΄νκ³ λ¦¬</th>
	                       			<td>
	                       				<select name="category" id="category">
		                       				<option value="">μΉ΄νκ³ λ¦¬ μ ν</option>
		                       				<option value="10">μ‘λ₯</option>
		                       				<option value="20">μ΄ν¨λ₯</option>
		                       				<option value="30">κ³ΌμΌ</option>
		                       				<option value="40">μ±μ</option>
		                       				<option value="50">μ‘°λ―Έλ£</option>
		                       				<option value="60">μλ£</option>
		                       				<option value="70">κ·Έ μΈ</option>
		                       			</select>
		                       		</td>
	                       			<th id="th-name">μν μ΄λ¦</th>
	                       			<td>
	                       				<input type="text" name="itemName" class="text-type" id="itemName" required>
	                       			</td>
	                       		</tr>
	                       		<tr>
	                       			<th style="width:18%">κ°κ²©</th>
	                       			<td>
	                       				<input type="text" name="price" class="text-type" id="price" required>
	                       			</td>
	                       			<th style="height:40px;">μ¬κ³ </th>
	                       			<td style="width:40%">
	                       				<input type="text" name="itemAmount" class="text-type" id="itemAmount" required>
	                       			</td>
	                       		</tr>
	                       		<tr>
	                       			<th>κ°λ΅ν μνμκ°</th>
	                       			<td colspan="3">
	                       				<textarea rows="1" cols="70" name="introduce" required style="resize: none;float: left;"></textarea>
	                       			</td>
	                       		</tr>
	                       </table>
	                       <input type="submit" id="submit-btn" class="primary-btn" value="μλ£">
	                       
	                       <!-- μμ  μ μμ κ° -->
	                       <input type="hidden" name="updateNum" value="updateNum">
	                       
	                       <!--μν κ΄λ¦¬ νμ΄λΈ λ  -->
						</form>
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
    <script src="/resources/js/adminJs/itemRegister.js"></script>
</body>
<script type="text/javascript">
// νμΌ μ²¨λΆ μ μλ¦Ό
$("#input-file").change(function(){
	var fileInput = $('#input-file');
	var fileInputCount = fileInput[0].files.length;
	if (fileInputCount == 1) {
		exitAlert();
		$("#footer-modal-content").prepend("νμΌμ΄ μ²¨λΆλμμ΅λλ€.");
		showModalAlert();
	}
});
</script>


</html>