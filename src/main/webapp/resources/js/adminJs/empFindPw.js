/* 유효성 검사 */
function checkForm()
{
	var empNum = $("#empNum").val();			// 입력한 ID
	var empMail = $("#empMail").val();			// 입력한 이메일
	var inputPinNum = $("#pinNumChk").val();	// 입력한 이메일 인증번호
	
	// 정규식
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	
	var result = false;
	
	if ( empNum.length == 0 || empNum == "" )
	{
		modalContent();
		$("#modalAlert_content").prepend("ID를 입력해주세요.");
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
	
	result = true;
	
	return result;
}

/* 임시 비밀번호 이메일 전송 */
$("#sendMailBtn").click(function()
{
	var empMail = $("#empMail").val();		// 입력한 이메일
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
			url: "sendMail?empMail=" + empMail,
			success: function(result)
			{
				var pw = result;
			}
		});
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
