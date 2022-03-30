	// 주문 취소
	function valueChk() {
	var cancleNum = [];
	
	$("input[name=orderNum]:checked").each(function() {
		cancleNum.push($(this).val());
	});
	
	if(cancleNum == "") { // 체크박스가 체크되어있지 않은 경우 경고창을 띄우며 취소를 진행하지 않음.
		alert("선택된 항목이 없습니다.");
		
		return false;
	} else { // 체크박스가 체크된 경우 확인 절차를 진행함.
		var cancleChk = confirm("정말 취소하시겠습니까?");
		if(cancleChk == true) {

			$.ajax({
				url: "/order/ordercancle",
				type: "post",
				data: {
					orderNum: $("#orderNum").val()			
				},
				success: function(res, url) {
					if(res == "success") {
						alert("취소되었습니다.");
						location.href = "/order/orderList";
					}
				
				}
			});
			
			return true;	
		} else {
			return false;
		}
	}
}
	
	// 검색어 유효성 검사
	function searchChk() {
		var searchWord = $.trim($("input[name=searchWord]").val());
			var kor_check = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20a-zA-Z0-9])/i;
			if (kor_check.test(searchWord)){
				alert("한글, 영어, 숫자만 입력 가능합니다.");
				return false
			} else {
				return true;
			}
		
	}
    		