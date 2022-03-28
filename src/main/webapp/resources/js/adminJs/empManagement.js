/* 직원 정보 삭제 */
function empDelete(empNum) 
{
	var result = confirm("정말 삭제하시겠습니까?");
	var positionCheck = "${loginPosition}";
	console.log(positionCheck)
	
	if ( result )
	{
		// 직급을 확인해서 해당 직급이면 삭제 실행
		if ( positionCheck == "사장" || positionCheck == "부장" )
		{
			location.href = "/admin/empDelete?empNum="+empNum;
		}
		else // 해당 직급이 아니면 false 리턴
		{
			alert("권한이 없습니다.");
			return false;
		}
		
	}
	else
	{
		return false;
	}
	
}

/* 직원 정보 수정 */
function empUpdate(empNum) 
{
	location.href = "/admin/empUpdate?empNum="+empNum;
}

/* 직원 검색 */
function searchEmp() 
{
	var searchWord = $.trim($("input[name=searchWord]").val());
	var lengthCheck = /([^{2,5}])/i;
	if ( !(lengthCheck.test(searchWord)) ) 
	{
		alert("2글자 이상, 5글자 이하로 입력해주십시오.");
		
		return false;
	} 
	else 
	{
		var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20a-zA-Z0-9])/i;
		if ( kor_check.test(searchWord) )
		{
			alert("한글, 영어, 숫자만 입력 가능합니다.");
			return false
		} 
		else 
		{
			return true;
		}
	}
}