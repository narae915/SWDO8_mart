/* 유효성 검사 */
function checkForm()
{
	var empPw = document.getElementById("empPw").value;				// 입력한 비밀번호
	var empPwCheck = document.getElementById("empPwCheck").value;	// 입력한 비밀번호 확인
	var empName = document.getElementById("empName").value;			// 입력한 이름
	var position = $("#position").find("option:selected");			// 선택한 직급
	var empCall = document.getElementById("empCall").value;			// 입력한 연락처
	var empMail = $("#empMail").val();								// 입력한 이메일
	var inputPinNum = $("#pinNumChk").val();						// 입력한 이메일 인증번호
	
	// 정규식
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	
	var result = false;
	
	if ( empName.length == 0 )
	{
		modalContent();
		$("#modalAlert_content").prepend("이름을 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( empPw.length == 0 )
	{
		modalContent();
		$("#modalAlert_content").prepend("비밀번호를 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( empPw != empPwCheck )
	{
		modalContent();
		$("#modalAlert_content").prepend("비밀번호가 일치하지 않습니다.");
		showModalAlert();
		return result;
	}
	
	if ( empCall.length == 0 || empCall.length != 11 || isNaN(empCall) )
	{
		modalContent();
		$("#modalAlert_content").prepend("연락처를 올바르게 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( empMail.length == 0 || !(emailChk.test(empMail)) )
	{
		modalContent();
		$("#modalAlert_content").prepend("이메일을 올바르게 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	// 이메일 업데이트 버튼 표시 X 인증번호 전송 버튼 O일때
	if ( $("#updateMailBtn").css("display") == "none" || $("#sendMailBtn").css("display") == "block" )
	{
		if ( $("#pinNumChk").is(":disabled") || $("#pinNumChk_Btn").is(":disabled") ) // 인증확인 창이 비활성화 되있다면
		{
			modalContent();
			$("#modalAlert_content").prepend("이메일을 인증을 완료해주세요.");
			showModalAlert();
			return result;
		}
		else
		{
			if ( inputPinNum != pinNum ) // 인증번호가 일치하지 않는다면
			{
				modalContent();
				$("#modalAlert_content").prepend("이메일 인증번호가 일치하지 않습니다.");
				showModalAlert();
				return result;
			}
		}
	}
	
	if ( position.val() == 0 )
	{
		modalContent();
		$("#modalAlert_content").prepend("직급을 선택해주세요.");
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

/* 이메일 수정 버튼 클릭시 */
$("#updateMailBtn").click(function()
{
	var empMail = $("#empMail");
	
	empMail.attr("readonly", false); 				// readonly 해제
	$("#empMail").css("background-color", "white"); // 배경색 변경
	$("#empMail").css("color", "black"); 			// 글자색 변경
	$("#sendMailBtn").css("display", "block"); 		// 인증번호 전송 버튼 표시
	$("#updateMailBtn").css("display", "none"); 	// 이메일 수정 버튼 숨김
});

/* 인증번호 이메일 전송 */
$("#sendMailBtn").click(function()
{
	var empMail = $("#empMail").val();		// 입력한 이메일
	var pinNumChk = $("#pinNumChk");		// 인증번호 입력란
	var pinNumBox = $("#pinNumChk_false");	// 인증번호 입력란 박스
	var checkBtn = $("#pinNumChk_Btn");		// 인증번호 확인 버튼
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	
	if ( empMail.length == 0 || !(emailChk.test(empMail)) )
	{
		modalContent();
		$("#modalAlert_content").prepend("이메일을 올바르게 입력해주세요.");
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
				console.log("result : " + result);
				pinNumChk.attr("disabled", false); // 인증 번호 발송시 disabled 해제
				checkBtn.attr("disabled", false);
				pinNumBox.attr("id", "pinNumChk_true");  // 인증 번호 발송시 id를 변경함으로서 css적용
				checkBtn.attr("id", "pinNumChk_Btn_true");
				pinNum = result;
			}
		});
	}
});

/* 인증번호 확인 */
$("#pinNumChk_Btn").click(function()
{
	var inputPinNum = $("#pinNumChk").val();	// 입력한 인증번호   
	var checkPinNum = $("#pinNumChk_warn");		// 비교 결과
	
	if ( inputPinNum == pinNum )
	{
		checkPinNum.html("인증번호가 일치합니다.");
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