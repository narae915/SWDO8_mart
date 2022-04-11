var pinNum = ""; // 메일 인증번호

/* 유효성 검사 */
function checkForm()
{
	var empName = $("#empName").val();						// 입력한 이름
	var empPw = $("#empPw").val();							// 입력한 비밀번호
	var empPwCheck = $("#empPwCheck").val();				// 입력한 비밀번호 확인
	var empCall = $("#empCall").val();						// 입력한 연락처
	var empMail = $("#empMail").val();						// 입력한 이메일
	var inputPinNum = $("#pinNumChk").val();				// 입력한 이메일 인증번호
	var position = $("#position").find("option:selected");	// 선택한 직급
	
	// 정규식
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	var pwChk = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/; // 비밀번호 정규식
	
	var result = false;
	
	if ( empName.length == 0 )
	{
		exitAlert();
		$("#footer-modal-content").prepend("이름을 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( !(pwChk.test(empPw)) )
	{
		exitAlert();
		$("#footer-modal-content").prepend("비밀번호는 영문, 숫자, 특수문자를 포함하여<br> 8~16자로 작성해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( empPw.length == 0 )
	{
		exitAlert();
		$("#footer-modal-content").prepend("비밀번호를 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( empPw != empPwCheck )
	{
		exitAlert();
		$("#footer-modal-content").prepend("비밀번호가 일치하지 않습니다.");
		showModalAlert();
		return result;
	}
	
	if ( empCall.length == 0 || empCall.length != 11 || isNaN(empCall) )
	{
		exitAlert();
		$("#footer-modal-content").prepend("연락처를 올바르게 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( empMail.length == 0 || !(emailChk.test(empMail)) )
	{
		exitAlert();
		$("#footer-modal-content").prepend("이메일을 올바르게 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( $("#pinNumChk").is(":disabled") || $("#pinNumChk_Btn").is(":disabled") ) // 인증확인 창이 비활성화 되있다면
	{
		exitAlert();
		$("#footer-modal-content").prepend("이메일을 인증을 완료해주세요.");
		showModalAlert();
		return result;
	}
	else
	{
		if ( !( $("#pinNumChk_Btn_true").is(":disabled") ) ) // 인증확인 창이 활성 상태인데 인증확인 버튼이 비활성화 상태가 아닌경우
		{
			exitAlert();
			$("#footer-modal-content").prepend("이메일을 인증을 완료해주세요.");
			showModalAlert();
			return result;
		}
		
		if ( isNaN(inputPinNum) ) // 인증번호가 숫자가 아닌경우
		{
			exitAlert();
			$("#footer-modal-content").prepend("올바른 인증번호 형식이 아닙니다.");
			showModalAlert();
			return result;
		}
		
		if ( inputPinNum != pinNum ) // 인증번호가 일치하지 않는다면
		{
			exitAlert();
			$("#footer-modal-content").prepend("이메일 인증번호가 일치하지 않습니다.");
			showModalAlert();
			return result;
		}
	}
	
	if ( position.val() == 0 )
	{
		exitAlert();
		$("#footer-modal-content").prepend("직급을 선택해주세요.");
		showModalAlert();
		return result;
	}
	
	result = true;
	
	return result;
}

/* 비밀번호 확인 후 화면에 표시 */
$("#empPwCheck").blur(function()
{
	var inputEmpPw = document.getElementById("empPw").value;	// 입력한 비밀번호
	var pwChk = document.getElementById("empPwCheck").value;	// 입력한 비밀번호 확인
	var pwWarn = $("#pw_warn");									// 비교 결과
	
	if ( inputEmpPw == 0 || pwChk == 0 ) // 입력하지 않았을 경우
	{
		return false;
	}
	else // 입력한 경우
	{
		if ( inputEmpPw == pwChk ) // 일치하는지 확인
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

/* 인증번호 이메일 전송 */
$("#sendMailBtn").click(function()
{
	var empMail = $("#empMail").val();		// 입력한 이메일
	var mailBox = $("#empMail");			// 이메일 입력란
	var pinNumChk = $("#pinNumChk");		// 인증번호 입력란
	var pinNumBox = $("#pinNumChk_false");	// 인증번호 입력란 박스
	var checkBtn = $("#pinNumChk_Btn");		// 인증번호 확인 버튼
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	
	if ( empMail.length == 0 || !(emailChk.test(empMail)) )
	{
		exitAlert();
		$("#footer-modal-content").prepend("이메일을 올바르게 입력해주세요.");
		showModalAlert();
		return false;
	}
	else
	{
		$.ajax
		({
			type: "get",
			url: "mailCheck?empMail=" + empMail,
			success: function(result)
			{
				mailBox.attr("readonly", true) // 메일 발송 성공시 메일 수정 불가
				$("#sendMailBtn").val("인증번호 재전송"); // 전송 성공 시 전송버튼 value값 변경
				pinNumChk.attr("disabled", false); // 인증 번호 발송시 disabled 해제
				checkBtn.attr("disabled", false);
				pinNumBox.attr("id", "pinNumChk_true");  // 인증 번호 발송시 id를 변경함으로서 css적용
				checkBtn.attr("id", "pinNumChk_Btn_true");
				pinNum = result;
				console.log(pinNum);
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
		checkPinNum.html("인증번호가 일치합니다.");
		pinNumBox.attr("readonly", true);
		checkPinNum.attr("class", "correct");       
		$("#pinNumChk_Btn_true").attr("disabled", true);
		$("#pinNumChk_Btn_true").css({"background-color": "#ebebe4"});
	}
	else 
	{
		checkPinNum.html("인증번호를 다시 확인해주세요.");
		checkPinNum.attr("class", "incorrect");
	}   
});
