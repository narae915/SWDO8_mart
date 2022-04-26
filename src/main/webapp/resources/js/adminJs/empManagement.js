/* 직원 검색 */
function searchEmp() 
{
	var searchWord = $.trim($("input[name=searchWord]").val());
	var lengthCheck = /([^{2,5}])/i;
	if ( !(lengthCheck.test(searchWord)) ) 
	{
		modalContent();
		$("#modalAlert_content").prepend("2글자 이상, 5글자 이하로 입력해주십시오.");
		showModalAlert();
		return false;
	} 
	else 
	{
		var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20a-zA-Z0-9])/i;
		if ( kor_check.test(searchWord) )
		{
			modalContent();
			$("#modalAlert_content").prepend("한글, 영어, 숫자만 입력 가능합니다.");
			showModalAlert();
			return false;
		} 
		else 
		{
			return true;
		}
	}
}

/* 모달창 표시 */

function confirmModal_v2(callback){

	var result = false;
 
	showModalAlert(function(confirm)
	{
		if ( confirm == 1 )
		{
			result = true;
			callback(result);	
		}
		else if ( confirm == 2 )
		{
			result = false;
			callback(result);	
		}
	});			
	
}

var showModalAlert = function (callback) 
{
	$(".modalAlert").fadeIn();
	
	$(".modalAccept").click(function()
	{
		$(".modalAlert").fadeOut();	
		callback(1);
	});
	
	$(".modalClose").click(function()
	{
		$(".modalAlert").fadeOut();	
		callback(2);
	});
}

/* 모달창 안 버튼 표시 */
function modalContent()
{
	$("#modalAlert_content").html(""); // 태그 초기화
	$("#modalAlert_content").append('<input type="button" class="modalClose" value="닫기">');
}