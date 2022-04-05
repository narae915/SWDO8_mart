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
	
	if(confirm("수정을 확정하시겠습니까?") == true)
	{
		result = true;
		return result;
	}
	else
	{
		return result;
	}
	
	result = true;
	
	return result;
}

 window.onload = function()
 {
	// 직원 직급 
 	var empPosition = "${emp.position}";
 	
 	// 가져온 값을 셀렉트창에 표시
 	$("#position").val(empPosition).prop("selected", true);
 };