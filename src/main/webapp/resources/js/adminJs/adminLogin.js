/* 유효성 검사 */
function checkForm()
{
	var empNum = document.getElementById("empNum").value; 
	var empPw = document.getElementById("empPw").value;

	if ( empNum.length == 0 || empNum.length > 4 || isNaN(empNum) )
	{
		modalContent();
		$("#modalAlert_content").prepend("ID를 올바르게 입력해주세요.");
		showModalAlert();
		return false;
	}
	
	if ( empPw.length == 0 )
	{
		modalContent();
		$("#modalAlert_content").prepend("비밀번호를 입력해주세요.");
		showModalAlert();
		return false;
	}
	
	return true;
}
  
$(document).ready(function() 
{
	var userInputId = getCookie("userInputId");
	var setCookieYN = getCookie("setCookieYN");

	if( setCookieYN == 'Y' ) 
	{
		$("#saveIdChk").prop("checked", true);
	} 
	else 
	{
		$("#saveIdChk").prop("checked", false);
	}
    
	$("#empNum").val(userInputId); 
    
	// 로그인 버튼 클릭시
    $('#loginBtn').click(function() 
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
	var val = document.cookie.split(';');
    
	for ( var i = 0; i < val.length; i++ ) 
	{
		x = val[i].substr(0, val[i].indexOf('='));
		y = val[i].substr(val[i].indexOf('=') + 1);
		x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
        
		if ( x == cookie_name ) 
		{
          return unescape(y); // unescape로 디코딩 후 값 리턴
		}
	}
}

/* 모달창 표시 */
function showModalAlert() 
{
	$(".modalAlert").fadeIn();
	
	$(".modalClose").click(function()
	{
		$(".modalAlert").fadeOut();	
	});
}

/* 모달창 안 버튼 표시 */
function modalContent()
{
	$("#modalAlert_content").html(""); // 태그 초기화
	$("#modalAlert_content").append('<input type="button" class="modalClose" value="닫기">');
}