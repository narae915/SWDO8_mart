/* 유효성 검사 */
function checkForm()
{
	var empNum = $("#empNum").val();			// 입력한 ID
	var empMail = $("#empMail").val();			// 입력한 이메일
	
	// 정규식
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	
	var result = false;
	
	if ( empNum.length == 0 || empNum == "" )
	{
		exitAlert();
		$("#footer-modal-content").prepend("ID를 입력해주세요.");
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
			url: "sendMail?empMail=" + empMail,
			success: function(result)
			{
				var pw = result;
			}
		});
	}
});
