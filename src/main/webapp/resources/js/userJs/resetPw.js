/* 유효성 검사 */
function checkForm()
{
	var userMail = $("#userMail").val();		// 입력되있는 ID
	var userPw = $("#userPw").val();			// 입력한 비밀번호
	var userPwCheck = $("#userPwCheck").val();	// 입력한 비밀번호 확인
	
	// 정규식
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	var pwChk = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/; // 비밀번호 정규식
	
	var result = false;
	
	if ( userMail.length == 0 || !(emailChk.test(userMail)) )
	{
		exitAlert();
		$("#footer-modal-content").prepend(emailChk);
		showModalAlert();
		return result;
	}
	
	if ( !(pwChk.test(userPw)) )
	{
		exitAlert();
		$("#footer-modal-content").prepend(pwChk1);
		showModalAlert();
		return result;
	}
	
	if ( userPw.length == 0 || userPwCheck == 0 )
	{
		exitAlert();
		$("#footer-modal-content").prepend(pwChk2);
		showModalAlert();
		return result;
	}
	
	if ( userPw != userPwCheck )
	{
		exitAlert();
		$("#footer-modal-content").prepend(pwChk3);
		showModalAlert();
		return result;
	}
	
	result = true;
	
	return result;
}

/* 비밀번호 확인 후 화면에 표시 */
$("#userPwCheck").blur(function()
{
	var inputUserPw = document.getElementById("userPw").value;	// 입력한 비밀번호
	var pwChk = document.getElementById("userPwCheck").value;	// 입력한 비밀번호 확인
	var pwWarn = $("#pw_warn");									// 비교 결과
	
	if ( inputUserPw == 0 || pwChk == 0 ) // 입력하지 않았을 경우
	{
		return false;
	}
	else // 입력한 경우
	{
		if ( inputUserPw == pwChk ) // 일치하는지 확인
		{
			pwWarn.html(pwWarn1);
			pwWarn.attr("class", "correct");       
		}
		else 
		{
			pwWarn.html(pwWarn2);
			pwWarn.attr("class", "incorrect");
		} 
	}
});
