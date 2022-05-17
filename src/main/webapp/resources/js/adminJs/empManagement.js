/* 직원 정보 수정 */
function empUpdate(empNum) 
{
    location.href = "/admin/empUpdate?empNum="+empNum;
}

/* 직원 정보 삭제 */
function empDelete(empNum, empImg) 
{
    $("#modalAlert_content").html("");
    $("#modalAlert_content").prepend("정말 삭제하시겠습니까?<br><br>");
    $("#modalAlert_content").append('<input type="button" class="modalAccept" value="확인" style="position: absolute; right: 15.5em; bottom: 3em;"><br>');
    $("#modalAlert_content").append('<input type="button" class="modalClose" value="취소" style="position: absolute; left: 15.5em; bottom: 3em;">');
    confirmModal_v2(function(confirm)
    {
        if ( confirm )
        {
            // 직급을 확인해서 해당 직급이면 삭제 실행
            if ( positionCheck == "사장" || positionCheck == "부장" )
            {
                if ( empImg == null || empImg.length == 0 || empImg == "" ) // 직원 사진이 존재하지 않으면 직원 정보만 삭제
                {
                    location.href = "/admin/empDelete?empNum="+empNum;
                }
                else // 직원 사진이 있다면 직원 정보, 사진, 사진 정보 삭제
                {
                    $.ajax
                    ({
                        url: "/admin/empImgDelete",
                        type: "get",
                        data:
                        {
                            empImg: empImg
                        },
                        success: function(result)
                        {
                            if ( result == "success" )
                            {
                                location.href = "/admin/empDelete?empNum="+empNum;
                                modalContent();
                                $("#modalAlert_content").prepend("삭제되었습니다.");
                                showModalAlert();
                            }
                        }
                    });
                } 
            }
            else // 해당 직급이 아니면 false 리턴
            {
                modalContent();
                $("#modalAlert_content").prepend("권한이 없습니다.");
                showModalAlert();
                return false;
            }
        }
        else
        {
            return false;
        }
    })
}

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
function confirmModal_v2(callback)
{
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