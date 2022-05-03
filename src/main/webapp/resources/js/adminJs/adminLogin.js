/* 유효성 검사 */
function checkForm()
{
	var empNum = $("#empNum").val();	// 입력한 ID
	var empPw = $("#empPw").val();		// 입력한 PW

	if ( empNum.length == 0 || empNum.length > 4 || isNaN(empNum) )
	{
		exitAlert();
		$("#footer-modal-content").prepend("ID를 올바르게 입력해주세요.");
		showModalAlert();
		return false;
	}
	
	if ( empPw.length == 0 )
	{
		exitAlert();
		$("#footer-modal-content").prepend("비밀번호를 입력해주세요.");
		showModalAlert();
		return false;
	}
	
	return true;
}
 
/* ID 기억하기 */
$(document).ready(function() 
{
	var userInputId = getCookie("userInputId");
	var setCookieYN = getCookie("setCookieYN");

	if( setCookieYN == "Y" ) 
	{
		$("#saveIdChk").prop("checked", true);
	} 
	else 
	{
		$("#saveIdChk").prop("checked", false);
	}
    
	$("#empNum").val(userInputId); 
    
	// 로그인 버튼 클릭시
    $("#loginBtn").click(function() 
	{
		if ( $("#saveIdChk").is(":checked") )
		{ 
			var userInputId = $("#empNum").val();
			setCookie("userInputId", userInputId, 60); 
			setCookie("setCookieYN", "Y", 60);
        } 
		else 
		{
			deleteCookie("userInputId");
			deleteCookie("setCookieYN");
		}
        
		document.form.submit();
	});
});

/* 쿠키값 set */
function setCookie(cookieName, value, exdays)
{
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

/* 쿠키값 삭제 */
function deleteCookie(cookieName)
{
	var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

/* 쿠키값 가져오기 */
function getCookie(cookie_name) 
{
	var x, y;
	var val = document.cookie.split(";");
    
	for ( var i = 0; i < val.length; i++ ) 
	{
		x = val[i].substr(0, val[i].indexOf("="));
		y = val[i].substr(val[i].indexOf("=") + 1);
		x = x.replace(/^\s+|\s+$/g, ""); // 앞과 뒤의 공백 제거하기
        
		if ( x == cookie_name ) 
		{
          return unescape(y); // unescape로 디코딩 후 값 리턴
		}
	}
}
