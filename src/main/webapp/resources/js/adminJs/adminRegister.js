 var pinNum = ""; // 메일 인증번호

/* 유효성 검사 */
function checkForm()
{
	var empPw = document.getElementById("empPw").value;
	var empPwCheck = document.getElementById("empPwCheck").value;
	var empName = document.getElementById("empName").value;
	var position = $("#position").find("option:selected");
	var empCall = document.getElementById("empCall").value;
	
	var result = false;
	
	if ( empPw.length == 0 )
	{
		alert("비밀번호를 입력해주세요.");
		return result;
	}
	
	if ( empPw != empPwCheck )
	{
		alert("비밀번호가 일치하지 않습니다.");
		return result;
	}
	
	if ( empName.length == 0 )
	{
		alert("이름을 입력해주세요.");
		return result;
	} 
	
	if ( position.val() == 0 )
	{
		alert("직급을 선택해주세요.")
		return result;
	}
	
	if ( empCall.length == 0 || empCall.length != 11 )
	{
		alert("연락처를 올바르게 입력해주세요.");
		return result;
	}
	
	result = true;
	
	return result;
}

/* 인증번호 이메일 전송 */
function sendMail()	
{
	var empMail = $("#empMail").val();		// 입력한 이메일
	var pinNumChk = $("#pinNumChk");		// 인증번호 입력란
	var pinNumBox = $("#pinNumChk_false");	// 인증번호 입력란 박스
	
	if ( empMail.length == 0 )
	{
		alert("이메일을 올바르게 입력해주세요.");
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
				pinNumBox.attr("id", "pinNumChk_true");  // 인증 번호 발송시 id를 변경함으로서 css적용
				pinNum = result;
			}
		});
	}
	
	/* 인증번호 비교 */
	$("#pinNumChk").blur(function()
	{
	    var inputPinNum = $("#pinNumChk").val();	// 입력한 인증번호   
	    var checkPinNum = $("#pinNumChk_warn");		// 비교 결과
	    
	    console.log(inputPinNum);
	    
	    if ( inputPinNum == pinNum )
	    {
	    	checkPinNum.html("인증번호가 일치합니다.");
	    	checkPinNum.attr("class", "correct");        
	    }
	    else 
	    {
	    	checkPinNum.html("인증번호를 다시 확인해주세요.");
	    	checkPinNum.attr("class", "incorrect");
	    }   
	});
}