/* 유효성 검사 */
function checkForm()
{
	var useName = $("#useName").val();			// 입력되있는 이름
	var userMail = $("#userMail").val();		// 입력되있는 ID
	var userCall = $("#userCall").val();		// 연락처
	
	// 정규식
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	
	var result = false;
	
	if ( useName.length == 0 || useName.length > 4 )
	{
		exitAlert();
		$("#footer-modal-content").prepend("이름을 올바르게 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( userMail.length == 0 || !(emailChk.test(userMail)) )
	{
		exitAlert();
		$("#footer-modal-content").prepend("이메일을 올바르게 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	if ( userCall.length == 0 || userCall.length != 11 || isNaN(userCall) )
	{
		exitAlert();
		$("#footer-modal-content").prepend("연락처를 올바르게 입력해주세요.");
		showModalAlert();
		return result;
	}
	
	result = true;
	
	return result;
}