/* 유효성 검사 */
function checkForm()
{
	var userName = $("#userName").val();			// 입력한 이름
	var userCall = $("#userCall").val();			// 입력한 연락처
	var checkSpc = /[~!@#$%^&*()_+|<>?:{}]/;		// 특수문자 정규식
	var checkNum = /[0-9]/;							// 숫자 정규식
	
	var result = false;
	
	if ( userName.length == 0 || checkSpc.test(userName) || checkNum.test(userName) )
	{
		exitAlert();
		$("#footer-modal-content").prepend("이름을 올바르게 입력해주세요.");
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
