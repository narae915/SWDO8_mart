var pinNum = ""; // 메일 인증번호

/* 유효성 검사 */
function checkForm()
{
	var userMail = $("#userMail").val();		// 입력한 ID
	var inputPinNum = $("#pinNumChk").val();	// 입력한 이메일 인증번호
	
	// 정규식
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	
	var result = false;
	
	if ( userMail.length == 0 || !(emailChk.test(userMail)) )
	{
		exitAlert();
		$("#footer-modal-content").prepend(emailChk);
		showModalAlert();
		return result;
	}
	
	if ( $("#pinNumChk").is(":disabled") || $("#pinNumChk_Btn").is(":disabled") ) // 인증확인 창이 비활성화 되있다면
	{
		exitAlert();
		$("#footer-modal-content").prepend(pinNumChk);
		showModalAlert();
		return result;
	}
	else
	{
		if ( !( $("#pinNumChk_Btn_true").is(":disabled") ) ) // 인증확인 창이 활성 상태인데 인증확인 버튼이 비활성화 상태가 아닌경우
		{
			exitAlert();
			$("#footer-modal-content").prepend(pinNumChk);
			showModalAlert();
			return result;
		}
		
		if ( isNaN(inputPinNum) ) // 인증번호가 숫자가 아닌경우
		{
			exitAlert();
			$("#footer-modal-content").prepend(inputPinNum);
			showModalAlert();
			return result;
		}
		
		if ( inputPinNum != pinNum ) // 인증번호가 일치하지 않는다면
		{
			exitAlert();
			$("#footer-modal-content").prepend(emailPinNum);
			showModalAlert();
			return result;
		}
	}
	
	result = true;
	
	return result;
}

/* 인증번호 이메일 전송 */
$("#sendMailBtn").click(function()
{
	var userMail = $("#userMail").val();		// 입력한 이메일
	var mailBox = $("#userMail");				// 이메일 입력란
	var pinNumChk = $("#pinNumChk");			// 인증번호 입력란
	var pinNumBox = $("#pinNumChk_false");		// 인증번호 입력란 박스
	var checkBtn = $("#pinNumChk_Btn");			// 인증번호 확인 버튼
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	
	if ( userMail.length == 0 || !(emailChk.test(userMail)) )
	{
		exitAlert();
		$("#footer-modal-content").prepend(emailChk);
		showModalAlert();
		return false;
	}
	else
	{
		$.ajax
		({
			type: "get",
			url: "sendMail?userMail=" + userMail,
			success: function(result)
			{
				var pw = result;
				console.log(pw);
				if ( result.length != 6 )
				{
					$("#errorMessage").prepend(errorMessage);
				}
				else
				{
					mailBox.attr("readonly", true) // 메일 발송 성공시 메일 수정 불가
					$("#sendMailBtn").val(reSendMailBtn); // 전송 성공 시 전송버튼 value값 변경
					pinNumChk.attr("disabled", false); // 인증 번호 발송시 disabled 해제
					checkBtn.attr("disabled", false);
					pinNumBox.attr("id", "pinNumChk_true");  // 인증 번호 발송시 id를 변경함으로서 css적용
					checkBtn.attr("id", "pinNumChk_Btn_true");
					pinNum = result;
					alert(sendSuccess);
				}
				
				
			}
		});
	}
});

/* 인증번호 확인 */
$("#pinNumChk_Btn").click(function()
{
	var inputPinNum = $("#pinNumChk").val();	// 입력한 인증번호   
	var pinNumBox = $("#pinNumChk");			// 인증번호 입력란
	var checkPinNum = $("#pinNumChk_warn");		// 비교 결과
	
	if ( inputPinNum == pinNum )
	{
		checkPinNum.html(checkPinNum1);
		pinNumBox.attr("readonly", true);
		checkPinNum.attr("class", "correct");       
		$("#pinNumChk_Btn_true").attr("disabled", true);
		$("#pinNumChk_Btn_true").css({"background-color": "#ebebe4"});
	}
	else 
	{
		checkPinNum.html(checkPinNum2);
		checkPinNum.attr("class", "incorrect");
	}   
});
