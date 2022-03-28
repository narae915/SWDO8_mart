 function checkForm()
{
	var empNum = document.getElementById("empNum").value; 
	var empPw = document.getElementById("empPw").value;
	
	if ( empNum.length == 0 )
	{
		alert("ID를 입력해주세요.");
		return false;
	}
	
	if ( empPw.length == 0 )
	{
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	
	return true;
}