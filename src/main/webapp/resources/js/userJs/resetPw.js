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
		$("#footer-modal-content").prepend("이메일을 올바르게 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( !(pwChk.test(userPw)) )
	{
		exitAlert();
		$("#footer-modal-content").prepend("비밀번호는 영문, 숫자, 특수문자를 포함하여<br> 8~16자로 작성해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( userPw.length == 0 )
	{
		exitAlert();
		$("#footer-modal-content").prepend("비밀번호를 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( userPw != userPwCheck )
	{
		exitAlert();
		$("#footer-modal-content").prepend("비밀번호가 일치하지 않습니다.");
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
			pwWarn.html("일치합니다.");
			pwWarn.attr("class", "correct");       
		}
		else 
		{
			pwWarn.html("다시 확인해주세요.");
			pwWarn.attr("class", "incorrect");
		} 
	}
});
