/* 유효성 검사 */
function checkForm()
{
	//주소 hidden태그에 채우기
	var userAddress= $("#address").val() + "_" + $("#detailAddress").val() + " " + $("#extraAddress").text();
	$("input[name=userAddress]").attr("value", userAddress);
	
	//주소 입력했으면 우편번호를 controller에 보내기 , 그렇지 않으면 hidden의 value인 0이 가도록 설정
	var postcode = $("#postcode").val();
	if ( postcode != null ) 
	{
		$("input[name=postcode]").attr("value", postcode);
	}

	var userName = $("#username").val();		// 입력되있는 이름
	var userMail = $("#userMail").val();		// 입력되있는 ID
	var userCall = $("#userCall").val();		// 연락처

	// 정규식
	var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 이메일 정규식
	var callChk = /^(?:(010\d{4})|(01[1|6|7|8|9]-\d{3,4}))(\d{4})$/;
	
	var result = true;
	
	if (userName.length == 0 || userMail.length == 0 || userCall.length == 0) 
	{
		exitAlert();
		$("#footer-modal-content").prepend(blankChk);
		showModalAlert();
		result = false;
	}
	
	if ( emailChk.test(userMail) == false )
	{
		exitAlert();
		$("#footer-modal-content").prepend(mailChkMessage);
		showModalAlert();
		result = false;
	}
	
	if ( callChk.test(userCall) == false  || isNaN(userCall) )
	{
		exitAlert();
		$("#footer-modal-content").prepend(telChk);
		showModalAlert();
		result = false;
	}
	
	return result;
}